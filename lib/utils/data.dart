// onboarding screen data
import 'package:todo_app/services/models/onboarding.dart';

const firstTitle = 'Manage your tasks';
const secondTitle = 'Create daily routine';
const thirdTitle = 'Orgonaize your tasks';

const firstSubTitle =
    "You can easily manage all of your daily tasks in DoMe for free";
const secondSubTitle =
    "In Uptodo you can create your personalized routine to stay productive";
const thirdSubTitle =
    "You can organize your daily tasks by adding your tasks into separate categories";

const firstUrl = "assets/images/onboading_1.png";
const secondUrl = "assets/images/onboading_2.png";
const thirdUrl = "assets/images/onboading_3.png";

List<Onboarding> onbordingData = [
  Onboarding(title: firstTitle, subTitle: firstSubTitle, url: firstUrl),
  Onboarding(title: secondTitle, subTitle: secondSubTitle, url: secondUrl),
  Onboarding(title: thirdTitle, subTitle: thirdSubTitle, url: thirdUrl)
];
