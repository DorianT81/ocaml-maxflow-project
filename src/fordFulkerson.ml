open Graph

type ffGraph = (int*int) graph 
type chemin_augmentant = (int*int list)

exception Path_trouve of chemin_augmentant

let parcours graphe source dest =
  let rec parcours_bis g s d l mini =
    if (s=d) then
      raise (Path_trouve((l,mini)))
    else
    let l_arc = out_arcs s in
    let dest arc = 
      let arc = {a,tgt,b} in tgt (* peut être maper avant et faire sur les noeuds*)
    in
    let l_filtre = List.filter (fun arc -> List.mem l (dest arc)) l_arc in (*On veut refuser les arcs dans l_arc qui ont pour sommet taget un sommet de l*)
      match l_filtre with
        |[]-> ()
        |({src,tgt,lbl})::qu -> parcours_bis g tgt d (src::l) (min mini lbl) 
      ;() 
  in
  parcours_bis graphe source dest [] max_int
;;

let rajouteflot

;;


let rec fordFulkAlg graphe source dest =
  try
    parcours graphe source dest; graphe
  with 
  |Path_trouve path -> let g2 = rajouteflot graphe path in
    fordFulkAlg g2 source dest
  |_ -> failwith "Erreur inconue"

;;