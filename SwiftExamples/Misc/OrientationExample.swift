import SwiftUI

struct OrientationExample: View {
    @State private var orientation = UIDeviceOrientation.unknown
    
    // It does not work well in simulator; try a real device
    var body: some View {
        Group {
            if orientation.isPortrait {
                PortraitView()
            }
            else if orientation.isLandscape {
                LandscapeView()
            }
            else if orientation.isFlat {
                Text("Flat")
                    .font(.title)
            }
            else {
                Text("Unknown")
                    .font(.title)
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

fileprivate struct PortraitView: View {
    var body: some View {
        VStack {
            Spacer()
            PersonPhotoView()
            Spacer()
            PersonInfoView()
            Spacer()
        }
    }
}

fileprivate struct LandscapeView: View {
    var body: some View {
        HStack {
            Spacer()
            PersonPhotoView()
            Spacer()
            PersonInfoView()
            Spacer()
        }
    }
}

fileprivate struct PersonPhotoView: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .opacity(0.5)
    }
}

fileprivate struct PersonInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Kevin Lee")
            Text("Male")
            Text("626-893-2341")
            Text("kevin@example.com")
            Text("Irvine, CA")
        }
        .font(.title2)
    }
}

struct OrientationExample_Previews: PreviewProvider {
    static var previews: some View {
        OrientationExample()
            .previewInterfaceOrientation(.portrait)
    }
}
