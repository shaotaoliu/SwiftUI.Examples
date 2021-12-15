import SwiftUI

struct CurveExample: View {
    var years = incomes.map { $0.year }
    var amountsCA = incomes.flatMap { $0.states } .filter { $0.name == "CA" } .map { $0.amount }
    var amountsNY = incomes.flatMap { $0.states } .filter { $0.name == "NY" } .map { $0.amount }
    let maxAmount: Double = incomes.flatMap { $0.states } .map { $0.amount } .max()!
    let minAmount: Double = incomes.flatMap { $0.states } .map { $0.amount } .min()!
    let interval = UIScreen.main.bounds.width / CGFloat(incomes.count + 1)
    
//    func createPath(amounts: [Double]) -> Path {
//        let interval = Double(UIScreen.main.bounds.width) / Double(amounts.count + 1)
//        let scale = 200 / (maxAmount - minAmount)
//
//        var path = Path()
//        path.move(to: CGPoint(x: interval, y: (maxAmount - amounts[0]) * scale))
//
//        for i in 1..<amounts.count {
//            path.addLine(to: CGPoint(x: interval * Double(i + 1), y: (maxAmount - amounts[i]) * scale))
//        }
//
//        return path
//    }
    
    var body: some View {
        VStack {
            Text("Average Income")
                .font(.title.bold())
                .padding(.bottom, 30)
            
            VStack {
                HStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: interval, height: 1)
                    
                    Text("CA")
                }
                
                HStack {
                    Rectangle()
                        .fill(.red)
                        .frame(width: interval, height: 1)
                    
                    Text("NY")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            
            ZStack {
                AmountCurve(amounts: amountsCA, maxBound: maxAmount, minBound: minAmount, color: .red)
                AmountCurve(amounts: amountsNY, maxBound: maxAmount, minBound: minAmount, color: .blue)
                
//                createPath(amounts: amountsCA)
//                    .stroke(.red)
//
//                createPath(amounts: amountsNY)
//                    .stroke(.blue)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            HStack(spacing: 0) {
                ForEach(years, id: \.self) { year in
                    Text(String(year))
                        .font(.system(size: 12))
                        .frame(width: interval)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    struct AmountCurve: View {
        let amounts: [Double]
        let maxBound: Double
        let minBound: Double
        var color: Color = .black
        
        var body: some View {
            GeometryReader { geometry in
                let interval = geometry.size.width / Double(amounts.count + 1)
                let scale = geometry.size.height / (maxBound - minBound)

                Path { path in
                    path.move(to: CGPoint(x: interval, y: (maxBound - amounts[0]) * scale))

                    for i in 1..<amounts.count {
                        path.addLine(to: CGPoint(x: interval * CGFloat((i + 1)), y: (maxBound - amounts[i]) * scale))
                    }
                }
                .stroke(color)
            }
        }
    }
}

fileprivate struct Income {
    let year: Int
    let states: [StateIncome]
}

fileprivate struct StateIncome {
    let name: String
    let amount: Double
}

fileprivate let incomes = [
    Income(year: 2013, states: [
        StateIncome(name: "CA", amount: 32),
        StateIncome(name: "NY", amount: 28)
    ]),
    Income(year: 2014, states: [
        StateIncome(name: "CA", amount: 43),
        StateIncome(name: "NY", amount: 35)
    ]),
    Income(year: 2015, states: [
        StateIncome(name: "CA", amount: 39),
        StateIncome(name: "NY", amount: 36)
    ]),
    Income(year: 2016, states: [
        StateIncome(name: "CA", amount: 55),
        StateIncome(name: "NY", amount: 40)
    ]),
    Income(year: 2017, states: [
        StateIncome(name: "CA", amount: 66),
        StateIncome(name: "NY", amount: 46)
    ]),
    Income(year: 2018, states: [
        StateIncome(name: "CA", amount: 53),
        StateIncome(name: "NY", amount: 77)
    ]),
    Income(year: 2019, states: [
        StateIncome(name: "CA", amount: 73),
        StateIncome(name: "NY", amount: 95)
    ]),
    Income(year: 2020, states: [
        StateIncome(name: "CA", amount: 76),
        StateIncome(name: "NY", amount: 98)
    ])
]

struct CurveExample_Previews: PreviewProvider {
    static var previews: some View {
        CurveExample()
    }
}
