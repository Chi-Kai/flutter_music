// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.result,
        required this.code,
    });

    Result result;
    int code;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        result: Result.fromJson(json["result"]),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "code": code,
    };
}

class Result {
    Result({
        required this.songs,
        required this.hasMore,
        required this.songCount,
    });

    List<Song> songs;
    bool hasMore;
    int songCount;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        songs: List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
        hasMore: json["hasMore"],
        songCount: json["songCount"],
    );

    Map<String, dynamic> toJson() => {
        "songs": List<dynamic>.from(songs.map((x) => x.toJson())),
        "hasMore": hasMore,
        "songCount": songCount,
    };
}

class Song {
    Song({
        required this.id,
        required this.name,
        required this.artists,
        required this.album,
        required this.duration,
        required this.copyrightId,
        required this.status,
        required this.alias,
        required this.rtype,
        required this.ftype,
        required this.transNames,
        required this.mvid,
        required this.fee,
        required this.rUrl,
        required this.mark,
    });

    int id;
    String name;
    List<Artist> artists;
    Album album;
    int duration;
    int copyrightId;
    int status;
    List<String> alias;
    int rtype;
    int ftype;
    List<String>? transNames;
    int mvid;
    int fee;
    dynamic rUrl;
    int mark;

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        name: json["name"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        album: Album.fromJson(json["album"]),
        duration: json["duration"],
        copyrightId: json["copyrightId"],
        status: json["status"],
        alias: List<String>.from(json["alias"].map((x) => x)),
        rtype: json["rtype"],
        ftype: json["ftype"],
        transNames: json["transNames"] == null ? null : List<String>.from(json["transNames"].map((x) => x)),
        mvid: json["mvid"],
        fee: json["fee"],
        rUrl: json["rUrl"],
        mark: json["mark"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "album": album.toJson(),
        "duration": duration,
        "copyrightId": copyrightId,
        "status": status,
        "alias": List<dynamic>.from(alias.map((x) => x)),
        "rtype": rtype,
        "ftype": ftype,
        "transNames": transNames == null ? null : List<dynamic>.from(transNames!.map((x) => x)),
        "mvid": mvid,
        "fee": fee,
        "rUrl": rUrl,
        "mark": mark,
    };
}

class Album {
    Album({
        required this.id,
        required this.name,
        required this.artist,
        required this.publishTime,
        required this.size,
        required this.copyrightId,
        required this.status,
        required this.picId,
        required this.mark,
        required this.alia,
    });

    int id;
    String name;
    Artist artist;
    int publishTime;
    int size;
    int copyrightId;
    int status;
    double picId;
    int mark;
    List<String>? alia;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        name: json["name"],
        artist: Artist.fromJson(json["artist"]),
        publishTime: json["publishTime"],
        size: json["size"],
        copyrightId: json["copyrightId"],
        status: json["status"],
        picId: json["picId"].toDouble(),
        mark: json["mark"],
        alia: json["alia"] == null ? null : List<String>.from(json["alia"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "artist": artist.toJson(),
        "publishTime": publishTime,
        "size": size,
        "copyrightId": copyrightId,
        "status": status,
        "picId": picId,
        "mark": mark,
        "alia": alia == null ? null : List<dynamic>.from(alia!.map((x) => x)),
    };
}

class Artist {
    Artist({
        required this.id,
        required this.name,
        required this.picUrl,
        required this.alias,
        required this.albumSize,
        required this.picId,
        required this.img1V1Url,
        required this.img1V1,
        required this.trans,
    });

    int id;
    String name;
    dynamic picUrl;
    List<dynamic> alias;
    int albumSize;
    int picId;
    String img1V1Url;
    int img1V1;
    dynamic trans;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        picUrl: json["picUrl"],
        alias: List<dynamic>.from(json["alias"].map((x) => x)),
        albumSize: json["albumSize"],
        picId: json["picId"],
        img1V1Url: json["img1v1Url"],
        img1V1: json["img1v1"],
        trans: json["trans"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picUrl": picUrl,
        "alias": List<dynamic>.from(alias.map((x) => x)),
        "albumSize": albumSize,
        "picId": picId,
        "img1v1Url": img1V1Url,
        "img1v1": img1V1,
        "trans": trans,
    };
}
