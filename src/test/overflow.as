let _ = 0x8000_0000_0000_0000 + 0x7fff_ffff_ffff_ffff : Nat;
// let _ = 0x8000_0000_0000_0000 + 0x8000_0000_0000_0000 : Nat;
let _ = 0x8000_0000_0000_0000 - 0x8000_0000_0000_0000 : Nat;
// let _ = 0x8000_0000_0000_0000 - 0x8000_0000_0000_0001 : Nat;
let _ = 0x1_0000_0000 * 0xffff_ffff : Nat;
// let _ = 0x1_0000_0000 * 0x1_0000_0000 : Nat;

let _ = 0x4000_0000_0000_0000 + 0x3fff_ffff_ffff_ffff : Int;
// let _ = 0x4000_0000_0000_0000 + 0x4000_0000_0000_0000 : Int;
let _ = 0x2000_0000_0000_0000 - 0x4000_0000_0000_0000 : Int;
let _ = -0x2000_0000_0000_0000 - 0x6000_0000_0000_0000 : Int;
// let _ = -0x2000_0000_0000_0000 - 0x6000_0000_0000_0001 : Int;
let _ = 0x1000_0000_0000_0000 * 7 : Int;
let _ = -0x1000_0000_0000_0000 * 8 : Int;
// let _ = 0x1000_0000_0000_0000 * 8 : Int;

let _ = 0x1000_0000 / 0 : Int;

let _ = 1_314_235_251_543_424_342_678_909 * 72_462_525_423_451_963_967_165_868;
