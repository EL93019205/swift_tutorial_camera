//
//  ViewController.swift
//  swift_tutorial_camera
//
//  Created by 早川マイケル on 2021/02/02.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var backImageView: UIImageView!

    var checkPermission = CheckPermission()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkPermission.checkCamera()
    }

    // シェアボタン
    @IBAction func share(_ sender: Any) {
        let text = "#駆け出しエンジニアと繋がりたい #swift勉強中 #swiftから投稿"
        let image = backImageView.image?.jpegData(compressionQuality: 0.5)
        let item = [text, image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    // アルバムボタン
    @IBAction func album(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
    }
    
    // カメラボタン
    @IBAction func camera(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
    }
    
    // ImagePicker簡略化
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
       // インスタンス作成
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    // 撮影(アルバム)のキャンセルボタンがタップされたとき
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        print("tojiru")
    }

    // 撮影(アルバム)が選択されたとき
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.editedImage] as? UIImage{
            
            // 画像を反映
            backImageView.image = pickerImage
            
            // 閉じる
            picker.dismiss(animated: true, completion: nil)
            print("sentaku")
        }
    }
    
    
}

