# COMP122 Lecture Notes: Dec 4, 2024

## Announcements:
  1. Assignment: #3: Digital Logic (31-digital-logic)
     - Consider it a practice quiz!
     - Due: Dec 6 17:00 PST

  1. Quiz #3: Digital Logic (30-quiz-digital-logic)
     - Online Timed Quiz
     - Paper-like Deliverable
     - Released on Dec 6 17:00 PST
     - Due: Dec 8 23:59 PDT

## Today's Agenda:

   1. T/R
      1. Control Lines and the CPU
      1. State and MicroArchitecture



## Questions from Last Lecture/Lab, etc.:
   * M/W 

   * T/R

## Any Review?

---
# Today's Lecture/Lab Material

  1. Control Lines and the CPU
     - See Slides: Control_Lines_and_the_CPU.pdf 
 
  1. State and the MicroArchitecturekCombinational Circuits
     - See Slides: State_and_MicroArchitecture.pdf

---
## Resources

      | A | B |  X |
      |---|---|----| 
 A'B' | 0 | 0 |  0 |  
 A'B  | 0 | 1 |  1 |
 AB'  | 1 | 0 |  1 |
 AB   | 1 | 1 |  0 |

A'B + AB'

      | A | B |  X |
      |---|---|----| 
 A'B' | 0 | 0 |  1 |   1   
 A'B  | 0 | 1 |  1 |   1 
 AB'  | 1 | 0 |  ? |   0 
 AB   | 1 | 1 |  1 |   1 


A'B' + A'B  + AB


      | A | B |  X |
      |---|---|----| 
 A'B' | 0 | 0 |  1 |  
 A'B  | 0 | 1 |  1 |
 AB'  | 1 | 0 |  0 |
 AB   | 1 | 1 |  1 |

A'B' + A'B + AB



         | A | B | C | X | Y | Z |
         |---|---|---|---|---|---|
 A'B'C'  | 0 | 0 | 0 | 1 | 1 | 0 |
 A'B'C   | 0 | 0 | 1 | 0 | 0 | 1 |
 A'BC'   | 0 | 1 | 0 | 1 | 0 | 1 |
 A'BC    | 0 | 1 | 1 | 1 | 0 | 1 |
 AB'C'   | 1 | 0 | 0 | 1 | 1 | 0 |
 AB'C    | 1 | 0 | 1 | 0 | 1 | 0 |
 ABC'    | 1 | 1 | 0 | 0 | 1 | 0 |
 ABC     | 1 | 1 | 1 | 1 | 0 | 1 |

X = A'B'C' + A'BC' + A'BC + AB'C' + ABC
Y = A'B'C' + AB'C' + AB'C + ABC'
Z = (Y)' = A'B'C + A'BC' + A'BC + ABC

 A'B'C' + AB'C' + AB'C + ABC' == ( A'B'C + A'BC' + A'BC + ABC )'

---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


