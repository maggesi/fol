module boolmodel.

domainb 0.
domainb 1.

addb 1 1 1.
addb 1 0 1.
addb 0 1 1.
addb 0 0 0.

eqb N N :- domainb N.

end