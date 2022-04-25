Preguntas para después de hacer el ejercicio
A continuación les planteamos algunas cuestiones para pensar y contestar. Las preguntas van a ser evaluadas también.

1. Sobre implementar funcionalidad
Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando.
Cuando los implementaste, ¿esos tests pasaron (los tres) de una?

Respuesta: Los tests al correrlos uno por uno pasaron todos, pero cuando queriamos volver al test anterior habia fallado ya que no habiamos
implementado retrocederElHabitatAlInicioDeLosTiempos, entonces tuvimos que ir al código y completar de forma correcta el mensaje

2. ¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03?
¿se te ocurre cómo? Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?

Respuesta: Si, no nos convencio hacer que las pruebas pasen individualmente porque sino teniamos que ir y cambiar las cosas que habiamos
implementado para pruebas anteriores, asi podian pasar correctamente. Lo que hicimos para que las pruebas pasen en conjunto fue implementar
cantidadDeHuevos como un colaborador interno del objeto Habitat que sea inicializado en 0, entonces retrocederElHabitatAlInicioDeLosTiempos
hace que la cantidad de huevos inicial sea 0 y intentarReproducirse aumenta en 1 la cantidad de huevos actual

3. Sobre código repetido
¿les quedó código repetido? ¿dónde?¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)?

Respuesta: Nos quedó código repetido inicialmente en hacerQueElHabitatTengaLosRecursosSuficientes y en retrocederElHabitatAlInicioDeLosTiempos
cuando queriamos reiniciar la cantidad de huevos para cada avispa, lo solucionamos cambiando la forma en la que guardamos los huevos e iteramos
por la estructura elegida (un diccionario) para poder poner en 0 los huevos de las avispas y resetear la cantidad de orugas y de polillas.
La cosa del dominio que nos faltó representar fue que los huevos se comportan de igual forma cuando reseteamos el habitat, es decor, todos se van a 0

4. Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes
polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué? ¿por qué tendría sentido que fuera
de la otra forma? ¿con cuál nos quedamos?

Respuesta: En nuestro modelo quedo como responsable de esta accion las polillas, ya que las que ponen huevos son ellas, y para eso antes
de que lo hagan se fijan si hay suficientes orugas/polillas/huevos antes de proceder. Tendría sentido de que de esto se encargue el hábitat
ya que es el lugar donde los recursos tambien viven, y el hábitat sabe de su existencia (ya que la cantidad de polillas, orugas y huevos son
colaboradores internos del habitat). Pero nos quedamos con nuestra implementación, nos parece más semejante a la realidad que la otra

5. Sobre código repetido 2
Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código?

Respuesta: Lo que haria sería hacer un objeto Avispa y hacer objetos hijos que tengan los nombres de cada avispa, con la diferencia que en su forma de reproduccion que cada una tenga un requisito diferente para reproducirse (unas utilizan orugas, otra polillas, etc). Sin embargo, no hariamos de clase un Huevo y como clases hijas los huevos de cada avispa ya que los huevos en sí no tienen ningun comportamiento especial ni saben responder distintos mensajes según la genética de estos, en ese caso seguiriamos con nuestra implementacion de los huevos

6. Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban?
Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Respuesta: el tema de la cantidad de los huevos lo resolvimos guardándolos en un diccionario, donde las claves de este son su genética y
el valor es la cantidad de huevos que tienen esa genética. Hizo falta uno solo ya que nos daba la información de los huevos de cada avispa y
la suma de los huevos (los valores del diccionario) nos daba la cantidad de huevos total.
En cuanto a si era más sencillo o no, fue más dificil de implementar que si hubiesemos hecho distintos colaboradores internos del hábitat que
sean la cantidad de huevos con X genética, pero sin dudas creemos que es más eficiente y ordenado.
