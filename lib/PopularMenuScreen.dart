import 'package:flutter/material.dart';

class PopularMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Menu', style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation:0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color:Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
          padding:EdgeInsets.all(16),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchField(),
              SizedBox(height:16),
              // Фильтр кнопка
              Align(
                alignment:Alignment.centerRight,
                child: filterButton(),
              ),
              SizedBox(height:16),
              Expanded(
                child: ListView(
                  children: [
                    menuItem('Original Salad','Lovy Food','8','assets/images/salad1.jpg'),
                    menuItem('Fresh Salad','Cloudy Resto','10','assets/images/salad2.jpg'),
                    menuItem('Yummie Ice Cream','Circlo Resto','6','assets/images/icecream.jpg'),
                    menuItem('Vegan Special','Haty Food','11','assets/images/vegan.jpg'),
                    menuItem('Mixed Pasta','Recto Food','13','assets/images/pasta.jpg'),
                  ],
                ),
              )
            ],
          )
      ),

      // Нижняя панель навигации
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, -2),
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                icon: Icons.home,
                label: 'Home',
                isActive: true,
              ),
              navItem(
                icon: Icons.favorite_border,
                label: '',
              ),
              navItem(
                icon: Icons.storefront_outlined,
                label: '',
              ),
              navItem(
                icon: Icons.person_outline,
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      height:40,
      decoration:BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius:BorderRadius.circular(8)
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText:'Search',
          border:InputBorder.none,
          prefixIcon:Icon(Icons.search,color:Colors.grey),
          contentPadding:EdgeInsets.only(top:6),
        ),
      ),
    );
  }

  Widget filterButton() {
    return Container(
      padding:EdgeInsets.symmetric(horizontal:12,vertical:8),
      decoration:BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Icon(Icons.tune,color:Colors.black),
    );
  }

  Widget menuItem(String title, String subtitle, String price, String imagePath) {
    return Container(
        margin: EdgeInsets.only(bottom:16),
        padding:EdgeInsets.all(16),
        decoration: BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color:Colors.grey.withOpacity(0.1),blurRadius:5,offset: Offset(0,3))
            ]
        ),
        child:Row(
          children: [
            CircleAvatar(
              radius:24,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width:16),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(title,style:TextStyle(fontWeight:FontWeight.bold)),
                    SizedBox(height:4),
                    Text(subtitle,style:TextStyle(color:Colors.grey))
                  ]
              ),
            ),
            Text('\$$price',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16,color:Colors.red)),
          ],
        )
    );
  }

  Widget navItem({required IconData icon, required String label, bool isActive=false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(isActive)
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.pink),
          )
        else
          Icon(icon, color: Colors.pink),

        if(label.isNotEmpty)
          SizedBox(height:4),

        if(label.isNotEmpty)
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.pink : Colors.pink,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          )
      ],
    );
  }
}
