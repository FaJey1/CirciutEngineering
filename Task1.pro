predicates
	nondeterm parent(string, string)
   	nondeterm man(string)
    	nondeterm woman(string)
    	nondeterm sisters(string, string)
    	nondeterm brothers(string, string)
    	nondeterm check_grandparents(string, string)
    	nondeterm check_ancestorsM(string, string)
    	nondeterm check_ancestorsF(string, string)
    	nondeterm check_relationship(string, string)
    	nondeterm check_married(string, string)
    	nondeterm married(string, string)
    	nondeterm wife(string, string)
    	nondeterm brother_in_law(string, string)
    	nondeterm father_in_law(string, string)
    	nondeterm sister_in_law(string, string)
    	nondeterm husband(string, string)
    	
clauses
    	parent("Ivan", "Nina").
    	parent("Ivan", "Oleg").
    	parent("Anna", "Nina").
    	parent("Anna", "Oleg").
   	parent("Oleg", "Alla").
    	parent("Oleg", "Larisa").
    	parent("Vera", "Alla").
    	parent("Vera", "Larisa").
    	parent("Larisa", "Natalia").
    	parent("Victor", "Natalia").
    	
    	/*parent("Oleg", "Vika").
    	parent("Vera", "Vika").
    	parent("Oleg", "Egor").
    	parent("Vera", "Egor").*/
    	
    	man("Oleg").
    	man("Ivan").
    	man("Victor").
    	/*man("Egor").*/
    	
    	woman("Anna").
    	woman("Nina").
    	woman("Vera").
    	woman("Alla").
    	woman("Larisa").
    	woman("Natalia").
    	/*woman("Vika").*/
    	
    	married("Ivan", "Anna").
    	married("Oleg", "Vera").
    	married("Larisa", "Victor").
    	
    	check_grandparents(X, Y):-
  		parent(Z,X), parent(Y, Z).
  		
  	check_ancestorsM(X,Y):-
  		parent(X, Z), parent(Z, Y), man(Y).
  		
  	check_ancestorsF(X,Y):-
  		parent(X, Z), parent(Z, Y), woman(Y).
  		
  	check_relationship(X, Y):- 
  		parent(Z, X), parent(Z, Y).
  		
  	check_married(X, Y):-
  		married(X, Y); married(Y, X).	
  	
  	sisters(X,Y):-
  		parent(Z, X), parent(Z, Y), woman(Y), man(Z), X<>Y.
  		
  	brothers(X,Y):-
  		parent(Z, X), parent(Z, Y), man(Y), man(Z), X<>Y.
  		
  	wife(X,Y):-
  		check_married(X,Y), woman(Y).
  		
  	husband(X,Y):-
  		check_married(X,Y), man(Y).
  		
  	brother_in_law(X,Y):-
  		wife(X, Z), brothers(Z, Y).
  		
  	father_in_law(X,Y):-
  		wife(X,Z), parent(Y, Z), man(Y).
  		
  	sister_in_law(X, Y):-
  		husband(X, Z), sisters(Z, Y).
  		
goal
    	sisters("Larisa", Y).
