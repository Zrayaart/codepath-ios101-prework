//
//  ViewController.swift
//  SorayaSardine_IOS101_Prework
//
//  Created by Soraya Sardine on 12/15/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var universityName: UILabel!
    @IBOutlet var dreamJobName: UILabel!
    @IBOutlet var profileName: UILabel!
    @IBOutlet var Profile_Image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Rounds profile picture
        Profile_Image.layer.cornerRadius = Profile_Image.frame.size.width / 2
        Profile_Image.clipsToBounds = true
        Profile_Image.layer.borderColor = UIColor.white.cgColor
        Profile_Image.layer.borderWidth = 2
        // Makes all text on page white
        dreamJobName.textColor = .white
        profileName.textColor = .white
        universityName.textColor = .white
    }
    
    // Changes the background color & text color when "Customize Look" is pressed
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomColor = changeColor()
            view.backgroundColor = randomColor
        let textColor = changeTextColor(for: randomColor)
        profileName.textColor = textColor
        dreamJobName.textColor = textColor
        universityName.textColor = textColor
    }
    func changeColor() -> UIColor {

        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)

            return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        }
    // Changes the text color depending on the brightess of the background screen's color
    func changeTextColor(for randomColor: UIColor) -> UIColor {
        var textColor = UIColor.white
        var brightness: CGFloat = 0.0
        randomColor.getHue(nil, saturation: nil, brightness: &brightness, alpha: nil)

        if brightness > 0.5 {
            textColor = darkTextColor()
        } else {
            textColor = lightTextColor()
        }
        return textColor
    }
    // Gives a darker color range for the text
    func darkTextColor() -> UIColor {
        let red = CGFloat.random(in: 0...0.5)
        let green = CGFloat.random(in: 0...0.5)
        let blue = CGFloat.random(in: 0...0.5)

        return UIColor(red: red + 0.5, green: green + 0.5, blue: blue + 0.5, alpha: 1.0)
    }
    // Gives a lighter color range for the text
    func lightTextColor() -> UIColor {
        let red = CGFloat.random(in: 0.6...1)
        let green = CGFloat.random(in: 0.6...1)
        let blue = CGFloat.random(in: 0.6...1)

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

