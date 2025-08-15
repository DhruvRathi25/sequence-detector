module seq_detector_tb;
    reg x;
    reg rst;
    reg clk;
    wire z;

    seq_detector DUT(.z(z),.x(x),.rst(rst),.clk(clk));

    initial begin
        $dumpfile("seq_detector.vcd");
        $dumpvars(0, seq_detector_tb);
        $monitor("T=%d x=%b rst=%b z=%b", $time, x, rst, z);
    end

    initial begin
        clk=0;
    end

    always begin
        #5 clk= ~clk;
    end

    initial begin
        rst=1;
        //correct
        #4 rst=0; x=0;
        #10 x=1;
        #10 x=1;
        #10 x=0;
        #10 x=1;
        //correct
        #10 x=0;
        #10 x=1;
        #10 x=1;
        #10 x=0;

        #20 $finish;
    end
endmodule