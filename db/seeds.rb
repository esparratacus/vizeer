# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles= Role.create([{name: 'admin'},{name: 'estudiante'},{name: 'consejero'},{name: 'profesor'}])
admin_user = User.new
admin_user.email= "admin@admin.com"
admin_user.password ="admin123"
admin_user.save

 lista_materias=[["Pensamiento Algorítmico",3,"El objetivo principal es estimular su capacidad para enfrentar la solución de problemas y lograr que el estudiante desarrolle una nueva forma de pensar para que pueda emplear el computador como herramienta para la solución de problemas. 
El alumno al terminar el curso estará en capacidad de aplicar  los tres paradigmas de pensamiento que constituyen la disciplina de la Informática: teoría, abstracción y diseño. 
Para lograr el objetivo se utilizan metodologías que ayudan a la definición y desarrollo de algoritmos. Igualmente en la segunda parte del curso, se utiliza una herramienta para la programación (lenguaje C/C++) para así implementar las soluciones algorítmicas en el computador."],
  ["Introducción a la ingeniería de sistemas",2,"Busca presentar al estudiante los aspectos históricos, conceptuales,  y sociales que rigen la Ingeniería y particularmente hacer énfasis en la razón de ser de la Ingeniería  de Sistemas. En el curso se define la Ingeniería como profesión, se identifican los diferentes perfiles y campos de acción del Ingeniero de Sistemas, y se define terminología básica en relación con Hardware, Software, Sistemas numéricos y sistemas de información."],
  ["Programación de computadores",3,"El estudiante debe profundizar en temas de memoria dinámica y almacenamiento de datos, así como asimilar los conceptos fundamentales sobre las estructuras de datos básicas."],
  ["Programación orientada a objetos",2,"Se pretende que el estudiante asimile los conceptos fundamentales de programación orientada a objetos, tales como clases, objetos, herencia y polimorfismo.
Despertar la habilidad para implementar software basado en el paradigma de Orientación a Objetos.
Al finalizar el curso el alumno deberá estar en capacidad de analizar, diseñar e implementar soluciones a problemas usando el paradigma de la orientación a objetos."],
  ["Máquinas digitales",3,"Esta asignatura esta dirigida a estudiantes de ingeniería de sistemas y pretende dar una visión de los componentes básicos de hardware de un computador. Cubre temas tales como: fundamentos de circuitos lógicos, unidades de proceso, tipos de instrucciones, sistemas de almacenamiento, memorias RWM, memorias ROM, discos, cintas, periféricos, puertos, terminales y teclados"],
  ["Análisis y diseño orientado a objetos",2,"Se pretende que el estudiante  asimile los conceptos fundamentales de análisis y diseño orientado a objetos.
Introducir al estudiante en los conceptos básicos del Proceso de Ingeniería de software, y algunas de sus etapas (obtención de requerimientos, análisis y diseño)
Modelar gráficamente la solución de problemas con un enfoque Orientado a Objetos, usando un lenguaje de modelado, en este caso UML implementado cualquier herramienta visual.
Al finalizar el curso el alumno deberá estar en capacidad de analizar, diseñar e implementar  soluciones a problemas usando el paradigma de la orientación a objetos, sustentado bajo un esquema de proceso de ingeniería de software básico."],
  ["Estructuras de datos",3,"El objetivo principal es lograr que el estudiante desarrolle habilidad para definir estructuras dinámicas de agrupamiento de datos, como lo son los árboles binarios, grafos y búsquedas.  Para lograr el objetivo se utilizan metodologías que ayudan a la definición, desarrollo y verificación de algoritmos. Igualmente se utiliza una herramienta para la programación (lenguaje C/C++) para así implementar las soluciones algorítmicas en el computador.
Resolver problemas del mundo real a través de una adecuada selección y utilización de las estructuras de datos con base en el análisis del problema y el diseño de la solución."],
  ["Comunicaciones y redes",4,"Se pretende que los estudiantes conozcan los conceptos básicos de las redes de computadores y la transmisión de datos.
- Conocer el concepto de redes y su aplicabilidad
- Conocer los conceptos básicos de transmisión de datos
- Dominar los conceptos de las capas físicas y enlace
- Adoptar los conceptos de redes de área local
- Dominar los conceptos básicos del conjunto de protocolos de TCP/IP"],
  ["Bases de datos",3,"
Se pretende ofrecer los elementos conceptuales, prácticos, experimentales e investigativos necesarios para modelar, diseñar y construir  bases de datos relacionales."],
  ["Sistemas operativos",3,"Tiene como objetivo principal capacitar al estudiante en los conceptos fundamentales de los Sistemas Operativos, teniendo en cuenta sus principales componentes: administración de recursos, manejo de procesos, manejo del almacenamiento principal, manejo del almacenamiento secundario, manejo de dispositivos, seguridad."],
  ["Sistemas de información",3,"El curso pretende que el  estudiante comprenda y apropie los conceptos básicos sobre sistemas de información su impacto en las organizaciones y las etapas del ciclo de vida de los Sistemas de  Información.  Se estudian y se aplican  diferentes metodologías estructuradas para el análisis y diseño de Sistemas de Información."],
  ["Pensamiento sistemico",3,"El curso pretende presentar el origen y naturaleza del pensamiento de sistemas y entender su uso a través del estudio y aplicación de talleres y metodologías sistémicas.  Esto con el fin de desarrollar en el estudiante una visión holística para la solución de problemas y para el diseño de sistemas."],
  ["Análisis de algoritmos",2,"Aprender a evaluar matemáticamente el desempeño de un algoritmo desde el punto de vista del tiempo consumido y el espacio utilizado en la solución del problema que resuelve. Estudiar y ejercitar las principales técnicas de diseño de algoritmos. Estudiar algunos problemas denominados Fundamentales por la importancia que tienen y frecuencia con que aparecen en la programación de computadores."],
  ["Lenguajes de programación",3,"Hasta el momento los estudiantes tienen un dominio amplio en la programación imperativa estructurada y orientada a objetos; sin embargo, es necesario que también conozcan y aprendan otros paradigmas de programación que le permitan ampliar su esquema de pensamiento y abstracción.
El paradigma de programación lógico le permite a los estudiantes obtener una visión nueva para abordar los problemas de la vida real y acercarse un poco mas a la solución de problemas que son abordados por la Inteligencia Artificial.
El paradigma de programación funcional, al igual que el anterior es una forma novedosa de ver el mundo, permitiendo tener un enfoque diferente a la hora de atacar los problemas de programación."],
  ["Introducción a sistemas distribuidos",2,"El curso introduce al funcionamiento y utilidad de los sistemas distribuidos de manera que el estudiante sea capaz de adquirir la visión necesaria para entender y diseñar un esquema computacional básico de este tipo."],
  ["Ingeniería de Software",4,"Al finalizar el curso el estudiante estará en capacidad de comprender las distintas fases y tareas de un proceso de desarrollo de software, con la integración de metodologías de apoyo en cada etapa y con el manejo de distintos modelos y lenguajes de especificación."],
  ["Gerencia y gestión informática",2,"El curso busca capacitar a los estudiantes para que generen competencias gerenciales desde la perspectiva estratégica y afiancen sus capacidades en gerencia informática.
Se estudian  conceptos de estrategia, gerencia y gestión."],
  ["Arquitectura de software",3,"El curso brinda al estudiante las herramientas, técnicas y métodos para la comprensión y diseño de sistemas complejos de software.  Al final del curso el estudiante debe estar en capacidad de comprender los distintos estilos, patrones y vistas de una arquitectura de software y elegir entre ellas para modelar adecuadamente un sistema dado."]]
  
  lista_materias.each do |nombre,creditos,descripcion|
    Course.create(nombre: nombre, creditos: creditos,descripcion: descripcion)
  end