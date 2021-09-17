//
//  ContentView.swift
//  SwiftUIExpandableList
//
//  Created by Tomas Havlicek on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        List(sampleMenuItems, children: \.subMenuItems) { item in
//            HStack {
//                Image(item.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 50)
//
//                Text(item.name)
//                    .font(.system(.title3, design: .rounded))
//                    .bold()
//            }
//        }
//        .listStyle(InsetGroupedListStyle())
        
        List {
            ForEach(sampleMenuItems) { menuItem in
                Section(header:
                    HStack {
                        Text(menuItem.name)
                            .font(.title3)
                            .fontWeight(.heavy)
                        
                        Image(menuItem.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.vertical)
                ) {
                    OutlineGroup(menuItem.subMenuItems ?? [MenuItem](), children: \.subMenuItems) { item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Text(item.name)
                                .font(.system(.title3, design: .rounded))
                                .bold()
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
