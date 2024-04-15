import SwiftUI

struct EditNoteView: View {
    @Binding var note: Note // Binding to reflect changes back
    @Binding var isEditing: Bool
    @Binding var notes: [Note] // Binding to update notes
    
    var body: some View {
        VStack {
            TextField("Title", text: $note.title)
            // Create a text field for the title
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0))
                )
                .foregroundColor(.black)
                .padding(.horizontal, 3)
            
            TextEditor(text: $note.content)
            //Create a TextEditor for the note
                .padding()
                .background(Color(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0))
                .cornerRadius(10)
                .foregroundColor(.black)
                .padding(.horizontal, 3)
            
            Button(action: {
                isEditing = false
                // Close editing mode
                // Update the notes array with edited note
                if let index = notes.firstIndex(where: { $0.id == note.id }) {
                    notes[index] = note
                }
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Edit Note")
    }
}
