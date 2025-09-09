const users = [
  { id: 1, name: "Ana", age: 22 },
  { id: 2, name: "Luis", age: 19 },
  { id: 3, name: "Pedro", age: 22 },
  { id: 4, name: "Maria", age: 19 },
  { id: 5, name: "Juan", age: 23 },
];
console.log(users);

const byAge = users.reduce((acc, u) => {
  if (acc[u.age] == null) {
    acc[u.age] = [];
  }
  acc[u.age].push(u.name);
  return acc;
}, {});

console.log(byAge); // { '19': [ 'Luis' ], '22': [ 'Ana' ] }
