// actor {
//   public func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };

import Debug "mo:base/Debug"; // we import this for the print
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";
// we create a class with keyword actor
actor dBank {
  stable var currentValue: Float = 300; // we use stable keyword to keep the lasted state
  currentValue := 300; // ewhen changing the value to a valriable, we use := replace op
  
  Debug.print("Hello");
  //Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  // let is a constant or immutabledfxxx
  let id = 45378343;
  Debug.print(debug_show(id));

  public func topUp( amount: Float) {
    currentValue +=amount;
    Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount: Float) {
    var callTemp: Float = currentValue - amount;
    if (callTemp < 0) {
      Debug.print(debug_show("Amount can not be below 0"))
    } else {
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
    }
  };
  // topUp();


  // querrying and update

  public query func checkBalance(): async Float{ // we use async because we expect the balance
   return currentValue; 
  };

  public func compoundInterest() {
    //formula : P = current_val*(1+0.01)^numsec
    let currentTime = Time.now();
    let time_in_nano_sec = currentTime - startTime;
    let time_in_seconds = time_in_nano_sec / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(time_in_seconds));
    startTime := currentTime;
  };
}