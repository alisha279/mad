OOP Lab Wrap-up — Campus Library System

Name: Alisha Nasir  
Roll Number: 04072313019

Q1. What can a subclass using `extends` use for free that a class using `implements` has to write itself?

A subclass using `extends` can use the parent class's existing fields and implemented methods. A class using `implements` must implement the required members itself.

Q2. Book and Dvd both use Renewable. When would you pick a mixin, and when an abstract parent class?

I would use a mixin when different classes need to share behaviour, such as renewal. I would use an abstract parent class when related classes need common fields and methods and share the same basic structure.


Q3. Why must you override `hashCode` whenever you override `==`?

Objects that are equal according to `==` must have the same `hashCode`. This helps collections such as sets identify equal objects correctly.


Q4. An extension method on String and a subclass of String both add behaviour. Why does Dart let you write the first one but not the second?

An extension method adds behaviour to `String` without creating a subclass. Dart's `String` type is final, so it cannot be extended through inheritance.
