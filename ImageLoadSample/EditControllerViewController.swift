//
//  EditControllerViewController.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/02/13.
//

import UIKit

class EditControllerViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var InfoView: UIView!
    
    @IBOutlet weak var HistogramView: UIView!
    @IBOutlet weak var InfoLabel: UILabel!
    
    @IBOutlet weak var VerticalView: UIView!
    @IBOutlet weak var HorizonView: UIView!
    
    @IBOutlet weak var VerticalHeaderMenu: UIView!
    @IBOutlet weak var HorizonHeaderMenu: UIView!
    
    @IBOutlet weak var VerticalSliderValueLabel: UILabel!
    @IBOutlet weak var HorizonSliderValueLabel: UILabel!
    
    @IBOutlet weak var VerticalPictureControlContainerView: UIView!
    @IBOutlet weak var VerticalWhiteBalanceContainerView: UIScrollView!
    
    
    @IBOutlet weak var HorizonContainerView: UIScrollView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var HorizonScrollView: UIScrollView!
    
    @IBOutlet weak var WhiteBalanceButton: UIButton!
    @IBOutlet weak var PictureControlButton: UIButton!
    @IBOutlet weak var HorizonPictureControlButton: UIButton!
    
    @IBOutlet weak var WhiteBalanceContainerView: UIView!
    
    
    var targetImage: UIImage?
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 情報・ヒストグラム表示設定
        let delegate = UIApplication.shared.delegate as! AppDelegate
        InfoView.isHidden = !delegate.strucInfoState.switchState
        InfoLabel.isHidden = !delegate.strucInfoState.infoButtonSate
        HistogramView.isHidden = !delegate.strucInfoState.histogramButtonState
        
        // デリゲート設定
        self.scrollView.delegate = self
        self.HorizonScrollView.delegate = self
        
        // 最大倍率・最小倍率を設定 ※暫定
        self.scrollView.maximumZoomScale = 5.0
        self.scrollView.minimumZoomScale = 1.0
        self.HorizonScrollView.maximumZoomScale = 5.0
        self.HorizonScrollView.minimumZoomScale = 1.0
        
        // 読み込んだイメージ設定
        self.imageView.image = targetImage
        
        // 画面タテ・ヨコ判定
        self.setScreen()
        
        // 初期設定
        VerticalSliderValueLabel.isHidden = true
        HorizonSliderValueLabel.isHidden = true
        
        VerticalPictureControlContainerView.isHidden = true
        VerticalWhiteBalanceContainerView.isHidden = true
        
        // ヒストグラム・情報表示待ち受け
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotifyOperateInfoSwitch(notification: )), name: .postSwitchInfo, object: nil)
        
        // 「ピクチャーコントロール」ピクチャーコントロールセレクト：タッチ待受
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotifyOperatePictureSelect(notification: )), name: .postPictureControllSelect, object: nil)
        
        // スライダー操作開始待受
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotifyOperateSliderChangeStart(notification: )), name: .postSliderChangeStart, object: nil)
        
        // スライダー値変更待受
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotifyOperateSliderValueChange(notification: )), name: .postSliderChangeValue, object: nil)
        
        // スライダー操作終了待受
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotifyOperateSliderChangeEnd(notification: )), name: .postSliderChangeEnd, object: nil)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil){ _ in
            // 回転後にビュー切り替え
            self.setScreen()
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        
    }
    
    // ヒストグラム・情報表示/非表示処理
    @objc func handleNotifyOperateInfoSwitch(notification: Notification){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        if delegate.strucInfoState.switchState {
            InfoView.isHidden = false
        } else {
            InfoView.isHidden = true
        }
        
        InfoView.isHidden = !delegate.strucInfoState.switchState
        HistogramView.isHidden = !delegate.strucInfoState.histogramButtonState
        InfoLabel.isHidden = !delegate.strucInfoState.infoButtonSate
    }
    
    // ピクチャーコントロールセレクト表示処理
    @objc func handleNotifyOperatePictureSelect(notification: Notification){
        self.performSegue(withIdentifier: "ShowPictureControll", sender: nil)
    }
    
    // スライダー操作開始時表示切り替え
    @objc func handleNotifyOperateSliderChangeStart(notification:Notification){
        VerticalHeaderMenu.isHidden = true
        HorizonHeaderMenu.isHidden = true
        
        if isPortrait{
            VerticalSliderValueLabel.isHidden = false
            VerticalSliderValueLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            self.view.bringSubviewToFront(VerticalSliderValueLabel)
        }else{
            HorizonSliderValueLabel.isHidden = false
            HorizonSliderValueLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            self.view.bringSubviewToFront(HorizonSliderValueLabel)
        }
        
    }
    
    // スライダー値変化時
    @objc func handleNotifyOperateSliderValueChange(notification:Notification){
        let value:String = notification.userInfo?["valueKey"] as! String
        
        if isPortrait {
            VerticalSliderValueLabel.text = value
        } else {
            HorizonSliderValueLabel.text = value
        }
    }
    
    // スライダー操作終了表示切り替え
    @objc func handleNotifyOperateSliderChangeEnd(notification:Notification){
        if isPortrait {
            VerticalSliderValueLabel.isHidden = true
        } else {
            HorizonSliderValueLabel.isHidden = true
        }
        
        VerticalHeaderMenu.isHidden = false
        HorizonHeaderMenu.isHidden = false
    }
    
    @IBAction func actionBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func actionShowShare(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowShare", sender: nil)
    }
    
    @IBAction func actionShowOutput(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowOutput", sender: nil)
    }
    
    @IBAction func actionShowInfo(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowInfo", sender: nil)
    }
    
    // スタイル（ピクチャーコントロールの表示　タテ）
    @IBAction func actionShowPictureController(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if delegate.blPictureControlActive {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.VerticalPictureControlContainerView.transform = CGAffineTransform(translationX: 0, y: 270)
            })
            delegate.blPictureControlActive = false
            PictureControlButton.setTitleColor(UIColor.white, for: .normal)
            PictureControlButton.tintColor = UIColor.white
            HorizonPictureControlButton.setTitleColor(UIColor.white, for: .normal)
            HorizonPictureControlButton.tintColor = UIColor.white
        }else{
            self.VerticalAllContainerHidden()
            VerticalPictureControlContainerView.isHidden = false
            
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.VerticalPictureControlContainerView.transform = CGAffineTransform(translationX: 0, y: -270)
            })
            delegate.blPictureControlActive = true
            PictureControlButton.setTitleColor(UIColor.yellow, for: .normal)
            PictureControlButton.tintColor = UIColor.yellow
            HorizonPictureControlButton.setTitleColor(UIColor.yellow, for: .normal)
            HorizonPictureControlButton.tintColor = UIColor.yellow
            
        }
    }
    
    // スタイル（ピクチャーコントロールの表示 ヨコ）
    @IBAction func actionHorizonPictureController(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if delegate.blPictureControlActive {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.HorizonContainerView.transform = CGAffineTransform(translationX: 350, y: 0)
            })
            delegate.blPictureControlActive = false
            PictureControlButton.setTitleColor(UIColor.white, for: .normal)
            PictureControlButton.tintColor = UIColor.white
            HorizonPictureControlButton.setTitleColor(UIColor.white, for: .normal)
            HorizonPictureControlButton.tintColor = UIColor.white
        }else{
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.HorizonContainerView.transform = CGAffineTransform(translationX: -350, y: 0)
            })
            delegate.blPictureControlActive = true
            HorizonPictureControlButton.setTitleColor(UIColor.yellow, for: .normal)
            HorizonPictureControlButton.tintColor = UIColor.yellow
            PictureControlButton.setTitleColor(UIColor.yellow, for: .normal)
            PictureControlButton.tintColor = UIColor.yellow
        }
    }
    
    @IBAction func actionShowWhiteBalance(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if delegate.blWhiteBalanceActive {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.VerticalWhiteBalanceContainerView.transform = CGAffineTransform(translationX: 0, y: 270)
            })
            delegate.blWhiteBalanceActive = false
            WhiteBalanceButton.setTitleColor(UIColor.white, for: .normal)
            WhiteBalanceButton.tintColor = UIColor.white
            
            
        } else {
            self.VerticalAllContainerHidden()
            VerticalWhiteBalanceContainerView.isHidden = false
            
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.VerticalWhiteBalanceContainerView.transform = CGAffineTransform(translationX: 0, y: -270)
            })
            delegate.blWhiteBalanceActive = true
            WhiteBalanceButton.setTitleColor(UIColor.yellow, for: .normal)
            WhiteBalanceButton.tintColor = UIColor.yellow
            
        }
    }
    
    
    
    
    // タテ・ヨコ切り替え時の設定
    private func setScreen(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        VerticalView.isHidden = !isPortrait
        HorizonScrollView.isHidden = isPortrait
        
        if VerticalView.isHidden {
            // ヨコ向き
            self.view.bringSubviewToFront(HorizonScrollView)
            self.view.sendSubviewToBack(VerticalView)
            
            // imageViewをscrollviewいっぱいに生成
            self.imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            self.imageView.contentMode = .scaleAspectFit
            
            HorizonScrollView.addSubview(imageView)
            
            self.view.bringSubviewToFront(HorizonHeaderMenu)
            
            if delegate.blPictureControlActive {
                self.HorizonContainerView.transform = CGAffineTransform(translationX: -350, y: 0)
                self.VerticalPictureControlContainerView.transform = CGAffineTransform(translationX: 0, y: 270)
            }

        }else{
            self.view.bringSubviewToFront(VerticalView)
            self.view.sendSubviewToBack(HorizonScrollView)
            
            // imageViewをscrollviewいっぱいに生成
            self.imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            self.imageView.contentMode = .scaleAspectFit
            
            scrollView.addSubview(imageView)
            
            self.view.bringSubviewToFront(VerticalHeaderMenu)
            
            if delegate.blPictureControlActive {
                self.HorizonContainerView.transform = CGAffineTransform(translationX: 350, y: 0)
                self.VerticalPictureControlContainerView.transform = CGAffineTransform(translationX: 0, y: -270)
            }

        }
        
        self.view.bringSubviewToFront(InfoView)
    }
    
    private func VerticalAllContainerHidden(){
        self.VerticalWhiteBalanceContainerView.isHidden = true
        self.VerticalPictureControlContainerView.isHidden = true
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
