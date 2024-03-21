//////////////////////////////////////////////////////////////////////////////////
// Company: Labsticc - UBS
// PhD-Engineer: Mohamed EL BOUAZZATI
// 
// Create Date: 01/02/2023 07:53:21 PM
// Design Name: Ewma_snr_rssi
// Module Name: Ewma_snr_rssi
// Project Name: HIDS for network Processor
// Target Devices: LoRA 
// Tool Versions: 
// Description: Exponentially Weighted Moving Average for snr and rssi
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Ewma_rssi
    (
    input logic                 rst_h,
    input logic                clk_h,  
    input logic             EnableEwma,
    input logic   [31:0]           rssi, 
    output  logic    [31:0]    ewma_rssi, 
    output logic            endEwma,
    output logic            EnableDecision  
    );

typedef enum logic [1:0] {Monitor =2'b00, Ewma = 2'b01, Init = 2'b10} state;
 state next_state;

  logic   [31:0] state_rssi, state_rssi25, real_rssi, ewmaRSSI;
  assign ewma_rssi = ewmaRSSI;
  //assign real_snr = snr;
  //assign real_rssi = rssi;

  always_ff @(posedge clk_h, negedge rst_h) begin
    if(rst_h == 1'b0)  begin
    endEwma = 0; 
    ewmaRSSI =0;
    state_rssi = 0;
    real_rssi = 0;
    state_rssi25 =0;
    next_state = Init;

  end           
  else  begin 
  case(next_state) 
      Init : begin 
       // calculate alpha =0.5
            if(EnableEwma) begin
             state_rssi[29:0] =rssi[30:1];
             state_rssi[30] = 1'b0;
             state_rssi[31]= rssi[31]; 
    // calculate alpha =0.25
             state_rssi25[28:0] =rssi[30:2];
             state_rssi25[30:29] = 2'b00;
             state_rssi25[31]= rssi[31]; 
             endEwma = 1; 
            
             next_state = Monitor;
            end
      end
      Ewma: begin
          ewmaRSSI = real_rssi + state_rssi + state_rssi25;
          ewmaRSSI[31] = real_rssi[31]; 

          state_rssi[29:0] = ewmaRSSI[30:1];
          state_rssi [30] = 0;
          state_rssi[31] = ewmaRSSI[31];

          state_rssi25[28:0] =ewmaRSSI[30:2];
          state_rssi25[30:29] = 2'b00;
          state_rssi25[31]= ewmaRSSI[31];  
          endEwma = 1; 
          EnableDecision = 1; 
          next_state=Monitor;
      end
      Monitor : begin
      endEwma = 0;
      EnableDecision = 0; 
      if(EnableEwma) begin
        real_rssi[28:0]=rssi[30:2];
        real_rssi[30:29]=2'b00;
        real_rssi[31]=rssi[31];
        next_state=Ewma;
      end
      else next_state=Monitor;
      end
    default : next_state=Init;            
    endcase        
    end
  end
endmodule