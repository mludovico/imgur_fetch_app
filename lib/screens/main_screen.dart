import 'package:flutter/cupertino.dart';
import 'package:imgurfetchapp/api/api_connection.dart';
import 'package:imgurfetchapp/widgets/img_card.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ApiConnection _connection = ApiConnection();

  List imgList;

  @override
  void initState() {
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: FutureBuilder(
        future: _connection.getImages(1),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: CupertinoActivityIndicator(),
              );
              break;
            default:
              if(snapshot.hasError)
                return Center(
                  child: Text(
                    'Não foi possível obter imagens\nVerifique sua conexão de internet',
                    style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 17,
                        decoration: TextDecoration.none
                    ),
                  ),
                );
              else if(snapshot.data.length < 1)
                return Center(
                  child: Text(
                    'Nenhuma imagem disponível',
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 17,
                      decoration: TextDecoration.none
                    ),
                  ),
                );
              else
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3
                    ),
                    padding: EdgeInsets.all(15),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageCard(
                          url: snapshot.data[index],
                        ),
                      );
                    }
                  ),
                );
              break;
          }
        },
      ),
    );
  }

  void fillList() async {
    imgList = await _connection.getImages(2);
    print('inside filllist $imgList');
  }
}
