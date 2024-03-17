import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://media.istockphoto.com/id/1164822188/vector/male-avatar-profile-picture.jpg?s=612x612&w=0&k=20&c=KPsLgVIwEGdDvf4_kiynCXw96p_PhBjIGdU68qkpbuI=',
      character: cast.character);
}
