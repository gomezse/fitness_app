import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  int? _selectedDay;

  //-----------------------------CALENDAR--------------------------------------
  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
    });
  }

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
    });
  }

  List<Widget> _buildDaysOfMonth() {
    final daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    final List<Widget> dayWidgets = [];

    for (int i = 1; i <= daysInMonth; i++) {
      dayWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = i;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
            decoration: BoxDecoration(
              color: _selectedDay == i ? Colors.blue : Colors.grey[200],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
              '$i',
              style: TextStyle(
                fontSize: 16,
                color: _selectedDay == i ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      );
    }

    return dayWidgets;
  }

  //-----------------------------------CATEGORIES------------------------------

  final List<Widget> _elements_categories = [
    _category(
      title: 'Cardio',
      photo: 'assets/cardio.jpg',
    ),
    _category(
      title: 'Yoga',
      photo: 'assets/yoga.jpg',
    ),
    _category(
      title: 'Boxing',
      photo: 'assets/boxing.jpg',
    ),
    _category(
      title: 'Crossfit',
      photo: 'assets/crossfit.jpg',
    ),
    _category(
      title: 'Running',
      photo: 'assets/running.jpg',
    ),
  ];

  final List<Widget> _elements_popular = [
    _category(photo: 'assets/popular_1.jpg', width: 220, height: 150),
    _category(photo: 'assets/popular_2.jpg', width: 220, height: 150),
    _category(photo: 'assets/popular_3.jpg', width: 220, height: 150),
    _category(photo: 'assets/popular_4.jpg', width: 220, height: 150),
    _category(photo: 'assets/popular_5.jpg', width: 220, height: 150),
    _category(photo: 'assets/popular_6.jpg', width: 220, height: 150),
    _category(photo: 'assets/popular_7.jpg', width: 220, height: 150),
    _category(photo: 'assets/popular_8.jpg', width: 220, height: 150),
  ];
  final List<String> _listaDeVideos = [
    'https://www.youtube.com/watch?v=UItWltVZZmE',     // Día 1
    'https://www.youtube.com/watch?v=p-uUnrCdhR8',    // Día 2
    'https://www.youtube.com/watch?v=FeR-4_Opt-g',    // Día 3
    'https://www.youtube.com/watch?v=UBMk30rjy0o',   // Día 4
    'https://www.youtube.com/watch?v=Eik9mXj5vbA',   // Día 5
    'https://www.youtube.com/watch?v=Eyu6dUVVmU0',   // Día 6
    'https://www.youtube.com/watch?v=1f8yoFFdkcY',   // Día 7
    'https://www.youtube.com/watch?v=Cw-Wt4xKD2s',   // Día 8
    'https://www.youtube.com/watch?v=AUTqIj21X7g',   // Día 9
    'https://www.youtube.com/watch?v=-CQaTP8crjA',   // Día 10
    'https://www.youtube.com/watch?v=UItWltVZZmE',     // Día 11
    'https://www.youtube.com/watch?v=p-uUnrCdhR8',    // Día 12
    'https://www.youtube.com/watch?v=FeR-4_Opt-g',    // Día 13
    'https://www.youtube.com/watch?v=UBMk30rjy0o',   // Día 14
    'https://www.youtube.com/watch?v=Eik9mXj5vbA',   // Día 15
    'https://www.youtube.com/watch?v=Eyu6dUVVmU0',   // Día 16
    'https://www.youtube.com/watch?v=1f8yoFFdkcY',   // Día 17
    'https://www.youtube.com/watch?v=Cw-Wt4xKD2s',   // Día 18
    'https://www.youtube.com/watch?v=AUTqIj21X7g',   // Día 19
    'https://www.youtube.com/watch?v=-CQaTP8crjA',   // Día 20
    'https://www.youtube.com/watch?v=UItWltVZZmE',     // Día 21
    'https://www.youtube.com/watch?v=p-uUnrCdhR8',    // Día 22
    'https://www.youtube.com/watch?v=FeR-4_Opt-g',    // Día 23
    'https://www.youtube.com/watch?v=UBMk30rjy0o',   // Día 24
    'https://www.youtube.com/watch?v=Eik9mXj5vbA',   // Día 25
    'https://www.youtube.com/watch?v=Eyu6dUVVmU0',   // Día 26
    'https://www.youtube.com/watch?v=1f8yoFFdkcY',   // Día 27
    'https://www.youtube.com/watch?v=Cw-Wt4xKD2s',   // Día 28
    'https://www.youtube.com/watch?v=AUTqIj21X7g',   // Día 29
    'https://www.youtube.com/watch?v=-CQaTP8crjA',   // Día 30
    'https://www.youtube.com/watch?v=UItWltVZZmE',     // Día 31
  ];


  Widget _getSessionForSelectedDay() {
    if (_selectedDay == null) {
      _selectedDay = 1;
    }

    YoutubePlayerController _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(_listaDeVideos[_selectedDay! - 1])!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return _sessionCard(
      title: 'Session for Day $_selectedDay',
      videoUrl: _listaDeVideos[_selectedDay! - 1],
      day: _selectedDay!,
      youtubePlayerController: _youtubePlayerController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My training Plan',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: _previousMonth,
                  ),
                  Text(
                    DateFormat.yMMM().format(_selectedDate),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: _nextMonth,
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildDaysOfMonth(),
                ),
              ),
              SizedBox(height: 20),
              _title_section(title: 'Today Sessions'),
              _getSessionForSelectedDay(),
              SizedBox(height: 20),
              _title_section(title: 'Categories'),
              SizedBox(height: 10),
              _horizontal_list(elements: _elements_categories),
              SizedBox(height: 30),
              _title_section(title: 'Popular'),
              _horizontal_list(elements: _elements_popular),
            ],
          ),
        ),
      ),
    );
  }
}

class _horizontal_list extends StatelessWidget {
  const _horizontal_list({
    super.key,
    required List<Widget> elements,
  }) : _elements = elements;

  final List<Widget> _elements;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _elements,
      ),
    );
  }
}

class _title_section extends StatelessWidget {
  const _title_section({super.key, required title}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
      alignment: Alignment.centerLeft,
      child: Text(
        _title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

class _category extends StatelessWidget {
  const _category({
    super.key,
    String? title,
    double? height,
    double? width,
    required String photo
  }) : _title=title != null?title:'',
        _height=height != null?height:200,
        _width=width != null?width:200,
        _photo=photo;

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
            ),
            borderRadius: BorderRadius.circular(10.0)
        ),
        height: _height,
        width: _width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),


        child: Stack(

          children: [
            Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.05),Colors.black.withOpacity(0.1)])
            ),
            ),
            Positioned(

              child: Padding(
                padding: const EdgeInsets.only(left:10,right: 10,top: 5),
                child: Text(
                  _title,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                      color:Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7)
                  ,
                ),
              ),
            ),

          ],
        )
    );
  }
}


class _sessionCard extends StatelessWidget {
  final String title;
  final String videoUrl;
  final int day;
  final YoutubePlayerController youtubePlayerController;

  const _sessionCard({
    Key? key,
    required this.title,
    required this.videoUrl,
    required this.day,
    required this.youtubePlayerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: YoutubePlayer(
              controller: youtubePlayerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}