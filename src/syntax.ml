(* Variables *)

type var = string Source.phrase
type var_use = (string, Type.mut) Source.annotated_phrase


(* Types *)

type mut = Type.mut Source.phrase

type actor = Type.actor Source.phrase

type typ = typ' Source.phrase
and typ' =
  | VarT of var * typ list                     (* constructor *)
  | PrimT of Type.prim                         (* primitive *)
  | ObjT of actor * typ_field list             (* object *)
  | ArrayT of mut * typ                        (* array *)
  | OptT of typ                                (* option *)
  | TupT of typ list                           (* tuple *)
  | FuncT of typ_bind list * typ * typ         (* function *)
  | AsyncT of typ                              (* future *)
  | LikeT of typ                               (* expansion *)
  | AnyT                                       (* top *)
(*
  | UnionT of type * typ                       (* union *)
  | AtomT of string                            (* atom *)
*)

and typ_field = typ_field' Source.phrase
and typ_field' = {var : var; typ : typ; mut : mut}

and typ_bind = typ_bind' Source.phrase
and typ_bind' = {var : var; bound : typ}


(* Literals *)

type lit =
  | NullLit
  | BoolLit of bool
  | NatLit of Value.Nat.t
  | IntLit of Value.Int.t
  | Word8Lit of Value.Word8.t
  | Word16Lit of Value.Word16.t
  | Word32Lit of Value.Word32.t
  | Word64Lit of Value.Word64.t
  | FloatLit of Value.Float.t
  | CharLit of Value.unicode
  | TextLit of string
  | PreLit of string * Type.prim


(* Patterns *)

type pat = pat' Source.phrase
and pat' =
  | WildP                                      (* wildcard *)
  | VarP of var                                (* variable *)
  | TupP of pat list                           (* tuple *)
  | AnnotP of pat * typ                        (* type annotation *)
  | LitP of lit ref                            (* literal *) (* only in switch case, for now *)
(*
  | ObjP of pat_field list                     (* object *)
  | AsP of pat * pat                           (* conjunctive *)
  | OrP of pat * pat                           (* disjunctive *)

and pat_field = pat_field' Source.phrase
and pat_field' = {var : var; pat : pat}
*)


(* Operators *)

type unop =
  | PosOp                                       (* +x *)
  | NegOp                                       (* -x *)
  | NotOp                                       (* bitwise negation *)

type binop =
  | AddOp                                       (* x+y *)
  | SubOp                                       (* x-y *)
  | MulOp                                       (* x*y *)
  | DivOp                                       (* x/y *)
  | ModOp                                       (* x%y *)
  | AndOp                                       (* bitwise operators... *)
  | OrOp
  | XorOp
  | ShiftLOp
  | ShiftROp
  | RotLOp
  | RotROp
  | CatOp                                       (* concatenation *)

type relop =
  | EqOp                                        (* x=y *)
  | NeqOp                                       (* x!=y *)
  | LtOp                                        (* x<y *)
  | GtOp                                        (* x>y *)
  | LeOp                                        (* x<=y *)
  | GeOp                                        (* x>=y *)


(* Expressions *)

type priv = priv' Source.phrase
and priv' = Public | Private

type exp = (exp', Type.typ) Source.annotated_phrase
and exp' =
  | VarE of var_use                            (* variable *)
  | LitE of lit ref                            (* literal *)
  | UnE of unop * exp                          (* unary operator *)
  | BinE of exp * binop * exp                  (* binary operator *)
  | RelE of exp * relop * exp                  (* relational operator *)
  | TupE of exp list                           (* tuple *)
  | ProjE of exp * int                         (* tuple projection *)
  | ObjE of actor * var * exp_field list       (* object *)
  | DotE of exp * var_use                      (* object projection *)
  | AssignE of exp * exp                       (* assignment *)
  | ArrayE of exp list                         (* array *)
  | IdxE of exp * exp                          (* array indexing *)
  | CallE of exp * typ list * exp              (* function call *)
  | BlockE of dec list                         (* block *)
  | NotE of exp                                (* negation *)
  | AndE of exp * exp                          (* conjunction *)
  | OrE of exp * exp                           (* disjunction *)
  | IfE of exp * exp * exp                     (* conditional *)
  | SwitchE of exp * case list                 (* switch *)
  | WhileE of exp * exp                        (* while-do loop *)
  | LoopE of exp * exp option                  (* do-while loop *)
  | ForE of pat * exp * exp                    (* iteration *)
  | LabelE of var * exp                        (* label *)
  | BreakE of var * exp                        (* break *)
  | RetE of exp                                (* return *)
  | AsyncE of exp                              (* async *)
  | AwaitE of exp                              (* await *)
  | AssertE of exp                             (* assertion *)
  | IsE of exp * typ                           (* instance-of *)
  | AnnotE of exp * typ                        (* type annotation *)
  | DecE of dec                                (* declaration *)
(*
  | ThrowE of exp list                         (* throw exception *)
  | TryE of exp * case list                    (* catch eexception *)
  | FinalE of exp * exp                        (* finally *)
  | AtomE of string                            (* atom *)
*)

and exp_field = exp_field' Source.phrase
and exp_field' = {var : var; exp : exp; mut : mut; priv : priv}

and case = case' Source.phrase
and case' = {pat : pat; exp : exp}


(* Declarations *)

and dec = dec' Source.phrase
and dec' =
  | ExpD of exp                                        (* plain expression *)
  | LetD of pat * exp                                  (* immutable *)
  | VarD of var * exp                                  (* mutable *)
  | FuncD of var * typ_bind list * pat * typ * exp     (* function *)
  | TypD of var * typ_bind list * typ                  (* type *)
  | ClassD of var * typ_bind list * actor * pat * exp_field list (* class *)


(* Program *)

type prog = prog' Source.phrase
and prog' = dec list
