import 'dart:convert';

class CountryInfo
{
  String flag;


  CountryInfo({this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json)
  {
    return CountryInfo(
      flag: json['flag'],
    );
  }
}

class Country {
  String countryName;
  String continent;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int tests;
  int population;
  double casePerOneMillion;
  double deathsPerOneMillion;
  CountryInfo countryInfo;

  Country({
    this.countryName,
    this.continent,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.tests,
    this.population,
    this.casePerOneMillion,
    this.deathsPerOneMillion,
    this.countryInfo});

  factory Country.fromJson(Map<String, dynamic> parsedJson)
  {
    return Country(
        countryName: parsedJson['country'],
        cases: parsedJson['cases'],
        todayCases: parsedJson['todayCases'],
        deaths: parsedJson['deaths'],
        todayDeaths: parsedJson['todayDeaths'],
        recovered: parsedJson['recovered'],
        todayRecovered: parsedJson['todayRecovered'],
        active: parsedJson['active'],
        critical: parsedJson['critical'],
        casePerOneMillion: parsedJson['casesPerOneMillion'].toDouble(),
        deathsPerOneMillion: parsedJson['deathsPerOneMillion'].toDouble(),
        tests: parsedJson['tests'],
        population: parsedJson['population'],
        continent: parsedJson['continent'],
        countryInfo: CountryInfo.fromJson(parsedJson['countryInfo'])
    );
  }
}

class CountryList
{
  final List<Country> post;

  CountryList({this.post});

  factory CountryList.fromJson(List<dynamic> postJson)
  {
    List<Country> countryList = new List<Country>();
    countryList = postJson.map((e) => Country.fromJson(e)).toList();

    return new CountryList(post: countryList);
  }
}
