
### How it works
* Akka is a toolkit and runtime for building highly concurrent, distributed, and resilient message-driven applications on the JVM
* The mechanism of the calculation process base on Finite state machine, it be employed to obtain the expandability
* the calculation can be extend by Groovy or JavaScript
* for each script, must have a function which named __doIt__ and return a String as result
* the return value defined by class __com.tms.calculator.scripts.CalStates__ , an exception will raise if return value not predefined


### How to customize the scripts and the priority

The basic idea is that first come first serve basis,
that means system will find a script against the current state to execute it with priority listed below:

1. employee
2. position
3. dept
4. company
5. system

All scripts to be stored in database, changes log also.


### How To start the calculation:

    new CalEngineHolder(msg,context,employeeID).start();



