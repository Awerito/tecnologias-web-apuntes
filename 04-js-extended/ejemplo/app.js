let tasks = [
  { id: 1, text: "Leer", done: false },
  { id: 2, text: "Practicar JS", done: true },
];

const $ = (s) => document.querySelector(s);

function addTask(list, text) {
  const id = list.length ? Math.max(...list.map((t) => t.id)) + 1 : 1;
  return [...list, { id, text, done: false }];
}

function toggleTask(list, id) {
  return list.map((t) => (t.id === id ? { ...t, done: !t.done } : t));
}

function TaskItem({ id, text, done }) {
  const cls = done ? "item done" : "item";
  const mark = done ? "[x]" : "[ ]";
  return `<div data-id="${id}" class="${cls}">${mark} ${text}</div>`;
}

function renderList(list) {
  $("#list").innerHTML = list.map(TaskItem).join("");
}

$("#form").addEventListener("submit", (e) => {
  e.preventDefault();
  const text = $("#newText").value.trim();
  if (!text) return;
  tasks = addTask(tasks, text);
  $("#newText").value = "";
  renderList(tasks);
});

$("#list").addEventListener("click", (e) => {
  const item = e.target.closest(".item");
  if (!item) return;
  const id = Number(item.dataset.id);
  tasks = toggleTask(tasks, id);
  renderList(tasks);
});

$("#onlyActive").addEventListener("input", () => {
  const only = $("#onlyActive").checked;
  const view = only ? tasks.filter((t) => !t.done) : tasks;
  renderList(view);
});

// inicial
renderList(tasks);
