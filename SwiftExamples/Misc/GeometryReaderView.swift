import SwiftUI

struct GeometryReaderView: View {
    
    var body: some View {
        
        GeometryReader { g1 in
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    GeometryReader { g2 in
                        HStack(spacing: 0) {
                            Text("Left")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: g2.size.width / 3, height: g2.size.height)
                                .background(.red)
                            
                            Text("Right")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: g2.size.width * 2 / 3, height: g2.size.height)
                                .background(.yellow)
                        }
                    }
                }
                .frame(width: g1.size.width, height: g1.size.height / 3)
                
                HStack(spacing: 0) {
                    GeometryReader { g3 in
                        HStack(spacing: 0) {
                            Text("Left")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .frame(width: g3.size.width / 2, height: g3.size.height)
                                .background(.blue)
                            
                            Text("Right")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .frame(width: g3.size.width / 2, height: g3.size.height)
                                .background(.green)
                        }
                    }
                }
                .frame(width: g1.size.width, height: g1.size.height * 2 / 3)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
