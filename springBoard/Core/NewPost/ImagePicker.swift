//
//  ImagePicker.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/8/23.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        // make this .camera in the future
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // insert something here?
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // code when image is selected
        print("image selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // if image is found
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
            
        }
        parent.isPickerShowing = false
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // code for when cancelled
        print("cancelled")
        
        parent.isPickerShowing = false
    }
}
