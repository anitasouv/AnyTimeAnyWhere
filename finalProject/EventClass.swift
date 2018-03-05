//
//  EventClass.swift
//  finalProject
//
//  Created by Anita Souv on 2/28/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import Foundation

class EventClass {
    var title: String = ""               // Title of the event or reminder
    var details: String?            // Description of the event or reminder
    var notes: String?               // Notes and reminders about the event about the event
    
    var toDoList: [String]?          // An optional checklist-type to-do list for that particular event/reminder
    var startDate: String?           // or a range or duration of the event/reminder
    var endDate: String?
    var startTimeOfEvent: String?    // actually start time of event
    var endTimeOfEvent: String?      // actually end time of event
    var timeOfReminder: String?      // Time before event to notify user

    // OPTIONAL
    // var location: CLLocation     // location and range of where to notify user of event
    // var radius: Double
    
    
    var sourceFlag: Source?          // In-app, Facebook, Email, Google calendar, etc.
    // var linkToSource: String
    
    // OPTIONAL image link
    // var img: String              // Optional image for easy reminding
    
    init(title: String, details: String, notes: String, toDoList: [String], startDate: String, endDate: String, startTimeOfEvent: String, endTimeOfEvent: String, timeOfReminder: String, sourceFlag: Source  ) {
        self.title = title;
        self.details = details;
        self.notes = notes;
        
        self.toDoList = toDoList;
        self.startDate = startDate;
        self.endDate = endDate
        self.startTimeOfEvent = startTimeOfEvent;
        self.endTimeOfEvent = endTimeOfEvent;
        self.timeOfReminder = timeOfReminder;
        
        self.sourceFlag = sourceFlag;
    }
}

enum Source {
    case inApp
    case facebook
    case email
    case googleCalendar
}
