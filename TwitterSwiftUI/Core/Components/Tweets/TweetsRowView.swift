//
//  TweetsRowView.swift
//  TwitterSwiftUI
//
//  Created by Zoup Soup on 6/14/23.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // Profile Image & User Information + Tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // User Information & Tweet Caption
                VStack(alignment: .leading, spacing: 4) {
                    
                    //User Information
                    HStack {
                        Text("Zoup Soup")
                            .font(.subheadline).bold()
                        
                        Text("@thecodingsoup")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // Tweet Caption
                    Text("yeah, i totally think I'm THAT cool uwu")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            // Action Buttons
            HStack {
                Button {
                    // action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
