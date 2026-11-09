# Project-FPGA
Lab work at FPGA this semester.

Our team is composed of Bitlan Adrian-Gabriel, Dorobantu Iulian-Adrian, Ghibirdic Maria-Cristina, Ghita Alexandru-Catalin and Juverdeanu Diana-Maria.

Each member has a folder with their labs: [`Bitlan Adrian`](Bitlan%20Adrian), [`Dorobantu Iulian`](Dorobantu%20Iulian), [`Ghibirdic Maria`](Ghibirdic%20Maria), [`Ghita Alexandru`](Ghita%20Alexandru) and [`Juverdeanu Diana`](Juverdeanu%20Diana).

Board: OMDAZZ Cyclone IV (`EP4CE10E22C8N`), Quartus Prime Lite 25.1.

## Labs

| Lab | Folder | Description |
|-----|--------|-------------|
| 1 | [`Bitlan Adrian/Lab 1`](Bitlan%20Adrian/Lab%201) | First programmed LED: a Quartus project where button S1 (`key1`) drives `led1` directly. Includes the lab guide `FPGA.pdf`. |
| 1 | [`Dorobantu Iulian/Lab 1`](Dorobantu%20Iulian/Lab%201) | First programmed LED: button S1 (`key1`) drives `led1` directly. Includes the lab guide `FPGA.pdf`. |
| 1 | [`Ghita Alexandru/Lab 1`](Ghita%20Alexandru/Lab%201) | First programmed LED: button S1 (`key1`) drives `led1` directly. Includes the lab guide `FPGA.pdf` and the archive `Lab 1 Ghita Alexandru.zip`. |
| 2 | [`Bitlan Adrian/Lab 2`](Bitlan%20Adrian/Lab%202) | LED blinker: a button press (S1, active-low) toggles blinking of `led1`; the blink period comes from a counter on the 50 MHz clock. |
| 2 | [`Dorobantu Iulian/Lab 2`](Dorobantu%20Iulian/Lab%202) | LED blinker: a button press (S1, active-low) toggles blinking of `led1`, with the period from a counter on the 50 MHz clock. |
| 2 | [`Ghita Alexandru/Lab 2`](Ghita%20Alexandru/Lab%202) | LED blinker: a button press (S1, active-low) toggles blinking of `led1`, with the period from a counter on the 50 MHz clock. Includes the archive `Lab 2 Ghita Alexandru.zip`. |
| 3 | [`Bitlan Adrian/Lab 3`](Bitlan%20Adrian/Lab%203) | Three projects: `Ex1` (`Lab3`: button-toggled LED blink plus buzzer tone), `Emiter` (50 MHz clock divided into a carrier with a 1 kHz audio tone) and `RF_Generator` (square-wave RF output from the clock). |
| 3 | [`Dorobantu Iulian/Lab 3`](Dorobantu%20Iulian/Lab%203) | Three projects: `Ex1` (button-toggled LED blink plus buzzer tone), `Emiter` (carrier from the 50 MHz clock with a 1 kHz audio tone) and `RF_Generator` (square-wave RF output from the clock). |
| 3 | [`Ghita Alexandru/Lab 3`](Ghita%20Alexandru/Lab%203) | Three projects: `Ex1` (button-toggled LED blink plus buzzer tone), `Emiter` (carrier from the 50 MHz clock with a 1 kHz audio tone) and `RF_Generator` (square-wave RF output from the clock). Includes the archive `Lab 3 Ghita Alexandru.zip`. |
| 4 | [`Bitlan Adrian/Lab 4`](Bitlan%20Adrian/Lab%204) | Vector drawing on an oscilloscope in XY mode: `OsciDesen` draws the letters P, A, U, L and a heart using line interpolation and a sigma-delta DAC (one pin + 4.7 kOhm + 5 nF per axis). S1/S2 change the shape, with a buzzer beep. Lab guide: `FPGA6.pdf`. |
| 4 | [`Dorobantu Iulian/Lab 4`](Dorobantu%20Iulian/Lab%204) | Vector drawing on an oscilloscope in XY mode: `OsciDesen` draws the letters P, A, U, L and a heart with line interpolation and a sigma-delta DAC. S1/S2 change the shape, with a buzzer beep. Lab guide: `FPGA6.pdf`. |
| 4 | [`Ghita Alexandru/Lab 4`](Ghita%20Alexandru/Lab%204) | Vector drawing on an oscilloscope in XY mode: `OsciDesen Ghita Alexandru` (`lab6`) draws the letters A, L, E, X, G, H, I, T, A (his name) with line interpolation and a sigma-delta DAC (X on `PIN_103`, Y on `PIN_100`). S1/S2 go to the next/previous letter, with a 2 kHz buzzer beep. Includes the archive `Lab 4 Ghita Alexandru.zip`. |
| 5 | [`Bitlan Adrian/Lab 5`](Bitlan%20Adrian/Lab%205) | Two projects: `Senzor Prezenta` (capacitive presence sensor on `PIN_103`: measures the foil discharge time, calibrates a baseline and drives the buzzer on `PIN_110` with a pitch that rises with the change) and `NN` (a small neural network with online learning: an LDR on `PIN_103` is classified as pulsing, steady or dark; S1/S2/KEY3 train the classes, KEY4 resets, results on LED1-LED3). |
| 5 | [`Dorobantu Iulian/Lab 5`](Dorobantu%20Iulian/Lab%205) | Two projects: `Senzor Prezenta` (capacitive presence sensor on `PIN_103` with a buzzer on `PIN_110` whose pitch rises with the change) and `NN` (small neural network with online learning that classifies an LDR on `PIN_103` as pulsing, steady or dark; S1/S2/KEY3 train, KEY4 resets, results on LED1-LED3). |
| 5 | [`Ghita Alexandru/Lab 5`](Ghita%20Alexandru/Lab%205) | Two projects: `Senzor Prezenta` (capacitive presence and distance sensor on `PIN_103` with the buzzer on `PIN_110`, plus a 7-segment display that shows the distance as a digit from 0 = very close to 9 = nothing detected) and `NN` (small neural network with online learning that classifies an LDR on `PIN_103` as pulsing, steady or dark; S1/S2/KEY3 train, KEY4 resets, results on LED1-LED3). Includes the archive `Lab 5 Ghita Alexandru.zip`. |
