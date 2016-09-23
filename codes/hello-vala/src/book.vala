using GLib;
public class Book : Object {
	private string title;
	private string isbn;
	public Book(string isbn, string title) {
		this.isbn = isbn;
		this.title = title;
	}
	public void printISBN() {
		stdout.printf("%s\n", isbn);
	}
	public void printTitle() {
		stdout.printf("%s\n", title);
	}
}
