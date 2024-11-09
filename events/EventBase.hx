package events;

import haxe.Constraints.Function;

class EventBase<Options = Any> {
	public var listeners: Array<Function>;

	public function new() {
		listeners = [];
	}

	// ==== Listener ==== //
	public function addListener(listener: Function) {
		listeners.push(listener);
	}

	public function removeListener(listener: Function) {
		listeners.remove(listener);
	}

	// ==== Call ==== //
	public function call(?options: Options) {
		var i = -1;

		while (listeners[++i] != null) {
			this.listeners[i](options);
		}
	}
}