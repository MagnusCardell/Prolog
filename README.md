Prolog Functions
========

This is a collection of common functions used in Prolog and definitions of existing functors.

Use it to look up the logic or tweek it to your liking.

##Features
- defoperator.pl - Define your own operators
- dividelist.pl
- functions.pl - Many definitions of included prolog functors and some simple additions.
- inventory.pl - Bike assembly database
- lengthtest.pl
- monkeybanana.pl 
- real time uni.pl - unification without consultation. 
- splitlist.pl 
- unifiable.pl
- **servers** - all use Swipl libraries
- client.pl - simple client
- networker.pl - TCP server waiting for connections
- networkerUDP.pl - UDP server 
- serverUNI.pl - TCP server sending back result of a query


##Try it out!
Tested with either **gprolog** or **swipl**.

Start Prolog, compile file, start asking:

    $ swipl
    ?- [*filename*]. 
    ?- *functor*.

example:

    $ swipl
    ?- [functions].
    ?- appender1([a,b,c], d, X).

