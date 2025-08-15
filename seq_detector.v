//FSM FOR DETECTING AN OVERLAPPING SEQUENCE 0110

module seq_detector(z, x, rst, clk);
    output reg z;
    input x;
    input rst;
    input clk;
    reg[1:0] present_state;
    reg[1:0] next_state;

    parameter S0 =2'b00 , S1=2'b01 , S2=2'b10 , S3=2'b11;

    always@(posedge clk or posedge rst) begin
        if (rst) present_state<=S0;
        else begin
            present_state<= next_state;
        end
    end

    always@(present_state, x) begin
        case(present_state)
        S0: begin 
            next_state= x? S0: S1;
            z= 0;
        end
        S1: begin 
            next_state= x? S2: S1;
            z= 0;
        end
        S2: begin 
            next_state= x? S3: S1;
            z= 0;
        end
        S3: begin 
            next_state= x? S1: S2;
            z= x? 0: 1;
        end
        endcase
    end
endmodule


