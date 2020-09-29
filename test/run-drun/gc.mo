import Prim "mo:prim";
// check blob and text iterator objects survive gc correctly
actor {
  public shared func testBytes() : async () {
    let blob = "\00\01\02\03" : Blob;
    for (b in blob.bytes()) {
      await async {};
      Prim.debugPrint(debug_show b);
    };
  };

  public shared func testChars() : async () {
    let text = "abcd" # "efgh" # "hijklmnopqrstuvwxyz";
    for (c in text.chars()) {
      await async {};
      Prim.debugPrint(debug_show c);
    };
  };

  public shared func testArray() : async () {
    let is = ["0","1","2"];
    for (i in is.vals()) {
      await async {};
      Prim.debugPrint(debug_show i);
    };
  };


  public shared func testArrayMut() : async () {
    let is = [var "0","1","2"];
    for (i in is.vals()) {
      await async {};
      Prim.debugPrint(debug_show i);
    };
  };
}

//CALL ingress testBytes "DIDL\x00\x00"
//CALL ingress testChars "DIDL\x00\x00"
//CALL ingress testArray "DIDL\x00\x00"
//CALL ingress testArrayMut "DIDL\x00\x00"

