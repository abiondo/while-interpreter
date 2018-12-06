(* Identity function *)
let id x = x

(* Polymorphic conditional function *)
let cond (b : 'a -> bool) (f1 : 'a -> 'b) (f2 : 'a -> 'b) (x : 'a) : 'b =
	(if b x then f1 else f2) x

(* Turns a total function into an always-defined partial function *)
let partial (f : 'a -> 'b) (x : 'a): 'b option = Some (f x)

(* Composition of partial functions *)
let (%.) (f : 'a -> 'b option) (g : 'a -> 'b option) (x : 'a) : 'b option =
	match g x with
	| None     -> None
	| Some (y) -> f y
