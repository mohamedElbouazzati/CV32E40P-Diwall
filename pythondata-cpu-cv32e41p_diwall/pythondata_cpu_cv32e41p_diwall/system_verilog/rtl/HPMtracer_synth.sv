
//////////////////////////////////////////////////////////////////////////////////
// Company: Lab-sticc université bretagne sud
// Engineer: Mohamed EL BOUAZZATI
// Supervisors: Philippe Tanguy and Guy Gogniat

// Create Date: 01/28/2022 05:11:27 PM
// Design Name: HPMtracer
// Module Name: HPMtracer
// Project Name: Hardware perfomance counter tracer
// Target Devices: CV32E40P
// Tool Versions: 2020.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

(* DONT_TOUCH = 1 *)
module HPMtracer_synth(
    input logic                rst_h,
    input logic                clk_h,
    input logic [11:0]        csr_add,
    input logic [31:0]        csr_data,
    input logic [2:0][63:0]   HPM,
    output logic [2:0][63:0]   HPMout,
    input logic                 EndDetect,
    output logic                EnableDetect,
    input logic          [1:0]  target
    

    );
    bit          enableS1;
    bit         disableS1;
    
    assign enableS1 = (csr_add == 12'h320 )&&(csr_data ==32'h0000);
    assign disableS1 = (csr_add == 12'h320 )&&(csr_data ==32'hFFFFFFFF); 

   typedef enum logic [1:0] {M=2'b11, R=2'b01, W=2'b10} state;
   state next_state;

always_ff @(posedge clk_h, negedge rst_h) 
begin
  if(rst_h == 1'b0) begin
  EnableDetect=0;  
  HPMout <=0;
  next_state <= W;
  end
  else begin
            case(next_state)
             W: begin
                EnableDetect=0;  
                HPMout <=0;
                if(enableS1) 
                begin 
                   next_state=M;
                end
                else begin 
                   next_state=W;
                end
                end 
            M: begin
                if(disableS1) begin 
                    next_state=R;
                    EnableDetect=1;  
                    HPMout <=HPM;
                end
                else begin 
                 next_state =M;
                 EnableDetect=0;  
                 HPMout <=0;     
                end
                end 
            R: begin
                if(EndDetect) begin
                     EnableDetect =0;
                     HPMout <= 0;
                     next_state=W;
                end  
                else begin 
                        EnableDetect =0;
                        HPMout <= HPM;
                        next_state=R;
                end
            end
            default: next_state = W;         
            endcase
  end
end

endmodule : HPMtracer_synth