var _mouse_gui_x = device_mouse_x_to_gui(0);

var _mouse_gui_y = device_mouse_y_to_gui(0);

if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
{
	// If it is, change the frame to the hover frame (1)
	image_index = 1;

	// If the left mouse button is pressed,
	if (mouse_check_button_pressed(mb_left))
	{
		// Reduce the scale of the instance so it appears smaller while it's pressed
		image_xscale = 0.9;
		image_yscale = 0.9;
	}

	// If the left mouse button is released (which is when we register a click),
	if (mouse_check_button_released(mb_left))
	{
		// Change the frame to the idle frame (0)
		image_index = 0;
	
		// Call User Event 0 where the button performs its actions
		event_user(0);
	
		// Reset the scale so the button appears at its normal size
		image_xscale = 0.99;
		image_yscale = 0.99;
	
		// Play the button press sound effect
		audio_play_sound(snd_button_press_01, 0, 0);
	}
}
// If the mouse is not hovering,
else
{
	// Change the frame to the idle frame (0)
	image_index = 0;

	// Reset the scale so the button appears at its normal size
	image_xscale = 0.99;
	image_yscale = 0.99;
}