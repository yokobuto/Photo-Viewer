//
//  ContentView.swift
//  Photo Viewer
//
//  Created by Jörg Klausewitz on 01.05.25.
//

import SwiftUI

struct ContentView: View {
    
    // Dragging
    @GestureState private var dragAmount = CGSize.zero
    @State private var offset = CGSize.zero
    
    // Ratation
    @GestureState private var rotateAmount: Angle = .zero
    @State private var finalRotation: Angle = .zero
    
    //Magnification
    @GestureState private var magnifyBy: CGFloat = 1.0
    @State private var finalMagnification: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Text("dragAmount width: \(dragAmount.width)")
            Text("dragAmount height: \(dragAmount.height)").padding(.bottom)
            Text("offset width: \(offset.width)")
            Text("offset height: \(offset.height)").padding(.bottom)
            Text("rotateAmount: \(rotateAmount)")
            Text("finalRotation: \(finalRotation)").padding(.bottom)
            Text("magnifyBy: \(magnifyBy)")
            Text("finalMagnification: \(finalMagnification)")
        }
        .background(.red)
        .padding()
        .simultaneousGesture(dragGesture)
        .simultaneousGesture(rotationGesture)
        .simultaneousGesture(magnificationGesture)
    }
    
    var dragGesture: some Gesture {
            DragGesture()
                .updating($dragAmount) { value, state, _ in
                    state = value.translation
                }
                .onEnded { value in
                    offset = CGSize(
                        width: offset.width + value.translation.width,
                        height: offset.height + value.translation.height
                    )
                }
    }
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .updating($rotateAmount) { value, state, _ in
                state = value
            }
            .onEnded { value in
                finalRotation += value
            }
    }
    
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) { value, state, _ in
                state = value
            }
            .onEnded { value in
                finalMagnification *= value
            }
    }
    
    
    
    
}








#Preview {
    ContentView()
}
