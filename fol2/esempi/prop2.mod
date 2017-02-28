module prop2.


%type prop = p of string;;
%let pname (P s) = s;;
%example with conjuction := let dest_and fm = match fm with And(p, q) -> (p, q) |_-> failwith ("dest_and");;

form (atom A).						    
						    
break_prop (atom A) A.					      
break_prop (and P Q) (P :: Q).
break_prop (or P Q) (P :: Q).

	      
