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
        
        Image("postImage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .offset(x: dragAmount.width + offset.width, y: dragAmount.height + offset.height)
            .rotationEffect(finalRotation + rotateAmount)
            .scaleEffect(finalMagnification + magnifyBy)
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
    
    func printGestureValues(){
        print("dragAmount width: \(dragAmount.width)")
        print("dragAmount height: \(dragAmount.height)")
        print("offset width: \(offset.width)")
        print("offset height: \(offset.height)")
        print("rotateAmount: \(rotateAmount)")
        print("finalRotation: \(finalRotation)")
        print("magnifyBy: \(magnifyBy)")
        print("finalMagnification: \(finalMagnification)")
    }
    
    
    
    
}








#Preview {
    ContentView()
}
