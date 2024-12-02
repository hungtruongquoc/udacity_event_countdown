//
//  Event_CountdownTests.swift
//  Event CountdownTests
//
//  Created by Hung Truong on 11/30/24.
//

import Testing
import SwiftUI
@testable import Event_Countdown

struct Event_CountdownTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test func testEventInitialization() throws {
            let id = UUID()
            let title = "Test Event"
            let date = Date()
            let textColor = Color.blue
            
            let event = Event(id: id, title: title, date: date, textColor: textColor)
            
            #expect(event.id == id)
            #expect(event.title == title)
            #expect(event.date == date)
            // Note: Color comparison is not directly possible, but we can verify the event was created
        }
        
        @Test func testEventDefaultInitialization() throws {
            let title = "Test Event"
            let date = Date()
            
            let event = Event(title: title, date: date)
            
            #expect(event.title == title)
            #expect(event.date == date)
            #expect(event.textColor == .primary)
        }
        
        @Test func testEventComparison() throws {
            let now = Date()
            let later = now.addingTimeInterval(3600) // 1 hour later
            
            let event1 = Event(title: "First Event", date: now)
            let event2 = Event(title: "Second Event", date: later)
            
            #expect(event1 < event2)
            #expect(!(event2 < event1))
        }
        
        @Test func testEventEquality() throws {
            let id = UUID()
            let date = Date()
            
            let event1 = Event(id: id, title: "Event", date: date)
            let event2 = Event(id: id, title: "Different Title", date: date.addingTimeInterval(3600))
            let event3 = Event(title: "Event", date: date)
            
            #expect(event1 == event2) // Same ID means same event
            #expect(event1 != event3) // Different IDs mean different events
        }
        
        @Test func testSampleEventCreation() throws {
            let sampleEvent = Event.sampleEvent
            
            #expect(sampleEvent.title == "Sample Event")
            #expect(sampleEvent.textColor == .blue)
        }
        
        @Test func testSampleEventsArray() throws {
            let sampleEvents = Event.sampleEvents
            
            #expect(sampleEvents.count == 3)
            #expect(sampleEvents[0].title == "Team Meeting")
            #expect(sampleEvents[1].title == "Lunch Break")
            #expect(sampleEvents[2].title == "Project Deadline")
            
            // Verify events are in chronological order
            for i in 0..<(sampleEvents.count - 1) {
                #expect(sampleEvents[i].date < sampleEvents[i + 1].date)
            }
        }

}
