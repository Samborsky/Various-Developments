//
//  Model.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 20.07.2022.
//

import Foundation
import UIKit
import AVFoundation

let gribi = "Грибы"
let skryabin = "Скрябин"
let rock = "Will Rock You"



protocol SongProtocol {
//    var name: String {get set}
    var image: UIImage? {get set}
    var song: String {get set}
    var songType: String {get}
}


struct Songs: SongProtocol {
    
    var song: String
    var image: UIImage?
    var songType: String

}

//создаем аудиоплеер
    func audioPlayer (controller: PlayerViewController, song: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: song, ofType: "mp3") {
                try controller.audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("error")
        }
    }


///создаем URL путь к нашему файлу
func songToShare(songName: String) -> URL {
    let activityItem = URL(fileURLWithPath: Bundle.main.path(forResource: songName, ofType: "mp3") ?? "")
    return activityItem
}
