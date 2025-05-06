import os
import sys
import tkinter as tk
from tkinter import filedialog, messagebox
from pathlib import Path

# Determine path to the templates (support PyInstaller or normal run)
if hasattr(sys, '_MEIPASS'):
    resource_dir = Path(sys._MEIPASS) / "uvm_generator" / "templates"
else:
    resource_dir = Path(__file__).parent / "templates"

def generate_uvm_design(design_name, output_dir):
    os.makedirs(output_dir, exist_ok=True)

    for file_path in resource_dir.glob("*"):
        if not file_path.is_file():
            continue

        with open(file_path, 'r') as infile:
            content = infile.read()
        content = (content
                    .replace(" /*design_name*/", design_name)
                    .replace("design_name", design_name)
                    .replace("/*design_name*/", design_name)
                    .replace("/*design name*/", design_name))

        new_file_name = file_path.name.replace("design_name", design_name)
        output_path = os.path.join(output_dir, new_file_name)

        with open(output_path, 'w') as outfile:
            outfile.write(content)

def generate_clicked():
    design = design_var.get().strip()
    output_base = output_var.get().strip()

    if not design or not output_base:
        messagebox.showerror("Error", "Please fill in all fields.")
        return

    output_dir = os.path.join(output_base, f"{design}_uvm")
    generate_uvm_design(design, output_dir)
    messagebox.showinfo("Success", f"Generated UVM template in '{output_dir}'.")

def select_output_folder():
    folder = filedialog.askdirectory()
    if folder:
        output_var.set(folder)

# GUI setup
root = tk.Tk()
root.title("UVM Template Generator")
root.geometry("400x250")

design_var = tk.StringVar()
output_var = tk.StringVar()

tk.Label(root, text="Design Name:").pack(pady=(10, 2))
tk.Entry(root, textvariable=design_var, width=50).pack()

tk.Label(root, text="Output Folder:").pack(pady=(10, 2))
tk.Entry(root, textvariable=output_var, width=50).pack()
tk.Button(root, text="Browse", command=select_output_folder).pack(pady=(2, 10))

tk.Button(root, text="Generate UVM Files", command=generate_clicked).pack(pady=10)

root.mainloop()