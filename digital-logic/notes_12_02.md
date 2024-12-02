# COMP122 Lecture Notes: Dec 2, 2024

## Announcements:
  1. Assignment: #3: Digital Logic (31-digital-logic  )
     - Consider it a practice quiz!
     - Due: Dec 6 17:00 PST
     - URL: https://classroom.github.com/a/o-QeWQ0y

  1. Quiz #3: Digital Logic (30-quiz-digital-logic  )
     - Online Timed Quiz
     - Paper-like Deliverable
     - Released on Dec 6 17:00 PST
     - Due: Dec 8 23:59 PDT

   1. 40-exam-mips
      - due Tuesday, Dec 10 23:59 PST

   1. All student repos are to be deleted
      - December 22, 2024
      - Copy your repos to build a portfolio 


## This Weeks's Agenda:
   1. Start a new section: Digital Logic

   1. M/T 
      1. Introduction to Digital Logic
      1. Combinational Circuits

   1. W/R
      1. Control Lines and the CPU
      1. State and MicroArchitecture



## Questions from Last Lecture/Lab, etc.:
   * M/W 

   * T/R

---
# Today's Lecture/Lab Material

  1. Introduction to Digital Logic
     - See Slides: Introduction_to_Digital.pdf
 
  1. Combinational Circuits
     - See Slides: Combinational_Circuits.pdf

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


