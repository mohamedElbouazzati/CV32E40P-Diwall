
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


module HPMtracer(
    input logic                rst_h,
    input logic                clk_h,
    input logic [11:0]        csr_add,
    input logic [31:0]        csr_data,
    input logic [31:0]         pc_h,
    input logic [31:0]         instr_h,
    input logic [31:0][63:0]   HPM,
    output logic [31:0][63:0]   HPMout,
    input logic                 EndDetect,
    output logic                EnableDetect
    

    );

    integer      cycles;
    bit          enableS1;
    bit         disableS1;
    bit         maintienS1;
    bit         maintienS0;
    int         HPMlog;  
    
assign enableS1 = (csr_add == 12'h320 )&&(csr_data ==32'h0000);
assign disableS1 = (csr_add == 12'h320 )&&(csr_data ==32'hFFFFFFFF); 
//assign maintienS0 = (csr_add != 12'h320 )&&(csr_data !=32'h0000);
//assign maintienS1 = (csr_add != 12'h320 )&&(csr_data !=32'hFFFF);
     
enum int unsigned {M=0, R=1, W=2} state, next_state;

always_comb begin
  begin
        case (state)
             W: begin
                HPMout <= 0;
                EnableDetect=0;
                if(enableS1) next_state=M;
                else next_state=W;
            end 
            M: begin
                HPMout <=0;
                EnableDetect=0;  
                if(disableS1) next_state=R;
                else next_state =M;
            end 
            R: begin
                if(EndDetect) next_state=W;
                else begin 
                EnableDetect =1;
                HPMout <= HPM;
                end
            end  
            default: next_state = W;         
            endcase
        end  
  end

always_ff @(posedge clk_h, negedge rst_h) 
begin
  if(rst_h == 1'b0) begin
  EnableDetect=0;  
  HPMout <=0;
  state=W;
  end
  else begin 
       state = next_state;
  end
end

    endmodule : HPMtracer