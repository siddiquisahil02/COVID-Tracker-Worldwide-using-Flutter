class Delta
{
  int confirm;
  int dead;
  int rec;

  Delta({this.confirm, this.dead, this.rec});

  factory Delta.fromJson(Map<String, dynamic> json)
  {
    return Delta(
        confirm : json['confirmed'],
        dead : json['deceased'],
        rec : json['recovered']
    );
  }

}

class DistrictData
{
  String district;
  int active;
  int confirmed;
  int deceased;
  int recovered;
  Delta delta;

  DistrictData({this.district, this.active, this.confirmed, this.deceased,
    this.recovered, this.delta});

  factory DistrictData.fromJson(Map<String, dynamic> parsedJason)
  {
    return DistrictData(
        district: parsedJason['district'],
        active: parsedJason['active'],
        confirmed: parsedJason['confirmed'],
        deceased: parsedJason['deceased'],
        recovered: parsedJason['recovered'],
        delta: Delta.fromJson(parsedJason['delta'])
    );
  }
}

class Post
{
  String state;
  String statecode;
  List<DistrictData> districtData;

  Post({this.state, this.statecode, this.districtData});

  factory Post.fromJson(Map<String, dynamic> postJson)
  {

    var list = postJson['districtData'] as List;
    print(list.runtimeType);

    List<DistrictData> imagesList = list.map((e) => DistrictData.fromJson(e)).toList();

    return Post(
        state: postJson['state'],
        statecode: postJson['statecode'],
        districtData: imagesList
    );
  }
}

class PostList
{
  final List<Post> posts;

  PostList({this.posts});

  factory PostList.fromJson(List<dynamic> dikhaDo)
  {
    List<Post> posts = new List<Post>();
    posts = dikhaDo.map((e) => Post.fromJson(e)).toList();

    return new PostList(posts: posts);
  }

}