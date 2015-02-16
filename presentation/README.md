 = Responsive Email Proof Of Concept =

== Purpose of this project ==

The goal is to find out what level of responsiveness
can be achieved in emails targeted primarily to Win 8(.1) & Win 10
mobile email clients

Primary Targets: NO ZOOM, no pinching

== Resources ==


== Methodology ==


== Scope ==

== Layouts ==

=== Fixed width Table Layout ===
 * Most reliable once done. 
 * Very rigid. Hard to tweak.

=== Fluid Tables ===
 * Simplest case combines multiple fixed table layouts
 * Easier to covert to from existing fixed templates
 * Mostly not really fluid, as the actual content markup is still fixed to a given size. 
	

=== Flexbox layout ===
 * requires the least markup for various sizes
 * good for a large group of niche(ish) high end targets
 * requires a developers as content producer

==  Findings (06.07.2015) ==
 1. Exhange server is the biggest disruptive factor
 2. Targeting multiple platforms will not allow for a real responsive layout
 3. What is the responsive layout intended for anyway?  

== Next step ==
* Run more extensive tests using fluid table layouts
* Run more extensive tests using two tier layouts
* Define final scope based on findings
* New desing based on proposed layout & target goals
