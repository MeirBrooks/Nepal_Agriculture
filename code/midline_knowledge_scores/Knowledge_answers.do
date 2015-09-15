/* PROGRAM DESCRIPTION
Program: Knowledge_answers.do
Task: Declares Midline question answers (G22-G32)
Project: ICIMOD NEPAL AGRICULTURE
Edited: Seungmin Lee, 24 June 2015 */

// Define macros for answers
// "LB" stands for lower bound and "UB" stands for upper bound
// If the correct answer is not bounded, then macro value should be the same for both LB and UB
// If the correct answer is "YES", then macro value should be 1. If "No", then macro value should be 2.
// If the correct answer is blank, then macro value should be a dot(.)
// If the correct answer is not available, then macro value should be 999
** We do not have answers for MID_G32 (TOMATO) and MID_G31 (FRENCH BEAN)


// Tomato Answers

local G22_TOMATO_LB 1
local G22_TOMATO_UB 1

local G23_TOMATO_LB 100
local G23_TOMATO_UB 100

local G24_TOMATO_LB 50
local G24_TOMATO_UB 50

local G25_TOMATO_LB 3
local G25_TOMATO_UB 4

local G26_TOMATO_LB 2
local G26_TOMATO_UB 2

local G27_TOMATO_LB 1
local G27_TOMATO_UB 1

local G28_TOMATO_LB 50
local G28_TOMATO_UB 50

local G29_TOMATO_LB 100
local G29_TOMATO_UB 100

local G30_TOMATO_LB 1
local G30_TOMATO_UB 1

local G31_TOMATO_UREA 1
local G31_TOMATO_DAP 1
local G31_TOMATO_POTAS 1

local G32_TOMATO_SANDY 999
local G32_TOMATO_SANDY_LOAM 999
local G32_TOMATO_LOAM 999
local G32_TOMATO_CLAY 999

// Ginger Answers

local G22_GINGER_LB 1
local G22_GINGER_UB 1

local G23_GINGER_LB 100
local G23_GINGER_UB 100

local G24_GINGER_LB 50
local G24_GINGER_UB 50

local G25_GINGER_LB 3
local G25_GINGER_UB 4

local G26_GINGER_LB 2
local G26_GINGER_UB 2

local G27_GINGER_LB 1
local G27_GINGER_UB 1

local G28_GINGER_LB 25
local G28_GINGER_UB 25

local G29_GINGER_LB 50
local G29_GINGER_UB 50

local G30_GINGER_LB 2
local G30_GINGER_UB 2

local G31_GINGER_UREA 1
local G31_GINGER_DAP 1
local G31_GINGER_POTAS 1

local G32_GINGER_SANDY 2
local G32_GINGER_SANDY_LOAM 1
local G32_GINGER_LOAM 1
local G32_GINGER_CLAY 2

// French Beans Answers

local G22_FRENCH_BEANS_LB 1
local G22_FRENCH_BEANS_UB 1

local G23_FRENCH_BEANS_LB 100
local G23_FRENCH_BEANS_UB 100

local G24_FRENCH_BEANS_LB 50
local G24_FRENCH_BEANS_UB 50

local G25_FRENCH_BEANS_LB 3
local G25_FRENCH_BEANS_UB 4

local G26_FRENCH_BEANS_LB 2
local G26_FRENCH_BEANS_UB 2

local G27_FRENCH_BEANS_LB 1
local G27_FRENCH_BEANS_UB 1

local G28_FRENCH_BEANS_LB 25
local G28_FRENCH_BEANS_UB 25

local G29_FRENCH_BEANS_LB 50
local G29_FRENCH_BEANS_UB 50

local G30_FRENCH_BEANS_LB 2
local G30_FRENCH_BEANS_UB 2

local G31_FRENCH_BEANS_UREA 999
local G31_FRENCH_BEANS_DAP 999
local G31_FRENCH_BEANS_POTAS 999

local G32_FRENCH_BEANS_SANDY 2
local G32_FRENCH_BEANS_SANDY_LOAM 1
local G32_FRENCH_BEANS_LOAM 2
local G32_FRENCH_BEANS_CLAY 2

macro list
