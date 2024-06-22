import tkinter as tk 
from GUI.main_window import Main_Window
from datetime import *
from resources.styles.colors import c


current_time = datetime.now()
formatted_time = current_time.strftime('Date: '+c.CYAN+"%Y-%m-%d"+ c.END + ', Time: ' + c.CYAN + "%H:%M:%S"+c.END)

def main():

    print('['+c.PURPLE+'*'+c.END+'] Starting '+c.GREEN+'Wisec'+ c.END, formatted_time)
    root = tk.Tk()
    app = Main_Window(root)
    root.mainloop()

if __name__ == '__main__':
    main()
