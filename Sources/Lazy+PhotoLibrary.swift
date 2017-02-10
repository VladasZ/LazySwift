//
//  Lazy+PhotoLibrary.swift
//  LazySwift
//
//  Created by Vladas Zakrevskis on 2/10/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit
import Photos

public extension Lazy {
    
    public class photoLibrary : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        //MARK: - Static elements
        
        public static var askForPermissionMessage:String = "Application needs access to your photo library."
        public static var openSettingsTitle:String = "Settings"
        
        static let controller = photoLibrary()
        
        public static func pick(_ completion:@escaping (UIImage) -> ()) {
            
            checkPhotoLibraryPermission {
 
                controller.completion = completion
                Lazy.presentViewController(controller)
            }
        }
        
        static func checkPhotoLibraryPermission(_ success:@escaping () -> ()) {
            
            let status = PHPhotoLibrary.authorizationStatus()
            
            switch status {
            case .authorized:          success()
            case .denied, .restricted: self.requestAccessIfDenied()
            case .notDetermined:
                
                PHPhotoLibrary.requestAuthorization() { status in
                    
                    switch status {
                    case .authorized:          success()
                    case .denied, .restricted: self.requestAccessIfDenied()
                    case .notDetermined:       print("notDetermined")
                    }
                }
            }
        }
        
        static func requestAccessIfDenied() {
            
            Lazy.alert.question(askForPermissionMessage, agreeTitle: openSettingsTitle)
            {
                Lazy.openSettings()
            }
        }
        
        //MARK: - Controller
        
        let picker = UIImagePickerController()
        
        var completion:((UIImage) -> ())? = nil
        
        public override func viewDidLoad() {
            super.viewDidLoad()
            
            picker.sourceType = .photoLibrary
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
