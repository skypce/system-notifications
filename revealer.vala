using Gtk;
public class RevealerSample: Gtk.Window {
    public RevealerSample () {
        Object (type: Gtk.WindowType.TOPLEVEL);

        this.set_size_request (300, 300);
        this.title = "Test Gd.Revealer widget";
        this.hide_titlebar_when_maximized = false;

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        Gtk.ToggleButton button = new Gtk.ToggleButton.with_label ("Revealed");
        box.pack_start (button, false, true, 0);
        // the above line is equivalent to box.add (button);
        this.add (box);

        Gtk.Revealer revealer = new Gtk.Revealer ();
        Gtk.Entry entry = new Gtk.Entry ();
        revealer.add (entry);
        box.pack_start (revealer, false, true, 0);

        button.bind_property ("active", revealer, "reveal-child");
    }

    public override void destroy () {
        Gtk.main_quit ();
    }

    public static void main (string[] args) {
        Gtk.init (ref args);

        var rs = new RevealerSample ();
        rs.show_all ();

        Gtk.main ();
    }
}