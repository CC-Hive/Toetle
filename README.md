# Toetle
A turtle testing API for when you have no turtles

# Why call it Toetle?
Stub functions -> stub toe -> toe turtle -> toetle

Even I get confued by my brain sometimes - @Lupus590

# What does it do?
A normal stub function would return nil which is not something that most turtle functions normaly return. Toetle takes a list of responces from the programmer and returns those instead. Should the list be too short, toetle will give the first responce again and continue down the list again.

# TODO and Notes Regarding Imlementation
* All toetle specific stuff should be in turtle.toetle where both turtle and toetle are tables. Other than the toetle subtable the turtle table should have the same keys/indexes as the vanilla turtle API.
* Functions in the turtle API returns an entry from their responce list.
* Have a random mode? Entries in the list are returned randomly instead of in sequence?
* Try to have simular responce time as vinilla turtle API? Put in sleeps?
* Responces are stored in a table, how to support nil responces?
 * 0 index of list is number of enties?
 * all enties are a sub table, responce is in that table
* Regarding functions to add responces:
 * Naming convetion. Same as turtle API but in toetle table?
 * allow adding a table of responces?
