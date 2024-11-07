package events;

import haxe.ds.HashMap;
import haxe.Constraints.Function;

class EventHandler<EventType = String> {
	// For some reason, Maps don't work with generics.
	// public var events: HashMap<EventType, Event>;

	public var events_k: Array<EventType>;
	public var events_v: Array<EventBase>;

	public function new() {
		events_k = [];
		events_v = [];
	}

	// ==== Helper Functions ==== //
	public function getEvent(name: EventType): EventBase {
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
		// this.events.get(name).addListener(call);
		this.getEvent(name).addListener(call);
	}

	public function removeEventListener(name: EventType, call: Function) {
		// this.events.get(name).removeListener(call);
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

	// public overload extern inline function addEventListener(name: String, event: Event) {
	// 	this.events.set(name, event);
	// }

	// public overload extern inline function addEventListener(name: String, call: Function) {
	// 	var event: Event = new Event();
	// 	event.call.bind(call);
	// 	this.events.set(name, event);
	// }

	// public function callEvent(name: String, options: Null<Dynamic> = null): Bool {
	// 	var event: Event = this.events.get(name);

	// 	if (event == null) {
	// 		return false;
	// 	}

	// 	event.call(options);
	// 	return true;
	// }
}