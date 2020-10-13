//
//  PhotoViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 16/5/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoViewController: UIViewController {

// for pose layers on top of camera spp
    @IBOutlet weak var sppTwoLayer: UIImageView!
    
    @IBOutlet weak var sppOneLayer: UIImageView!
    
    @IBOutlet weak var sppThreeLayer: UIImageView!
    
    @IBOutlet weak var sppFourLayer: UIImageView!
    
    @IBOutlet weak var sppFiveLayer: UIImageView!
    
    @IBOutlet weak var sppSixLayer: UIImageView!
    
    @IBOutlet weak var sppSevenLayer: UIImageView!
    
    @IBOutlet weak var sppEightLayer: UIImageView!
    
    @IBOutlet weak var sppNineLayer: UIImageView!
 
    
    
    
    // for pose layers on top of camera cp
    
    
    @IBOutlet weak var cpOneLayer: UIImageView!
    
    @IBOutlet weak var cpTwoLayer: UIImageView!
    
    @IBOutlet weak var cpThreeLayer: UIImageView!
    
    @IBOutlet weak var cpFourLayer: UIImageView!
    
    @IBOutlet weak var cpFiveLayer: UIImageView!
    
    @IBOutlet weak var cpSixLayer: UIImageView!
    
    @IBOutlet weak var cpSevenLayer: UIImageView!
    
    @IBOutlet weak var cpEightLayer: UIImageView!
    
    @IBOutlet weak var cpNineLayer: UIImageView!
    
    
    @IBOutlet weak var helpButton: UIButton!
    
    
    
    
    
    
    
    
    // for pop up views
    
    @IBOutlet var popUpViewCP: UIView!
    
    @IBOutlet var popUpView: UIView!
    
    @IBOutlet var popUpViewTips: UIView!
    
    
    
    
    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var tipsDetail: UILabel!
    
    
   // for buttons under studio
    
    @IBAction func spp(_ sender: Any) {
        animateIn(desiredView: popUpView)
        poseCollection.forEach { (button) in
            button.isHidden = true
                   
        }
        self.helpButton.isHidden = true
    }
    
    @IBAction func cp(_ sender: Any) {
        animateIn(desiredView: popUpViewCP)
        poseCollection.forEach { (button) in
            button.isHidden = true
                   
        }
        self.helpButton.isHidden = true
    }
    
    
    
    // for buttons on the pop up page spp
    @IBAction func sppOne(_ sender: Any) {
        sppOneLayer.isHidden = !sppOneLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    @IBAction func sppTwo(_ sender: UIButton) {
        sppTwoLayer.isHidden = !sppTwoLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    @IBAction func sppThree(_ sender: Any) {
        sppThreeLayer.isHidden = !sppThreeLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
        
    }
    
    @IBAction func sppFour(_ sender: Any) {
        sppFourLayer.isHidden = !sppFourLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    @IBAction func sppFive(_ sender: Any) {
        sppFiveLayer.isHidden = !sppFiveLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    @IBAction func sppSix(_ sender: Any) {
        sppSixLayer.isHidden = !sppSixLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    @IBAction func sppSeven(_ sender: Any) {
        sppSevenLayer.isHidden = !sppSevenLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    @IBAction func sppEight(_ sender: Any) {
        sppEightLayer.isHidden = !sppEightLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    @IBAction func sppNine(_ sender: Any) {
        sppNineLayer.isHidden = !sppNineLayer.isHidden
        animateOut(desiredView: popUpView)
        self.helpButton.isHidden = false
    }
    
    
    
    
    // for buttons on the pop up page cp
    
    @IBAction func cpOne(_ sender: Any) {
        cpOneLayer.isHidden = !cpOneLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpTwo(_ sender: Any) {
        cpTwoLayer.isHidden = !cpTwoLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpThree(_ sender: Any) {
        cpThreeLayer.isHidden = !cpThreeLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpFour(_ sender: Any) {
        cpFourLayer.isHidden = !cpFourLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpFive(_ sender: Any) {
        cpFiveLayer.isHidden = !cpFiveLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpSix(_ sender: Any) {
        cpSixLayer.isHidden = !cpSixLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpSeven(_ sender: Any) {
        cpSevenLayer.isHidden = !cpSevenLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpEight(_ sender: Any) {
        cpEightLayer.isHidden = !cpEightLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    @IBAction func cpNine(_ sender: Any) {
        cpNineLayer.isHidden = !cpNineLayer.isHidden
        animateOut(desiredView: popUpViewCP)
        self.helpButton.isHidden = false
    }
    
    
    
    @IBAction func helpPressed(_ sender: Any) {
        
        animateIn(desiredView: popUpViewTips)
        
        if (!sppOneLayer.isHidden) {
            self.tipsDetail.text = "1. Form a heart next to your head with your arms, with elbows touching \n2. Look at the camera and smile or give a wink!"
        }
        
        if (!sppTwoLayer.isHidden) {
            self.tipsDetail.text = "1. Relax your arms and sway your dress or skirt with one hand \n2. Tilt your head to the side"
        }
        
        if (!sppThreeLayer.isHidden) {
            self.tipsDetail.text = "1. Sit on the floor in front of some flowers or a pretty background and cross your legs \n2. Rest ur arms between your legs"
        }
        
        if (!sppFourLayer.isHidden) {
            self.tipsDetail.text = "1. Sit on the edge of a bench or railing and cross one leg over the other \n2. Rest your arms on your legs"
        }
        
        if (!sppFiveLayer.isHidden) {
            self.tipsDetail.text = "1. Throw your arms up and swing your body to the side in one movement \n2. Let your hair swing together with your body"
        }
        
        if (!sppSixLayer.isHidden) {
            self.tipsDetail.text = "1. Throw one hand in the air and tilt your head in that direction \n2. Slightly cross one leg over the other"
        }
        
        if (!sppSevenLayer.isHidden) {
            self.tipsDetail.text = "1. Kneel on the ground and throw both arms in the air"
        }
        
        if (!sppEightLayer.isHidden) {
            self.tipsDetail.text = "1. Lean one hand on a railing or an object and tilt your head towards that shoulder"
        }
        
        if (!sppNineLayer.isHidden) {
            self.tipsDetail.text = "1. Sit on one step of a flight of stairs, place one leg on the first step below and the other on the second \n2. Rest your elbow on the leg on the first step and rest your chin on that hand \n3. Rest your other arm on the other leg"
        }
        
        
        
        
        if (!cpOneLayer.isHidden) {
            self.tipsDetail.text = "1. Rest your arm on your his chest and look into each others eyes"
        }
        
        
        if (!cpTwoLayer.isHidden) {
            self.tipsDetail.text = "1. For guy: Carry her on your shoulders \n2. For girl: Open your arms wide like you’re flying through the air"
        }
        
        if (!cpThreeLayer.isHidden) {
            self.tipsDetail.text = "1. For guy: Hold her face and look into her eyes \n2. For girl: Hug him"
        }
        
        
        if (!cpFourLayer.isHidden) {
            self.tipsDetail.text = "1. Hold each other’s hands and take a step forward, looking at each other"
        }
        
        if (!cpFiveLayer.isHidden) {
            self.tipsDetail.text = "1. For guy: Give her a hug from the back and look at her \n2. For girl: Hold his hands and look at him"
        }
        
        if (!cpSixLayer.isHidden) {
            self.tipsDetail.text = "1. For guy: Carry her on your shoulders \n2. Look at each other"
        }
        
        if (!cpSevenLayer.isHidden) {
            self.tipsDetail.text = "1. For guy: Hold her hand \n2. For girl: walk away from him in a “follow me” pose"
        }
        
        if (!cpEightLayer.isHidden) {
            self.tipsDetail.text = "1. Face away from the camera and stand side by side \n2. Use opposing hands to form a heart on the top of your heads"
        }
        
        if (!cpNineLayer.isHidden) {
            self.tipsDetail.text = "1. Sit on the ground with your legs locked around each other"
        }
        

        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        animateOut(desiredView: popUpViewTips)
        
    }
    
    
    func animateIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = self.view.center
        
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
        
        
    }
    
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
    
    
    
    
    // for studio button
    
    @IBAction func handleSelection(_ sender: UIButton) {
        poseCollection.forEach { (button) in
            button.isHidden = !button.isHidden
            
        }
        
        self.helpButton.isHidden = true
        
        animateOut(desiredView: popUpView)
        animateOut(desiredView: popUpViewCP)
        
        sppOneLayer.isHidden = true
        sppTwoLayer.isHidden = true
        sppThreeLayer.isHidden = true
        sppFourLayer.isHidden = true
        sppFiveLayer.isHidden = true
        sppSixLayer.isHidden = true
        sppSevenLayer.isHidden = true
        sppEightLayer.isHidden = true
        sppNineLayer.isHidden = true
        
        cpOneLayer.isHidden = true
        cpTwoLayer.isHidden = true
        cpThreeLayer.isHidden = true
        cpFourLayer.isHidden = true
        cpFiveLayer.isHidden = true
        cpSixLayer.isHidden = true
        cpSevenLayer.isHidden = true
        cpEightLayer.isHidden = true
        cpNineLayer.isHidden = true
        
        
        
        
        
    }
    
    
    
    

    @IBOutlet var poseCollection: [UIButton]!
    
    
    @IBAction func poseTapped(_ sender: UIButton) {
    }
    
    
    
    
    @IBOutlet weak var cameraView: UIView!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    var capturePhotoOutput: AVCapturePhotoOutput?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(iOS 10.2, *) {
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                //videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect;
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            } catch {
                print("error")
            }
        }
    
        
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoOutput?.isHighResolutionCaptureEnabled = true
        captureSession?.addOutput(capturePhotoOutput!)
        
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.75)
        
        popUpViewCP.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.75)
        
        popUpViewTips.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.75)
        
    
    }
    
    
    @IBAction func captureButton(_ sender: Any) {
        
        guard let capturePhotoOutput = self.capturePhotoOutput else {
            print("error in capturing")
            return
        }
        
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .off
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self)
        
       
        
    }
    
    
    func switchToFrontCamera() {
        if frontCamera?.isConnected ==  true {
            captureSession?.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            } catch {
                print("error")
            }
            
            capturePhotoOutput = AVCapturePhotoOutput()
            capturePhotoOutput?.isHighResolutionCaptureEnabled = true
            captureSession?.addOutput(capturePhotoOutput!)
            
            popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.75)
            
            popUpViewCP.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.75)
        }
    }
    
    func switchToBackCamera() {
        if backCamera?.isConnected ==  true {
            captureSession?.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            } catch {
                print("error")
            }
            
            capturePhotoOutput = AVCapturePhotoOutput()
            capturePhotoOutput?.isHighResolutionCaptureEnabled = true
            captureSession?.addOutput(capturePhotoOutput!)
            
            popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.75)
            
            popUpViewCP.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.75)
        }
    }
    
    @IBAction func cameraSwitch(_ sender: Any) {
        guard let currentCameraInput: AVCaptureInput = captureSession?.inputs.first else {
            print("error")
            return
        }
        
        if let input = currentCameraInput as? AVCaptureDeviceInput {
            if input.device.position == .back {
                switchToFrontCamera()
            }
            if input.device.position == .front {
                switchToBackCamera()
            }
        }
        
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

extension PhotoViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {

        // Check if there is any error in capturing
        guard error == nil else {
            print("Fail to capture photo: \(String(describing: error))")
            return
        }

        // Check if the pixel buffer could be converted to image data
        guard let imageData = photo.fileDataRepresentation() else {
            print("Fail to convert pixel buffer")
            return
        }

        // Check if UIImage could be initialized with image data
        guard let capturedImage = UIImage.init(data: imageData , scale: 1.0) else {
            print("Fail to convert image data to UIImage")
            return
        }
/*
        // Get original image width/height
        let imgWidth = capturedImage.size.width
        let imgHeight = capturedImage.size.height
        // Get origin of cropped image
        let imgOrigin = CGPoint(x: (imgWidth - imgHeight)/2, y: (imgHeight - imgHeight)/2)
        // Get size of cropped iamge
        let imgSize = CGSize(width: imgHeight, height: imgHeight)

        // Check if image could be cropped successfully
        guard let imageRef = capturedImage.cgImage?.cropping(to: CGRect(origin: imgOrigin, size: imgSize)) else {
            print("Fail to crop image")
            return
        }
*/
        // Convert cropped image ref to UIImage
        //let imageToSave = UIImage(cgImage: capturedImage, scale: 1.0, orientation: .right)
        UIImageWriteToSavedPhotosAlbum(capturedImage, nil, nil, nil)

        }
    
}
