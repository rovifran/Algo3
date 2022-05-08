# Números

## Primera parte

Hacer file-in del archivo Numeros-Parte1-Ejercicio.st.

Como se observa, contamos con una clase Numero que representa un modelo de números. En particular soporta operaciones de enteros y de fracciones.
Contamos con una suite de tests que verifica una serie de operaciones básicas que soporta nuestro modelo.

El objetivo de esta primera parte es quitar los ifs utilizando polimorfismo, aplicando el algoritmo que vimos en clase. 

Los tests deben seguir pasando (sin modificarlos).

## Segunda parte

Para esta segunda parte, deben previamente quitar la categoría Numeros-Parte1-Ejercicio, y luego hacer file-in de Numeros-Parte2-Ejercicio.st.

Este segundo modelo presentado es una posible solución de la primera parte, pero agregando nuevas operaciones: resta, división y fibonacci.

Como podrán ver cuando corran los tests, hay varios que funcionan y son los correspondientes a cuando se opera aritméticamente entre números del mismo tipo, o sea entre enteros o entre fracciones. Los test que fallan son los relacionados a las operaciones entre números de distinto tipo, es decir, entre enteros y fracciones y viceversa.

El objetivo de este ejercicio es que implementen la suma, la resta, la multiplicación y la división entre números enteros y fraccionarios.

La solución final no debe tener if en los métodos que deben implementar y todos los test deben funcionar (sin ser modificados!).

**Pasos a seguir:**

1. Antes de empezar a resolver el problema, debuggeen los tests que funcionan para entender cómo es el modelo que se está presentando. Analicen las clases Numero, Entero y Fraccion.
2. Una vez que se sientan cómodos con el modelo, hagan pasar todos los tests implementando lo necesario utilizando ifs. 
3. Una vez que los tests pasen, apliquen el algoritmo que vimos en clase para reemplazar if por polimorfismo.

Para la entrega, deben hacer file-out de la solución a esta segunda parte. No es necesario entregar la solución a la primera parte.

**Algunas aclaraciones:**

- Las fracciones no pueden tener denominador 1. Fracciones con denominador 1 se asumen enteros.
- Los enteros no pueden responder los mensajes #numerador y #denominador ya que no son fracciones.
- Cuando se opera aritméticamente con enteros, verán que se utilizan las operaciones aritméticas provistas por el sistema. Esto es para que sea más performante.

## Desafío Adicional (opcional, no resta, sólo otorga puntos extra)

Aquellos que estén interesados en llevar al extremo el reemplazo de if por polimorfismo (y practicar para el parcial), traten de sacar los ifs que ya venían en el ejercicio inicialmente: Los tienen que ver con que no se puede dividir por cero, que el denominador no puede ser uno, casos bases de fibonacci, etc. 

Las soluciones a este desafío son muy interesantes y distintas para lenguajes de prototipación (ej. javascript) vs clasificación.


## Preguntas teóricas

### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

Respuesta: El primer mensaje que lo recibe self nos da la informacion sobre el tipo de objeto que es self y el segundo llamado
hace que el colaborador (que conoce su tipo) se ocupe de realizar la accion correspondiente, ya que tambien conoce quien es self

### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Respuesta: Nos parece que la logica sobre cómo instanciar un objeto debe ser responsabilidad de ese mismo objeto, no es lo ideal
que dependa de un tercero. Por ejemplo en el caso de este ejercicio, no tiene sentido que los tests sean los que tengan el cómo
se instancia un entero o una fraccion, deben saber crearse por sí solos. No se debería crear el objeto en distintos lugares y de
formas diferentes ya que se corre el riesgo de instanciar de forma inadecuada al objeto provocando errores. Lo arreglaríamos 
poniendo los mensajes de instanciación del objeto en la categoria private y con documentacion aclarando al programador cómo y de qué forma instanciar a dicho objeto.

### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Respuesta: Los estamos categorizando principalmente en públicos y privados, y dentro de los públicos podemos diferenciarlos según
sus acciones sobre el objeto (por ejemplo, initialization, arithmetic operations, accesing, etc)

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Respuesta: Lo ponemos para que cualquier programador en el futuro quiera crear una nueva subclase que debe implementar estos
mensajes. Sirve para que, en el caso que este (el programador) se olvide de implementarlos, haya un registro que le informe
que es responsabilidad de su nueva subclase implementar dichos mensajes.

### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Respuesta: Porque romper el encapsulamiento puede generar problemas ya que si modificamos variables internas de una clase ajena, 
esta misma clase puede no tener registro de estos cambios y por lo general conlleva a errores, ya sea de programación/ejecución.
Además el código es mucho mas extensible y facil de arreglar y mantener si el encapsulamiento se respeta