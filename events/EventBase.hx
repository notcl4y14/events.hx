package events;

import haxe.rtti.CType.Typedef;
import haxe.Constraints.Function;

class EventBase {
	public var listeners: Array<Function>;

	// ==== Listener ==== //
	public function addListener(listener: Function) {
		listeners.push(listener);
	}

	public function removeListener(listener: Function) {
		listeners.remove(listener);
	}

	// ==== Call ==== //
	public function call(?options: Typedef) {
		var i = -1;

		while (listeners[++i] != null) {
			this.listeners[i](options);
		}
	}
}