-- Simply Sets the PC To EX_OVERIDE when you press A button, to call certain functions etc

-- Code Address to Set The PC To
EX_OVERIDE  = 0xF45E

assert(EX_OVERIDE,"Address invalid");

------------------
--- Your Input ---
------------------
	
	INPUT_PREVIOUS 			= input.read();
	INPUT 					= input.read();
	INPUT_PRESS 			= input.read();
	
	KEY_TOGGLE_OVERIDE 		= "A";
	
	
	--------------------------------------------------------------------------------------
	-- InputUpdate()
	function InputUpdate()
		-- Load inputs
		INPUT_PREVIOUS = copytable(INPUT);
		INPUT = input.read();
		
		-- Update press events
		for k, v in pairs(INPUT) do
			INPUT_PRESS[k] = nil;
			
			local v_prev = INPUT_PREVIOUS[k];
			if v_prev == nil and v == true then
				INPUT_PRESS[k] = true;		-- Key has been pressed
			else 
				INPUT_PRESS[k] = nil;		-- Key has not been pressed
			end
		end
	end
	
	
gens.registerbefore(function()

		InputUpdate()
		if INPUT_PRESS[KEY_TOGGLE_OVERIDE] then memory.setregister("pc",EX_OVERIDE) end
end)
