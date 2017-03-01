/*
  PROMPT 1:

  Social network connectivity. Given a social network containing n members and a log file containing
  m timestamps at which times pairs of members formed friendships, design an algorithm to determine
  the earliest time at which all members are connected (i.e., every member is a friend of a friend
  of a friend ... of a friend). Assume that the log file is sorted by timestamp and that friendship
  is an equivalence relation. The running time of your algorithm should be mlogn or better and use
  extra space proportional to n.
*/

/*
  N = # of members in social network
  m = # of timestamps of when a friendship was made

  Design an algorithm to determine the earliest time at which all members are connected

  This is a dynamic connectivity problem. It involves connected components.
  Prompt asks for earliest point where all nodes are in one component.
*/
