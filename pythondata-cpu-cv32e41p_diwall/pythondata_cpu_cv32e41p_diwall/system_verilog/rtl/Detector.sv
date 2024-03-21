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
(* DONT_TOUCH = 1 *)
module Detector(
    output logic [1:0]          alert,
    input logic                 rst_h,
    input logic                clk_h,
    input  [1:0][63:0]   HPM,
    output logic            endD,   
    input logic             enableD
    
    );
    
    //integer K1 = 10770.50;
    //integer K2 = 31.00;
    localparam K1 = 55;
    localparam K2 = 595;
    logic [31:0] alert_counter = 0;

   // enum int unsigned {Monitor = 0, Analyze = 1 } state, next_state;    // start of detection, heap overflow, legitime, stack overflow
   typedef enum logic [1:0] {Analyze=2'b00, Monitor=2'b10} state;
   state next_state;
    //enum int unsigned {start = 0, HBO = 1,LEG = 2, SBO = 3 } state, next_state;
    //assign IMISS=HPM[5];
    //assign LD=HPM[6];
    //assign ST=HPM[7];
    //assign COMP_INSTR=HPM[11];
    //assign BRANCH_TAKEN = HPM[10];
    // assign BRANCH_TAKEN = HPM[2];
    //assign JMP_STALL = HPM[4];
    //assign JUMP =  HPM[8];
    //assign LD_STALL = HPM[1];
     // assign LD_STALL = HPM[3];
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

if(HPM[0] <= K1) begin 
                // legitime
                alert_test = 2'b00 ;
                endD = 1;
                next_state <= Monitor;

end   
else begin 
   alert_counter = alert_counter +1;
    if(HPM[1] <= K2) begin 
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