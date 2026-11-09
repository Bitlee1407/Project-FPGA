module Emiter (
    input wire clk,
    output wire rf_out
);

reg [4:0] rf_count = 0;
reg carrier = 0;
reg [14:0] audio_count = 0;
reg audio = 0;

always @(posedge clk) begin
    if (rf_count == 24) begin
        rf_count <= 0;
        carrier <= ~carrier;
    end else rf_count <= rf_count + 1;
end

always @(posedge clk) begin
    if (audio_count == 24999) begin
        audio_count <= 0;
        audio <= ~audio;
    end else audio_count <= audio_count + 1;
end

assign rf_out = carrier & audio;

endmodule
