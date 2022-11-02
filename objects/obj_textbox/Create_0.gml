/// Customizable Properties

// Input
confirm_key = vk_space; // button to press to go to the next page
max_input_delay = 5; // how many frames to ignore input
input_delay = max_input_delay;

// Position
margin = 16; // how much space the textbox gets from the edges of the screen
padding = 8; // how much space things inside the textbox get
width = display_get_gui_width() - margin * 2;
height = sprite_height;

x = (display_get_gui_width() - width) / 2;
y = display_get_gui_height() - height - margin;

// Text
text_font = fnt_text;
text_color = c_white;
text_speed = 0.6;
text_x = padding;
text_y = padding * 3;
text_width = width - padding * 2;

// Portrait
portrait_x = padding;
portrait_y = padding;

// Speaker
speaker_x = padding;
speaker_y = 0;
speaker_font = fnt_name;
speaker_color = #464633;

/// Private properties
/*** LOOK BUT DO NOT EDIT! ***/
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_length = 0;

portrait_sprite = -1;
portrait_width = sprite_get_width(spr_portrait);
portrait_height = sprite_get_height(spr_portrait);
portrait_side = PORTRAIT_SIDE.LEFT;

enum PORTRAIT_SIDE {
	LEFT,
	RIGHT
}

speaker_name = "";
speaker_width = sprite_get_width(spr_name);
speaker_height = sprite_get_height(spr_name);

/// Methods
/*** Generally you never need to call these manually ***/

// Start a conversation
setTopic = function(topic) {
	actions = global.topics[$ topic];
	current_action = -1;
		
	next();
}

// Move to the next action, or close the textbox if out of actions
next = function() {
	current_action++;
	if (current_action >= array_length(actions)) {
		instance_destroy();
	}
	else {
		actions[current_action].act(id);
	}
}

// Set the text that should be typed out
setText = function(newText) {
	text = newText;
	text_length = string_length(newText);
	text_progress = 0;
}