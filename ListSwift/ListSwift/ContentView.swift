import SwiftUI
struct Pokemon {
    let name: String
    let type: String
    let color: Color
}

struct ContentView : View {
    var pokemonList = [
        Pokemon(name: "Charmander", type: "Fire", color: .red),
        Pokemon(name: "Squirtle", type: "Water", color: .blue),
        Pokemon(name: "Bulbasaur", type: "Grass", color: .green),
        Pokemon(name: "Pikachu", type: "Electric", color: .yellow),
    ]
    var body: some View {
        NavigationView {
            List(pokemonList, id: \.name) { pokemon in
                CellForRow(cellData: pokemon)
            }.navigationBarTitle("Pokemon's")
        }
    }
}

struct CellForRow: View {
    let cellData: Pokemon
     @State private var showingAddUser = true
    var body: some View {
        HStack(spacing: 10) {
            Text(cellData.name)
            Text(cellData.type).foregroundColor(cellData.color)
            Spacer()
            Button(action: self.buttonAction) {
                Image(systemName: "chevron.right")
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.black)
            }
        }
    }
    
    private func buttonAction() {
        let link = NavigationLink(destination: ScrollContentView(),
                       isActive: $showingAddUser) {
                        Text("Navigate")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ScrollContentView: View {
    var pokemonList = [
        Pokemon(name: "Charmander", type: "Fire", color: .red),
        Pokemon(name: "Squirtle", type: "Water", color: .blue),
        Pokemon(name: "Bulbasaur", type: "Grass", color: .green),
        Pokemon(name: "Pikachu", type: "Electric", color: .yellow),
        Pokemon(name: "Charmelion", type: "Fire", color: .red),
        Pokemon(name: "Wartotle", type: "Water", color: .blue),
        Pokemon(name: "Ivysaur", type: "Grass", color: .green),
        Pokemon(name: "Pichu", type: "Electric", color: .yellow),
        Pokemon(name: "Charizard", type: "Fire", color: .red),
        Pokemon(name: "Blastoize", type: "Water", color: .blue),
        Pokemon(name: "Venasaur", type: "Grass", color: .green),
        Pokemon(name: "Raichu", type: "Electric", color: .yellow),
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(pokemonList, id: \.name) { pokemon in
                CellForRow(cellData: pokemon)
            }
        }
    }
}

struct ScrollContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContentView()
    }
}
