/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _mouse_gui_x = device_mouse_x_to_gui(0);

var _mouse_gui_y = device_mouse_y_to_gui(0);

if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
{
	// If it is, change the frame to the hover frame (1)
	image_index = 1;
}
// If the mouse is not hovering,
else
{
	// Change the frame to the idle frame (0)
	image_index = 0;

	// Reset the scale so the button appears at its normal size
	image_xscale = 1;
	image_yscale = 1;
}







