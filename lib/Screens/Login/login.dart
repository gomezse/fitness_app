
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


 _submit() async{
    if(_usernameController.text != 'admin' || _passwordController.text != 'admin' ){

        _mostrarSnackBar(context,'Usuario o Contraseña incorrecta', 500);


    }else{

        Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Fondo
          _fondo_img(),

          // Opacidad
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Contenido del login
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Título
                  _msj_inicio_session(),
                  const SizedBox(height: 32),

                 //Usuario
                  _text_field(usernameController: _usernameController, label: 'Nombre de Usuario',),

                  const SizedBox(height: 16),

                  //Contraseña
                  _text_field(usernameController: _passwordController, label: 'Contraseña',),

                  const SizedBox(height: 32),
                  // Botón Ingresar
                  _btn_login(usernameController: _usernameController, passwordController: _passwordController,onPressed: _submit),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//SnackBar ---> mensajeria
class _fondo_img extends StatelessWidget {
  const _fondo_img({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo_login.jpg'), // Cambia esto a la ruta de tu imagen
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _btn_login extends StatelessWidget {
  const _btn_login({
    super.key,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required onPressed,
  }) : _usernameController = usernameController, _passwordController = passwordController,_onPressed=onPressed;

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;

  final  _onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:_onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Ingresar',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class _msj_inicio_session extends StatelessWidget {
  const _msj_inicio_session({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Iniciar Sesión',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _text_field extends StatelessWidget {
  const _text_field( {
    super.key,
    required TextEditingController usernameController,
    required String label
  }) : _controller = usernameController,
        _label =label;

  final TextEditingController _controller;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: _label,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

_mostrarSnackBar(BuildContext context, String _mensaje, int _status) {
  final snackBarER = SnackBar(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    backgroundColor: _status == 200 ? Colors.green[400] : Colors.red,
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Icon(_status == 200 ? Icons.check_circle_outline : Icons.error_outline,
            color: Colors.white),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(_mensaje,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Colors.white)),
        ),
      ],
    ),
    action: SnackBarAction(
      label: 'Cerrar',
      textColor: Colors.white,
      onPressed: () {
        // Solo cierra el popup. no requiere acción
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBarER);
}