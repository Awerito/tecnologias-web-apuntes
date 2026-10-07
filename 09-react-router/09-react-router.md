---
title: "React Router: Navegación en SPAs"
author: "Diego Muñoz"
date: "07 de octubre de 2026"
theme: "metropolis"
aspectratio: 169
colorlinks: true
---

# Introducción

* Entender cómo se maneja la **navegación** en aplicaciones React.
* Aprender los componentes esenciales de **React Router**.
* Configurar rutas básicas y navegación entre páginas.
* Distinguir entre **SPA** y múltiples archivos HTML.

---

# Aplicación SPA

* **Single Page Application**: el servidor entrega un solo HTML.
* Todo lo demás lo dibuja JavaScript en el navegador.
* Vite genera ese único HTML y React se monta en el `div` raíz.

```html
<body>
  <div id="root"></div>
  <script type="module" src="/src/main.jsx"></script>
</body>
```

---

# Navegación sin React Router

* Un estado decide qué pantalla se muestra. La URL nunca cambia.

```jsx
import { useState } from "react";
export default function App() {
  const [screen, setScreen] = useState("A");
  return (
    <>
      <button onClick={() => setScreen("A")}>A</button>
      <button onClick={() => setScreen("B")}>B</button>
      {screen === "A" && <h2>Pantalla A</h2>}
      {screen === "B" && <h2>Pantalla B</h2>}
    </>
  );
}
```

---

# Motivación de React Router

* React solo muestra **un componente raíz** (`App`).
* Necesitamos un sistema para cambiar “pantallas” sin recargar.
* **React Router** permite rutas declarativas dentro de una SPA.

```bash
pnpm add react-router
```

---

# Concepto básico de rutas

* Cada “ruta” asocia una **URL** con un **componente**.
* React Router escucha los cambios de URL sin recargar la página.

```js
<Route path="/" element={<Home />} />
<Route path="/about" element={<About />} />
```

---

# Configuración inicial (Router + Routes)

```js
import { BrowserRouter, Routes, Route } from "react-router";
import Home from "./pages/Home";
import About from "./pages/About";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
      </Routes>
    </BrowserRouter>
  );
}
```

---

# Componentes de ejemplo

```js
// pages/Home.jsx
export default function Home() {
  return <h2>Inicio</h2>;
}

// pages/About.jsx
export default function About() {
  return <h2>Acerca de</h2>;
}
```

> Cada archivo representa una "vista" o "pantalla" distinta.

---

# Navegación entre páginas

* `Link` reemplaza los `<a>` normales.
* Cambia la URL sin recargar la página.

```js
import { Link } from "react-router";

export default function NavBar() {
  return (
    <nav>
      <Link to="/">Inicio</Link> |{" "}
      <Link to="/about">Acerca de</Link>
    </nav>
  );
}
```

---

# Integrar la barra de navegación

```js
import { BrowserRouter, Routes, Route } from "react-router";
import NavBar from "./components/NavBar";
import Home from "./pages/Home";
import About from "./pages/About";
export default function App() {
  return (
    <BrowserRouter>
      <NavBar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
      </Routes>
    </BrowserRouter>
  );}
```

---

# Parámetros en rutas (1/2)

* Se definen con `:nombre`.
* Se leen con `useParams()`.

```js
// En App.jsx
<Route path="/user/:id" element={<User />} />
```

---

# Parámetros en rutas (2/2)

```js
// pages/User.jsx
import { useParams } from "react-router";

export default function User() {
  const { id } = useParams();
  return <h3>Perfil de usuario: {id}</h3>;
}
```

> Ejemplo:
> `/user/42` muestra “Perfil de usuario: 42”.

---

# Navegación programática

* `useNavigate()` permite redirigir desde código.

```js
import { useNavigate } from "react-router";

export default function Login() {
  const navigate = useNavigate();
  function handleLogin() {
    // validaciones...
    navigate("/dashboard");
  }
  return <button onClick={handleLogin}>Entrar</button>;
}
```

---

# Ruta comodín (404)

```js
<Route path="*" element={<h3>Página no encontrada</h3>} />
```

> Debe ir al final del bloque `<Routes>`.

---

# Estructura recomendada

```
src/
|-- pages/
|   |-- Home.jsx
|   |-- About.jsx
|   `-- User.jsx
|-- components/
|   `-- NavBar.jsx
`-- App.jsx
```

---

# Resumen

* **BrowserRouter**: contexto principal de navegación.
* **Routes / Route**: definen qué mostrar por URL.
* **Link**: navegación declarativa.
* **useParams / useNavigate**: lectura y cambio de ruta.
* **SPA real**: una sola página HTML, múltiples vistas.

---

# Preguntas y Discusión

¿Tienes dudas? ¡Hablemos!
