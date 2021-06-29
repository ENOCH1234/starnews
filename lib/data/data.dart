class SliderModel{

  late String imagePath;
  late String title;
  late String desc;

  SliderModel({required this.imagePath, required this.title, required this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

   String getImageAssetPath(){
    return imagePath;
   }

   String getTitle(){
    return title;
   }

   String getDesc(){
    return desc;
   }
}

List<SliderModel> getSlides(){

  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel(imagePath: "", title: "", desc: "");

  // 1
  sliderModel.setImageAssetPath("assets/onboarding/news.png");
  sliderModel.setTitle("Latest News");
  sliderModel.setDesc("Get latest news across the world at your fingertips!");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: "", title: "", desc: "");

  // 2
  sliderModel.setImageAssetPath("assets/onboarding/onboarding.png");
  sliderModel.setTitle("Sports");
  sliderModel.setDesc("Don't be left out in sport updates, we serve it hot!");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: "", title: "", desc: "");

  // 3
  sliderModel.setImageAssetPath("assets/onboarding/onboarding.png");
  sliderModel.setTitle("Entertainment");
  sliderModel.setDesc("Enjoy the best of entertainment and internet gossips!");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: "", title: "", desc: "");

  return slides;

}