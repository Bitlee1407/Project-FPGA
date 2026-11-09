# Project-FPGA
Lab work at FPGA this semester.

Our team is composed of Bitlan Adrian-Gabriel, Dorobantu Iulian-Adrian, Ghibirdic Maria-Cristina, Ghita Alexandru-Catalin and Juverdeanu Diana-Maria.

Each member has a folder with their labs: [`Bitlan Adrian`](Bitlan%20Adrian), [`Dorobantu Iulian`](Dorobantu%20Iulian), [`Ghibirdic Maria`](Ghibirdic%20Maria), [`Ghita Alexandru`](Ghita%20Alexandru) and [`Juverdeanu Diana`](Juverdeanu%20Diana).

Board: OMDAZZ Cyclone IV (`EP4CE10E22C8N`), Quartus Prime Lite 25.1.

## Labs

| Lab | Folder | Description |
|-----|--------|-------------|
| 1 | [`Bitlan Adrian/Lab 1`](Bitlan%20Adrian/Lab%201) | First programmed LED: a Quartus project where button S1 (`key1`) drives `led1` directly. Includes the lab guide `FPGA.pdf`. |
| 1 | [`Dorobantu Iulian/Lab 1`](Dorobantu%20Iulian/Lab%201) | My first FPGA project: pressing key1 (S1) lights up led1, the button is wired straight to the LED. The `FPGA.pdf` guide is in the folder too. |
| 1 | [`Ghita Alexandru/Lab 1`](Ghita%20Alexandru/Lab%201) | Introduction to Quartus and the Cyclone IV board. The `Lab1` design connects the S1 button to LED1 so the LED follows the button state. Contents: the Quartus project, lab guide `FPGA.pdf` and the full archive `Lab 1 Ghita Alexandru.zip`. |
| 2 | [`Bitlan Adrian/Lab 2`](Bitlan%20Adrian/Lab%202) | LED blinker: a button press (S1, active-low) toggles blinking of `led1`; the blink period comes from a counter on the 50 MHz clock. |
| 2 | [`Dorobantu Iulian/Lab 2`](Dorobantu%20Iulian/Lab%202) | Blinking LED. One press on S1 starts the blinking of led1, another press stops it. The speed is set by a counter that divides the 50 MHz clock. |
| 2 | [`Ghita Alexandru/Lab 2`](Ghita%20Alexandru/Lab%202) | Toggle blink with a button. S1 is active-low and every press switches LED1 between blinking and off; the blink rate is obtained from a clock divider on the 50 MHz oscillator. Archive: `Lab 2 Ghita Alexandru.zip`. |
| 3 | [`Bitlan Adrian/Lab 3`](Bitlan%20Adrian/Lab%203) | Three projects: [`Ex1`](Bitlan%20Adrian/Lab%203/Ex1) (`Lab3`: button-toggled LED blink plus buzzer tone), `Emiter` (50 MHz clock divided into a carrier with a 1 kHz audio tone) and `RF_Generator` (square-wave RF output from the clock). |
| 3 | [`Dorobantu Iulian/Lab 3`](Dorobantu%20Iulian/Lab%203) | Three small projects. `Ex1` blinks the LED on a button press and plays a tone on the buzzer, `Emiter` makes a carrier from the 50 MHz clock and switches it on/off with a 1 kHz tone, and `RF_Generator` puts a square-wave RF signal on a pin. |
| 3 | [`Ghita Alexandru/Lab 3`](Ghita%20Alexandru/Lab%203) | Lab split in three parts: `Ex1` (LED blink toggled by S1 together with a buzzer tone), `Emiter` (OOK transmitter: carrier derived from the 50 MHz clock, modulated by a 1 kHz audio signal) and `RF_Generator` (square-wave RF generator driven directly by the clock). Archive: `Lab 3 Ghita Alexandru.zip`. |
| 4 | [`Bitlan Adrian/Lab 4`](Bitlan%20Adrian/Lab%204) | Vector drawing on an oscilloscope in XY mode: `OsciDesen` draws the letters A, D, R, I, A, N, B, I, T, L, A, N (my name) using line interpolation and a sigma-delta DAC (one pin + 4.7 kOhm + 5 nF per axis). S1/S2 go to the next/previous letter, with a buzzer beep. Lab guide: `FPGA6.pdf`. |
| 4 | [`Dorobantu Iulian/Lab 4`](Dorobantu%20Iulian/Lab%204) | Drawing on the oscilloscope in XY mode. `OsciDesen` writes my name, ADRIAN DOROBANTU, one letter at a time. Each letter is made of lines and the X/Y voltages come from a sigma-delta DAC (a pin with an RC filter). S1 goes to the next letter, S2 back, and the buzzer beeps on every press. Guide: `FPGA6.pdf`. |
| 4 | [`Ghita Alexandru/Lab 4`](Ghita%20Alexandru/Lab%204) | Oscilloscope vector display (XY mode). Project `OsciDesen Ghita Alexandru` (top module `lab6`) traces my name ALEX GHITA letter by letter: line segments are interpolated and sent through a sigma-delta DAC, X on `PIN_103` and Y on `PIN_100`. S1/S2 select the next/previous letter and each press gives a short 2 kHz beep. Archive: `Lab 4 Ghita Alexandru.zip`. |
| 5 | [`Bitlan Adrian/Lab 5`](Bitlan%20Adrian/Lab%205) | Two projects: `Senzor Prezenta` (capacitive presence sensor on `PIN_103`: measures the foil discharge time, calibrates a baseline and drives the buzzer on `PIN_110` with a pitch that rises with the change) and `NN` (a small neural network with online learning: an LDR on `PIN_103` is classified as pulsing, steady or dark; S1/S2/KEY3 train the classes, KEY4 resets, results on LED1-LED3). |
| 5 | [`Dorobantu Iulian/Lab 5`](Dorobantu%20Iulian/Lab%205) | Two projects. `Senzor Prezenta`: a capacitive sensor on `PIN_103` that makes the buzzer (`PIN_110`) sound higher when a hand comes closer. `NN`: a small neural network that learns live and tells if the light on an LDR (`PIN_103`) is pulsing, steady or dark; I train it with S1/S2/KEY3, reset with KEY4, and the answer shows on LED1-LED3. |
| 5 | [`Ghita Alexandru/Lab 5`](Ghita%20Alexandru/Lab%205) | `Senzor Prezenta`: capacitive presence and distance sensor (`PIN_103`) with buzzer feedback on `PIN_110`, extended with a 7-segment display that shows the distance as a digit, 0 = very close and 9 = nothing detected. `NN`: neural network with online learning that classifies the LDR signal on `PIN_103` as pulsing / steady / dark (training on S1, S2, KEY3, reset on KEY4, output on LED1-LED3). Archive: `Lab 5 Ghita Alexandru.zip`. |
