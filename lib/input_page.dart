import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constansts.dart';
import 'package:flutter_app/result_page.dart';
import 'package:flutter_app/user_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './icon_cinsiyet.dart';
import './my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara=15;
  double sporGunu=3;
  int boy=170;
  int kilo = 60;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            child: Row(
              children:<Widget> [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(child: Column(
                mainAxisAlignment:MainAxisAlignment.center ,
              children:<Widget> [
                Text('Haftada Kaç Gün Spor Yapıyorsunuz?',
                style: kMetinStili,
                ),
                Text(sporGunu.round().toString(), style: kSayiStili),
                Slider(
                  min:0,
                  max: 7,
                  divisions:7,
                  value: sporGunu,
                  onChanged: (double newValue) {
                    setState(() {
                      sporGunu=newValue;

                    });
                  },
                )
              ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text('Günde Kaç Sigara İçiyorsunuz?',
                  style: kMetinStili,
                ),
                Text(icilenSigara.round().toString(),
                  style: kSayiStili,
                ),
                Slider(
                  min: 0,
                  max: 30,
                  value: icilenSigara,
                  onChanged: (double newValue){
                    setState(() {
                      icilenSigara=newValue;
                    });
                  },
                )
              ],
            ),
            ),
          ),
          Expanded(
            child: Row(
              children:<Widget> [
                Expanded(
                  child:MyContainer(
                    onPress:(){
                      setState(() {
                        seciliCinsiyet='KADIN';
                      });
                    } ,
                    renk: seciliCinsiyet=='KADIN'
                        ?Colors.lightBlue[100]
                        :Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress:(){
                      setState(() {
                        seciliCinsiyet='ERKEK';
                      });
                    } ,

                    renk: seciliCinsiyet=='ERKEK'
                        ?Colors.lightBlue[100]
                        :Colors.white,
                    child: IconCinsiyet(icon: FontAwesomeIcons.mars,
                    cinsiyet: 'ERKEK',
                    ),

                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
              height:50,
              child: FlatButton(
                color:Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>ResultPage(UserData(
                            kilo: kilo,
                            boy: boy,
                            seciliCinsiyet: seciliCinsiyet,
                            sporGunu: sporGunu,
                            icilenSigara: icilenSigara,))));
                },
                child: Text(
                  'HESAPLA'
                ),
              ),

          )

        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                  RotatedBox(
                    quarterTurns:-1,
                    child: Text(
                      label,
                      style: kMetinStili,
                    ),
                  ),
                  SizedBox(width: 10,
                  ),
                  RotatedBox(quarterTurns: -1,
                      child: Text(
                      label=='BOY'? boy.toString(): kilo.toString(),
                    style: kSayiStili,
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                    ButtonTheme(
                      minWidth: 36,
                      child: OutlineButton(borderSide: BorderSide(color: Colors.blueGrey),
                        child: Icon(
                          FontAwesomeIcons.plus,
                        size: 10,
                        ),
                      onPressed: (){
                        setState(() {
                         label=='BOY'? boy++: kilo++;
                        });
                      },
                  ),
                    ),
                    ButtonTheme(
                      minWidth: 36,
                      child: OutlineButton(borderSide: BorderSide(color: Colors.blueGrey),
                        child: Icon(
                          FontAwesomeIcons.minus,
                        size: 10,
                        ),
                        onPressed: (){
                        setState(() {
                          label=='BOY'? boy--: kilo--;;
                        });
                          },
                      ),
                    ),
                  ],
                  ),
                ],
                );
  }
}

