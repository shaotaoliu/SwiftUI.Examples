import SwiftUI

struct LineGraphExample: View {
    var data: [CGFloat]
    
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            let width = proxy.size.width / CGFloat(data.count - 1)
            let maxPoint = (data.max() ?? 0) + 100
            
            let points = data.enumerated().compactMap { item -> CGPoint in
                let progress = item.element / maxPoint
                let pathHeight = progress * height
                let pathWidth = width * CGFloat(item.offset)
                
                return CGPoint(x: pathWidth, y: -pathHeight + height)
            }
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLines(points)
            }
            .strokedPath(StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .fill(.blue)
            
            LinearGradient(colors: [
                Color.gray.opacity(0.9),
                Color.gray.opacity(0.5),
                Color.gray.opacity(0.1)
            ], startPoint: .top, endPoint: .bottom)
                .clipShape(
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLines(points)
                        
                        path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                        path.addLine(to: CGPoint(x: 0, y: height))
                    }
                )
        }
    }
}

let samples: [CGFloat] = [
    989, 1200, 750, 790, 650,
    950, 1200, 600, 500, 600,
    890, 1203, 1400, 900, 1250,
    1600, 800, 1200, 950, 1300
]

struct LineGraphExample_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphExample(data: samples)
            .frame(height: 220)
            .border(.green, width: 1)
    }
}
