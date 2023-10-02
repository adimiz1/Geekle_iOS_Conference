//
//  UploadViewController.swift
//  iOS_Geekle_Conference
//
//  Created by Adi Mizrahi on 18/09/2023.
//

import Foundation
import UIKit
import Cloudinary

class UploadViewController: UIViewController {
    @IBOutlet weak var vwBack: UIView!
    @IBOutlet weak var btnOpenGallery: UIButton!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    @IBOutlet weak var ivMain: CLDUIImageView!

    var cloudinary: CLDCloudinary!
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCloudinary()
        setBackButton()
        setUploadButton()
    }

    func setCloudinary() {
        cloudinary = CLDCloudinary(configuration: CLDConfiguration(cloudName: "adimizrahi2"))
    }

    func setBackButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(stepBack))
        vwBack.addGestureRecognizer(gesture)
    }

    func setUploadButton() {
        btnOpenGallery.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
    }

    @objc func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }

    func uploadImage(_ image: UIImage) {
        aiLoading.isHidden = false
        let data = image.pngData()
        cloudinary.createUploader().upload(data: data!, uploadPreset: "ios_sample", completionHandler:  { response, _ in
            DispatchQueue.main.async {
                self.ivMain.cldSetImage( response!.secureUrl!, cloudinary: self.cloudinary)
                self.aiLoading.isHidden = true
            }
        })
    }


    @objc func stepBack() {
        self.dismiss(animated: true)
    }
}

extension UploadViewController:  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        uploadImage(image)
    }


}
