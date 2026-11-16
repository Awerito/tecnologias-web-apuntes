---
title: "React Navigation: Navegación en React Native"
author: "Diego Muñoz"
date: "16 de noviembre de 2026"
theme: "metropolis"
aspectratio: 169
colorlinks: true
---

# Navegación en React Native

* Pantallas declaradas en código con **React Navigation**.
* **Stack**: pantallas apiladas con botón atrás.
* **Parámetros**: datos que viajan de una pantalla a otra.
* **Tabs**: barra inferior con las secciones de la app.

---

# Navegación sin biblioteca

* La barra con `useState` cambia de ejemplo, pero:

  * No hay botón atrás ni historial.
  * No se pueden enviar datos a otra pantalla.
  * Cada pantalla nueva se agrega a mano en la barra.

---

# React Navigation

* Biblioteca estándar de navegación en React Native.
* Cada pantalla se registra con un **nombre** y un componente.
* Se navega por nombre, no por URL como en React Router.
* `NavigationContainer` envuelve toda la navegación de la app.

---

# Instalación

En el proyecto de NativeWind:

```bash
pnpm add @react-navigation/native @react-navigation/native-stack
pnpm add @react-navigation/bottom-tabs
pnpm expo install react-native-screens react-native-safe-area-context
pnpm start
```

> `pnpm expo install` elige las versiones compatibles con el SDK de Expo.

---

# Stack

* Las pantallas se apilan una sobre otra.
* El header muestra el título y el botón atrás automático.
* `useNavigation()` entrega `navigation` en cualquier pantalla.
* `navigation.navigate("Detalle")` abre la pantalla `Detalle`.
* Crear `components/Lista.tsx`, `components/Detalle.tsx` y `components/Productos.tsx`.

---

# components/Lista.tsx

```js
import { useNavigation } from "@react-navigation/native";
import { Pressable, Text, View } from "react-native";

const productos = [
  { id: 1, nombre: "Empanada", precio: 2500 },
  { id: 2, nombre: "Completo", precio: 3000 },
  { id: 3, nombre: "Sopaipilla", precio: 500 },
];
```

---

# Componente Lista

```js
export default function Lista() {
  const navigation = useNavigation();
  return (
    <View className="flex-1 bg-slate-900 p-4">
      {productos.map((producto) => (
        <Pressable key={producto.id}
          className="p-4 mb-3 rounded-xl bg-slate-800"
          onPress={() => navigation.navigate("Detalle", producto)}>
          <Text className="text-lg text-white">{producto.nombre}</Text>
        </Pressable>
      ))}
    </View>
  );
}
```

---

# Parámetros

* El segundo argumento de `navigate` viaja a la pantalla destino.
* La pantalla destino recibe `route` como prop.
* `route.params` contiene el producto tocado.

> El editor marca `route` y `navigate` en rojo por los tipos. La app corre igual.

---

# components/Detalle.tsx

```js
import { Text, View } from "react-native";

export default function Detalle({ route }) {
  const { nombre, precio } = route.params;
  return (
    <View className="flex-1 items-center justify-center bg-slate-900">
      <Text className="text-3xl font-bold text-white">{nombre}</Text>
      <Text className="text-xl text-emerald-400 mt-2">${precio}</Text>
    </View>
  );
}
```

---

# components/Productos.tsx

```js
import {
  createNativeStackNavigator,
} from "@react-navigation/native-stack";
import Lista from "./Lista";
import Detalle from "./Detalle";
const Stack = createNativeStackNavigator();
export default function Productos() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Lista" component={Lista} />
      <Stack.Screen name="Detalle" component={Detalle} />
    </Stack.Navigator>
  );
}
```

---

# App.tsx

```js
import "./global.css";
import { NavigationContainer } from "@react-navigation/native";
import { SafeAreaProvider } from "react-native-safe-area-context";
import Productos from "./components/Productos";

export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Productos />
      </NavigationContainer>
    </SafeAreaProvider>
  );
}
```

---

# Tabs

* Barra inferior siempre visible con las secciones de la app.
* Cada `Tab.Screen` es una pestaña. Su `name` es el texto de la pestaña.
* Una pestaña puede contener un stack completo, como `Productos`.
* `headerShown: false` oculta el header de las tabs. `Productos` ya tiene el suyo.
* Cada tab mantiene su estado al cambiar: el contador no vuelve a 0.
* El `App.tsx` final reemplaza al anterior.

---

# Imports de App.tsx

```js
import "./global.css";
import { NavigationContainer } from "@react-navigation/native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { SafeAreaProvider } from "react-native-safe-area-context";
import Productos from "./components/Productos";
import PrimerTest from "./components/PrimerTest";
import Flexbox from "./components/Flexbox";
import Scroll from "./components/Scroll";
import SafeArea from "./components/SafeArea";
import Contador from "./components/Contador";

const Tab = createBottomTabNavigator();
```

---

# Navegación por tabs

```js
export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Tab.Navigator screenOptions={{ headerShown: false }}>
          <Tab.Screen name="Productos" component={Productos} />
```

---

# Tabs de ejemplos

```js
          <Tab.Screen name="Primer test" component={PrimerTest} />
          <Tab.Screen name="Flexbox" component={Flexbox} />
          <Tab.Screen name="Scroll" component={Scroll} />
          <Tab.Screen name="Safe area" component={SafeArea} />
          <Tab.Screen name="Contador" component={Contador} />
        </Tab.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>
  );
}
```

---

# Resumen

* React Navigation declara las pantallas en código, con nombre y componente.
* `NavigationContainer` envuelve toda la navegación.
* Stack:

  * Pantallas apiladas con botón atrás.
  * `navigation.navigate("Nombre", datos)` abre una pantalla.
  * `route.params` lee los datos recibidos.
* Tabs:

  * Barra inferior con una pestaña por `Tab.Screen`.
  * Una pestaña puede contener un stack.

---

# Preguntas y Discusión

¿Tienes dudas? ¡Hablemos!
