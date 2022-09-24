ini_open("save.ini");
kills = ini_read_real("Scores", "Kills", 0);
highscore = ini_read_real("Scores", "highscore", 0);
if highscore >= 10
{
	ini_write_real("Scores", "unlockables", 1);
}
if highscore >= 40
{
	ini_write_real("Scores", "unlockables", 2);
}
ini_close();