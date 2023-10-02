//
//  TransformViewController.swift
//  iOS_Geekle_Conference
//
//  Created by Adi Mizrahi on 12/09/2023.
//

import Foundation
import UIKit
import Cloudinary

class TransformViewController: UIViewController {

    @IBOutlet weak var ivOriginal: CLDUIImageView!
    @IBOutlet weak var ivTransformed: CLDUIImageView!
    @IBOutlet weak var vwBack: UIView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setBackButton()
        setImageView()
    }

    func setBackButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(stepBack))
        vwBack.addGestureRecognizer(gesture)
    }

    func setImageView() {
        let originalUrl = CloudinaryHelper.shared.cloudinary.createUrl().generate("sample")
        ivOriginal.cldSetImage(originalUrl!, cloudinary: CloudinaryHelper.shared.cloudinary)
        let transformedUrl = CloudinaryHelper.shared.cloudinary.createUrl().setTransformation(CLDTransformation().setEffect("sepia")).generate("sample")
        ivTransformed.cldSetImage(transformedUrl!, cloudinary: CloudinaryHelper.shared.cloudinary)
    }

    @objc func stepBack() {
        self.dismiss(animated: true)
    }
}
