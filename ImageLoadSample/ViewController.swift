//
//  ViewController.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/01/06.
//

import UIKit
import UniformTypeIdentifiers

var selectImage:UIImage?

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    //カメラロールからの写真の選択
    @IBAction func selectPicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let pickerView = UIImagePickerController()
                
                pickerView.sourceType = .photoLibrary
                pickerView.delegate = self
                self.present(pickerView, animated: true)
            }
    }
    
    // ドキュメントフォルダから選択
    @IBAction func selectFile(_ sender: UIButton) {
        
        let pickerView = UIDocumentPickerViewController(forOpeningContentTypes: [.image])
        pickerView.delegate = self
        self.present(pickerView, animated: true, completion: nil)
    }
    
    @IBAction func outputImage(_ sender: Any) {
        self.performSegue(withIdentifier: "modal", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextViewController = segue.destination as? EditControllerViewController {
            nextViewController.targetImage = selectImage
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("キャンセルしました")
    }
    
}

//写真を選択した後にUIImageViewへの写真割り当て
extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // URLを取得
        guard let url = info[.imageURL] as? URL else {return}
        
        // ***テスト用***
        selectImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        // ***テスト用***
        
        // イメージ読み込み呼び出し
        ImageRead(url: url)
        
        self.dismiss(animated: true)
        
        self.performSegue(withIdentifier: "goEdit", sender: nil)
    }
}



//ファイル選択後にUIImageViewへ割り当て
extension ViewController:UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //URLを取得
        guard let url = urls.first else {return}
        
        if url.startAccessingSecurityScopedResource(){
            defer {url.stopAccessingSecurityScopedResource()}
            
            // ***テスト用***
            do{
                let testImage = try Data(contentsOf: url)

                selectImage = UIImage(data: testImage)

            }catch{
                print("テスト用画像読み込みエラー")
            }
            // ***テスト用***
            
            // イメージ読み込み呼び出し
            ImageRead(url: url)
            
            self.dismiss(animated: true)
            
            self.performSegue(withIdentifier: "goEdit", sender: nil)
        }
    }
}

func ImageRead(url:URL){
    
    // ライブラリ用ファイルパス取得
    let encodePath = url.path(percentEncoded: false)
    
    var ulErr:UInt = UInt(kNkfl_Code_None.rawValue)
    
    // ライブラリ用変数
    var fileLibraryParam = NkflLibraryParam()
    fileLibraryParam.ulSize = UInt(MemoryLayout<NkflLibraryParam>.size)
    fileLibraryParam.ulVersion = 0x01000000
    
    // ライブラリオープン
    ulErr = Nkfl_Entry(UInt(kNkfl_Cmd_OpenLibrary.rawValue), &fileLibraryParam)
    
    // セッション用変数
    var sessionParam = NkflSessionParam()
    sessionParam.ulSize = UInt(MemoryLayout<NkflSessionParam>.size)
    sessionParam.ulType = UInt(kNkfl_Source_FileName_UTF8.rawValue)
    
    // ファイルポインタ設定
    let objWrapClass = Wrapper()
    objWrapClass.imagePathSet(&sessionParam, path: encodePath)
    
    // セッションオープン
    ulErr = Nkfl_Entry(UInt(kNkfl_Cmd_OpenSession.rawValue), &sessionParam)
    
    var imageInfoParam = NkflImageInfoParam()
    imageInfoParam.ulSize = UInt(MemoryLayout<NkflImageInfoParam>.size)
    imageInfoParam.ulSessionID = sessionParam.ulSessionID
    
    // 画像情報オープン
    ulErr = Nkfl_Entry(UInt(kNkfl_Cmd_GetImageInfo.rawValue), &imageInfoParam)
    
    // 画像データ取得
    var imageParam = NkflImageParam()
    let ulLength = imageInfoParam.ulWidth * imageInfoParam.ulHeight * imageInfoParam.ulByteDepth * 3
    var buf = [CChar](repeating: 0, count: Int(ulLength))
    objWrapClass.imageRead(&imageParam, imageInfo: &imageInfoParam, resultPoint: &buf)
    
    // イメージ設定 ※作成中
//    let data = Data(bytes: buf, count: Int(ulLength))
//    selectImage = UIImage(data: data)
    // イメージ設定 ※作成中
    
    // セッションクローズ
    ulErr = Nkfl_Entry(UInt(kNkfl_Cmd_CloseSession.rawValue), &sessionParam)
    
    // ライブラリクローズ
    ulErr = Nkfl_Entry(UInt(kNkfl_Cmd_CloseLibrary.rawValue), nil)
}
