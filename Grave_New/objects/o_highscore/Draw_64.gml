draw_set_halign(fa_center);

draw_text(room_width/2, room_height/4, "Kills " + string(kills));
draw_text(room_width/2, room_height/4 + 12, "Highscore "+string(highscore));
draw_text(room_width/2, room_height/4 + 24, @"Press R To Restart");
if highscore >= 10
{
	draw_text(room_width/6 + 4, 0 , @"Rolling Unlocked");
}
if highscore >= 40
{
	draw_text(room_width/6 + 4, 12 , @"Healing Unlocked");
}
