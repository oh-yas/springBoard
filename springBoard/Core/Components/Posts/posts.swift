//
//  posts.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/5/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct posts: View {
    let post: Post
    @State var image = UIImage()
    @State var postdate = ""

    var body: some View {
        VStack(alignment: .leading) {
            // name and info
            
            if let user = post.user {
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 28.0, height: 28.0)
                        .foregroundColor(.black)
                    Text("@\(user.username)")
                        .font(.subheadline).bold()
                    Text(postdate)
                        .font(.caption)
                        .foregroundColor(Color.black)
                }
                .padding(.leading, 5.0)
            }
            // picture
            
            Image(uiImage: image)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            
            // caption
            Text(post.caption)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            
            
            // add message button
            HStack {
                Spacer()
                Button {
                    // action goes here
                    let sms: String = "sms:" + post.user!.phonenumber
                    print(sms)
                    UIApplication.shared.open(URL.init(string: sms)!)
                } label: {
                    // what it looks like
                    
                    Image(systemName: "message.fill")
                        .foregroundColor(Color.black)
                        
                }
                Spacer()
            }
            Divider()
                .padding(.top)
        }
        .onAppear() {
            self.retrieveImage()
            self.time()
        }
    }
    func retrieveImage() {
        let storageRef = Storage.storage().reference()
        let fileRef = storageRef.child(post.filepath)
        fileRef.getData(maxSize: 10*1024*1024) { data, error in
            if error == nil {
                image = UIImage(data: data!)!
            }
        }
    }
    func time() {
        let date = post.timestamp.dateValue()
        let temp = DateFormatter()
        temp.dateFormat = "MM/dd/YY"
        postdate = temp.string(from: date)
    }
}

//struct posts_Previews: PreviewProvider {
//    static var previews: some View {
//        posts()
//            
//    }
//}
