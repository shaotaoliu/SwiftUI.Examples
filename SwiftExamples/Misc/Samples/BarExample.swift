import SwiftUI

struct BarExample: View {
    let maxAmount: CGFloat = CGFloat(incomes.flatMap { $0.states } .map { $0.amount } .max()!)

    var body: some View {
        VStack {
            Text("Average Income")
                .font(.title.bold())
            
            VStack {
                HStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 50, height: 15)
                    
                    Text("CA")
                }
                
                HStack {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 50, height: 15)
                    
                    Text("NY")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            
            HStack(alignment: .bottom, spacing: 20) {
                let x = UIScreen.main.bounds.height / maxAmount / 3
                
                ForEach(incomes, id: \.year) { income in
                    VStack {
                        HStack(alignment: .bottom, spacing: 0) {
                            ForEach(income.states, id: \.name) { state in
                                VStack {
                                    Text(String(format: "%.f", state.amount))
                                    
                                    Rectangle()
                                        .fill(state.name == "CA" ? .blue : .red)
                                        .frame(width: 25, height: state.amount * x)
                                }
                            }
                        }
                                
                        Text(String(income.year))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        StateIncome(name: "CA", amount: 68),
        StateIncome(name: "NY", amount: 89)
    ]),
    Income(year: 2020, states: [
        StateIncome(name: "CA", amount: 80),
        StateIncome(name: "NY", amount: 98)
    ])
]

struct BarExample_Previews: PreviewProvider {
    static var previews: some View {
        BarExample()
    }
}
