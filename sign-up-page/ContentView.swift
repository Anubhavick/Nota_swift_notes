
import SwiftUI

// MARK: - 1. MAIN ROUTER
struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            // If logged in, show the main app with the sidebar
            AppShellView(isLoggedIn: $isLoggedIn)
        } else {
            // Otherwise, show the login page
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

// MARK: - 2. LOGIN VIEW
struct LoginView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.cyan]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: "note.text.badge.plus")
                    .font(.system(size: 80)).foregroundColor(.white)
                Text("Nota")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text("Your thoughts, organized.")
                    .font(.headline).foregroundColor(.white.opacity(0.8))
                
                Spacer()
                
                // For demo purposes, we will just use a Login button
                Button(action: { isLoggedIn = true }) {
                    Text("Sign In")
                        .font(.headline).foregroundColor(.indigo).padding()
                        .frame(maxWidth: .infinity).background(Color.white)
                        .cornerRadius(15).shadow(color: .black.opacity(0.2), radius: 10, y: 5)
                }
                
                Button("Skip for now") {
                    isLoggedIn = true
                }
                .foregroundColor(.white.opacity(0.8)).padding(.top, 5)
            }
            .padding(30)
        }
    }
}


// MARK: - 3. MAIN APP SHELL WITH SIDEBAR
struct AppShellView: View {
    @Binding var isLoggedIn: Bool
    
    // Source of truth for all notes and settings
    @State private var notes: [Note] = Note.sampleData
    @State private var selectedNoteID: Note.ID?
    @State private var selectedPanel: Panel? = .home // Default to home screen
    @State private var colorScheme: ColorScheme? = nil // nil = system setting
    
    enum Panel: Hashable {
        case home, profile, settings
    }
    
    var body: some View {
        NavigationSplitView {
            // --- SIDEBAR ---
            List(selection: $selectedPanel) {
                Label("Home", systemImage: "house.fill").tag(Panel.home)
                Label("Profile", systemImage: "person.fill").tag(Panel.profile)
                Label("Settings", systemImage: "gearshape.fill").tag(Panel.settings)
            }
            .navigationTitle("Menu")
            
        } content: {
            // --- CONTENT (Main page for each sidebar item) ---
            switch selectedPanel {
            case .home:
                NotesListView(notes: $notes, selectedNoteID: $selectedNoteID)
            case .profile:
                ProfileView(isLoggedIn: $isLoggedIn)
            case .settings:
                SettingsView(selectedColorScheme: $colorScheme)
            case .none:
                Text("Select an item from the menu.")
            }
            
        } detail: {
            // --- DETAIL (Shows the selected note for editing) ---
            if let selectedNoteID = selectedNoteID,
               let index = notes.firstIndex(where: { $0.id == selectedNoteID }) {
                NoteDetailView(note: $notes[index])
            } else {
                VStack {
                    Image(systemName: "note.text").font(.largeTitle).foregroundColor(.secondary)
                    Text("Select a note to view or edit").font(.title2).foregroundColor(.secondary)
                }
            }
        }
        .preferredColorScheme(colorScheme) // Applies the selected theme
    }
}


// MARK: - 4. NOTES LIST VIEW (HOME)
struct NotesListView: View {
    @Binding var notes: [Note]
    @Binding var selectedNoteID: Note.ID?
    
    func addNote() {
        let newNote = Note(title: "New Note", content: "")
        notes.insert(newNote, at: 0)
        selectedNoteID = newNote.id // Automatically select the new note
    }
    
    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    var body: some View {
        List(selection: $selectedNoteID) {
            ForEach($notes) { $note in
                NoteRowView(note: $note)
            }
            .onDelete(perform: deleteNote)
        }
        .navigationTitle("All Notes")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: addNote) {
                    Label("Add Note", systemImage: "plus")
                }
            }
        }
    }
}

// A helper view for a single row in the notes list
struct NoteRowView: View {
    @Binding var note: Note
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title).font(.headline)
                Text(note.content)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1) // Show only one line of content
            }
            Spacer()
            if note.isImportant {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}


// MARK: - 5. NOTE DETAIL/EDITOR VIEW (CORRECTED)
struct NoteDetailView: View {
    @Binding var note: Note
    
    var body: some View {
        VStack {
            HStack {
                TextField("Note Title", text: $note.title)
                    // THIS IS THE CORRECTED LINE:
                    .font(.largeTitle.bold())
                
                Spacer()
                
                Button {
                    note.isImportant.toggle()
                } label: {
                    Label("Toggle Important", systemImage: note.isImportant ? "star.fill" : "star")
                        .labelStyle(.iconOnly)
                        .font(.title2)
                        .foregroundColor(note.isImportant ? .yellow : .gray)
                }
            }
            
            Text("Tip: You can add links like this: www.apple.com")
                .font(.caption)
                .foregroundColor(.secondary)
            
            TextEditor(text: $note.content)
                .font(.body)
                .padding(4)
                .background(Color(uiColor: .systemGroupedBackground)) // Use uiColor for better compatibility
                .cornerRadius(8)
            
        }
        .padding()
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}



// MARK: - 6. SETTINGS VIEW (CORRECTED)
struct SettingsView: View {
    @Binding var selectedColorScheme: ColorScheme?
    
    var body: some View {
        // Using NavigationView here makes the view self-contained and preview correctly.
        NavigationView {
            Form {
                Section("Appearance") {
                    Picker("Theme", selection: $selectedColorScheme) {
                        // THIS IS THE CORRECTED PART:
                        Text("System").tag(nil as ColorScheme?) // Tag for nil value
                        Text("Light").tag(ColorScheme.light as ColorScheme?) // Tag for .light value
                        Text("Dark").tag(ColorScheme.dark as ColorScheme?)   // Tag for .dark value
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Settings")
        }
    }
}




// MARK: - 7. PROFILE VIEW (CORRECTED)
struct ProfileView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.gray)
                
                Text("Jessica Adams")
                    // THIS IS THE CORRECTED LINE:
                    .font(.largeTitle.bold())
                
                Spacer()
                
                Button("Log Out", role: .destructive) {
                    isLoggedIn = false
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
