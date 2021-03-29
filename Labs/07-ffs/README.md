### Lab Assignment

## Assignment 1

### 1) Equations

![rovnice](Images/rovnice.png)
 
 ### 2) Tables for D, JK, T flip-flops

   | **clk** | **D** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: |
   | ↑ | 0 | 0 | 0 | No change |
   | ↑ | 0 | 1 | 0 | No change |
   | ↑ | 1 | 0 | 1 | q(n+1) |
   | ↑ | 1 | 1 | 1 | q(n+1) |


   | **clk** | **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
   | :-:| :-: | :-: | :-: | :-: | :-- |
   | ↑ | 0 | 0 | 0 | 0 | No change |
   | ↑ | 0 | 0 | 1 | 1 | No change |
   | ↑ | 0 | 1 | 0 | 0 | Reset |
   | ↑ | 0 | 1 | 1 | 0 | Reset |
   | ↑ | 1 | 0 | 0 | 1 | Set |
   | ↑ | 1 | 0 | 1 | 1 | Set |
   | ↑ | 1 | 1 | 0 | 1 | Toggle |
   | ↑ | 1 | 1 | 1 | 0 | Toggle |


   | **clk** | **T** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ↑ | 0 | 0 | 1 | No change |
   | ↑ | 0 | 1 | 0 | No change |
   | ↑ | 1 | 0 | 0 | Toggle |
   | ↑ | 1 | 1 | 1 | Toggle |
