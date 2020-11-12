// MunoPhone Balance Template:
// This is used for letting players test the waters in future balance changes.
// This post is intendend for characters who already have munophone supported.

// Everything between the comment sections can be copied and pasted.

// REQUIRED FILES:
// - init.gml
// - update.gml
// - draw_hud.gml
// - user_event15.gml (This is for the MunoPhone functionality)

// EXAMPLES:
// - Simple Super Jump Swap

// To start, you'll need these variables in your init.gml:
#region // init.gml
/*

// Future Balance Changes
futurechanges = false;           // Only set to true if there are changes that aren't in the live build that we want to test.
proposed_balance = false;       // This is what handles the cheats. Don't even bother with this <3

// For Future Reference
// user_event1.gml should be used for changes to attacks, stats (anything in init), and etc.
// user_event2.gml is used for attack update. This is for anything very specific for attacks.

*/
#endregion

// I am providing three examples here of how things can/should be set-up depending on your file.
// Next, you will need to set up a cheat in user_event15.gml (this is for the munophone).

#region // user_event15 - Cheat Section
/*

// update.gml
if futurechanges{
	initCheat("Testing Mode", "cheat_testing", [0, 1], ["Off", "On"], "Test any future balance patches before it becomes live. Check patch notes.");
}

*/
#endregion

// You can name the cheat whatever you want, but I prefer using cheat_testing.
// Next, after this, you'll need to put this component into update.gml to make it all work:

#region // update.gml
/*

// Online/Versus Mode Testing
if get_gameplay_time() < 120 and futurechanges and phone_cheats[cheat_testing] == 0{
	if taunt_pressed{
		clear_button_buffer(PC_TAUNT_PRESSED);
		if proposed_balance{
			print_debug("Testing Mode Deactivated");
	        proposed_balance = false;
	        if (get_stage_data(SD_ID) == 16499){ 
	        	phone_cheats[cheat_testing] = 0;
	        }
		} else {
			print_debug("Testing Mode Active");
	        proposed_balance = true;
	        if (get_stage_data(SD_ID) == 16499){ 
	        	phone_cheats[cheat_testing] = 1;
	        }
		}
	}
}

// Checks for the stage so the cheat can be toggled
if (get_stage_data(SD_ID) == 16499){
	if phone_cheats[cheat_testing] == 0{
		proposed_balance = false;
	} else {
		proposed_balance = true;
	}
}

*/
#endregion

// With this code, you now have the ability to not only play with the testing changes online and locally
// but you can also use it on munophone. Remember, update.gml's user_event should only ever be used to change stats, attacks, or alter article properties.
// Lastly, is draw_hud.gml. This is just so the player(s) know that they are playing tests or not.

#region // draw_hud.gml
/*

// feel free to alter these to your liking
var xx = temp_x;
var yy = temp_y - 16;

if get_gameplay_time() < 140 and futurechanges and phone_cheats[cheat_testing] == 0{
	if !proposed_balance{
        draw_debug_text(xx - 32, yy, "Press Taunt to test upcoming changes");
	} else {
        draw_debug_text(xx, yy, "Press Taunt to play live build");
	}
}

if proposed_balance and get_gameplay_time() > 140{
    draw_debug_text(xx - 16, yy, "Testing - This Version Isn't Live!");
}

*/
#endregion

// Always helps to have visuals.
// But that's about it! All you need is to use the user events!

#region// EXAMPLES:
// This one is used in update.gml but also is the same check as death.gml and any other checks that happen for a short time.
/*

// update.gml
if proposed_balance or phone_cheats[cheat_testing] == 1{
    // Balance Change Script:
    user_event(1);
}

// Then, within user_event(1), we can change and alter things as we please. For example, change up attacks. This can also be used
// to adjust angles, damage, stats for the actual character, among other things.
*/

// user_event1:
/*

// Balance Cheat Script - update.gml
// Any Proposed Changes should be put in here PRIOR to pushing them.

// // USpecial Super Jump Test
// set_attack_value(AT_USPECIAL, AG_CATEGORY, 2);
// set_attack_value(AT_USPECIAL, AG_SPRITE, sprite_get("uspecial"));
// set_attack_value(AT_USPECIAL, AG_NUM_WINDOWS, 3);
// set_attack_value(AT_USPECIAL, AG_HAS_LANDING_LAG, 4);
// set_attack_value(AT_USPECIAL, AG_OFF_LEDGE, 1);
// set_attack_value(AT_USPECIAL, AG_AIR_SPRITE, sprite_get("uspecial"));
// set_attack_value(AT_USPECIAL, AG_HURTBOX_SPRITE, sprite_get("uspecial_hurt"));
// set_attack_value(AT_USPECIAL, AG_USES_CUSTOM_GRAVITY, 1);
// 
// set_window_value(AT_USPECIAL, 1, AG_WINDOW_TYPE, 1);
// set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 6);
// set_window_value(AT_USPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 2);
// set_window_value(AT_USPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
// set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_absa_whip_charge"));
// 
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_TYPE, 1);
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_LENGTH, 16);
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED_TYPE, 2);
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED, -6);
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 4);
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 2);
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_HAS_SFX, 1);
// set_window_value(AT_USPECIAL, 2, AG_WINDOW_SFX, asset_get("sfx_forsburn_consume"));
// 
// set_window_value(AT_USPECIAL, 3, AG_WINDOW_TYPE, 7);
// set_window_value(AT_USPECIAL, 3, AG_WINDOW_LENGTH, 12);
// set_window_value(AT_USPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 2);
// set_window_value(AT_USPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 6);
// 
// 
// set_num_hitboxes(AT_USPECIAL, 1);
// 
// set_hitbox_value(AT_USPECIAL, 1, HG_PARENT_HITBOX, 1);
// set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_TYPE, 1);
// set_hitbox_value(AT_USPECIAL, 1, HG_WINDOW, 2);
// set_hitbox_value(AT_USPECIAL, 1, HG_LIFETIME, 1);
// set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_Y, -35);
// set_hitbox_value(AT_USPECIAL, 1, HG_WIDTH, 40);
// set_hitbox_value(AT_USPECIAL, 1, HG_HEIGHT, 70);
// set_hitbox_value(AT_USPECIAL, 1, HG_SHAPE, 1);
// set_hitbox_value(AT_USPECIAL, 1, HG_PRIORITY, 1);
// set_hitbox_value(AT_USPECIAL, 1, HG_DAMAGE, 2);
// set_hitbox_value(AT_USPECIAL, 1, HG_ANGLE, 90);
// set_hitbox_value(AT_USPECIAL, 1, HG_BASE_KNOCKBACK, 5);
// set_hitbox_value(AT_USPECIAL, 1, HG_BASE_HITPAUSE, 4);
// set_hitbox_value(AT_USPECIAL, 1, HG_VISUAL_EFFECT, 3);
// set_hitbox_value(AT_USPECIAL, 1, HG_HIT_SFX, asset_get("sfx_forsburn_reappear_hit"));
// set_hitbox_value(AT_USPECIAL, 1, HG_ANGLE_FLIPPER, 1);
// set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_GROUP, -1);

*/

// If you go into testing, especially with a sandbert esque character, you should notice it is just a quick super jump.
// toggling this off should reset it, however, you may also just need to press F5 or reset a lot of the attack.
#endregion