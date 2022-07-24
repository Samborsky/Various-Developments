//
//  PlayerViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 20.07.2022.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    //MARK: - переменные и аутлеты

    var songsArray = [Songs]()
    
    var audioPlayer = AVAudioPlayer()
    var repeatSong = true
    //позволяет поделиться определенным файлом(чем угодно, текст, картинка, песня и тд)
    var activityController: UIActivityViewController? = nil


    @IBOutlet weak var topSongNameLabel: UILabel!

    @IBOutlet weak var songImage: UIImageView!

    @IBOutlet weak var songNameLabel: UILabel!

    @IBOutlet weak var volumeLabel: UILabel!

    @IBOutlet weak var songTimeLeftLabel: UILabel!

    @IBOutlet weak var songTimeRightLabel: UILabel!

    @IBOutlet weak var volumeSlider: UISlider!


    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var playStopButton: UIButton!

    @IBOutlet weak var repeatButton: UIButton!

    @IBOutlet weak var shuffleButton: UIButton!

    var imageOne: UIImage? = nil
    var songName = ""
    var songCount = 0
    var shuffleSongs = Array(0...2)


//MARK: - жизненные циклы

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        //останавливаем песню при закрытии контроллера
        audioPlayer.stop()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer.play()

        songImage.image = imageOne
        songNameLabel.text = songName
        topSongNameLabel.text = songName
        audioPlayer.volume = 0.5

        slider.maximumValue = Float(self.audioPlayer.duration)

//заставляем слайдер двигаться во время проигрывания песни
        var _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
//MARK: - методы

///селектор "ожиляющий элементы"
  @objc func updateSlider() {
        volumeSlider.value = Float(audioPlayer.volume)
        slider.value = Float(audioPlayer.currentTime)

//показывает длину песни
      let duration = audioPlayer.duration
      let minutes = Int(duration / 60)
      let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
      songTimeRightLabel.text = NSString(format: "%2d:%02d", minutes, seconds) as String

//показывает текущее время песни
      let timePlayed = audioPlayer.currentTime
      let minutes1 = Int(timePlayed / 60)
      let seconds1 = Int(timePlayed.truncatingRemainder(dividingBy: 60))
      songTimeLeftLabel.text = NSString(format: "%02d:%02d", minutes1, seconds1) as String

      if audioPlayer.isPlaying == false {
          playStopButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
      } else {
          playStopButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
      }

    }

//скрываем плеер и переходим назад
    @IBAction func hideButton(_ sender: UIButton) {
        audioPlayer.stop()
        dismiss(animated: true)
}

//поделиться файлом
    @IBAction func shareButton(_ sender: Any) {
        //перебираем songCount, ведь каждой песне присвоен свой номер
        switch songCount {
        case 0:
            activityController = UIActivityViewController(activityItems: [songToShare(songName: gribi)], applicationActivities: nil)
            //вызываем активитиКонтроллер
            present(activityController!, animated: true, completion: nil)
        case 1:
            activityController = UIActivityViewController(activityItems: [songToShare(songName: rock)], applicationActivities: nil)
            present(activityController!, animated: true, completion: nil)
        case 2:
            activityController = UIActivityViewController(activityItems: [songToShare(songName: skryabin)], applicationActivities: nil)
            present(activityController!, animated: true, completion: nil)
        default: break
        }

    }

//MARK: - кнопки управления песнями

//проигрывание случайно песни
    @IBAction func shuffleButton(_ sender: UIButton) {

        let randomNumber = shuffleSongs.randomElement() ?? 0

        switch randomNumber {

        case 0:
            //чтобы одна и та же песня не играла несколько раз подряд, проваливаемся дальше
            if randomNumber == songCount {
                fallthrough
            }
            theSwiftDeveloperHomework.audioPlayer(controller: self, song: gribi)
            audioPlayer.play()
            songImage.image = UIImage(named: "gribi")
            topSongNameLabel.text = "Грибы"
            songNameLabel.text = "Тает лед"
            songCount = 0
            slider.maximumValue = Float(audioPlayer.duration)

        case 1:
            if randomNumber == songCount {
                fallthrough
            }
            theSwiftDeveloperHomework.audioPlayer(controller: self, song: rock)
            audioPlayer.play()
            songImage.image = UIImage(named: "rock")
            topSongNameLabel.text = "Queen"
            songNameLabel.text = "Will Rock You"
            songCount = 1
            slider.maximumValue = Float(audioPlayer.duration)

        case 2:
            if randomNumber == songCount {
                fallthrough
            }
            theSwiftDeveloperHomework.audioPlayer(controller: self, song: skryabin)
            audioPlayer.play()
            songImage.image = UIImage(named: "kuzma")
            topSongNameLabel.text = "Скрябин"
            songNameLabel.text = "Люди як кораблi"
            songCount = 2
            slider.maximumValue = Float(Double(audioPlayer.duration))
        default: break
        }
    }



//повтор песни
        @IBAction func repeatSong(_ sender: UIButton) {

            if repeatSong {
                print("repeat")
                repeatButton.tintColor = .systemBlue
                audioPlayer.numberOfLoops = -1

                repeatSong = true
            } else {
                print("not repeat")
                    repeatButton.tintColor = .gray
                audioPlayer.numberOfLoops = 0

                repeatSong = false
            }
            repeatSong.toggle()
        }

//настройка слайдера
    @IBAction func sldier(_ sender: UISlider) {

        if sender == slider {
            audioPlayer.currentTime = TimeInterval(slider.value)
        }
    }

//предыдущая песня
    @IBAction func previusSong(_ sender: UIButton) {

        switch songCount{
        case 1:
            theSwiftDeveloperHomework.audioPlayer(controller: self, song: gribi)
            audioPlayer.play()
            songImage.image = UIImage(named: "gribi")
            topSongNameLabel.text = "Грибы"
            songNameLabel.text = "Тает лед"
            songCount = 0
            slider.maximumValue = Float(audioPlayer.duration)

        case 2:
            theSwiftDeveloperHomework.audioPlayer(controller: self, song: rock)
            audioPlayer.play()
            songImage.image = UIImage(named: "rock")
            topSongNameLabel.text = "Queen"
            songNameLabel.text = "Will Rock You"
            songCount = 1
            slider.maximumValue = Float(audioPlayer.duration)
        default: break
        }
    }

//следующая песня
    @IBAction func nextSong(_ sender: UIButton) {

        switch songCount{
        case 0:
            theSwiftDeveloperHomework.audioPlayer(controller: self, song: rock)
            audioPlayer.play()
            songImage.image = UIImage(named: "rock")
            topSongNameLabel.text = "Queen"
            songNameLabel.text = "Will Rock You"
            songCount = 1
            slider.maximumValue = Float(Double(audioPlayer.duration))

        case 1:
            theSwiftDeveloperHomework.audioPlayer(controller: self, song: skryabin)
            audioPlayer.play()
            songImage.image = UIImage(named: "kuzma")
            topSongNameLabel.text = "Скрябин"
            songNameLabel.text = "Люди як кораблi"
            songCount = 2
            slider.maximumValue = Float(Double(audioPlayer.duration))
        default: break
        }
    }

    //плей/пауза песни
    @IBAction func playSong(_ sender: UIButton) {

        if audioPlayer.isPlaying {
            playStopButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            audioPlayer.pause()
        } else {
            playStopButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            audioPlayer.play()
        }
    }

//MARK: - настройка громкости

//регулировка громкости
    @IBAction func volumeSlider(_ sender: UISlider) {

        volumeLabel.text = String(Int(sender.value * 100))
        audioPlayer.volume = sender.value
        sender.maximumValue = 1
        sender.minimumValue = 0
    }

//минимальная громкость
    @IBAction func muteVolume(_ sender: UIButton) {
        audioPlayer.volume = 0
        volumeLabel.text = "0"
    }

    //максимальная громкость
    @IBAction func maxVolume(_ sender: Any) {
        audioPlayer.volume = 1
        volumeLabel.text = "100"
    }

}
