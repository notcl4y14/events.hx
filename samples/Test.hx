package;

import events.EventHandler;

typedef Options = {
	var a: String;
	var b: Int;
};

class Test {
	public static function main() {
		// Creating a new EventHandler
		var eventHandler: EventHandler<String> = new EventHandler();

		// EventHandler class stores Event class instances
		// by their name in a map like this:
		// - resize: Event
		// - close: Event
		// You can wrap it up in a new static class for all
		// events or create different ones.
		
		// Creating a new Event
		eventHandler.createEvent("event");

		// Event stores listeners (functions).
		// When called, Event calls each listener.

		// Creating a listener
		var listener = (?options: Options) -> {
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