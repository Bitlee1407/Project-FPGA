module RF_Generator (
    input wire clk,
    output reg rf_out = 0
);

reg [4:0] counter = 0;

always @(posedge clk) begin
    if (counter == 24) begin
        counter <= 0;
        rf_out <= ~rf_out;
    end else begin
        counter <= counter + 1;
    end
end

endmodule
