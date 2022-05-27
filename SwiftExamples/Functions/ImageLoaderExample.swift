import SwiftUI

struct ImageLoaderExample: View {
    
    @State var image1: UIImage?
    @State var image2: UIImage?
    
    var body: some View {
        VStack {
            if let image = image1 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .frame(width: 300, height: 230)
            }
            
            if let image = image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .frame(width: 300, height: 250)
            }
        }
        .onAppear {
            guard let url = Bundle.main.url(forResource: "sunset", withExtension: "jpeg") else {
                return
            }
            
            if let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil),
               let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) {
                image1 = UIImage(cgImage: image, scale: 2, orientation: .up)
            }
            
            if let data = try? Data(contentsOf: url) {
                image2 = UIImage(data: data)
            }
        }
    }
}

struct ImageLoaderExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderExample()
    }
}
