import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}

struct ContentView: View {
    @State private var notes: [Note] = []
    
    var body: some View {
        NavigationView {
            List(notes) { note in
                NavigationLink(destination: DetailNoteView(note: note, notes: $notes)) {
                    Text(note.title)
                }
            }
            .navigationTitle("Notes")
            .background(
                NavigationLink(destination: NewNoteView(notes: $notes)) {
                    EmptyView()
                }
                .frame(width: 0, height: 0)
                .hidden()
            )
            .overlay(
                NavigationLink(destination: NewNoteView(notes: $notes)) {
                    Text("Add Task")
                        .font(.system(size: 35))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: UIScreen.main.bounds.height / 6)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .background(Color.clear)
                        .padding(.horizontal, 0)
                        .padding(.bottom, 0)
                }
                .edgesIgnoringSafeArea(.bottom)
                .offset(y: 40)
                , alignment: .bottom
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
