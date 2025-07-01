 4-bit Pseudo Random Number Generator using Verilog on Basys 3 FPGA

## 🔍 Project Overview
This project implements a **4-bit pseudo-random number generator (PRNG)** on the **Basys 3 FPGA board** using **Verilog**. The PRNG is designed using a **Linear Feedback Shift Register (LFSR)** with a tapped XOR feedback mechanism.

Additionally, the binary output of the PRNG is **converted to decimal** and displayed on the **7-segment display** built into the Basys 3 board.

---

## 🛠️ Tools and Technologies
- **FPGA Board:** Basys 3
- **Language:** Verilog 
- **Design Tool:** Xilinx Vivado 2024.2

---

## 📁 Project Directory Structure
```bash
├── src/            # Verilog source files (prng, seven_segment_display, bin_to_bcd, top_module)
├── constraints/    # XDC file with pin mappings for Basys 3
├── tb/             # Testbenches for simulation
└── README.md       # Project documentation

```
## 🧩 Synthesize & Implement on Basys 3:
1.Open Xilinx Vivado 2024.2

2.Create a new project and add the files from the src/ and constraints/ folders.

3.Set the target board to Basys 3.

4.Run Synthesis → Implementation → Bitstream Generation

5.Program the FPGA using Hardware Manager

## 🧪 Run Simulation (Optional):
1.Use Vivado’s built-in simulator

2.Add the tb/ testbenches

3.Simulate the design and verify waveform output

## 👤 Author
**Thamaraikannan T**

Project completed as part of academic learning on FPGA/Verilog using Basys 3.

## 📜 License
This project is open-source and available under the MIT License.


