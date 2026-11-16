# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names

Group 11: Kaden Fong

## Summary

In this lab, I worked on creating two different clock dividers using a modulo counter and a ripple counter. I used D flip-flops, T flip-flops, and full adders to build both counters. The modulo counter was supposed to divide the clock by 12, while the ripple counter divided it by 8. I also tested the counters on the Basys 3 board using the center button as the clock and the upper button to reset everything. I had some trouble with the ripple counter because the LEDs weren't doing what I wanted them to do. I also learned more about the difference between synchronous and asynchronous flip-flops and how that affects resetting the counters. I'm still getting used to how flip-flops work, but this lab helped me get how they can be connected to count and divide clock signals.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?

The modulo counter divides by 2 times the count because it takes two toggles to complete one full clock cycle. The output changes once when the counter reaches its limit, but it needs to reach that limit again to change back. For example, my modulo counter counts from 0 to 5, so it takes 6 clock pulses to toggle the output and another 6 to toggle it back. That means it takes 12 clock pulses for one full cycle.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?

The counter goes to all 1s because each T flip-flop uses the previous flip-flop's output as its clock. Since the T inputs are set to 1, each flip-flop toggles when it receives a rising clock edge. On the first clock pulse, the first flip-flop changes from 0 to 1, which triggers the second one, and then the third one. This causes all three outputs to become 1 after the changes pass through.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?

I'd use a 17-bit ripple counter. The Basys 3 has a 100 MHz clock, and each T flip-flop divides the frequency by 2. With 17 flip-flops, I would divide 100 MHz by 2^17, which gives me around 763 Hz. That's not 1 KHz, but it's closer than using 16 flip-flops, which would give around 1526 Hz.