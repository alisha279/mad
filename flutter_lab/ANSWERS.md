Study Tracker Lab — Wrap-up

Name:Alisha Nasir  
Roll Number: 04072313019

Part A: Numbers

A1: 5

A2: 10

A3: 6

A4: 54

Part B: Written Answers

B1: Which classes are Stateless and which are Stateful, and why?

`LabApp`, `HomePage`, `StudentCard`, and `GoalBanner` are Stateless because they display information or arrange the interface without storing changing state. `Tally`, `Countdown`, and `BuggyCounter` are Stateful because they need to maintain changing values, such as the count, remaining time, and click total.

B2: Why must the Timer be cancelled in dispose()?

The Timer must be cancelled to stop it from running after the Countdown widget is removed. Otherwise, it could call `setState()` after the widget has been disposed and cause an error.

B3: Which widgets in your code can be const, and what does const buy you?

`LabApp`, `HomePage`, `Tally`, `Countdown`, and `BuggyCounter` can be created using const constructors. Fixed widgets such as `SizedBox` and static `Text` widgets can also be const. `const` allows Flutter to reuse immutable widget configurations and avoid creating unnecessary widget instances. Widgets that depend on changing values cannot be const for those changing values.
