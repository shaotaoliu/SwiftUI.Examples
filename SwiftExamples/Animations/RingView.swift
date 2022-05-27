import SwiftUI

struct RingView: View {
    @State var percentage1: Double = 0
    @State var percentage2: Double = 0
    @State var percentage3: Double = 0
    
    var body: some View {
        ZStack {
            Ring(foregroundColor: .red,
                 backgroundColor: .red.opacity(0.2),
                 lineWidth: 35,
                 percentage: percentage1)
            .frame(width: 160, height: 160)
            .onTapGesture {
                withAnimation(.easeIn(duration: 1)) {
                    self.percentage1 = 100
                }
            }
            
            Ring(foregroundColor: .green,
                 backgroundColor: .green.opacity(0.2),
                 lineWidth: 35,
                 percentage: percentage2)
            .frame(width: 230, height: 230)
            .onTapGesture {
                withAnimation(.easeIn(duration: 1)) {
                    self.percentage2 = 100
                }
            }
            
            Ring(foregroundColor: .blue,
                 backgroundColor: .blue.opacity(0.2),
                 lineWidth: 35,
                 percentage: percentage3)
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation(.easeIn(duration: 1)) {
                    self.percentage3 = 100
                }
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}

struct Ring: View {
    
    let foregroundColor: Color
    let backgroundColor: Color
    let lineWidth: CGFloat
    let percentage: Double
    
    var body: some View {
        ZStack {
            RingShape()
                .stroke(style: StrokeStyle(lineWidth: lineWidth))
                .fill(backgroundColor)
            
            RingShape(percent: percentage)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .fill(foregroundColor)
        }
    }
}

struct RingShape: Shape {
    
    let startAngle: Double
    var percent: Double
    
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    init(startAngle: Double = 180, percent: Double = 100) {
        self.startAngle = startAngle
        self.percent = percent
    }
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let endAngle = startAngle + (percent * 360 / 100)
        
        return Path { path in
            path.addArc(center: center,
                        radius: radius,
                        startAngle: Angle(degrees: startAngle),
                        endAngle: Angle(degrees: endAngle),
                        clockwise: false)
        }
    }
}

struct Ring2: View {
    
    let foregroundColor: Color
    let backgroundColor: Color
    let lineWidth: CGFloat
    let percentage: Double
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(backgroundColor)
            
            Circle()
                .trim(from: 0, to: percentage / 100)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(foregroundColor)
        }
    }
}
