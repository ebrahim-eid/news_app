class AppConstants{
  static const String apikey= "3d9ff5eb7dee4b07827e5c8ce6a871b9";
  static const String baseUrl= "https://newsapi.org/v2";

  static String url(String category)=>
      "$baseUrl/top-headlines?country=in&category=$category&apiKey=$apikey";

  static String searchUrl(String keyWord)=>
      "$baseUrl/everything?q=$keyWord&apiKey=$apikey";
}



//f605b6e3cbd44488a8411663e0d9cdb9
//3d9ff5eb7dee4b07827e5c8ce6a871b9

//https://newsapi.org/v2/top-headlines?country=us&apiKey=f605b6e3cbd44488a8411663e0d9cdb9

//https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=f605b6e3cbd44488a8411663e0d9cdb9

//// https://newsapi.org/v2/everything?q=Apple&apiKey=3d9ff5eb7dee4b07827e5c8ce6a871b9