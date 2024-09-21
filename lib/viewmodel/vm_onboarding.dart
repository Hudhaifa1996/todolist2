import 'package:shared_preferences/shared_preferences.dart';

class Skip
{
    String buttonText = "skip";
    String buttonText2 = "next";

    int index=0;
Skip(index)
{
if (index ==2)
{buttonText = 'finish';
buttonText2 = '          ';
}
else
{buttonText = 'skip';
buttonText2 = 'next';}
}
    }
void Prefs() async
{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('repeat', false);
}





