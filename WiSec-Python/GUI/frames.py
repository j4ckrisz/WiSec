import tkinter as tk
from tkinter import ttk

class CustomFrame(ttk.Frame):
    def __init__(self, parent):

        super().__init__(parent)

        self.label = ttk.Label(self, text="This is a custom frame")
        self.label.grid(row=0, column=0, padx=5, pady=5)