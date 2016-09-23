using GLib;
using Gee;

public class Book : Object {
    private string title;
    private string isbn;
    private ArrayList<string> authors;

    public Book(string isbn, string title) {
        this.isbn = isbn;
        this.title = title;
        authors = new ArrayList<string>();
    }

    public void addAuthor(string author) {
        authors.add(author);
    }

    public void printISBN() {
        stdout.printf("%s\n", isbn);
    }

    public void printTitle() {
        stdout.printf("%s\n", title);
    }

    public void printAuthors() {
        foreach (var author in authors) {
            stdout.printf("Author name: %s\n", author);
        }
    }
}
