import tkinter as tk
from tkinter import ttk
from scapy.all import sniff, Dot11, Dot11Elt, Dot11Beacon, Dot11ProbeResp
import subprocess
from logic.network_utils import get_network_interfaces

# Import WPA2_Window from the correct module path
from GUI.WPA2_Window import WPA2_Window

class Main_Window(tk.Frame):

    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.master.title("Wisec - Wireless Penetration Testing Tool")
        self.master.geometry("1440x720")

        self.create_network_interface_selector()
        self.create_attack_menu()

    def create_network_interface_selector(self):
        interfaces = get_network_interfaces()
        self.interface_label = tk.Label(self, text="Select Network Interface:")
        self.interface_label.grid(row=0, column=0, padx=10, pady=10, sticky='w')

        self.interface_combobox = ttk.Combobox(self, values=interfaces, state='readonly')
        self.interface_combobox.bind('<<ComboboxSelected>>', self.on_interface_selected)
        self.interface_combobox.grid(row=0, column=1, padx=10, pady=10, sticky='w')

        self.selected_interface_label = tk.Label(self, text="")
        self.selected_interface_label.grid(row=0, column=2, padx=10, pady=10, sticky='w')

    def on_interface_selected(self, event):
        selected_interface = self.interface_combobox.get()
        self.selected_interface_label.config(text=f"Selected Interface: {selected_interface}")

    def create_attack_menu(self):
        # Create a frame for the attack menu
        self.menu_frame = tk.Frame(self)
        self.menu_frame.grid(row=0, column=3, rowspan=2, padx=10, pady=10, sticky='ns')

        # Create buttons for each attack option
        self.wpa2_button = tk.Button(self.menu_frame, text="WPA2 Attack", command=self.open_wpa2_window)
        self.wpa2_button.grid(row=0, column=0, pady=5, sticky='ew')

        self.wep_button = tk.Button(self.menu_frame, text="WEP Attacks", command=self.open_wep_window)
        self.wep_button.grid(row=1, column=0, pady=5, sticky='ew')

        self.wps_button = tk.Button(self.menu_frame, text="WPS Attacks", command=self.open_wps_window)
        self.wps_button.grid(row=2, column=0, pady=5, sticky='ew')

        self.evil_twin_button = tk.Button(self.menu_frame, text="Evil Twin Options", command=self.on_evil_twin)
        self.evil_twin_button.grid(row=3, column=0, pady=5, sticky='ew')

    def open_wpa2_window(self):
        WPA2_Window(self)

    def open_wep_window(self):
        pass

    def open_wps_window(self):

        pass

    def on_evil_twin(self):
        print("Evil Twin Attack selected")


if __name__ == "__main__":
    root = tk.Tk()
    app = Main_Window(master=root)
    app.mainloop()
