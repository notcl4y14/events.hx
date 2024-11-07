# events.hx

events.hx is a Haxe library that adds a simple event system.

## Example code
```haxe
package;

import events.EventHandler;

class Sample {
	public static function main() {
		// Creating a new EventHandler
		var eventHandler: EventHandler = new EventHandler();
		
		// Creating a new Event
		eventHandler.createEvent("event");

		// Creating a listener
		var listener = (?options: Dynamic) -> {
			Sys.println("Hello World!");

			if (options != null) {
				Sys.println(options.a);
				Sys.println(options.b);
			}
		};

		// Adding a listener
		eventHandler.addEventListener("event", listener);

		// Call event
		eventHandler.callEvent("event", { a: "b", b: "a" });
	}
}
```

## API
```haxe
/**
	EventHandler is a class that holds registered
	events.

	EventType can be replaced with something else
	like enum.
**/
class EventHandler<EventType = String> {
	public function new();

	// Adds and registers an event to EventHandler
	public function createEvent(name: EventType, ?event: EventBase): Void;

	// Removes an event from EventHandler
	public function removeEvent(name: EventType): Void;

	// Adds an Event Listener to Event
	public function addEventListener(name: EventType, call: Function): Void;

	// Removes an Event Listener from Event
	public function removeEventListener(name: EventType, call: Function): Void;

	// Calls event's listeners
	public function callEvent(name: EventType, ?options: Dynamic): Bool;
}

/**
	EventBase is a base class of an Event.
	Can be inherited for custom Event classes.
**/
class EventBase {
	// Adds an Event Listener to Event
	public function addListener(listener: Function): Void;

	// Removes an Event Listener from Event
	public function removeListener(listener: Function): Void;

	// Calls event's listeners
	public function call(?options: Typedef): Void;
}

/**
	Event is a class that inherits EventBase class.
	It's a default simple Event class.
**/
class Event extends EventBase {
	
	public function new();

}
```