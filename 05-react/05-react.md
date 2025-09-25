---
title: "Clase 4 — Introducción a React"
author: "Diego Muñoz"
date: "16 de septiembre de 2025"
theme: "metropolis"
aspectratio: 169
colorlinks: true
---

# Introducción

- React es una biblioteca para construir interfaces de usuario.  
- Nos permite dividir la UI en **componentes** reutilizables.  
- Usa **JS moderno + JSX** y un modelo de estado propio.

---

# 1. Node.js y npm/yarn

- **Node.js**: entorno para ejecutar JavaScript fuera del navegador.  
- Necesario para instalar dependencias y correr herramientas modernas.  
- **npm**: gestor de paquetes oficial de Node.  
- **yarn**: alternativa más rápida y con mejoras en UX.  

```bash
# instalar dependencias con npm
npm install

# lo mismo con yarn
yarn install
````

---

# 2. Vite

* Herramienta moderna para crear proyectos frontend.
* Muy rápida comparada con `create-react-app`.
* Soporta React, Vue, Svelte, etc.

```bash
# crear un proyecto react con vite
yarn create vite nombre-proyecto
```

---

# 3. React crudo

```js
import React from "react";
import { createRoot } from "react-dom/client";

function App() {
  return React.createElement("h1", null, "Hola React");
}

const root = createRoot(document.getElementById("root"));
root.render(React.createElement(App));
```

---

# 4. React con JSX

```js
import React from "react";
import { createRoot } from "react-dom/client";

function App() {
  return <h1>Hola React con JSX</h1>;
}

const root = createRoot(document.getElementById("root"));
root.render(<App />);
```

* JSX → sintaxis similar a HTML, pero en JavaScript.
* El transpiler lo transforma a `React.createElement`.

---

# 5. Componentes (definición)

```js
function Card({ title, body }) {
  return (
    <div className="card">
      <h3>{title}</h3>
      <p>{body}</p>
    </div>
  );
}
```

---

# 5. Componentes (uso)

```js
function App() {
  return (
    <div>
      <Card title="Intro a JS" body="Variables y funciones" />
      <Card title="React" body="Estado y componentes" />
    </div>
  );
}
```

---

# 6. Hooks: useState (concepto)

* React maneja **estado** con hooks.
* `useState` devuelve un valor + función para actualizarlo.

```js
import { useState } from "react";
```

---

# 6. Hooks: useState (ejemplo)

```js
function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Valor: {count}</p>
      <button onClick={() => setCount(count + 1)}>Sumar</button>
      <button onClick={() => setCount(0)}>Reset</button>
    </div>
  );
}
```

---

# 7. Eventos y listas (estado inicial)

```js
function App() {
  const [tasks, setTasks] = useState([
    { id: 1, text: "Leer", done: false }
  ]);
```

---

# 7. Eventos y listas (función toggle)

```js
  function toggle(id) {
    setTasks(tasks.map(
      t => t.id === id ? { ...t, done: !t.done } : t
    ));
  }
```

---

# 7. Eventos y listas (renderizado)

```js
  return (
    <div>
      {tasks.map(t => (
        <div
          key={t.id}
          onClick={() => toggle(t.id)}
          style={{ textDecoration: t.done ? "line-through" : "none" }}
        >
          {t.text}
        </div>
      ))}
    </div>
  );
}
```

---

# 8. Buenas prácticas iniciales

1. Componentes pequeños y reutilizables.
2. Estado local con `useState`.
3. Props inmutables: no modificar lo que llega al componente.
4. Keys únicas al renderizar listas.
5. Mantener JSX legible y limpio.

---

# Resumen

* Node.js y yarn/npm: base del ecosistema.
* Vite: crear y correr proyectos rápidamente.
* JSX simplifica la creación de elementos.
* Componentes = funciones puras + props.
* `useState`: primer hook para manejar estado.
* Listas y eventos → ya estamos listos para proyectos más grandes.
