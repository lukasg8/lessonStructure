//
//  ContentView.swift
//  lessonStructure
//
//  Created by Lukas on 8/10/23.
//

import SwiftUI

struct LessonParentView: View {
    @ObservedObject var manager: LessonManager

    var body: some View {
        VStack {
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(manager.words) { word in
                        VStack {
                            Text(word.word.text)
                            Text(String(word.lessonLevel))
                        }
                    }
                }
            }
            
            if manager.words.isEmpty {
                Text("Completed lesson!")
            } else {
                switch manager.words.first!.lessonLevel {
                case 1:
                    FirstLessonView(lessonmanager: manager)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case 2:
                    SecondLessonView(lessonmanager: manager)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                default:
                    Text("No lesson to show")
                }
            }
        }
    }
}

struct FirstLessonView:View {
    @ObservedObject var lessonmanager:LessonManager
    
    var body: some View {
        VStack {
            Button(action: { lessonmanager.completeLesson(success: true) } , label: { Text("Correct.") } )
            Button(action: { lessonmanager.completeLesson(success: false) } , label: { Text("Incorrect.") } )
        }
        .background(.green)
    }
}

struct SecondLessonView:View {
    @ObservedObject var lessonmanager:LessonManager
    
    var body: some View {
        VStack {
            Button(action: { lessonmanager.completeLesson(success: true) } , label: { Text("Correct.") } )
            Button(action: { lessonmanager.completeLesson(success: false) } , label: { Text("Incorrect.") } )
        }
        .background(.red)
    }
}
