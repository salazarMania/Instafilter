//
//  ImageSaver.swift
//  Instafilter
//
//  Created by SANIYA KHATARKAR on 27/08/24.
//

import UIKit

class ImageSaver : NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: (() -> Void)?
    func writeToPhotoAlbum(image : UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo : UnsafeRawPointer ){
        if let error = error {
            errorHandler?()
        } else {
            successHandler?()
        }
    }
}
