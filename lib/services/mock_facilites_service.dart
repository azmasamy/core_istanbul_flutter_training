import 'package:coreapp1/models/response.dart';
import 'package:coreapp1/models/space.dart';

List<Space> facilities = [
  Space(
      name: "The Training Hall",
      capacity: "12",
      instruments: [],
      photos: [
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/Employee_Training_and_Development.jpg"
      ],
      spacetype: SpaceType.SEMINAR_ROOM,
      isAvailable: true),
  Space(
      name: "The Main Hall",
      capacity: "30",
      instruments: [],
      photos: [
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/Employee_Training_and_Development.jpg"
      ],
      spacetype: SpaceType.MAIN_HALL,
      isAvailable: true),
  Space(
      name: "The Training Hall",
      capacity: "12",
      instruments: [],
      photos: [
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/Employee_Training_and_Development.jpg"
      ],
      spacetype: SpaceType.MEETING_ROOM,
      isAvailable: false),
  Space(
      name: "The Training Hall",
      capacity: "12",
      instruments: [],
      photos: [
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/Employee_Training_and_Development.jpg"
      ],
      spacetype: SpaceType.BRAINSTORMING_AREA,
      isAvailable: true),
  Space(
      name: "The Training Hall",
      capacity: "12",
      instruments: [],
      photos: [
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/Employee_Training_and_Development.jpg"
      ],
      spacetype: SpaceType.STAGE,
      isAvailable: false),
  Space(
      name: "The Training Hall",
      capacity: "12",
      instruments: [],
      photos: [
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/Employee_Training_and_Development.jpg"
      ],
      spacetype: SpaceType.SEMINAR_ROOM,
      isAvailable: false),
  Space(
      name: "The Training Hall",
      capacity: "12",
      instruments: [],
      photos: [
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/Employee_Training_and_Development.jpg"
      ],
      spacetype: SpaceType.BRAINSTORMING_AREA,
      isAvailable: true),
];

class MockFacilitiesService {
  static Future<Response> getFacilites() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => Response(
          message: "Facilites List Fetched Successfuly",
          isOperationSuccessful: true,
          data: facilities),
    );
  }
}
