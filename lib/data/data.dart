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
  sliderModel.setImageAssetPath("assets/images/");
  sliderModel.setTitle("Search");
  sliderModel.setDesc("Search Latest International News");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: "", title: "", desc: "");

  // 2
  sliderModel.setImageAssetPath("assets/images/");
  sliderModel.setTitle("Get");
  sliderModel.setDesc("Get Latest News Across the World");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: "", title: "", desc: "");

  // 3
  sliderModel.setImageAssetPath("assets/images/");
  sliderModel.setTitle("Use");
  sliderModel.setDesc("Use the App Anytime you want!");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: "", title: "", desc: "");

  return slides;

}