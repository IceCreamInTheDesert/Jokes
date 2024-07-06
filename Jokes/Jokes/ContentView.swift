import SwiftUI

struct Jokes: Identifiable {
    var id = UUID()
    var setup: String
    var punchline: String
}

var jokes = [
    Jokes(setup: "Why couldn't the bicycle stand up?", punchline: "It was two tired!"),
    Jokes(setup: "Why did the chicken cross the road?", punchline: "To get to the other side!"),
    Jokes(setup: "Is this pool safe for diving?", punchline: "It deep ends"),
    Jokes(setup: "Did you hear about the cheese factory that exploded in France?", punchline: "There was nothing left but de Brie"),
    Jokes(setup: "What did the Buddhist monk say to the hot dog vendor?", punchline: "Make me one with everything."),
    Jokes(setup: "How do you create light with water?", punchline: "Clean the windows."),
    Jokes(setup: "What do you call a bagel that can fly?", punchline: "A plain bagel.")
]

struct ContentView: View {
    
    @State var currJoke = 0
    @State var punchlineShown = false
    @State var alertShown = false
    @State var goodJokes = 0
    
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .onTapGesture {
                    if punchlineShown {
                        alertShown = true
                    }
                    if ((currJoke < (jokes.count - 1)) && punchlineShown) {
                        currJoke += 1
                        punchlineShown = false
                    } else if (punchlineShown) {
                        currJoke = 0
                        punchlineShown = false
                    }
                }
            
            VStack {
                Text(jokes[currJoke].setup)
                    .padding()
                
                Button {
                    punchlineShown = true
                } label: {
                    Text("Find out")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .mask(RoundedRectangle(cornerRadius: 8))
                }
                .padding()
                
                
                Text(jokes[currJoke].punchline)
                    .padding()
                    .opacity( punchlineShown ? 1 : 0)
                
                Text("🤣🤣🤣")
                    .padding()
                    .opacity( punchlineShown ? 1 : 0)
                
                
                Text("Tap anywhere to continue")
                    .italic()
                    .padding()
                    .opacity( punchlineShown ? 1 : 0)
                
                Text("Good jokes: \(goodJokes)")
                    .bold()
                
            }
            .padding()
        }
        .alert("Did you like the last joke?", isPresented: $alertShown) {
            Button {
                goodJokes+=1
            } label: {
                Text("These jokes are funny!!!")
            }
            Button {
                
            } label: {
                Text("I hate it make better jokes!!!")
            }
            Button {
                goodJokes+=10
            } label: {
                Text("Ok")
            }
        }
    }
}
