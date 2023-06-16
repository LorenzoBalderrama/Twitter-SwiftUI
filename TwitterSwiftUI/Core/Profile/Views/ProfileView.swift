//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by Zoup Soup on 6/14/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
        
            tweetsView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:16, y: 12)
                }

                
                Circle()
                    .frame(width: 72, height: 72)
                .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button  {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width:120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text("Zoup Soup")
                    .font(.title2)
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@thecodingsoup")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your next iOS Developer!")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Los Angeles, CA")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.thecodingsoup.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24) {
                HStack {
                    Text("807")
                        .font(.subheadline)
                        .bold()
                        
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                
                HStack {
                    Text("6.9M")
                        .font(.subheadline)
                        .bold()
                        
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .black : .gray)
                    
                    if selectionFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                        
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectionFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetsRowView()
                        .padding()
                }
            }
        }
    }
}
