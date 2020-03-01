//
//  LandmarkDetail.swift
//  SwiftUi_official
//
//  Created by Vasileios Gkreen on 29/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    
    
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    // map landmark in array of json with current index of detail view
    //https://developer.apple.com/documentation/swift/array/2994722-firstindex
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        
        VStack {
            /*
            When you specify only the height parameter, the view automatically sizes to the width of its content.
            In this case, MapView expands to fill the available space.
             */
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    Button(action: {
                        //change value of selected landmark
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                }
                
            }.padding()
            
            // puah the entire content of the view to the top
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
