
module SmartHomeLight_tb;

	// Inputs
	reg clk;
	reg reset;
	reg onClick;
	reg offClick;
	reg keypad;
	reg state;
        reg lampstate;

	// Outputs
	wire initialize;
	wire turn_lamp_on;
	wire turn_lamp_off;
	wire click_on_turn_on_button;
	wire click_on_turn_off_button;
	wire waiting;
	wire lamp_remains_off;

	// Instantiate the Unit Under Test (UUT)
	home_security uut (
		.clk(clk), 
		.reset(reset), 
		.onClick(onClick), 
		.offClick(offClick), 
		.pass_repeat(pass_repeat), 
		.keypad(keypad), 
		.state(state),
                .lampstate (lampstate),
		.initialize(initialize), 
		.turn_lamp_on(turn_lamp_on), 
		.waiting(waiting), 
		.turn_lamp_off(turn_lamp_off), 
		.click_on_turn_on_button(click_on_turn_on_button), 
		.click_on_turn_off_button(click_on_turn_off_button), 
		.lamp_remains_off(lamp_remains_off)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		onClick = 1;
		offClick = 0;
		keypad = 1;
		state = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk = 1;
		reset = 1;
		onClick = 1;
		offClick = 0;
		keypad = 1;
		state = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk = 0;
		reset = 0;
		onClick = 1;
		offClick = 0;
		keypad = 1;
		state = 0;


		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here

	end
      
endmodule
