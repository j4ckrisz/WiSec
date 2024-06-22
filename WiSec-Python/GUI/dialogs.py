import tkinter as tk
from tkinter import simpledialog


class CustomDialog(simpledialog.Dialog):
    def body(self, master):
        tk.Label(master, text="This is a custom dialog").grid(row=0)
        return None

    def apply(self):
        print("dialog closed")