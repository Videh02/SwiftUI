import SwiftUI
struct Pokemon {
    let name: String
    let type: String
    let color: Color
}

struct ContentView: View {
    @State private var selectedIndex = 0
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Picker("", selection: $selectedIndex) {
                    Text("Pokemon").tag(0)
                    Text("Evolution").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if selectedIndex == .zero {
                    ListView()
                } else {
                    ScrollContentView()
                }
            }
        }.navigationBarTitle("Pokemon's")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView: View {
    var pokemonList = [
        Pokemon(name: "Charmander", type: "Fire", color: .red),
        Pokemon(name: "Squirtle", type: "Water", color: .blue),
        Pokemon(name: "Bulbasaur", type: "Grass", color: .green),
        Pokemon(name: "Pikachu", type: "Electric", color: .yellow),
    ]
    var body: some View {
        List(pokemonList, id: \.name) { pokemon in
            NavigationLink(destination: PokemonDetail(pokemon: pokemon)) {
                CellForRow(cellData: pokemon)
            }
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
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

struct ScrollContentView: View {
    var pokemonList = [
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
                NavigationLink(destination: PokemonDetail(pokemon: pokemon)) {
                    CellForRow(cellData: pokemon)
                }
            }
        }
    }
}

struct ScrollContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContentView()
    }
}

struct PokemonDetail: View {
    let pokemon: Pokemon
    var body: some View {
        VStack(spacing: 10) {
            Text(pokemon.name).foregroundColor(Color.black)
            Text(pokemon.type).foregroundColor(pokemon.color)
        }
    }
}
