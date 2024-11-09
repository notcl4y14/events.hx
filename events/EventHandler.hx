package events;

import haxe.Constraints.Function;

class EventHandler<EventType> {
	// For some reason, Maps don't work with generics.
	public var events_k: Array<EventType>;
	public var events_v: Array<EventBase>;

	public function new() {
		events_k = [];
		events_v = [];
	}

	// ==== Helper Functions ==== //
	private function getEvent(name: EventType): EventBase {
		return events_v[events_k.indexOf(name)];
	}

	// ==== Event ==== //
	public function createEvent(name: EventType, ?event: EventBase) {
		event = event == null ? new Event() : event;
		events_k.push(name);
		events_v.push(event);
	}

	public function removeEvent(name: EventType) {
		var index = events_k.indexOf(name);
		events_k.splice(index, 1);
		events_v.splice(index, 1);
	}

	// ==== Event Listener ==== //
	public function addEventListener(name: EventType, call: Function) {
		this.getEvent(name).addListener(call);
	}

	public function removeEventListener(name: EventType, call: Function) {
		this.getEvent(name).removeListener(call);
	}

	// ==== Call Event ==== //
	public function callEvent(name: EventType, ?options: Dynamic): Bool {
		var event: EventBase = this.getEvent(name);

		if (event == null) {
			return false;
		}

		event.call(options);
		return true;
	}
}