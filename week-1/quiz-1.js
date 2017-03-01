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
  THOUGHTS:

  N = # of members in social network
  m = # of timestamps of when a friendship was made

  Design an algorithm to determine the earliest time at which all members are connected

  This is a dynamic connectivity problem. It involves connected components.
  Prompt asks for earliest point where all nodes are in one component.
*/

// VANILLA JS

var FriendshipFinder = function(population) {
  // this.population = Array.apply(null, Array(population)).map(function (_, i) {return i;});
  this.population = [];
  this.groupSizes = [];
  this.groups = population;

  for (var i = 0; i < population; i++) {
    this.population[i] = i;
  }

  for (var i = 0; i < population; i++) {
    this.groupSizes[i] = 1;
  }

  return this;
};

FriendshipFinder.prototype.allFriends = function() {
  return this.groups = 1;
};

FriendshipFinder.prototype.rootFor = function(person) {
  var current = person;
  while (current !== this.population[current]) {
    current = this.population[current];
  }
  return current;
};

FriendshipFinder.prototype.makeFriendship = function(person1, person2) {
  var person1Root = this.rootFor(person1);
  var person2Root = this.rootFor(person2);

  if (person1Root === person2Root) {
    return;
  }

  var person1GroupSize = this.groupSizes[person1Root];
  var person2GroupSize = this.groupSizes[person2Root];

  if (person1GroupSize > person2GroupSize) {
    this.population[person2Root] = person1Root;
    this.groupSizes[person1Root] += this.groupSizes[person2Root];
  } else {
    this.population[person1Root] = person2Root;
    this.groupSizes[person2Root] += this.groupSizes[person1Root];
  }

  this.groups--;

  if (this.groups === 1) {
    console.log('Everyone is in one group!');
  }
};

// Evaluator

var uf = new FriendshipFinder(5);
uf.makeFriendship(1, 4);
uf.makeFriendship(2, 3);
uf.makeFriendship(1, 3);
uf.makeFriendship(0, 3);
