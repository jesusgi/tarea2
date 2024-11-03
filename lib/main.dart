import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const Tarjeta());

class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tarjeta',
      home: TarjetaHome(),
    );
  }
}

class TarjetaHome extends StatelessWidget {
  const TarjetaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjeta'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 370,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 178, 220, 255),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/yo.jpg'),
                  ),
                  Text(
                    'Jesus Argenis Nolasco Núñez',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Desarrollador Flutter',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 16),
                  //*Like
                  Like(),
                  SizedBox(height: 16),
                  //Etiquetas
                  Wrap(
                    spacing: 5.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Etiquetas('Angular'),
                      Etiquetas('Html'),
                      Etiquetas('JavaScript'),
                      Etiquetas('Ionic'),
                    ],
                  ),
                  //Iconos de redes sociales
                  Iconos(),
                  SizedBox(height: 16),
                  //Botón de compartir
                  Botones(),
                  // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //   FilledButton(onPressed: null, child: Text('Compartir')),
                  //   SizedBox(width: 16),
                  //   FilledButton(
                  //     onPressed: null,
                  //     child: Text('CV'),
                  //   ),
                  // ]),
                  SizedBox(height: 16),
                  //*Número de proyectos y seguidores
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text('Proyectos'),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(children: [
                        Text(
                          '1.8K',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text('Seguidores'),
                      ]),
                      SizedBox(width: 16),
                      Column(children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text('Rating'),
                      ])
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Iconos
class Iconos extends StatefulWidget {
  const Iconos({super.key});

  @override
  State<Iconos> createState() => _IconosState();
}

//* Botón de compartir
class Botones extends StatefulWidget {
  const Botones({super.key});

  @override
  State<Botones> createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton.icon(
        onPressed: null,
        icon: const Icon(Icons.share),
        label: const Text('Compartir'),
      ),
      const SizedBox(width: 16),
      ElevatedButton.icon(
        onPressed: null,
        icon: const Icon(Icons.download),
        label: const Text('CV'),
      )
    ]);
  }
}

class _IconosState extends State<Iconos> {
  final Map<String, bool> iconos = {
    'facebook': false,
    'twitter': false,
    'instagram': false,
    'linkedin': false,
  };
  final Color colorInactivo = Colors.grey;
  final Color colorActivo = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Facebook
        IconButton(
          icon: Icon(Icons.facebook,
              color: iconos['facebook']! ? colorActivo : colorInactivo,
              size: 30),
          onPressed: () {
            setState(() {
              iconos['facebook'] = !iconos['facebook']!;
            });
          },
        ),
        //twitter
        IconButton(
          icon: Icon(Icons.close,
              color: iconos['twitter']! ? colorActivo : colorInactivo,
              size: 30),
          onPressed: () {
            setState(() {
              iconos['twitter'] = !iconos['twitter']!;
            });
          },
        ),
        //instagram
        IconButton(
          icon: Icon(Icons.photo_camera,
              color: iconos['instagram']! ? colorActivo : colorInactivo,
              size: 30),
          onPressed: () {
            setState(() {
              iconos['instagram'] = !iconos['instagram']!;
            });
          },
        ),
        //linkedin
        IconButton(
          icon: Icon(Icons.business,
              color: iconos['linkedin']! ? colorActivo : colorInactivo,
              size: 30),
          onPressed: () {
            setState(() {
              iconos['linkedin'] = !iconos['linkedin']!;
            });
          },
        )
      ],
    );
  }
}

//* Etiquetas
class Etiquetas extends StatelessWidget {
  final String texto;
  const Etiquetas(this.texto, {super.key}); //* constructor

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(texto),
      backgroundColor: Colors.white,
    );
    // margin: const EdgeInsets.only(right: 8),
    // decoration: BoxDecoration(
    //   color: Colors.blue,
    // ),
    // child: Text(texto));
  }
}

//* Like
class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  int like = 0;
  void sumarLike() {
    setState(() {
      like++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton.icon(
          onPressed: sumarLike,
          icon: like > 0
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite_border,
                  color: const Color.fromARGB(255, 110, 111, 110)),
          label: Text('$like'))
    ]);
  }
}
