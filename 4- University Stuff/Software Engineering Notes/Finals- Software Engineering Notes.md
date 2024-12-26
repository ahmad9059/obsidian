
## Activity Diagrams

Activity diagrams represent the dynamic (behavioural) view of the system.
Activity diagrams are a type of behavioural modelling.
Activity diagrams can model a specific use case at a more detailed level.
Activity diagrams are similar to flow charts: they describe the order of activity  
However, they differ from traditional flow charts (Why?)
### Activities
Action element in an activity diagram, whose official UML name is action state. usually  call it either action or activity. 
An action is indicated on the activity diagram by a "capsule" shape – a rectangular object with semicircular left and right ends. 
The text inside it indicates the action (e.g., Customer Calls Ticket Office or Registration Office Opens).

![](Pasted%20image%2020241226214755.png)

#### Initial State
Activity diagrams show a sequence of actions, they must indicate the starting point of the sequence. 

The official UML name for the starting point on the activity diagram is initial state, and it is the point at which you begin reading the action sequence. 

The initial state is drawn as a solid circle with a transition line (arrow) that connects it to the first action in the activity's sequence of actions.

![](Pasted%20image%2020241226214832.png)

#### Final state

Final states: The state which the system reaches when a specific process ends is known as a Final State

![](Pasted%20image%2020241226214941.png)

#### Flow

With arrows indicating direction, the transition lines on an activity diagram show the sequential flow of actions in the modeled activity. 
The arrow will always point to the next action in the activity's sequence.
The activity's flow terminates when the transition line of the last action in the sequence connects to a "final state" symbol, which is a bulls eye (a circle surrounding a smaller solid circle).

![](Pasted%20image%2020241226215015.png)

### Decision Points
Activities modeled for real software development projects include decision points that control what actions take place. 
Each transition line involved in a decision point must be labeled with text above it to indicate "guard conditions," commonly abbreviated as guards.
 A Guard refers to a statement written next to a decision node on an arrow sometimes within square brackets

![](Pasted%20image%2020241226215644.png)

### Fork
Fork nodes are used to support concurrent activities
We use a fork node when both the activities get executed concurrently i.e. no decision is made before splitting the activity into two parts. Both parts need to be executed in case of a fork statement.
We use a rounded solid rectangular bar to represent a Fork

In the example below, the activity of making coffee can be split into two concurrent activities and hence we use the fork notation.


![](Pasted%20image%2020241226220529.png)

### Join
Join nodes are used to support concurrent activities converging into one. For join notations we have two or more incoming edges and one outgoing edge.

When both activities i.e. steaming the milk and adding coffee get completed, we converge them into one final activity.

![](Pasted%20image%2020241226221114.png)

### Merge or Merge Event
Scenarios arise when activities which are not being executed concurrently have to be merged. We use the merge notation for such scenarios. We can merge two or more activities into one if the control proceeds onto the next activity irrespective of the path chosen.

![](Pasted%20image%2020241226221125.png)

In the diagram below: we can’t have both sides executing concurrently, but they finally merge into one. A number can’t be both odd and even at the same time.
![](Pasted%20image%2020241226221159.png)
### Steps to draw an activity diagram
1. Identify the initial state and the final states.
2. Identify the intermediate activities needed to reach the final state from the initial state.
3. Identify the conditions or constraints which cause the system to change control flow.
4. Draw the diagram with appropriate notations.

### Use of Activity Diagrams
Dynamic modelling of the system or a process.
To illustrate the various steps involved in a use case.
To model software elements like methods, operations and functions.
We can use Activity diagrams to depict concurrent activities easily.
To show the constraints, conditions and logic behind algorithms.

_Activity diagrams tell you what happens, but they do not tell you who does what. In programming, this means that the diagram does not convey which class is responsible for each activity_

## Swimlane Diagram

The Swimlane diagram is a useful variation of the activity diagram and allows you to represent the flow of activities described by the use case and at the same time indicate which actor/class has the responsibility for the for the actions described

- We use swimlanes for grouping related activities in one column 
- Swimlanes group related activities into one column or one row
- Swimlanes are used to add modularity to the activity diagram

We use a rectangular column to represent a swimlane as shown in the figure

![](Pasted%20image%2020241226223034.png)

### Example Diagram

![](Pasted%20image%2020241226223052.png)

Swimlanes are good in that they combine the activity diagram's depiction of logic with the interaction diagram's depiction of responsibility
However, they are difficult to develop and at times become too complex
The following is an retail system related example.

![](Pasted%20image%2020241226223145.png)


## Practice Case Study
The case study is about the process of reserving a flight. First, you enter the dates. Once you submit your desired flight plan, you can enter your personal information and at the same time the system could be searching availability. The system flow then joins back into one and you can select the specific flight on the dates you want to fly. After this in the system there are two different paths dependent on whether you are using reward points. In case of reward points you have to enter points and at the same time  the system holds your  reservation. After that payment information is entered, the system performs two processes at the same time. One is the system marks seat as taken and the other is the system processes payment. The system after that sends out a confirmation email

![](Pasted%20image%2020241226223448.png)


