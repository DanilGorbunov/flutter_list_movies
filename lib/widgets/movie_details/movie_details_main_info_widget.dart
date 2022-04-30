import 'package:catalogs/widgets/elements/radial_percent_widget.dart';
import 'package:catalogs/widgets/images.dart';
import 'package:catalogs/widgets/movie_details/movie_details_main_screen_cast_widget.dart';
import 'package:flutter/material.dart';

class MoviesDetailsMainInfoWidget extends StatelessWidget {
  const MoviesDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPostersWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: _OverViewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        SizedBox(height: 30),
        _PeopleWidget(),
      ],
    );
  }

  Text _DescriptionWidget() {
    return Text(
      'dgdfg drgdrg dgdgdg dgdg  ',
      maxLines: 3,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Text _OverViewWidget() {
    return Text(
      'OverView',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _TopPostersWidget extends StatelessWidget {
  const _TopPostersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(AppImages.iron1.assetName)),
        Positioned(
          top: 20,
          left: 10,
          bottom: 20,
          child: Image(image: AssetImage(AppImages.iron2.assetName)),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Text njhi ohhihxcc',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            text: ' (2021)',
          ),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: RadialPercentWidget(
                    percent: 0.68,
                    fillColor: Color.fromARGB(255, 10, 23, 25),
                    lineColor: Color.fromARGB(255, 37, 203, 103),
                    freeColor: Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                    child: Text('68'),
                  ),
                ),
                SizedBox(width: 10),
                Text('Score'),
              ],
            )),
        Container(
          height: 15,
          width: 1,
          color: Colors.grey,
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.play_arrow),
                Text('Play Trayler'),
              ],
            )),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          'R, 05/22/2021 (US) Atrion',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w300,
    );
    final jobStyle = TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w300,
    );

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max, //max size to left, to right
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollina', style: nameStyle),
                Text('Director', style: jobStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollina', style: nameStyle),
                Text('Director', style: jobStyle),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max, //max size to left, to right
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollina', style: nameStyle),
                Text('Director', style: jobStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollina', style: nameStyle),
                Text('Director', style: jobStyle),
              ],
            )
          ],
        )
      ],
    );
  }
}
