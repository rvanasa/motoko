//MOC-FLAG --package pkg "$(realpath lib/pkg)"
import P1 "mo:pkg";
import P2 "mo:pkg/other-module.mo";
P1.foo();
P2.bar();

