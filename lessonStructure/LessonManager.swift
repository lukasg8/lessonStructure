//
//  LessonManager.swift
//  lessonStructure
//
//  Created by Lukas on 8/10/23.
//

import Foundation

class Word:Identifiable {
    let id = UUID()
    let text: String
    let meaning: String
    let mastery:Float
    
    init(text: String, meaning: String, mastery: Float) {
        self.text = text
        self.meaning = meaning
        self.mastery = mastery
    }
}

struct LessonWord: Identifiable {
    let id = UUID()
    let word: Word
    var correctCount: Int = 0
    var incorrectCount: Int = 0
    var lessonLevel: Int = 1
}


class LessonManager: ObservableObject {
    
    @Published var words:[LessonWord]
    
    init(words: [Word]) {
        self.words = []
        for word in words {
            self.words.append(wordToLessonWord(word: word))
        }
    }
    
    func wordToLessonWord(word:Word) -> LessonWord {
        let lessonLevel:Int
        switch word.mastery {
        case 0..<0.5:
            lessonLevel = 1
        case 0.5..<1:
            lessonLevel = 2
        default:
            lessonLevel = 3
        }
        return LessonWord(word: word, lessonLevel: lessonLevel)
    }
    
    func completeLesson(success:Bool) {
        if var currentWord = words.first {
            if !success {
                currentWord.incorrectCount += 1
                words.append(currentWord)
            } else {
                currentWord.correctCount += 1
                if !(currentWord.lessonLevel >= 2) {
                    currentWord.lessonLevel += 1
                    words.append(currentWord)
                }
            }
        }
        words.removeFirst()
    }
}
