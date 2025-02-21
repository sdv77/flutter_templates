import 'package:flutter/material.dart';

class MeditateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        title: Text('Meditate',style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color:Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:16),
        children: [
          SizedBox(height:16),
          // Категории
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categoryChip('All', isActive:true),
                categoryChip('Bible In a Year'),
                categoryChip('Dailies'),
                categoryChip('Minutes'),
                categoryChip('Novice'),
              ],
            ),
          ),
          SizedBox(height:16),
          // Большая карточка
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text('A Song of Moon',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
                      SizedBox(height:8),
                      Text('Start with the basics',style:TextStyle(color:Colors.grey)),
                      SizedBox(height:8),
                      Text('9 Sessions',style:TextStyle(color:Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(width:16),
                Container(
                  height:80,
                  width:80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/moon_illustrarion.jpg'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:16),
          // Список карточек с картинками
          MeditateSessionCard(
            title:'The Sleep Hour',
            author:'Ashna Mukherjee',
            sessions:'3 Sessions',
            duration:'Start >',
            color: Colors.orange.shade100,
            imagePath: 'assets/images/sleep_hour.jpg',
          ),
          SizedBox(height:16),
          MeditateSessionCard(
            title:'Easy on the Mission',
            author:'Peter Mach',
            sessions:'5 minutes',
            duration:'Start >',
            color: Colors.yellow.shade200,
            imagePath: 'assets/images/mission.png',
          ),
          SizedBox(height:16),
          MeditateSessionCard(
            title:'Relax with Me',
            author:'Amanda James',
            sessions:'3 Sessions',
            duration:'Start >',
            color: Colors.blue.shade100,
            imagePath: 'assets/images/relax.jpg',
          ),
          SizedBox(height:16),
          MeditateSessionCard(
            title:'Sun and Energy',
            author:'Micheal Hiu',
            sessions:'5 minutes',
            duration:'Start >',
            color: Colors.green.shade100,
            imagePath: 'assets/images/sun_energy.png',
          ),
          SizedBox(height:16),
        ],
      ),
    );
  }

  Widget categoryChip(String title,{bool isActive=false}) {
    return Container(
      margin: EdgeInsets.only(right:8),
      padding: EdgeInsets.symmetric(horizontal:16, vertical:8),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title,style: TextStyle(color: isActive? Colors.white : Colors.black)),
    );
  }
}

class MeditateSessionCard extends StatelessWidget {
  final String title;
  final String author;
  final String sessions;
  final String duration;
  final Color color;
  final String imagePath;

  MeditateSessionCard({
    required this.title,
    required this.author,
    required this.sessions,
    required this.duration,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          // Добавляем изображение слева
          Container(
            height:60,
            width:60,
            margin: EdgeInsets.only(right:16),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover
                )
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(title,style:TextStyle(fontWeight:FontWeight.bold, fontSize:16)),
                SizedBox(height:4),
                Text(author,style:TextStyle(color:Colors.grey)),
                SizedBox(height:4),
                Text(sessions,style:TextStyle(color:Colors.grey)),
              ],
            ),
          ),
          Text(duration,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.blue)),
        ],
      ),
    );
  }
}
