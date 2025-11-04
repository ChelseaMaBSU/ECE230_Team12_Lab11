# Sequential Circuits: Latches

In this lab, you’ve learned about edge sensitive circuits and explored some of the power therein.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### What is different between edge and level sensitive circuits?

Level sensitive circuits capture and follows the input throughout the entire time the enable signal is 
HIGH or 1. If the input changes while it's HIGH, the output will change with it.
Edge level sensitive circuits capture the input only at the moment the clock transitions from LOW to HIGH,
or in this case at every positive edge.

### Why is it important to declare initial state?

It's important to declare initial state because without it the flipflops contain undefined values. The 
circuit could start at any random configuration and can vary between different devices.

### What do edge sensitive circuits let us build?

Edge sensitive circuits let us build sequential circuits like memory elements, counters, and registers.
Counters will only increment once per clock edge instead of continuously in a loop. Registers are a group of
flipflops, which means they can store multiple bits of binary data. They're important for storing and 
processing data over time and changing only at a specific clock edge. This helps create more complex 
systems in arithmetic logic units.


