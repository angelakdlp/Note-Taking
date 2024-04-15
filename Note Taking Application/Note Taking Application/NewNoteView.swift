import SwiftUI

struct NewNoteView: View {
    @Binding var notes: [Note]
    @State private var title: String = ""
    @State private var content: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var isFormValid: Bool {
        !title.isEmpty && !content.isEmpty
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                // Create a text field for the title
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0))
                )
                .foregroundColor(.black)
                .padding(.horizontal, 3)
            
            TextEditor(text: $content)
                //Create a TextEditor for the note
                .padding()
                .background(Color(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0))
                .cornerRadius(10)
                .foregroundColor(.black)
                .padding(.horizontal, 3)
            
            Button(action: {
                // Add note action
                if isFormValid {
                    notes.append(Note(title: title, content: content))
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Add Note")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            .disabled(!isFormValid)
            // Disable button if form is not valid
        }
        .padding()
        .navigationTitle("New Note")
    }
}

