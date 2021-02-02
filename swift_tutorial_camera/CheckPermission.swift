//
//  CheckPermission.swift
//  swift_tutorial_camera
//
//  Created by 早川マイケル on 2021/02/03.
//

import Foundation

import Photos

class CheckPermission{
    
    // ユーザーに許可を促す
    func checkCamera(){
        PHPhotoLibrary.requestAuthorization{ (status) in
            switch(status){
            case .authorized:
                print("authorized")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("denied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
    }
}
