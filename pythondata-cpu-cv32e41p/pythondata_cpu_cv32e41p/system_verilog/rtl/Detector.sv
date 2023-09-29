//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2022 06:13:21 PM
// Design Name: 
// Module Name: FSM_DT_V2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/* Model 3 
    |--- IMISS <= 10770.50
    |   |--- class: LEG
    |--- IMISS >  10770.50
    |   |--- JMP_STALL <= 31.00
    |   |   |--- class: Heap overflow
    |   |--- JMP_STALL >  31.00
    |   |   |--- class: Stack overflow
*/
module Detector(
    output logic [1:0]          alert,
    input logic                 rst_h,
    input logic                clk_h,
    input  [31:0][63:0]   HPM,
    output logic            endD,   
    input logic             enableD
    
    );
    
    //integer K1 = 10770.50;
    //integer K2 = 31.00;
    integer K1 = 55;
    integer K2 = 595;
    integer alert_counter = 0;
    integer Cycles,Minstret,JMP_STALL,IMISS,LD,ST,JUMP, LD_STALL, BRANCH, BRANCH_TAKEN, COMP_INSTR;
    enum int unsigned {Monitor = 0, Analyze = 1 } state, next_state;    // start of detection, heap overflow, legitime, stack overflow
    //enum int unsigned {start = 0, HBO = 1,LEG = 2, SBO = 3 } state, next_state;
    //assign IMISS=HPM[5];
    //assign LD=HPM[6];
    //assign ST=HPM[7];
    //assign COMP_INSTR=HPM[11];
    //assign BRANCH_TAKEN = HPM[10];
     assign BRANCH_TAKEN = HPM[2];
    //assign JMP_STALL = HPM[4];
    //assign JUMP =  HPM[8];
    //assign LD_STALL = HPM[1];
      assign LD_STALL = HPM[3];
    //assign BRANCH = HPM[9];
    logic  [1:0] alert_test;
    assign alert = alert_test;
   // always_comb @(IMISS,JMP_STALL, enableD, state) begin : next_state_logic
  always_ff @(posedge clk_h, negedge rst_h) begin
        if(rst_h == 1'b0)  begin
                 endD = 0;
                 alert_test = 2'b00; 
                 alert_counter=0;
                 //alert = 2'b11;  
                 next_state <= Monitor;
     
              end           
         else  begin 
                        case(next_state) 
        Analyze : begin

if(LD_STALL <= K1) begin 
                // legitime
                alert_test = 2'b01 ;
                endD = 1;
                next_state <= Monitor;

end   
else begin 
   alert_counter = alert_counter +1;
    if(BRANCH_TAKEN <= K2) begin 
                alert_test = 2'b10 ; 
                endD = 1;
                next_state <= Monitor;
                //stack overflow
    end
    else begin
      
               alert_test = 2'b11 ; 
                endD = 1;  
            // heap overflow
                next_state <= Monitor;   
               
    end    
end      
 

    end                 
        Monitor : begin
            endD = 0;
            alert_test <= 2'b00; // 2 = BO
            if(enableD) begin
            next_state=Analyze;
            end
            else next_state=Monitor;
        end 
        default : next_state=Monitor;            
  
       endcase        


         end
          
        end

endmodule
