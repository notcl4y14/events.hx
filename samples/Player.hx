package;

import events.Event;
import events.EventBase;

// Yes, this sample is from another Haxe library
// https://haxetink.github.io/tink_core/#/types/signal
class Player {
	public var damaged(default, null): EventBase<Int>;

	public function new() {
		damaged = new Event();
	}

	public function damage(health: Int) {
		this.damaged.call(health);
	}

	public static function main() {
		var player = new Player();
		
		// Notifier
		player.damaged.addListener( (health: Int) -> {
			trace("Player lost " + health + " HP");
		} );

		// Achievement
		player.damaged.addListener( (health: Int) -> {
			if (health != Math.floor(health)) {
				trace("Achievement: Lose HP in a float value");
			}
		} );

		player.damage(100);
	}
}