import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yashesap/constants.dart';
import 'package:yashesap/user_data.dart';
import 'result_page.dart';
import 'IconCinsiyet.dart';
import 'MyConteiner.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet='';
  double icilenSigara = 0.0;
  double yapilanSpor = 0.0;
  int boy = 170;
  int kilo = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyConteiner(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyConteiner(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyConteiner(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Haftada Kaç Gün Spor Yapıyorsunuz?',
                      style: kMetinStili),
                  Text(yapilanSpor.round().toString(), style: kSayiStili),
                  Slider(
                    value: yapilanSpor,
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanSpor = newValue;
                      });
                    },
                    min: 0,
                    max: 7,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyConteiner(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Günde kaç sigara içiyorsunuz?', style: kMetinStili),
                  Text(icilenSigara.round().toString(), style: kSayiStili),
                  Slider(
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                    min: 0,
                    max: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyConteiner(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.blueGrey
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyett: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyConteiner(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.blueGrey
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyett: 'ERKEK',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                    UserData(kilo: kilo,boy: boy,seciliCinsiyet: seciliCinsiyet,icilenSigara: icilenSigara,yapilanSpor: yapilanSpor)
                  ),));
                },
                child: Text(
                  'Hesapla',
                  style: kMetinStili,
                ),
              ))
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label,) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          child: Text(
            label,
            style: kMetinStili,
          ),
          quarterTurns: -1,
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
          quarterTurns: -1,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'BOY' ? boy++ : kilo++;
                });
              },
              child: Icon(
                FontAwesomeIcons.plus,
                size: 10,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'BOY' ? boy-- : kilo--;
                });
              },
              child: Icon(
                FontAwesomeIcons.minus,
                size: 10,
              ),
            ),
          ],
        )
      ],
    );
  }
}
