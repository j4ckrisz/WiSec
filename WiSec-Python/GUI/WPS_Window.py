import tkinter as tk
from tkinter import ttk
from scapy.all import sniff, Dot11, Dot11Elt, Dot11Beacon, Dot11ProbeResp
import subprocess
from logic.network_utils import get_network_interfaces

class WPS_Window:
    def __init__(self, parent):
        self.parent = parent
        self.window = tk.Toplevel(parent.master)
        self.window.title("WPS Attack Options")
        self.window.geometry("800x600")

        # Frame for network list
        self.network_list_frame = tk.Frame(self.window)
        self.network_list_frame.pack(fill='both', expand=True)

        # Scrollbar and Listbox for networks
        self.scrollbar = tk.Scrollbar(self.network_list_frame)
        self.scrollbar.pack(side='right', fill='y')

        self.network_listbox = tk.Listbox(self.network_list_frame, selectmode='multiple')
        self.network_listbox.pack(fill='both', expand=True)
        self.network_listbox.config(yscrollcommand=self.scrollbar.set)
        self.scrollbar.config(command=self.network_listbox.yview)

        # WPS Attack checkboxes
        self.pixie_dust_checkbox = tk.Checkbutton(self.window, text="Pixie Dust Attack")
        self.pixie_dust_checkbox.pack(pady=5)

        self.null_pin_checkbox = tk.Checkbutton(self.window, text="Null Pin Attack")
        self.null_pin_checkbox.pack(pady=5)

        self.wps_brute_force_checkbox = tk.Checkbutton(self.window, text="WPS Brute Forcing")
        self.wps_brute_force_checkbox.pack(pady=5)

        # Button to start recon
        self.recon_button = tk.Button(self.window, text="Start Recon for WPS Networks", command=self.start_recon)
        self.recon_button.pack(pady=5)

        # Store BSSIDs of discovered WPS networks to avoid duplicates
        self.discovered_bssids = set()

    def start_recon(self):
        selected_interface = self.parent.interface_combobox.get()
        if not selected_interface:
            print("No interface selected!")
            return

        self.network_listbox.delete(0, tk.END)  # Clear existing entries

        # Set the interface to monitor mode
        if not self.set_monitor_mode(selected_interface):
            print(f"Failed to set {selected_interface} to monitor mode.")
            return

        print(f"Starting WPS recon on interface: {selected_interface}")

        def packet_handler(pkt):
            if pkt.haslayer(Dot11Beacon) or pkt.haslayer(Dot11ProbeResp):
                ssid = pkt[Dot11Elt].info.decode('utf-8', 'ignore')
                bssid = pkt[Dot11].addr2

                # Check for WPS capabilities
                wps_element = self.find_wps_element(pkt)
                if wps_element and bssid not in self.discovered_bssids:
                    self.discovered_bssids.add(bssid)
                    self.network_listbox.insert(tk.END, f"{ssid} ({bssid}) - WPS Active")

        try:
            sniff(iface=selected_interface, prn=packet_handler, timeout=10)
        finally:
            # Revert interface back to original mode after recon
            self.set_managed_mode(selected_interface)

    def find_wps_element(self, pkt):
        """Find WPS elements in the packet."""
        # Iterate over all elements in the packet
        if pkt.haslayer(Dot11Elt):
            elements = pkt[Dot11Elt]
            while isinstance(elements, Dot11Elt):
                if elements.ID == 221 and elements.info.startswith(b'\x00\x50\xf2\x04'):
                    # Element ID 221 and starting with specific bytes indicates WPS
                    return elements
                elements = elements.payload
        return None

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

