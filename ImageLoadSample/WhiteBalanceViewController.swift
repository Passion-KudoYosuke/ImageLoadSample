//
//  WhiteBalanceViewController.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/02/27.
//

import UIKit

class WhiteBalanceViewController: UIViewController {
    
    @IBOutlet weak var colorTemperatureSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 背景のみ透過
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        // 色温度スライダーのグラデーション設定
        
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
