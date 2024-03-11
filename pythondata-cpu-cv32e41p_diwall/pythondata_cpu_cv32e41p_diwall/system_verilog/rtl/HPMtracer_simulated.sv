
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
    input logic [31:0][63:0]   HPM
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
 
    initial begin : logfile
    HPMlog = $fopen("HPMtracer.csv", "w");
    $fwrite(HPMlog, "Packet_Nbre,Cycle,HPM0(Cycles),HPM2(INSTR),HPM3(LD_STALL),HPM4(JMP_STALL),HPM5(IMISS),HPM6(LD),HPM7(ST),HPM8(JUMP),HPM9(BRANCH),HPM10(BRANCH_TAKEN),HPM11(COMP_INSTR)\n");
     end

always_ff @(posedge clk_h, negedge rst_h) begin
        if(rst_h == 1'b0) next_state <= W;
        else begin
        case (next_state)
             W: begin
                if(enableS1)  next_state=M;
                else next_state=W;
                end 
            M: begin
                if(disableS1) next_state=R;
                else next_state =M;
                end 
            R: begin
                if(enableS1) next_state=W;
                
            end  
            default: next_state = W;         
            endcase
        end  
  end

always_ff @(posedge clk_h, negedge rst_h) 
begin
  if(rst_h == 1'b0)
  $fwrite(HPMlog,"");
      // flag enable + output down 
    else if(next_state == 1) 
            // flag enable + output up 

       $fwrite(HPMlog,"%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",HPM[12],cycles,HPM[0],HPM[2],HPM[3],HPM[4],HPM[5],HPM[6],HPM[7],HPM[8],HPM[9],HPM[10],HPM[11]);
    else $fwrite(HPMlog,"");
    // flag enable + output down 
end

/*
always_comb begin 

end 
*/
/*
 
    always_ff @(posedge clk_h, negedge rst_h) begin
        if(enableS1 ||rst_h == 1'b0) begin 
                cycles <= 0;    
                state <= S0;
        end else if(disableS1) begin
                state <= S1;
             end    
         case (state)
            S0: begin 
             //$display("wait for enabling HPMtracer");
             //$fclose("HPMtracer.log", "w");
                cycles <= cycles + 1;
                end        
            S1: begin
             if(disableS1) begin
                 $fwrite(HPMlog,"%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",HPM[12],cycles,HPM[0],HPM[2],HPM[3],HPM[4],HPM[5],HPM[6],HPM[7],HPM[8],HPM[9],HPM[10],HPM[11]);
               
             end   
                   

                   //else begin 
                       //$fopen("HPMtracer.log", "w");    
                      //ll$display("Start HPMtracing");
                      //$fwrite(HPMlog,$time);
                    //  $fwrite(HPMlog,"%d,%d,%d,%x,%x,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",HPM[12],$time,cycles,pc_h,instr_h,HPM[0],HPM[2],HPM[3],HPM[4],HPM[5],HPM[6],HPM[7],HPM[8],HPM[9],HPM[10],HPM[11]);
                     // $fwrite(HPMlog,HPM[12],",",$time,cycles,pc_h,instr_h,HPM[0],HPM[2],HPM[3],HPM[4],HPM[5],HPM[6],HPM[7],HPM[8],HPM[9],HPM[10],HPM[11],"\n");
                
                   // end    
             
                end 
            endcase
  end
  
*/
    endmodule : HPMtracer