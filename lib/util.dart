

import 'package:flutter/material.dart';
import 'package:sac_app/models/Project.dart';


  Project? currentProject;

  List<Project> projects = [
  Project(
      title: 'Tic Tac Toe',
      status: "Completed",
      totalMembers: 5,
      currentMembers: 4,
      clubName: "YAAC",
      techStack: [],
      logo: "assets/logo.jpg",
      shortDescription: 'This is likely to be only rarely needed.'
          ' One case where you might need this is if you have an image overlaid on a very different background color.'
          ' In these cases, consider whether you can avoid '
          'overlapping multiple colors in one spot (for example, by having the background color only present'
          ' where the image is absent).',
      date: "24 Feb",
      year: 2024,
      longDescription:
      "The Flutter framework catches errors that occur during callbacks triggered by the framework itself,"
          " including errors encountered during the build, layout, and paint phases."
          " Errors that don’t occur within Flutter’s callbacks can’t be caught by the framework, but you can handle them by "
          "setting up an error handler on the PlatformDispatcher."
          "All errors caught by Flutter are routed to the FlutterError.onError handler. By default, this calls FlutterError"
          ".presentError, which dumps the error to the device logs. When running from an IDE, the inspector overrides this "
          "behavior so that errors can also be routed to the IDE’s console, allowing you to inspect the objects mentioned in "
          "the message."),
  Project(
      title: 'SAC APP',
      status: "Ongoing",
      totalMembers: 6,
      currentMembers: 6,
      clubName: "YAAC",
      techStack: ["Flutter", "Android", "Dart"],
      logo: "assets/logo.jpg",
      shortDescription:
      'When I run the command flutter run my app works fine in the emulator. '
          'This is a temporary solution for me as I will want to switch back to Visual Studio '
          'Code as it is my IDE of choice.',
      date: "24 May",
      year: 2023,
      longDescription: ""
          "When an error occurs during the build phase, the ErrorWidget.builder callback is invoked to build the widget that is used "
          "instead of the one that failed. By default, in debug mode this shows an error message in red, and in release mode this "
          "shows a gray background. \n Below each error type handling is explained. At the bottom there’s a code snippet which handles "
          "all types of errors. "
          "Even though you can just copy-paste the snippet, we recommend you to first get acquainted with each of the error types."),
    Project(
        title: 'Petrichor',
        status: "Ongoing",
        totalMembers: 5,
        currentMembers: 4,
        clubName: "YAAC",
        techStack: [],
        logo: "assets/logo.jpg",
        shortDescription: 'This is likely to be only rarely needed.'
            ' One case where you might need this is if you have an image overlaid on a very different background color.'
            ' In these cases, consider whether you can avoid '
            'overlapping multiple colors in one spot (for example, by having the background color only present'
            ' where the image is absent).',
        date: "20 Feb",
        year: 2024,
        longDescription:
        "The Flutter framework catches errors that occur during callbacks triggered by the framework itself,"
            " including errors encountered during the build, layout, and paint phases."
            " Errors that don’t occur within Flutter’s callbacks can’t be caught by the framework, but you can handle them by "
            "setting up an error handler on the PlatformDispatcher."
            "All errors caught by Flutter are routed to the FlutterError.onError handler. By default, this calls FlutterError"
            ".presentError, which dumps the error to the device logs. When running from an IDE, the inspector overrides this "
            "behavior so that errors can also be routed to the IDE’s console, allowing you to inspect the objects mentioned in "
            "the message."),
    Project(
        title: 'GC',
        status: "Completed",
        totalMembers: 5,
        currentMembers: 4,
        clubName: "YAAC",
        techStack: [],
        logo: "assets/logo.jpg",
        shortDescription: 'This is likely to be only rarely needed.'
            ' One case where you might need this is if you have an image overlaid on a very different background color.'
            ' In these cases, consider whether you can avoid '
            'overlapping multiple colors in one spot (for example, by having the background color only present'
            ' where the image is absent).',
        date: "24 Dec",
        year: 2025,
        longDescription:
        "The Flutter framework catches errors that occur during callbacks triggered by the framework itself,"
            " including errors encountered during the build, layout, and paint phases."
            " Errors that don’t occur within Flutter’s callbacks can’t be caught by the framework, but you can handle them by "
            "setting up an error handler on the PlatformDispatcher."
            "All errors caught by Flutter are routed to the FlutterError.onError handler. By default, this calls FlutterError"
            ".presentError, which dumps the error to the device logs. When running from an IDE, the inspector overrides this "
            "behavior so that errors can also be routed to the IDE’s console, allowing you to inspect the objects mentioned in "
            "the message."),
    Project(
        title: 'Acad App',
        status: "Onhold",
        totalMembers: 5,
        currentMembers: 4,
        clubName: "YAAC",
        techStack: [],
        logo: "assets/logo.jpg",
        shortDescription: 'This is likely to be only rarely needed.'
            ' One case where you might need this is if you have an image overlaid on a very different background color.'
            ' In these cases, consider whether you can avoid '
            'overlapping multiple colors in one spot (for example, by having the background color only present'
            ' where the image is absent).',
        date: "24 Feb",
        year: 2023,
        longDescription:
        "The Flutter framework catches errors that occur during callbacks triggered by the framework itself,"
            " including errors encountered during the build, layout, and paint phases."
            " Errors that don’t occur within Flutter’s callbacks can’t be caught by the framework, but you can handle them by "
            "setting up an error handler on the PlatformDispatcher."
            "All errors caught by Flutter are routed to the FlutterError.onError handler. By default, this calls FlutterError"
            ".presentError, which dumps the error to the device logs. When running from an IDE, the inspector overrides this "
            "behavior so that errors can also be routed to the IDE’s console, allowing you to inspect the objects mentioned in "
            "the message."),
];

  final Map<String, Color> statusColor = {
  "Ongoing": Colors.green,
  "Onhold": Colors.redAccent,
  "Completed": Colors.grey
};


  // all keys have been converted to lowerCase to make searching in the map easier
final Map<String, Uri> urlToTechStack = {
  "flutter": Uri.parse("https://flutter.dev"),
  "python": Uri.parse("https://www.python.org"),
  "ai/ml": Uri.parse("https://en.wikipedia.org/wiki/Artificial_intelligence"),
  "java": Uri.parse("https://www.java.com"),
  "kotlin": Uri.parse("https://kotlinlang.org"),
  "nodejs": Uri.parse("https://nodejs.org"),
  "django": Uri.parse("https://www.djangoproject.com"),
  "svelte": Uri.parse("https://svelte.dev"),
  "react": Uri.parse("https://reactjs.org"),
  "web development": Uri.parse("https://en.wikipedia.org/wiki/Web_development"),
  "android development": Uri.parse("https://en.wikipedia.org/wiki/Android_software_development"),
  "backend development": Uri.parse("https://en.wikipedia.org/wiki/Back-end_web_development"),
  "frontend development": Uri.parse("https://en.wikipedia.org/wiki/Front-end_web_development"),
  "dart": Uri.parse("https://en.wikipedia.org/wiki/Dart_(programming_language)"),
  "c": Uri.parse("https://en.wikipedia.org/wiki/C_(programming_language)"),
  "c++": Uri.parse("https://en.wikipedia.org/wiki/C%2B%2B")
};

