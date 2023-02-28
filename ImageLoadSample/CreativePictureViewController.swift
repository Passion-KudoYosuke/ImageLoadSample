//
//  CreativePictureViewController.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/02/21.
//

import UIKit

class CreativePictureViewController: UIViewController {

    @IBOutlet weak var dreamButton: UIButton!
    @IBOutlet weak var morningButton: UIButton!
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var somberButton: UIButton!
    @IBOutlet weak var doramaButton: UIButton!
    @IBOutlet weak var silenceButton: UIButton!
    @IBOutlet weak var bleachButton: UIButton!
    @IBOutlet weak var melancholicButton: UIButton!
    @IBOutlet weak var pureButton: UIButton!
    @IBOutlet weak var denimButton: UIButton!
    @IBOutlet weak var toyButton: UIButton!
    @IBOutlet weak var sepiaButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var pinkButton: UIButton!
    @IBOutlet weak var charcoalButton: UIButton!
    @IBOutlet weak var graphiteButton: UIButton!
    @IBOutlet weak var binaryButton: UIButton!
    @IBOutlet weak var carbonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    @IBAction func BackPictureControll(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionDreamButton(_ sender: Any) {
        dreamButton.tintColor = UIColor.yellow
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionMorningButton(_ sender: Any) {
        morningButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionPopButton(_ sender: Any) {
        popButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionSundayButton(_ sender: Any) {
        sundayButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionSombarButton(_ sender: Any) {
        somberButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionDoramaButton(_ sender: Any) {
        doramaButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionSilenceButton(_ sender: Any) {
        silenceButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionBleachButton(_ sender: Any) {
        bleachButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionMelancholicButton(_ sender: Any) {
        melancholicButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionPureButton(_ sender: Any) {
        pureButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionDenimButton(_ sender: Any) {
        denimButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionToyButton(_ sender: Any) {
        toyButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionSepiaButton(_ sender: Any) {
        sepiaButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionBlueButton(_ sender: Any) {
        blueButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionRedButton(_ sender: Any) {
        redButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionPinkButton(_ sender: Any) {
        pinkButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionCharcoalButton(_ sender: Any) {
        charcoalButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionGraphiteButton(_ sender: Any) {
        graphiteButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionBinaryButton(_ sender: Any) {
        binaryButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        carbonButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    @IBAction func actionCarbonButton(_ sender: Any) {
        carbonButton.tintColor = UIColor.yellow
        
        dreamButton.tintColor = UIColor.white
        morningButton.tintColor = UIColor.white
        popButton.tintColor = UIColor.white
        sundayButton.tintColor = UIColor.white
        somberButton.tintColor = UIColor.white
        doramaButton.tintColor = UIColor.white
        silenceButton.tintColor = UIColor.white
        bleachButton.tintColor = UIColor.white
        melancholicButton.tintColor = UIColor.white
        pureButton.tintColor = UIColor.white
        denimButton.tintColor = UIColor.white
        toyButton.tintColor = UIColor.white
        sepiaButton.tintColor = UIColor.white
        blueButton.tintColor = UIColor.white
        redButton.tintColor = UIColor.white
        pinkButton.tintColor = UIColor.white
        charcoalButton.tintColor = UIColor.white
        graphiteButton.tintColor = UIColor.white
        binaryButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": false])
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
