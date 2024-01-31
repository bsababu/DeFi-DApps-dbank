// actor {
//   public func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };

import Debug "mo:base/Debug"; // we import this for the print

// we create a class with keyword actor
actor dBank {
  var currentValue =300;
  currentValue := 100; // ewhen changing the value to a valriable, we use :=

  Debug.print("Hello");
  Debug.print(debug_show(currentValue));

  // let is a constant or immutable
  let id = 45378343;
  Debug.print(debug_show(id));
}