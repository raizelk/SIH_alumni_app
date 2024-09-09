import 'package:alumni_app_2/screen3_events/event_home.dart';
import 'package:alumni_app_2/screen3_events/event_model.dart';

List<EventItem> getEventPage() {
  List<EventItem> dates = [];

  dates.add(EventItem(date: "10", weekday: "Sun", isSelected: false));
  dates.add(EventItem(date: "11", weekday: "Mon", isSelected: false));
  dates.add(EventItem(date: "12", weekday: "Tues", isSelected: false));
  dates.add(EventItem(date: "13", weekday: "Wed", isSelected: false));
  dates.add(EventItem(date: "14", weekday: "Thus", isSelected: false));
  dates.add(EventItem(date: "15", weekday: "Fri", isSelected: false));
  dates.add(EventItem(date: "16", weekday: "Sat", isSelected: false));

  return dates;
}


List<DateTile> getDataTiles() {
  List<DateTile> events = [];

  // 1st event
  DateTile eventModel = DateTile(
      imgAssetPath: "assets2/1.png",
      eventType: "Event"
  );
 events.add(eventModel);

  // 2nd event
  eventModel = DateTile(
      imgAssetPath: "assets2/2.png",
     eventType: "Meetup"
  );
 events.add(eventModel);

  // 3rd event
  eventModel = DateTile(
      imgAssetPath: "assets2/3.png",
     eventType: "Gathering"
  );
  events.add(eventModel);

  return events;
}