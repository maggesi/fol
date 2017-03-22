module boolmodel.

domainb 0.
domainb 1.

/*----------------disjunction----------------*/
addb 1 1 1.
addb 1 0 1.
addb 0 1 1.
addb 0 0 0.

/*----------------conjunction----------------*/
mulb 1 1 1.
mulb 1 0 0.
mulb 0 1 0.
mulb 0 0 0.



eqb N N :- domainb N.

end