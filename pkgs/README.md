# Installing the Total Enrollment Predictor Package (TotalEnrlPredictor)
---
This installation is dependent on the user having the dplyr package installed and loaded into the environment in question

library(devtools)
devtools::install_github("hornedfrog88/csx415-project/pkgs/TotalEnrlPredictor")

Executing the score and/or score_linear functions to get a predicted Total Enrollment for the course

The score and score_linear functions both take 4 variable inputs

1.	CourseID-6 digit integer which is the unique UC Berkeley course identifier
2.	MaxUnits-2 digit(max) integer
3.	TotalCapacity-3 digit(max) integer
4.	TotalSections-3 digit(max) integer

Sample Function Calls with Sample Parameters (score can be interchanged with score_linear)
score(125768,3,75,4)-DATASCI W266
score(154233,3,63,4)-DATASCI W200
score(114538,4,36,1)-MATH 141
score(118027,4,180,1)-PHILOS 12A
score(104268,4,237,1)-COMPSCI 10
score(117517,1,96,4)-PBHLTH 162L
score(118006,4,40,1)-PHILOS 100
score(114543,4,36,1)-MATH 151
score(114553,4,36,1)-MATH 170
score(118111,4,144,1)-PHILOS 2
score(117528,3,160,1)-PBHLTH 181

