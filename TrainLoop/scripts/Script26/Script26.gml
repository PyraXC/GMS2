// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function test_hurt_player() {
  test_describe(hurt_player(Player1), function() {
      test_it("subtracts health from the player", function() {
		hurt_player(Player1);
      assert_equal(Player1.hp, 90);
    });
  });
}