module OsciDesen (
    input wire clk,
    input wire S1, S2,
    output wire X, Y,
    output reg buzzer = 1'b1
);

// Draws the name ADRIAN BITLAN letter by letter on an oscilloscope in XY mode.
// S1 = next letter, S2 = previous letter.

reg [7:0] x = 70, y = 60;
reg [9:0] sx = 0, sy = 0;
reg [10:0] timer = 0;
reg [3:0] phase = 0;   // 0=A, 1=D, 2=R, 3=I, 4=A, 5=N, 6=B, 7=I, 8=T, 9=L, 10=A, 11=N
reg [3:0] segment = 0;
reg [6:0] t = 0;

// Button synchronization
reg s1a = 1, s1b = 1;
reg s2a = 1, s2b = 1;

// Debounce
reg [18:0] db1 = 0, db2 = 0;
reg k1 = 1, k2 = 1;
reg prev1 = 1, prev2 = 1;

// Beep: 2 kHz for 80 ms
reg [13:0] tone_count = 0;
reg [21:0] beep_count = 0;

// Coordinates: {x0, y0, x1, y1}
function [31:0] shape;
    input [3:0] p;
    input [3:0] s;
begin
    shape = {8'd70,8'd60,8'd70,8'd60};
    case (p)
        // 0: A
        0: case (s)
            0: shape = {8'd70,8'd60,8'd128,8'd210};
            1: shape = {8'd128,8'd210,8'd186,8'd60};
            2: shape = {8'd186,8'd60,8'd157,8'd135};
            3: shape = {8'd157,8'd135,8'd99,8'd135};
            4: shape = {8'd99,8'd135,8'd128,8'd210};
            5: shape = {8'd128,8'd210,8'd70,8'd60};
            default: shape = {8'd70,8'd60,8'd70,8'd60};
        endcase
        // 1: D
        1: case (s)
            0: shape = {8'd90,8'd60,8'd90,8'd210};
            1: shape = {8'd90,8'd210,8'd140,8'd210};
            2: shape = {8'd140,8'd210,8'd165,8'd180};
            3: shape = {8'd165,8'd180,8'd165,8'd90};
            4: shape = {8'd165,8'd90,8'd140,8'd60};
            5: shape = {8'd140,8'd60,8'd90,8'd60};
            default: shape = {8'd90,8'd60,8'd90,8'd60};
        endcase
        // 2: R
        2: case (s)
            0: shape = {8'd90,8'd60,8'd90,8'd210};
            1: shape = {8'd90,8'd210,8'd145,8'd210};
            2: shape = {8'd145,8'd210,8'd165,8'd190};
            3: shape = {8'd165,8'd190,8'd165,8'd155};
            4: shape = {8'd165,8'd155,8'd145,8'd135};
            5: shape = {8'd145,8'd135,8'd90,8'd135};
            6: shape = {8'd90,8'd135,8'd165,8'd60};
            7: shape = {8'd165,8'd60,8'd90,8'd135};
            8: shape = {8'd90,8'd135,8'd145,8'd135};
            9: shape = {8'd145,8'd135,8'd165,8'd155};
            10: shape = {8'd165,8'd155,8'd165,8'd190};
            11: shape = {8'd165,8'd190,8'd145,8'd210};
            12: shape = {8'd145,8'd210,8'd90,8'd210};
            13: shape = {8'd90,8'd210,8'd90,8'd60};
            default: shape = {8'd90,8'd60,8'd90,8'd60};
        endcase
        // 3: I
        3: case (s)
            0: shape = {8'd95,8'd210,8'd160,8'd210};
            1: shape = {8'd160,8'd210,8'd128,8'd210};
            2: shape = {8'd128,8'd210,8'd128,8'd60};
            3: shape = {8'd128,8'd60,8'd95,8'd60};
            4: shape = {8'd95,8'd60,8'd160,8'd60};
            5: shape = {8'd160,8'd60,8'd95,8'd60};
            6: shape = {8'd95,8'd60,8'd128,8'd60};
            7: shape = {8'd128,8'd60,8'd128,8'd210};
            8: shape = {8'd128,8'd210,8'd160,8'd210};
            9: shape = {8'd160,8'd210,8'd95,8'd210};
            default: shape = {8'd95,8'd210,8'd95,8'd210};
        endcase
        // 4: A
        4: case (s)
            0: shape = {8'd70,8'd60,8'd128,8'd210};
            1: shape = {8'd128,8'd210,8'd186,8'd60};
            2: shape = {8'd186,8'd60,8'd157,8'd135};
            3: shape = {8'd157,8'd135,8'd99,8'd135};
            4: shape = {8'd99,8'd135,8'd128,8'd210};
            5: shape = {8'd128,8'd210,8'd70,8'd60};
            default: shape = {8'd70,8'd60,8'd70,8'd60};
        endcase
        // 5: N
        5: case (s)
            0: shape = {8'd90,8'd60,8'd90,8'd210};
            1: shape = {8'd90,8'd210,8'd165,8'd60};
            2: shape = {8'd165,8'd60,8'd165,8'd210};
            3: shape = {8'd165,8'd210,8'd165,8'd60};
            4: shape = {8'd165,8'd60,8'd90,8'd210};
            5: shape = {8'd90,8'd210,8'd90,8'd60};
            default: shape = {8'd90,8'd60,8'd90,8'd60};
        endcase
        // 6: B
        6: case (s)
            0: shape = {8'd90,8'd60,8'd90,8'd210};
            1: shape = {8'd90,8'd210,8'd145,8'd210};
            2: shape = {8'd145,8'd210,8'd165,8'd190};
            3: shape = {8'd165,8'd190,8'd165,8'd155};
            4: shape = {8'd165,8'd155,8'd145,8'd135};
            5: shape = {8'd145,8'd135,8'd90,8'd135};
            6: shape = {8'd90,8'd135,8'd150,8'd135};
            7: shape = {8'd150,8'd135,8'd170,8'd115};
            8: shape = {8'd170,8'd115,8'd170,8'd80};
            9: shape = {8'd170,8'd80,8'd150,8'd60};
            10: shape = {8'd150,8'd60,8'd90,8'd60};
            default: shape = {8'd90,8'd60,8'd90,8'd60};
        endcase
        // 7: I
        7: case (s)
            0: shape = {8'd95,8'd210,8'd160,8'd210};
            1: shape = {8'd160,8'd210,8'd128,8'd210};
            2: shape = {8'd128,8'd210,8'd128,8'd60};
            3: shape = {8'd128,8'd60,8'd95,8'd60};
            4: shape = {8'd95,8'd60,8'd160,8'd60};
            5: shape = {8'd160,8'd60,8'd95,8'd60};
            6: shape = {8'd95,8'd60,8'd128,8'd60};
            7: shape = {8'd128,8'd60,8'd128,8'd210};
            8: shape = {8'd128,8'd210,8'd160,8'd210};
            9: shape = {8'd160,8'd210,8'd95,8'd210};
            default: shape = {8'd95,8'd210,8'd95,8'd210};
        endcase
        // 8: T
        8: case (s)
            0: shape = {8'd80,8'd210,8'd176,8'd210};
            1: shape = {8'd176,8'd210,8'd128,8'd210};
            2: shape = {8'd128,8'd210,8'd128,8'd60};
            3: shape = {8'd128,8'd60,8'd128,8'd210};
            4: shape = {8'd128,8'd210,8'd176,8'd210};
            5: shape = {8'd176,8'd210,8'd80,8'd210};
            default: shape = {8'd80,8'd210,8'd80,8'd210};
        endcase
        // 9: L
        9: case (s)
            0: shape = {8'd95,8'd210,8'd95,8'd60};
            1: shape = {8'd95,8'd60,8'd165,8'd60};
            2: shape = {8'd165,8'd60,8'd95,8'd60};
            3: shape = {8'd95,8'd60,8'd95,8'd210};
            default: shape = {8'd95,8'd210,8'd95,8'd210};
        endcase
        // 10: A
        10: case (s)
            0: shape = {8'd70,8'd60,8'd128,8'd210};
            1: shape = {8'd128,8'd210,8'd186,8'd60};
            2: shape = {8'd186,8'd60,8'd157,8'd135};
            3: shape = {8'd157,8'd135,8'd99,8'd135};
            4: shape = {8'd99,8'd135,8'd128,8'd210};
            5: shape = {8'd128,8'd210,8'd70,8'd60};
            default: shape = {8'd70,8'd60,8'd70,8'd60};
        endcase
        // 11: N
        11: case (s)
            0: shape = {8'd90,8'd60,8'd90,8'd210};
            1: shape = {8'd90,8'd210,8'd165,8'd60};
            2: shape = {8'd165,8'd60,8'd165,8'd210};
            3: shape = {8'd165,8'd210,8'd165,8'd60};
            4: shape = {8'd165,8'd60,8'd90,8'd210};
            5: shape = {8'd90,8'd210,8'd90,8'd60};
            default: shape = {8'd90,8'd60,8'd90,8'd60};
        endcase
        default: shape = {8'd70,8'd60,8'd70,8'd60};
    endcase
end
endfunction

reg [3:0] last_segment;
always @(*) begin
    case (phase)
        0: last_segment = 5;  // A
        1: last_segment = 5;  // D
        2: last_segment = 13; // R
        3: last_segment = 9;  // I
        4: last_segment = 5;  // A
        5: last_segment = 5;  // N
        6: last_segment = 10; // B
        7: last_segment = 9;  // I
        8: last_segment = 5;  // T
        9: last_segment = 3;  // L
        10: last_segment = 5; // A
        11: last_segment = 5; // N
        default: last_segment = 0;
    endcase
end

wire [31:0] v = shape(phase, segment);
wire [7:0] x0 = v[31:24];
wire [7:0] y0 = v[23:16];
wire [7:0] x1 = v[15:8];
wire [7:0] y1 = v[7:0];

wire signed [10:0] dx = $signed({1'b0,x1}) - $signed({1'b0,x0});
wire signed [10:0] dy = $signed({1'b0,y1}) - $signed({1'b0,y0});
wire signed [20:0] ix = $signed({1'b0,x0}) + (dx * $signed({1'b0,t})) / 63;
wire signed [20:0] iy = $signed({1'b0,y0}) + (dy * $signed({1'b0,t})) / 63;

wire press1 = prev1 && !k1;
wire press2 = prev2 && !k2;

always @(posedge clk) begin
    // Synchronize buttons
    s1a <= S1;
    s1b <= s1a;
    s2a <= S2;
    s2b <= s2a;

    // Debounce: approximately 10 ms
    if (s1b == k1)
        db1 <= 0;
    else if (db1 == 499999) begin
        db1 <= 0;
        k1 <= s1b;
    end else
        db1 <= db1 + 1'b1;

    if (s2b == k2)
        db2 <= 0;
    else if (db2 == 499999) begin
        db2 <= 0;
        k2 <= s2b;
    end else
        db2 <= db2 + 1'b1;

    prev1 <= k1;
    prev2 <= k2;

    // Working sigma-delta DAC
    sx <= {2'b00,sx[7:0]} + {2'b00,x};
    sy <= {2'b00,sy[7:0]} + {2'b00,y};

    // Button selection
    if (press1 || press2) begin
        if (press1)
            phase <= (phase == 11) ? 4'd0 : phase + 1'b1;
        else
            phase <= (phase == 0) ? 4'd11 : phase - 1'b1;

        segment <= 0;
        t <= 0;
        timer <= 0;

        // Start beep
        beep_count <= 4000000;
        tone_count <= 0;
        buzzer <= 1'b1;
    end else begin
        // Drawing engine
        if (timer == 1388) begin
            timer <= 0;
            x <= ix[7:0];
            y <= iy[7:0];
            if (t == 63) begin
                t <= 0;
                segment <= (segment == last_segment) ? 4'd0 : segment + 1'b1;
            end else
                t <= t + 1'b1;
        end else
            timer <= timer + 1'b1;

        // Buzzer oscillator
        if (beep_count != 0) begin
            beep_count <= beep_count - 1'b1;
            if (tone_count == 12499) begin
                tone_count <= 0;
                buzzer <= ~buzzer;
            end else
                tone_count <= tone_count + 1'b1;
        end else begin
            // Inactive buzzer = HIGH
            buzzer <= 1'b1;
            tone_count <= 0;
        end
    end
end

assign X = sx[8];
assign Y = sy[8];

endmodule
