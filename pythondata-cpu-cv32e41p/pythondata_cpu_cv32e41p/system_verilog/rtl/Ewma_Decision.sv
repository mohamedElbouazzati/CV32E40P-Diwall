module Ewma_Decision
    (
    input logic                 rst_h,
    input logic                clk_h,  
    input logic             EnableDecision,
    input logic [31:0]         ewma_rssi, 
    output logic           Alert_Jamming   
    );
    logic  [31:0]  ewma_sig;
    logic  [31:0]   UCL = 4294967231; // -65
    logic  [31:0]   LCL = 4294967190; // -106
    integer alert_counter = 0;
    logic alert;
    assign Alert_Jamming = alert;
    assign ewma_sig  = ewma_rssi;
always_ff @(posedge clk_h, negedge rst_h) begin
    if(rst_h == 1'b0)  begin
        alert = 0;
        alert_counter = 0;
  end 
    else begin
  //  if(ewma_sig>0) begin    
    if(EnableDecision) begin 
            if(ewma_sig>UCL)begin
                alert = 1;
                alert_counter = alert_counter +1;
            end
            
            else if(ewma_sig<LCL)begin
                alert = 1;
                alert_counter = alert_counter +1;
            end
            else begin alert = 0;
            end     
        end
    end    
   // end
end

endmodule    