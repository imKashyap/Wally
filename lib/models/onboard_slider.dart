class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = [];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Choose from a massive collection of popular books from every genre you ask for.");
  sliderModel.setTitle("Explore");
  sliderModel.setImageAssetPath("assets/images/illustration1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Online synchronization for bookmarks, highlights, notes and current reading position with all your devices.");
  sliderModel.setTitle("Sync");
  sliderModel.setImageAssetPath("assets/images/illustration2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Download books to your shelf and read wherever you want to. Zero Internet issues.");
  sliderModel.setTitle("Offline");
  sliderModel.setImageAssetPath("assets/images/illustration3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}