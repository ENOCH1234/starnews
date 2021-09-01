import 'package:starnews/model/user.dart';

class UserPreferences {
  static const myUser = User(
    imagePath:
      'https://www.starnews.com.ng/wp-content/uploads/2021/03/starnews-favicon.png',
    name: 'Starnews',
    email:
      'info@starnews.com.ng',
    about:
      'Starnews is a media outlet that delivers relevant up-to-date news; we serve as a '
          'bridge to the information gap, ensuring that people get informed about happenings '
          'around both locally and internationally. With more than 50,000 active subscribers, '
          'and over 500,000 followers on our various social media platforms, we deliver our media '
          'content to a wide and diverse group of people in all the 36 states of Nigeria.'
          '\n \nWe meet the expectation of our readers and serve up relevant and well-targeted '
          'newsletters to them. By this, we do not only share information about happenings '
          'and up-to-date news, but we also share information about other businesses too, and '
          'report political activities of politicians to ensure their businesses and performance '
          'can leverage on the wide reach audience we enjoy.',
    isDarkMode: false,
  );
}