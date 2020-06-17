import 'dart:convert';

class AllCon
{
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  double testsPerOneMillion;
  int population;
  int affectedCountries;

  AllCon({
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.affectedCountries});

  factory AllCon.fromJson(Map<String, dynamic> json)
  {
    return AllCon(
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      todayRecovered: json['todayRecovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'].toDouble(),
      deathsPerOneMillion: json['deathsPerOneMillion'].toDouble(),
      tests: json['tests'],
      testsPerOneMillion: json['testsPerOneMillion'].toDouble(),
      population: json['population'],
      affectedCountries: json['affectedCountries'],
    );
  }
}