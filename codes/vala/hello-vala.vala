using GLib;

public class Main : Object
{
    public Main ()
    {
        var book = new Book("1234", "A new book");
        book.printISBN ();
        book.addAuthor("Tong Hui");
        book.addAuthor("Bin Li");
        book.printAuthors();

        var store = new BookStore(book, 4.2, 10);
        stdout.printf ("Initial stock is %d\n", store.getStock());
        stdout.printf ("Initial price is $ %f\n", store.getPrice());
        store.removeStock(4);
        store.setPrice(5.0);
        stdout.printf ("Stock is %d\n", store.getStock());
        stdout.printf ("and price is now $ %f\n", store.getPrice());
        var status = "still available";
        if (store.isAvailable() == false) {
            status = "not available";
        }
        stdout.printf ("And the book is %s\n", status);
    }
    static int main (string[] args)
    {
        stdout.printf ("Hello, world\n");
        var main = new Main();
        return 0;
    }
}
