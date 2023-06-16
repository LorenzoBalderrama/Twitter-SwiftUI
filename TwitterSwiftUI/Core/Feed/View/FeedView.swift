//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Zoup Soup on 6/14/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 20, id: \.self) { _ in
                    TweetsRowView()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
