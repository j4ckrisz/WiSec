import tkinter as tk
from tkinter import ttk, messagebox
from scapy.all import sniff, Dot11, Dot11Elt, Dot11Beacon, Dot11ProbeResp
from logic.network_utils import get_network_interfaces  

class Main_Window(tk.Frame):

    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack(fill='both', expand=True)
        self.master.title("Wisec - Wireless Penetration Testing")
        self.master.geometry("1080x720")

        self.discovered_networks = {}
        self.attack_options = {

            "handshake": tk.BooleanVar(),
            "pmkid": tk.BooleanVar(),
            "wep_crack": tk.BooleanVar(),
            "pixie_dust": tk.BooleanVar(),
            "null_pin": tk.BooleanVar(),
            "wps_brute_force": tk.BooleanVar(),
            "wps_pin_generator": tk.BooleanVar(),
            "randomize_mac": tk.BooleanVar()

        }

        self.attacking_aps = []

        self.create_interface_selector()
        self.create_recon_button()
        self.create_network_list()
        self.create_attack_options()
        self.create_ap_selection_box()
        self.create_log_window()
        self.create_additional_buttons()
        self.create_start_attack_button()
        self.create_clear_log_button()

    def create_interface_selector(self):

        interfaces = get_network_interfaces()
        
        self.interface_label = tk.Label(self, text="Select Network Interface:")
        self.interface_label.grid(row=0, column=0, padx=10, pady=10, sticky='w')

        self.interface_combobox = ttk.Combobox(self, values=interfaces, state='readonly')
        self.interface_combobox.grid(row=0, column=1, padx=10, pady=10, sticky='w')
        self.interface_combobox.bind('<<ComboboxSelected>>', self.on_interface_selected)

    def on_interface_selected(self, event):
        
        selected_interface = self.interface_combobox.get()
        self.log_action(f"Selected Interface: {selected_interface}")

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
            bssid = selected_item.split(" ")[-2][1:-1]  #Extract BSSID 

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
                self.log_action(f"No devices found for {bssid}")

    def create_attack_options(self):

        self.attack_options_frame = tk.LabelFrame(self, text="Attack Options")
        self.attack_options_frame.grid(row=1, column=3, padx=10, pady=10, sticky='ns')

        self.wpa2_attack_frame = tk.LabelFrame(self.attack_options_frame, text="WPA2 Attacks")
        self.wpa2_attack_frame.pack(fill='both', expand=True, padx=5, pady=5)

        self.handshake_checkbox = tk.Checkbutton(self.wpa2_attack_frame, text="Handshake Capture", variable=self.attack_options["handshake"])
        self.handshake_checkbox.pack(anchor='w')

        self.pmkid_checkbox = tk.Checkbutton(self.wpa2_attack_frame, text="PMKID Attack", variable=self.attack_options["pmkid"])
        self.pmkid_checkbox.pack(anchor='w')

        self.wep_attack_frame = tk.LabelFrame(self.attack_options_frame, text="WEP Attacks")
        self.wep_attack_frame.pack(fill='both', expand=True, padx=5, pady=5)

        self.wep_crack_checkbox = tk.Checkbutton(self.wep_attack_frame, text="WEP Crack", variable=self.attack_options["wep_crack"])
        self.wep_crack_checkbox.pack(anchor='w')

        self.wps_attack_frame = tk.LabelFrame(self.attack_options_frame, text="WPS Attacks")
        self.wps_attack_frame.pack(fill='both', expand=True, padx=5, pady=5)

        self.pixie_dust_checkbox = tk.Checkbutton(self.wps_attack_frame, text="Pixie Dust Attack", variable=self.attack_options["pixie_dust"])
        self.pixie_dust_checkbox.pack(anchor='w')

        self.null_pin_checkbox = tk.Checkbutton(self.wps_attack_frame, text="Null Pin Attack", variable=self.attack_options["null_pin"])
        self.null_pin_checkbox.pack(anchor='w')

        self.wps_brute_force_checkbox = tk.Checkbutton(self.wps_attack_frame, text="WPS Brute Forcing", variable=self.attack_options["wps_brute_force"])
        self.wps_brute_force_checkbox.pack(anchor='w')

        self.wps_pin_generator_checkbox = tk.Checkbutton(self.wps_attack_frame, text="WPS PIN Generator", variable=self.attack_options["wps_pin_generator"])
        self.wps_pin_generator_checkbox.pack(anchor='w')

        self.randomize_mac_checkbox = tk.Checkbutton(self.attack_options_frame, text="Randomize MAC", variable=self.attack_options["randomize_mac"])
        self.randomize_mac_checkbox.pack(anchor='w')

    def create_ap_selection_box(self):
        self.ap_selection_frame = tk.LabelFrame(self, text="AP Selection")
        self.ap_selection_frame.grid(row=2, column=0, columnspan=4, padx=10, pady=10, sticky='ew')

        self.ap_selection_label = tk.Label(self.ap_selection_frame, text="Enter AP numbers to attack (comma-separated):")
        self.ap_selection_label.pack(side='left', padx=5, pady=5)

        self.ap_selection_entry = tk.Entry(self.ap_selection_frame, width=50)
        self.ap_selection_entry.pack(side='left', padx=5, pady=5)

        self.start_attack_button = tk.Button(self.ap_selection_frame, text="Start Attack", command=self.start_attack)
        self.start_attack_button.pack(side='right', padx=5, pady=5)
        self.start_attack_button.config(state='disabled')  #disable the button

    def create_log_window(self):

        self.log_frame = tk.LabelFrame(self, text="Activity Log")
        self.log_frame.grid(row=3, column=0, columnspan=4, padx=10, pady=10, sticky='ew')

        self.log_text = tk.Text(self.log_frame, wrap='word', height=10)
        self.log_text.pack(fill='both', expand=True)
        self.log_text.config(state='disabled')  #read-only

    def log_action(self, message):

        self.log_text.config(state='normal')

        self.log_text.insert(tk.END, f"{message}\n")

        self.log_text.see(tk.END)  # Auto-scroll to the end

        self.log_text.config(state='disabled')

    def create_additional_buttons(self):

        self.additional_buttons_frame = tk.Frame(self)
        self.additional_buttons_frame.grid(row=4, column=0, columnspan=4, padx=10, pady=10, sticky='ew')

        self.magic_cage_button = tk.Button(self.additional_buttons_frame, text="Magic Cage", command=self.open_magic_cage_window)
        self.magic_cage_button.pack(side='left', padx=5, pady=5)

        self.evil_twin_button = tk.Button(self.additional_buttons_frame, text="Evil Twin", command=self.open_evil_twin_window)
        self.evil_twin_button.pack(side='left', padx=5, pady=5)

        self.jammer_button = tk.Button(self.additional_buttons_frame, text="Jammer", command=self.open_jammer_window)
        self.jammer_button.pack(side='left', padx=5, pady=5)

    def create_start_attack_button(self):
        pass

 #   def create_clear_log_button(self):

  #      self.clear_log_button = tk.Button(self, text="Clear Log", command=self.clear_log)
   #     self.clear_log_button.grid(row=5, column=2, padx=10, pady=10, sticky='ew')

    def start_recon(self):
        
        selected_interface = self.interface_combobox.get()
        
        if not selected_interface:
            self.log_action("No network interface selected.")
            return

        self.log_action(f"Starting recon on interface: {selected_interface}")
        self.discovered_networks = {}

    def start_attack(self):

        selected_interface = self.interface_combobox.get()
        
        if not selected_interface:
            self.log_action("No network interface selected.")
            return

        selected_aps = self.ap_selection_entry.get().strip()
        
        if not selected_aps:
            self.log_action("No APs selected for attack.")
            return

        ap_numbers = [int(num.strip()) for num in selected_aps.split(",") if num.strip().isdigit() and int(num.strip()) > 0]
        
        if not ap_numbers:
            self.log_action("Invalid input for AP selection.")
            return

        self.attacking_aps = []

        for num in ap_numbers:

            if num <= len(self.discovered_networks):

                bssid = list(self.discovered_networks.keys())[num - 1]

                self.attacking_aps.append(bssid)

            else:
                self.log_action(f"AP number {num} does not exist.")

        if self.attacking_aps:

            self.log_action(f"Starting attack on {selected_interface} against APs:")

            for bssid in self.attacking_aps:

                ssid = self.discovered_networks[bssid]["ssid"]
                self.log_action(f"Attacking: {ssid} ({bssid})")

        else:

            self.log_action("No valid APs selected for attack.")

  #  def clear_log(self):

   #     self.log_text.config(state='normal')
    #    self.log_text.delete('1.0', tk.END)
     #   self.log_text.config(state='disabled')

    def open_magic_cage_window(self):

        self.log_action("Magic Cage window opened.")
        messagebox.showinfo("Magic Cage", "This feature is under development.")

    def open_evil_twin_window(self):

        self.log_action("Evil Twin window opened.")
        messagebox.showinfo("Evil Twin", "This feature is under development.")

    def open_jammer_window(self):

        self.log_action("Jammer window opened.")
        messagebox.showinfo("Jammer", "This feature is under development.")

def main():
    root = tk.Tk()
    app = Main_Window(master=root)
    app.mainloop()

if __name__ == "__main__":
    main()
