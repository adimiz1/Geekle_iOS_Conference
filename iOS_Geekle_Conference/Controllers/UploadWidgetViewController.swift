//
//  UploadWidgetViewController.swift
//  iOS_Geekle_Conference
//
//  Created by Adi Mizrahi on 19/09/2023.
//

import Foundation
import UIKit
import Cloudinary

class UploadWidgetViewController: UIViewController {
    
    @IBOutlet weak var ivMain: CLDUIImageView!
    @IBOutlet weak var vwBack: UIView!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    @IBOutlet weak var btnUploadWidget: UIButton!

    var cloudinary: CLDCloudinary!
    var uploadWidget: CLDUploaderWidget!

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
        btnUploadWidget.addTarget(self, action: #selector(openUploadWidget), for: .touchUpInside)
    }

    @objc func openUploadWidget() {
        let configuration = CLDWidgetConfiguration(
          uploadType: CLDUploadType(signed: false, preset: "ios_sample"))

        uploadWidget = CLDUploaderWidget(
          cloudinary: cloudinary,
          configuration: configuration,
          images: nil,
          delegate: self)

        uploadWidget.presentWidget(from: self)
    }


    @objc func stepBack() {
        self.dismiss(animated: true)
    }
}

extension UploadWidgetViewController: CLDUploaderWidgetDelegate {
    func uploadWidget(_ widget: CLDUploaderWidget, willCall uploadRequests: [CLDUploadRequest]) {
        aiLoading.isHidden = false
      uploadRequests[0].response( { response, error in
          self.ivMain.cldSetImage(response!.secureUrl!, cloudinary: self.cloudinary)
          self.aiLoading.isHidden = true
      } )
    }
    func widgetDidCancel(_ widget: CLDUploaderWidget) {
    }
    func uploadWidgetDidDismiss() {
    }
}
