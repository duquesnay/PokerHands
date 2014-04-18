PokerHands
==========

PokerHands kata on Ruby (1.9), trying to follow strictly Object Calisthenics rules

How to use
----------
- TDD is mandatory : write 1 test -> make the code pass -> refactor
- don't cheat with the rules spirit. def notaget(){ return @value } is a getter, no matter how it is named
- have all rules applied, otherwise you don't get the juice of the exercice

State
-----
- done until 2 pairs comparison
- no proper makefile and stuff so far, tests running in rubymine
- I know, some rules are violated this and there

Sources
-------
- Kata is here : http://www.codingdojo.org/cgi-bin/index.pl?KataPokerHands
- Object Callisthenics rules :
	1.	Use only one level of indentation per method
	2.	Don’t use the else keyword
	3.	Wrap all primitives and strings
	4.	Use only one dot per line
	5.	Don’t abbreviate
	6.	Keep all entities small
	7.	Don’t use any classes with more than two instance variables
	8.	Use first-class collections
	9.	"Tell, don't ask" : Don’t use any getters/setters/properties
