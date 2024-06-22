import tkinter as tk
from tkinter import ttk
from scapy.all import sniff, Dot11, Dot11Elt, Dot11Beacon, Dot11ProbeResp
import subprocess
from logic.network_utils import get_network_interfaces

class Main_Window(tk.Frame):

    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack(fill='both', expand=True)
        self.master.title("Wisec - Wireless Penetration Testing Tool")
        self.master.geometry("1440x720")

        self.discovered_networks = {}
        self.create_interface_selector()
        self.create_recon_button()
        self.create_network_list()
        self.create_attack_options()

    def create_interface_selector(self):
        interfaces = get_network_interfaces()
        self.interface_label = tk.Label(self, text="Select Network Interface:")
        self.interface_label.grid(row=0, column=0, padx=10, pady=10, sticky='w')

        self.interface_combobox = ttk.Combobox(self, values=interfaces, state='readonly')
        self.interface_combobox.grid(row=0, column=1, padx=10, pady=10, sticky='w')
        self.interface_combobox.bind('<<ComboboxSelected>>', self.on_interface_selected)

    def on_interface_selected(self, event):
        selected_interface = self.interface_combobox.get()
        print(f"Selected Interface: {selected_interface}")

    def create_recon_button(self):
        self.recon_button = tk.Button(self, text="Start Recon", command=self.start_recon)
        self.recon_button.grid(row=0, column=2, padx=10, pady=10, sticky='w')

    def create_network_list(self):
        self.network_frame = tk.LabelFrame(self, text="Discovered Networks")
        self.network_frame.grid(row=1, column=0, columnspan=3, padx=10, pady=10, sticky='ew')

        self.network_listbox = tk.Listbox(self.network_frame, selectmode='multiple', width=100)
        self.network_listbox.pack(side='left', fill='both', expand=True)

        self.scrollbar = tk.Scrollbar(self.network_frame, command=self.network_listbox.yview)
        self.scrollbar.pack(side='right', fill='y')
        self.network_listbox.config(yscrollcommand=self.scrollbar.set)

        self.network_listbox.bind("<Double-Button-1>", self.show_connected_devices)

    def show_connected_devices(self, event):
        selected_index = self.network_listbox.curselection()
        if selected_index:
            selected_item = self.network_listbox.get(selected_index)
            bssid = selected_item.split(" ")[-2][1:-1]  # Extract BSSID from selected item
            if bssid in self.discovered_networks:
                devices = self.discovered_networks[bssid]["devices"]
                devices_window = tk.Toplevel(self)
                devices_window.title(f"Devices Connected to {selected_item}")
                devices_window.geometry("600x400")
                devices_frame = tk.Frame(devices_window)
                devices_frame.pack(fill='both', expand=True, padx=10, pady=10)
                devices_listbox = tk.Listbox(devices_frame, selectmode='single', width=80)
                devices_listbox.pack(side='left', fill='both', expand=True)
                scrollbar = tk.Scrollbar(devices_frame, command=devices_listbox.yview)
                scrollbar.pack(side='right', fill='y')
                devices_listbox.config(yscrollcommand=scrollbar.set)
                for device in devices:
                    devices_listbox.insert(tk.END, device)
            else:
                print(f"No devices found for {bssid}")

    def create_attack_options(self):
        self.attack_options_frame = tk.LabelFrame(self, text="Attack Options")
        self.attack_options_frame.grid(row=1, column=3, padx=10, pady=10, sticky='ns')

        self.wpa2_attack_frame = tk.LabelFrame(self.attack_options_frame, text="WPA2 Attacks")
        self.wpa2_attack_frame.pack(fill='both', expand=True, padx=5, pady=5)

        self.handshake_checkbox = tk.Checkbutton(self.wpa2_attack_frame, text="Handshake Capture")
        self.handshake_checkbox.pack(anchor='w')

        self.pmkid_checkbox = tk.Checkbutton(self.wpa2_attack_frame, text="PMKID Attack")
        self.pmkid_checkbox.pack(anchor='w')

        self.wep_attack_frame = tk.LabelFrame(self.attack_options_frame, text="WEP Attacks")
        self.wep_attack_frame.pack(fill='both', expand=True, padx=5, pady=5)

        self.wep_crack_checkbox = tk.Checkbutton(self.wep_attack_frame, text="WEP Crack")
        self.wep_crack_checkbox.pack(anchor='w')

        self.wps_attack_frame = tk.LabelFrame(self.attack_options_frame, text="WPS Attacks")
        self.wps_attack_frame.pack(fill='both', expand=True, padx=5, pady=5)

        self.pixie_dust_checkbox = tk.Checkbutton(self.wps_attack_frame, text="Pixie Dust Attack")
        self.pixie_dust_checkbox.pack(anchor='w')

        self.null_pin_checkbox = tk.Checkbutton(self.wps_attack_frame, text="Null Pin Attack")
        self.null_pin_checkbox.pack(anchor='w')

        self.wps_brute_force_checkbox = tk.Checkbutton(self.wps_attack_frame, text="WPS Brute Forcing")
        self.wps_brute_force_checkbox.pack(anchor='w')

    def start_recon(self):
        selected_interface = self.interface_combobox.get()
        if not selected_interface:
            print("No interface selected!")
            return

        self.network_listbox.delete(0, tk.END)  # Clear existing entries
        self.discovered_networks = {}  # Clear discovered networks

        # Set the interface to monitor mode
        if not self.set_monitor_mode(selected_interface):
            print(f"Failed to set {selected_interface} to monitor mode.")
            return

        print(f"Starting recon on interface: {selected_interface}")

        def packet_handler(pkt):
            if pkt.haslayer(Dot11Beacon) or pkt.haslayer(Dot11ProbeResp):
                ssid = pkt[Dot11Elt].info.decode('utf-8', 'ignore')
                bssid = pkt[Dot11].addr2
                capability = pkt.sprintf("{Dot11Beacon:%Dot11Beacon.cap%}"
                                         "{Dot11ProbeResp:%Dot11ProbeResp.cap%}")

                # Determine encryption type
                encryption_type = "Unknown"
                if "privacy" in capability:
                    if "WPA2" in capability:
                        encryption_type = "WPA2"
                    elif "WEP" in capability:
                        encryption_type = "WEP"
                    elif "WPA2/PSK" in capability:
                        encryption_type = "WPA2/PSK"

                # Determine if WPS is active
                wps_active = "WPS" in capability

                # Extract connected devices (stations)
                stations = pkt[Dot11].addr3

                network_info = f"{ssid} ({bssid}) - Encryption: {encryption_type}, WPS: {wps_active}"
                if bssid not in self.discovered_networks:
                    self.discovered_networks[bssid] = {"info": network_info, "devices": set()}
                    self.network_listbox.insert(tk.END, network_info)
                if stations and bssid in self.discovered_networks:
                    if stations not in self.discovered_networks[bssid]["devices"]:
                        self.discovered_networks[bssid]["devices"].add(stations)

        try:
            sniff(iface=selected_interface, prn=packet_handler, timeout=10)
        finally:
            # Revert interface back to original mode after recon
            self.set_managed_mode(selected_interface)

    def set_monitor_mode(self, interface):
        try:
            subprocess.run(['sudo', 'ip', 'link', 'set', interface, 'down'], check=True)
            subprocess.run(['sudo', 'iwconfig', interface, 'mode', 'monitor'], check=True)
            subprocess.run(['sudo', 'ip', 'link', 'set', interface, 'up'], check=True)
            return True
        except subprocess.CalledProcessError as e:
            print(f"Error setting monitor mode: {e}")
            return False

    def set_managed_mode(self, interface):
        try:
            subprocess.run(['sudo', 'ip', 'link', 'set', interface, 'down'], check=True)
            subprocess.run(['sudo', 'iwconfig', interface, 'mode', 'managed'], check=True)
            subprocess.run(['sudo', 'ip', 'link', 'set', interface, 'up'], check=True)
            print(f"Reverted {interface} to managed mode.")
        except subprocess.CalledProcessError as e:
            print(f"Error reverting managed mode: {e}")

if __name__ == "__main__":
    root = tk.Tk()
    app = Main_Window(master=root)
    app.mainloop()
