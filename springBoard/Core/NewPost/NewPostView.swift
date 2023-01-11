//
//  NewPostView.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/8/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct NewPostView: View {
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    @State var caption = ""
    
    var body: some View {
        VStack {
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
            }
            Button {
                // show the image picker
                isPickerShowing = true
            } label: {
                Text("Capture an Image")
                    .bold()
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            
            // upload button
            if selectedImage != nil {
                VStack {
                    TextField("Caption", text:$caption)
                        .padding(.all, 32)
                    Button {
                        uploadPhoto()
                    } label: {
                        Text("Upload Image")
                            .bold()
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(.black))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                }
                
            }
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            // image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
            
        }
    }
    func uploadPhoto() {
        
        guard selectedImage != nil else {
            return
        }
        
        let storageRef = Storage.storage().reference()
        
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {
            return
        }
        
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid, "filepath": path, "caption": caption, "timestamp": Timestamp(date: Date())] as [String : Any]
        
        
        let _ = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            if error == nil && metadata != nil {
                // post it with caption
                
                Firestore.firestore().collection("posts").document().setData(data)
                
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
