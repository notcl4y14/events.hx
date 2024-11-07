package events;

import haxe.rtti.CType.Typedef;
import haxe.Constraints.Function;

class Event extends EventBase {
	
	public function new() {
		listeners = [];
	}

}