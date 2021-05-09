# builder design pattern
use the builder pattern when you want to create a complex object using a series of steps.

this pattern involves three main types : 

1- Director ----> accept inputs and coordinates with the builder, usually is viewcontroller or a helper class.
2- product -----> the complex object to be created , it can be struct or class depending on desired refernce sematics, ususlly a model.
3- builder -----> accept steps-by-steps inputs and handles the creation of the product, usually is a class.


