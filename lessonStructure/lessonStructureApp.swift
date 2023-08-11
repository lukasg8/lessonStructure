//
//  lessonStructureApp.swift
//  lessonStructure
//
//  Created by Lukas on 8/10/23.
//

import SwiftUI

@main
struct lessonStructureApp: App {
    let words: [Word] = [
        Word(text: "obfuscate", meaning: "render obscure, unclear, or unintelligible", mastery: 0.2),
        Word(text: "ephemeral", meaning: "lasting for a very short time", mastery: 0.5),
        Word(text: "lugubrious", meaning: "looking or sounding sad and dismal", mastery: 0.7),
        Word(text: "ameliorate", meaning: "make (something bad or unsatisfactory) better", mastery: 0.3)
    ]

    var body: some Scene {
        let lessonmanager = LessonManager(words: words)
        WindowGroup {
            LessonParentView(manager: lessonmanager)
        }
    }
}
