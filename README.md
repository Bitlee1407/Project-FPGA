# Project-FPGA
My Lab work at FPGA this semester

Board: OMDAZZ Cyclone IV (`EP4CE10E22C8N`), Quartus Prime Lite 25.1.

## Labs

| Lab | Folder | Description |
|-----|--------|-------------|
| 1 | [`Lab 1`](Lab%201) | First programmed LED: a Quartus project where button S1 (`key1`) drives `led1` directly. Includes the lab guide `FPGA.pdf`. |
| 2 | [`Lab 2`](Lab%202) | LED blinker: a button press (S1, active-low) toggles blinking of `led1`; the blink period comes from a counter on the 50 MHz clock. |
| 3 | [`Lab 3`](Lab%203) | Three projects: `Ex1` (`Lab3`: button-toggled LED blink plus buzzer tone), `Emiter` (50 MHz clock divided into a carrier with a 1 kHz audio tone) and `RF_Generator` (square-wave RF output from the clock). |
| 4 | [`Lab 4`](Lab%204) | Vector drawing on an oscilloscope in XY mode: `OsciDesen` draws the letters P, A, U, L and a heart using line interpolation and a sigma-delta DAC (one pin + 4.7 kOhm + 5 nF per axis). S1/S2 change the shape, with a buzzer beep. Lab guide: `FPGA6.pdf`. |
| 5 | [`Lab 5`](Lab%205) | Capacitive presence & distance sensor: measures electrostatic discharge time on `PIN_103` to detect hand distance, displaying distance (9 down to 0) on the 7-segment display and variable audio frequency on buzzer `PIN_110`. |
