#!/bin/bash
echo -n "Input height (cm): "
read h

echo -n "Input base (cm): "
read b

let area=$h*$b/2
echo -n "The area of the triangle is: $area cm^2"
