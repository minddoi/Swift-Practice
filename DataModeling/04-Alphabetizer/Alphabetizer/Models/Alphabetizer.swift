//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by JENNA on 4/19/26.
//

import Foundation

@Observable
class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions // 기본 메세지 .instructions로 설정
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    // Alternates true and false
    private var isAlphabetized = false
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // tile들을 수평 위치 기준으로 정렬한 배열 생성
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        
        // 이 단어가 알파벳 순으로 앞에 오는지 판단
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        
        // 사용자가 만든 배열이랑 알파벳 정렬 기준으로 만들어진 배열 id가 다 같다면!!
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles
        
        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }
        
        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
                
        // Flip over correct tiles
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))
            
            // If alphabetized, generate new tiles
            if isAlphabetized {
//                tiles.removeAll()
                startNewGame()
            }
            
            // 올바른 타일 뒤집힌 것도 2초 뒤에 다시 false로 바꿔서 원상태로 돌림
            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
            
            // Display instructions
            message = .instructions
        }
        
        
    }
    
    // MARK: private implementation
    
    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // Assign new words to existing tiles
//            for index in 0..<tileCount {
//                let tile = tiles[index]
//                let word = newWords[index]
//                tile.word = word
//            }
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
        
    }
}
