import SwiftUI

struct DetailNoteView: View {
    var note: Note
    @State private var isEditing = false
    @State private var editedNote: Note // Added to store changes
    @Binding var notes: [Note] // Binding to update notes
    
    init(note: Note, notes: Binding<[Note]>) {
        self.note = note
        self._notes = notes
        self._editedNote = State(initialValue: note) // Initialize editedNote state
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if isEditing {
                EditNoteView(note: $editedNote, isEditing: $isEditing, notes: $notes)
            } else {
                Text(note.content)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .background(Color(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding()
                
                Spacer()
            }
        }
        .navigationTitle(note.title)
        .navigationBarItems(trailing:
            Button(action: {
                isEditing = true
                editedNote = note // Pass the original note to editedNote
            }) {
                Text("Edit")
            }
        )
    }
}
