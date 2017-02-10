//
//  LazyPhoto.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/10/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit
import Photos

public extension Lazy {
    
    public class photo : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        //MARK: - Static elements
        
        public static var askForLibraryPermissionMessage:String = "Application needs access to your photo library."
        public static var askForCameraPermissionMessage:String = "Application needs access to your camera."
        public static var openSettingsTitle:String = "Settings"
        
        public static func pick(_ completion:@escaping (UIImage) -> ()) {
            
            checkLibraryPermission {
                
                let controller = photo()
                
                controller.completion = completion
                Lazy.presentViewController(controller)
            }
        }
        
        public static func take(_ completion:@escaping (UIImage) -> ()) {
            
            checkCameraPermission {
                
                let controller = photo()
                
                controller.sourceType = .camera
                
                controller.completion = completion
                Lazy.presentViewController(controller)
            }
        }
        
        static func checkLibraryPermission(_ success:@escaping () -> ()) {
            
            let status = PHPhotoLibrary.authorizationStatus()
            
            switch status {
            case .authorized:          success()
            case .denied, .restricted: self.requestLibraryAccess()
            case .notDetermined:
                
                PHPhotoLibrary.requestAuthorization() { status in
                    
                    switch status {
                    case .authorized:          success()
                    case .denied, .restricted: self.requestLibraryAccess()
                    case .notDetermined:       print("notDetermined")
                    }
                }
            }
        }
        
        static func checkCameraPermission(_ success:@escaping () -> ()) {
            
            if AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) ==  AVAuthorizationStatus.authorized {
                success()
            }
            else {
                AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (granted :Bool) -> Void in
                    if granted == true {
                        success()
                    }
                    else {
                        requestCameraAccess()
                    }
                });
            }
        }
        
        static func requestLibraryAccess() {
            
            Lazy.alert.question(askForLibraryPermissionMessage, agreeTitle: openSettingsTitle)
            {
                Lazy.openSettings()
            }
        }
        
        static func requestCameraAccess() {
            
            Lazy.alert.question(askForCameraPermissionMessage, agreeTitle: openSettingsTitle)
            {
                Lazy.openSettings()
            }
        }
        
        //MARK: - Controller
        
        var completion:((UIImage) -> ())? = nil
        
        var sourceType: UIImagePickerControllerSourceType = .photoLibrary
        
        override public func viewDidLoad() {
            super.viewDidLoad()
            
            let picker = UIImagePickerController()
            
            picker.sourceType = sourceType
            picker.delegate = self
            
            view.addSubview(picker.view)
            addChildViewController(picker)
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            completion?(selectedImage)
            completion = nil
            
            dismiss(animated: true, completion: nil)
        }
    }
    
}
