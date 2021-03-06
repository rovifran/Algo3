
# Código Repetido

Este ejercicio tiene por objetivo que saquen el código repetido que encuentren en el modelo y en los tests. Por ej. entre el test01 y test02.

Los tests provistos ya funcionan, simplemente hay que sacar el código repetido y los tests deben seguir funcionando.

Se pueden modificar las clases provistas, sólo para eliminar código repetido. No se puede modificar lo que verifican los tests. O sea, sólo se puede hacer un cambio de diseño de tal manera que siga testeando lo mismo, que la funcionalidad sea la misma, pero que no haya código repetido.

Aclaración: Para hacer este ejercicio más sencillo se modela a un Customer utilizando un String en vez de una clase Customer. No es el objetivo del ejercicio que ustedes corrijan esta decisión, ni las consecuencias que trae consigo (por ej. que no se pueda agregar al CustomerBook dos Customers diferentes con el mismo nombre).


# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Respuesta: La entidad de la realidad que creamos es un cronómetro que cuenta los milisegundos que toma realizar una determinada  
acción, en el caso de los primeros dos test lo que se queria realizar era añadir y borrar un cliente de un libro de clientes 
y ver cuánto tiempo tomaba la ejecución de esta acción.

## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Respuesta: Lo que podemos usar para representar entes de la realidad son Objetos que poseen cierto comportamiento, si son
entes abstratos podemos usar Clases, y si son entes concretos podemos representarlos con Instancias de esa Clase.
Esta representacion de objetos debe tener una relacion 1:1 con la realidad, es decir, cada cosa implementada en el modelo
debe tener su equivalente en el mundo real.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Respuesta: La relación que hay entre sacar codigo repetido y la teoria del modelo/sistema es que, cuando nos sentamos a programar, debemos formar una teoría (conjunto de concimientos) sobre el modelo en el cual estamos trabajando, al obtener estas conclusiones 
logramos identificar bloques de código similares que luego podemos abstraer formando métodos nuevos ya que la falta de abstracción
proviene, la mayoría de las veces, en repetir lineas de código.