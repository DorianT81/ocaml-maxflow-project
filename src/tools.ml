(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes  (gr:'a graph) = 
  n_fold gr (fun acc id -> new_node acc id) empty_graph
let gmap gr f = 
  e_fold gr (fun acc arc -> 
    let {src;tgt;lbl}=arc in
    new_arc acc {src;tgt;lbl =(f lbl)}) (clone_nodes gr)
(* Replace _gr and _f by gr and f when you start writing the real function. *)
let add_arc gr n1 n2 v = 
  match find_arc gr n1 n2 with
  |None -> let arc = {src =n1;tgt = n2; lbl = v} in new_arc gr arc
  |Some x ->
  e_fold gr (fun acc arc -> 
    let {src;tgt;lbl}=arc in
    if arc <> x then new_arc acc arc else
    new_arc acc {src;tgt;lbl =v + lbl}) (clone_nodes gr)

