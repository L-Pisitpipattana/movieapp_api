import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:movieapp_api/models/models.dart';
import 'package:movieapp_api/routes/routes.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: size.width,
        height: size.height * 0.55,
        child: const Center(child: CircularProgressIndicator(color: Colors.indigo)),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Builder(
        builder: (context) {
          fit: BoxFit.cover;
          return Swiper(
            itemCount: movies.length,
            //layout: SwiperLayout.STACK,
            layout: SwiperLayout.TINDER,
            autoplay: true,
            itemWidth: 800,
            itemHeight: 500,
            itemBuilder: (_, int index) {
              final movie = movies[index];
              movie.heroId = 'swiper-${movie.id}';
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, DetailsScreen.routeName, arguments: movie),
                child: Hero(
                  tag: movie.heroId!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/images/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
