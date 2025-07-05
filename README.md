# UVM Template Generator

This tool generates a complete UVM (Universal Verification Methodology) environment based on a reusable SystemVerilog template. You simply provide the design name and output folder — the tool automatically renames files, updates internal content, and prepares a ready-to-use UVM structure.

No need to manually modify template files — everything is automated.

---

## 🚀 Features

✅ Standalone GUI application  
✅ Generates new UVM files based on your design name  
✅ Replaces all instances of `design_name` in:
- File names
- File contents
- Comments like `/*design_name*/` or `/*design name*/`

✅ Preserves folder structure  
✅ Embedded template — no need to provide it manually  
✅ `.exe` version available — no Python required  

1. Run the `uvm_generator.exe`  
2. Enter your desired **design name** (e.g., `spi`, `i2c`, `uart`)  
3. Select an **output folder**  
4. Click "Generate UVM Files"  

The tool creates a folder like:  
