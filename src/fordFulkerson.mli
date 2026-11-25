open Graph

exception No_path of string

type ffGraph = (int*int) graph 
type chemin_augmentant = (int*int list)

val fordFulkAlg: int graph -> id -> id ->  int graph

val rajouteflot: int graph -> chemin_augmentant -> int graph

val parcours: int graph -> id -> id -> chemin_augmentant (*Grapher -> source ->dest   ->    (min_des_poids_vus,chemin)*)

val g_to_empty_ffGraph : int graph -> ffGraph (*à la fin*)