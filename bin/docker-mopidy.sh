#!/usr/bin/env sh

docker run -d \
  -v $PWD/media:/var/lib/mopidy/media:ro \
  -v $PWD/local:/var/lib/mopidy/local \
  -p 6600:6600 -p 6680:6680 \
  wernight/mopidy \
  mopidy \
  -o spotify/username=$SPOTIFY_USERNAME -o spotify/password=$SPOTIFY_PASSWORD -o spotify/bitrate=320 \
  -o gmusic/enabled=true -o gmusic/username=$GMUSIC_USERNAME -o gmusic/password=$GMUSIC_PASSWORD -o gmusic/bitrate=320 -o gmusic/all_access=true -o gmusic/deviceid=$GMUSIC_DEVICEID \
  -o soundcloud/auth_token=$SOUNDCLOUD_TOKEN -o soundcloud/explore_songs=100
