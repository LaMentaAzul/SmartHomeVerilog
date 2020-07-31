module LightSystem(
    input clk,
    input  reset,
    input wire onClick,
    input wire offClick,
    input wire keypad,
    input wire state,

    output reg initialize ,
    output reg turn_lamp_on,
    output reg turn_lamp_off,
    output reg click_on_turn_on_button,
    output reg click_on_turn_off_button,
    output reg waiting,
    output reg lamp_remains_off,
    output reg lampstate,
    );


parameter STATE0=3'b000,
          STATE1=3'b001,
          STATE2=3'b010, 
          STATE3=3'b011,
          STATE4=3'b100,
          STATE5=3'b101,
          STATE6=3'b110;
	
reg[2:0] state_reg,next_state ; 

always @(posedge clk, posedge reset) 
  begin
   if (reset) begin
	state_reg <= 3'b000;
		end
	else begin
	   state_reg <= next_state;
	end
end 

always @(onClick,offClick,keypad,lampstate,state_reg) 
	begin

next_state = state_reg; 
  case (state_reg)
STATE0: next_state= STATE1;

STATE1: 
       if(keypad==1'b1)
          begin
	next_state = STATE2;
        click_on_turn_on_button =  1;
	lampstate=1;
end

STATE2: 
	if(onClick==1'b1&&keypad==1'b1&&lampstate==1)
	  begin
   	  next_state = STATE3;
    	  turn_lamp_off = 0;
	end

	else if(onClick==1'b1&&keypad==1'b1&&lampstate==0)
	   begin
	   next_state =STATE4;
	   turn_lamp_off = 1;
	   end
        else 
	  next_state = STATE2;

 STATE3:
   turn_lamp_on = 1;
     if(keypad==1'b1)
       begin
        next_state = STATE5;
        click_on_turn_off_button =  1;
	lampstate=1;
end

STATE5:

if(offClick==1'b1&&keypad==1'b1&&lampstate==1)
	  begin
   	  next_state = STATE6;
    	  turn_lamp_off = 1;
	end
        else 
	  next_state = STATE0;

STATE4:
if(keypad==1'b1)
begin
next_state = STATE0;
lamp_remains_off = 1;
end

STATE6:
if(keypad==1'b1)
begin
lamp_remains_off = 1;
initialize = 1;
end

default :			
	next_state = STATE0;
			
 endcase
end
endmodule

