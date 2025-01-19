import 'package:json_annotation/json_annotation.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel {
  @JsonKey(name: "location")
  final Location location;
  @JsonKey(name: "current")
  final Current current;

  CurrentWeatherModel({
    required this.location,
    required this.current,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: "last_updated_epoch")
  final int lastUpdatedEpoch;
  @JsonKey(name: "last_updated")
  final String lastUpdated;
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "temp_f")
  final double tempF;
  @JsonKey(name: "is_day")
  final int isDay;
  @JsonKey(name: "condition")
  final Condition condition;
  @JsonKey(name: "wind_mph")
  final double windMph;
  @JsonKey(name: "wind_kph")
  final double windKph;
  @JsonKey(name: "wind_degree")
  final int windDegree;
  @JsonKey(name: "wind_dir")
  final String windDir;
  @JsonKey(name: "pressure_mb")
  final int pressureMb;
  @JsonKey(name: "pressure_in")
  final double pressureIn;
  @JsonKey(name: "precip_mm")
  final int precipMm;
  @JsonKey(name: "precip_in")
  final int precipIn;
  @JsonKey(name: "humidity")
  final int humidity;
  @JsonKey(name: "cloud")
  final int cloud;
  @JsonKey(name: "feelslike_c")
  final double feelslikeC;
  @JsonKey(name: "feelslike_f")
  final double feelslikeF;
  @JsonKey(name: "windchill_c")
  final double windchillC;
  @JsonKey(name: "windchill_f")
  final double windchillF;
  @JsonKey(name: "heatindex_c")
  final double heatindexC;
  @JsonKey(name: "heatindex_f")
  final double heatindexF;
  @JsonKey(name: "dewpoint_c")
  final double dewpointC;
  @JsonKey(name: "dewpoint_f")
  final double dewpointF;
  @JsonKey(name: "vis_km")
  final int visKm;
  @JsonKey(name: "vis_miles")
  final int visMiles;
  @JsonKey(name: "uv")
  final double uv;
  @JsonKey(name: "gust_mph")
  final double gustMph;
  @JsonKey(name: "gust_kph")
  final double gustKph;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "code")
  final int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "region")
  final String region;
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lon")
  final double lon;
  @JsonKey(name: "tz_id")
  final String tzId;
  @JsonKey(name: "localtime_epoch")
  final int localtimeEpoch;
  @JsonKey(name: "localtime")
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
