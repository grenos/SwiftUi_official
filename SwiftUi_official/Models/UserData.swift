//
//  UserData.swift
//  SwiftUi_official
//
//  Created by Vasileios Gkreen on 01/03/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//



/*To prepare for the user to control which particular landmarks are favorites, you’ll first store the landmark data in an observable object.

An observable object is a custom object for your data that can be bound to a view from storage in SwiftUI’s environment. SwiftUI watches for any changes to observable objects that could affect a view, and displays the correct version of the view after a change.
*/



import SwiftUI
import Combine


final class UserData: ObservableObject {
    
    //An observable object needs to publish any changes to its data,
    //so that its subscribers can pick up the change.
    
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
