
import 'package:json_annotation/json_annotation.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
    @JsonKey(name: "location")
    Location location;
    @JsonKey(name: "current")
    Current current;
    @JsonKey(name: "forecast")
    Forecast forecast;

    ForecastModel({
        required this.location,
        required this.current,
        required this.forecast,
    });

    factory ForecastModel.fromJson(Map<String, dynamic> json) => _$ForecastModelFromJson(json);

    Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}

@JsonSerializable()
class Current {
    @JsonKey(name: "last_updated_epoch")
    int lastUpdatedEpoch;
    @JsonKey(name: "last_updated")
    String lastUpdated;
    @JsonKey(name: "temp_c")
    double tempC;
    @JsonKey(name: "temp_f")
    double tempF;
    @JsonKey(name: "is_day")
    int isDay;
    @JsonKey(name: "condition")
    Condition condition;
    @JsonKey(name: "wind_mph")
    double windMph;
    @JsonKey(name: "wind_kph")
    double windKph;
    @JsonKey(name: "wind_degree")
    int windDegree;
    @JsonKey(name: "wind_dir")
    String windDir;
    @JsonKey(name: "pressure_mb")
    int pressureMb;
    @JsonKey(name: "pressure_in")
    double pressureIn;
    @JsonKey(name: "precip_mm")
    int precipMm;
    @JsonKey(name: "precip_in")
    int precipIn;
    @JsonKey(name: "humidity")
    int humidity;
    @JsonKey(name: "cloud")
    int cloud;
    @JsonKey(name: "feelslike_c")
    double feelslikeC;
    @JsonKey(name: "feelslike_f")
    double feelslikeF;
    @JsonKey(name: "windchill_c")
    double windchillC;
    @JsonKey(name: "windchill_f")
    double windchillF;
    @JsonKey(name: "heatindex_c")
    double heatindexC;
    @JsonKey(name: "heatindex_f")
    double heatindexF;
    @JsonKey(name: "dewpoint_c")
    double dewpointC;
    @JsonKey(name: "dewpoint_f")
    double dewpointF;
    @JsonKey(name: "vis_km")
    int visKm;
    @JsonKey(name: "vis_miles")
    int visMiles;
    @JsonKey(name: "uv")
    int uv;
    @JsonKey(name: "gust_mph")
    double gustMph;
    @JsonKey(name: "gust_kph")
    int gustKph;

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

    factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

    Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
    @JsonKey(name: "text")
    String text;
    @JsonKey(name: "icon")
    String icon;
    @JsonKey(name: "code")
    int code;

    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

    Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Forecast {
    @JsonKey(name: "forecastday")
    List<Forecastday> forecastday;

    Forecast({
        required this.forecastday,
    });

    factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

    Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class Forecastday {
    @JsonKey(name: "date")
    DateTime date;
    @JsonKey(name: "date_epoch")
    int dateEpoch;
    @JsonKey(name: "day")
    Day day;
    @JsonKey(name: "astro")
    Astro astro;
    @JsonKey(name: "hour")
    List<Hour> hour;

    Forecastday({
        required this.date,
        required this.dateEpoch,
        required this.day,
        required this.astro,
        required this.hour,
    });

    factory Forecastday.fromJson(Map<String, dynamic> json) => _$ForecastdayFromJson(json);

    Map<String, dynamic> toJson() => _$ForecastdayToJson(this);
}

@JsonSerializable()
class Astro {
    @JsonKey(name: "sunrise")
    String sunrise;
    @JsonKey(name: "sunset")
    String sunset;
    @JsonKey(name: "moonrise")
    String moonrise;
    @JsonKey(name: "moonset")
    String moonset;
    @JsonKey(name: "moon_phase")
    String moonPhase;
    @JsonKey(name: "moon_illumination")
    int moonIllumination;
    @JsonKey(name: "is_moon_up")
    int isMoonUp;
    @JsonKey(name: "is_sun_up")
    int isSunUp;

    Astro({
        required this.sunrise,
        required this.sunset,
        required this.moonrise,
        required this.moonset,
        required this.moonPhase,
        required this.moonIllumination,
        required this.isMoonUp,
        required this.isSunUp,
    });

    factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

    Map<String, dynamic> toJson() => _$AstroToJson(this);
}

@JsonSerializable()
class Day {
    @JsonKey(name: "maxtemp_c")
    double maxtempC;
    @JsonKey(name: "maxtemp_f")
    double maxtempF;
    @JsonKey(name: "mintemp_c")
    double mintempC;
    @JsonKey(name: "mintemp_f")
    double mintempF;
    @JsonKey(name: "avgtemp_c")
    double avgtempC;
    @JsonKey(name: "avgtemp_f")
    double avgtempF;
    @JsonKey(name: "maxwind_mph")
    double maxwindMph;
    @JsonKey(name: "maxwind_kph")
    double maxwindKph;
    @JsonKey(name: "totalprecip_mm")
    double totalprecipMm;
    @JsonKey(name: "totalprecip_in")
    double totalprecipIn;
    @JsonKey(name: "totalsnow_cm")
    double totalsnowCm;
    @JsonKey(name: "avgvis_km")
    double avgvisKm;
    @JsonKey(name: "avgvis_miles")
    int avgvisMiles;
    @JsonKey(name: "avghumidity")
    int avghumidity;
    @JsonKey(name: "daily_will_it_rain")
    int dailyWillItRain;
    @JsonKey(name: "daily_chance_of_rain")
    int dailyChanceOfRain;
    @JsonKey(name: "daily_will_it_snow")
    int dailyWillItSnow;
    @JsonKey(name: "daily_chance_of_snow")
    int dailyChanceOfSnow;
    @JsonKey(name: "condition")
    Condition condition;
    @JsonKey(name: "uv")
    double uv;

    Day({
        required this.maxtempC,
        required this.maxtempF,
        required this.mintempC,
        required this.mintempF,
        required this.avgtempC,
        required this.avgtempF,
        required this.maxwindMph,
        required this.maxwindKph,
        required this.totalprecipMm,
        required this.totalprecipIn,
        required this.totalsnowCm,
        required this.avgvisKm,
        required this.avgvisMiles,
        required this.avghumidity,
        required this.dailyWillItRain,
        required this.dailyChanceOfRain,
        required this.dailyWillItSnow,
        required this.dailyChanceOfSnow,
        required this.condition,
        required this.uv,
    });

    factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

    Map<String, dynamic> toJson() => _$DayToJson(this);
}

@JsonSerializable()
class Hour {
    @JsonKey(name: "time_epoch")
    int timeEpoch;
    @JsonKey(name: "time")
    String time;
    @JsonKey(name: "temp_c")
    double tempC;
    @JsonKey(name: "temp_f")
    double tempF;
    @JsonKey(name: "is_day")
    int isDay;
    @JsonKey(name: "condition")
    Condition condition;
    @JsonKey(name: "wind_mph")
    double windMph;
    @JsonKey(name: "wind_kph")
    double windKph;
    @JsonKey(name: "wind_degree")
    int windDegree;
    @JsonKey(name: "wind_dir")
    String windDir;
    @JsonKey(name: "pressure_mb")
    int pressureMb;
    @JsonKey(name: "pressure_in")
    double pressureIn;
    @JsonKey(name: "precip_mm")
    double precipMm;
    @JsonKey(name: "precip_in")
    double precipIn;
    @JsonKey(name: "snow_cm")
    double snowCm;
    @JsonKey(name: "humidity")
    int humidity;
    @JsonKey(name: "cloud")
    int cloud;
    @JsonKey(name: "feelslike_c")
    double feelslikeC;
    @JsonKey(name: "feelslike_f")
    double feelslikeF;
    @JsonKey(name: "windchill_c")
    double windchillC;
    @JsonKey(name: "windchill_f")
    double windchillF;
    @JsonKey(name: "heatindex_c")
    double heatindexC;
    @JsonKey(name: "heatindex_f")
    double heatindexF;
    @JsonKey(name: "dewpoint_c")
    double dewpointC;
    @JsonKey(name: "dewpoint_f")
    double dewpointF;
    @JsonKey(name: "will_it_rain")
    int willItRain;
    @JsonKey(name: "chance_of_rain")
    int chanceOfRain;
    @JsonKey(name: "will_it_snow")
    int willItSnow;
    @JsonKey(name: "chance_of_snow")
    int chanceOfSnow;
    @JsonKey(name: "vis_km")
    int visKm;
    @JsonKey(name: "vis_miles")
    int visMiles;
    @JsonKey(name: "gust_mph")
    double gustMph;
    @JsonKey(name: "gust_kph")
    double gustKph;
    @JsonKey(name: "uv")
    double uv;

    Hour({
        required this.timeEpoch,
        required this.time,
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
        required this.snowCm,
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
        required this.willItRain,
        required this.chanceOfRain,
        required this.willItSnow,
        required this.chanceOfSnow,
        required this.visKm,
        required this.visMiles,
        required this.gustMph,
        required this.gustKph,
        required this.uv,
    });

    factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

    Map<String, dynamic> toJson() => _$HourToJson(this);
}

@JsonSerializable()
class Location {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "region")
    String region;
    @JsonKey(name: "country")
    String country;
    @JsonKey(name: "lat")
    double lat;
    @JsonKey(name: "lon")
    double lon;
    @JsonKey(name: "tz_id")
    String tzId;
    @JsonKey(name: "localtime_epoch")
    int localtimeEpoch;
    @JsonKey(name: "localtime")
    String localtime;

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

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

    Map<String, dynamic> toJson() => _$LocationToJson(this);
}
