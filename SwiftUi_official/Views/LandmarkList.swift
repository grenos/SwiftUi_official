//
//  LandmarkList.swift
//  SwiftUi_official
//
//  Created by Vasileios Gkreen on 01/03/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    //This userData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        NavigationView {
            
                List {
                    Toggle(isOn: $userData.showFavoritesOnly) {
                         Text("Favorites only")
                    }
                    
                    /*To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views,
                     use the ForEach type instead of passing your collection of data to List.*/
                    ForEach(userData.landmarks) { landmark in
                        
                        if !self.userData.showFavoritesOnly || landmark.isFavorite {
                            NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                                LandmarkRow(landmark: landmark)
                            }
                        }
                        
                    }
                }
                .navigationBarTitle(Text("Landmarks"))
        }
     
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
