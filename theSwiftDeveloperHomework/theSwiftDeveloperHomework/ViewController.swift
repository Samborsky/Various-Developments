//
//  ViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

//MARK: - аутлеты и переменные

    var songsArray: [Songs] = []


    @IBOutlet weak var viewOne: UIView!

    @IBOutlet weak var viewSecond: UIView!

    @IBOutlet weak var viewThird: UIView!


    @IBOutlet weak var firstImageView: UIImageView!

    @IBOutlet weak var secondImageView: UIImageView!

    @IBOutlet weak var thirdImageView: UIImageView!


    @IBOutlet weak var firstSongLabel: UILabel!

    @IBOutlet weak var secondSongLabel: UILabel!

    @IBOutlet weak var thirdSongLabel: UILabel!


    @IBOutlet weak var firstSongDuration: UILabel!

    @IBOutlet weak var secondSongDuration: UILabel!

    @IBOutlet weak var thirdSongDuration: UILabel!



    let gesture = UIGestureRecognizer()
//MARK: - методы жизненного цикла


    override func viewDidLoad() {
        super.viewDidLoad()

        Line(label: viewOne)
        Line(label: viewSecond)
        Line(label: viewThird)

        addSongs()
        fillOutlets()




    }
    //MARK: - методы

    func fillOutlets() {
        firstImageView.image = songsArray[0].image
        secondImageView.image = songsArray[1].image
        thirdImageView.image = songsArray[2].image

        firstSongLabel.text = songsArray[0].song
        secondSongLabel.text = songsArray[1].song
        thirdSongLabel.text = songsArray[2].song

        firstSongDuration.text = "3:29"
        secondSongDuration.text = "2:01"
        thirdSongDuration.text = "4:13"

    }


    //рисуем линию под текстом
    func Line(label: UIView) {
        let myLine = CALayer()
        myLine.frame = CGRect(x: 0, y: label.frame.height, width: label.frame.width, height: 2)
        myLine.backgroundColor = UIColor.lightGray.cgColor
        label.layer.addSublayer(myLine)
    }


    @IBAction func songOneButton(_ sender: UIButton) {
        print("song1")
    }

    @IBAction func songTwoButton(_ sender: UIButton) {
        print("song2")
    }

    @IBAction func songThreeButton(_ sender: UIButton) {
        print("song3")

    }



//MARK: - передаем информацию на PlayerViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //проигрываем первую песню

        if segue.identifier == "firstSongSegue" {
        guard let destinationVC = segue.destination as? PlayerViewController else { return}
        destinationVC.imageOne = songsArray[0].image
        destinationVC.songName = songsArray[0].song
        destinationVC.songCount = 0
        destinationVC.songsArray = songsArray

          audioPlayer(controller: destinationVC, song: gribi)

            //проигрываем вторую песню
        } else if segue.identifier == "secondSongSegue" {


        guard let destinationVC = segue.destination as? PlayerViewController else { return}
        destinationVC.imageOne = songsArray[1].image
        destinationVC.songName = songsArray[1].song
        destinationVC.songCount = 1
        destinationVC.songsArray = songsArray


            audioPlayer(controller: destinationVC, song: rock)

            //проигрываем третью песню
        } else if segue.identifier == "thirdSongSegue" {

            guard let destinationVC = segue.destination as? PlayerViewController else { return}
            destinationVC.imageOne = songsArray[2].image
            destinationVC.songName = songsArray[2].song
            destinationVC.songCount = 2
            destinationVC.songsArray = songsArray

            audioPlayer(controller: destinationVC, song: skryabin)
        }
    }

    func addSongs() {
        let songOne = Songs(song: gribi, image: UIImage(named: "gribi"), songType: "mp3")
        let songTwo = Songs(song: rock, image: UIImage(named: "rock"), songType: "mp3")
        let songThree = Songs(song: skryabin, image: UIImage(named: "kuzma"), songType: "mp3")

        songsArray.append(songOne)
        songsArray.append(songTwo)
        songsArray.append(songThree)
    }




}


