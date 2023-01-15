# Dijkstra's algorithm implementation for Mexico's city subway. Symbolic AI insight with Prolog.

## Description

This program represents the complete graph of Mexico's city subway. Further, it provides the necessary predicates to inform a user for the best and worst routes (in time) to take, between whatever two stations.
We consider a directed weight graph, where the time asociated to an edge is estimated by the formula:
 
           ((5 min) * g ) + n*(10 min)

Where g is the indegree to the destiny vertex of the edge, and n is the number of possible transhipments in the destiny vertex of the edge.

The program starts when the user execute the predicate: 

           bienvenida(Ruta, Peso).

Then, the program gives a welcome message to the user, and ask her to select between the two available options, so it can assist her to take an intelligent decision on choosing the best route:

1. Find best route.
2. Find worst route.

In case that the user writes an invalid option, the program will reply to her that she entered a wrong option, and kindly provide a valid one.
 
Relevant predicates:
  bienvenida -> Welcome message to the user
  mejorRuta  -> Find best route to navigate 
  peorRuta   -> Find worst route to navigate
  *todasLasRutas (It is included in mejorRuta and peorRuta. However, it is included as an additional predicate.

Mexico's City subwaw:

![alt text](https://github.com/Freddy-94/Mexico_City_Subway/blob/main/plano_red_metro_cdmx.jpg)