import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Login/login.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  int _selectedIndex=0;

  final List<Widget> _pages = [
    _pagina_intro(
      height: 0,
      width: 0,
      title: 'Intro prueba de\nApp Fitness',
      photo: 'assets/img1md.jpg',
    ),
    _pagina_intro(
      height: 0,
      width: 0,
      title: 'Intro para probar de\nApp Fitness',
      photo: 'assets/sushil-ghimire-DC5akQJyH4I-unsplash_big.jpg',
    ),
    const LoginPage()

  ];


  @override
  Widget build(BuildContext context) {
   final   _height= MediaQuery.of(context).size.height;
   final   _width= MediaQuery.of(context).size.width;

   final List<Widget> updatedPages = _pages.map((page) {
     if (page is _pagina_intro) {
       return _pagina_intro(
         height: _height,
         width: _width,
         title: page._title,
         photo: page._photo,
       );
     } else {
       return page;
     }
   }).toList();;

    return Scaffold(
      body:
          SizedBox(
            height: _height,
            width: _width,
            child: Stack(
              children: [

               PageView(
                 controller: _controller,
                 onPageChanged: (index){
                   setState(() {
                     _selectedIndex=index;
                   });
                 },
                 children:updatedPages
               ),
                Positioned(
                  bottom:20 ,
                  left: 20,
                  // top: 870,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                      List.generate(_pages.length, (index)=>
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: AnimatedContainer(
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 500),
                            width: index==_selectedIndex?50:20,
                            height: 20,
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        )
                      )
                  ),
                ),



                  (_selectedIndex == _pages.length -1)?Container():Positioned(
                   bottom:20 ,
                   right: 20,
                   // top: 870,
                    child: GestureDetector(
                      onTap: (){
                          setState(() {
                            _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          });
                      },
                      child:  _boton_arrow(),
                    ),
                ),





              ],
            ),
          )

    );
  }
}

class _boton_arrow extends StatelessWidget {
  const _boton_arrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        boxShadow:[BoxShadow(
          color:Color(0xffd3fda1).withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset:Offset(0,0)
        )],
        borderRadius: BorderRadius.circular(50),
        color:Color(0xffd3fda1),
      ),
      child: Center(
        child: Icon(
            color:Colors.black,
            size: 30,
            Icons.arrow_forward_ios_rounded
        ),
      ),
    );
  }
}

class _pagina_intro extends StatelessWidget {
  const _pagina_intro({
    super.key,
    required double height,
    required double width,
    required String title,
    required String photo
  }) : _height = height, _width = width,_title=title,_photo=photo;

  final double _height;
  final double _width;
  final String _title;
  final String _photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            _photo

          ),
          fit: BoxFit.cover,
        )
      ),
      height: _height,
      width: _width,
      child: Stack(

        children: [
          Container(decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.4),Colors.black.withOpacity(0.1)])
          ),
          ),
          Positioned(
            bottom:150,
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Text(
                _title,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(color:Colors.white,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 0.8)
                ,
              ),
            ),
          ),

        ],
      )
    );
  }
}
