package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class PlayState extends FlxState
{
    var testplayer = new flixel.FlxSprite();
    var debugText = new flixel.text.FlxText(0, 0, 0, "", 18); 
    var stamina = 100.0;
    var _speed = 1;
    var mytimer = 0.0;
    var lBinOR = lambda

    var direction = 1;
	override public function create()
	{
		super.create();
        
        testplayer.makeGraphic(50,50,flixel.util.FlxColor.CYAN);
        
        debugText.screenCenter();
        add(debugText);
        add(testplayer); 
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
        debugText.text = Std.string(Std.int(stamina));

        if (FlxG.keys.justReleased.SHIFT) {
            mytimer = 0;
        }   

        if (FlxG.keys.pressed.SHIFT && stamina > 1.0) {
            stamina--;
            _speed = 5;
        }
        else {
            _speed = 1;
            if (mytimer >= elapsed * 100 && stamina < 100) {
                stamina += elapsed * 10;
            }
            if (mytimer < elapsed * 100){
               mytimer += elapsed;
            }
        }

        
        
        if (FlxG.keys.pressed.S && testplayer.y < FlxG.height - 50) {
            testplayer.y += _speed;
        }
        if (FlxG.keys.pressed.W && testplayer.y > 0) {
            testplayer.y -= _speed;
        }
        if (FlxG.keys.pressed.A && testplayer.x > 0) {
            testplayer.x -= _speed;
        }
        if (FlxG.keys.pressed.D && testplayer.x < FlxG.width - 50) {
            testplayer.x += _speed;
        }

	}
}
