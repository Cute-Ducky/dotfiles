use gtk4::prelude::*;
use gtk4::glib::clone;
use std::process::Command;

fn main() {
    update();
    let application = gtk4::Application::new(
        //Some("com.github.9glenda.dotfiles.welcome"),
        Some("com.github.gtk-rs.examples.orientable_subclass"),
        Default::default(),
    );
    application.connect_activate(|app| {
        let window = gtk4::ApplicationWindow::new(app);
        let bx = gtk4::Box::new(gtk4::Orientation::Vertical, 6);
        //let orientable = CustomOrientable::new();
        let update_button = gtk4::Button::with_label("Update");
        let button2 = gtk4::Button::with_label("Test");

        update_button.connect_clicked(clone!(@strong window =>
            move |_| {
                update();
            }
        ));
        button2.connect_clicked(clone!(@strong window =>
            move |_| {
                println!("Test"); 
            }
        ));
     
        //orientable.set_halign(gtk4::Align::Center);
        bx.append(&button2);
        bx.append(&update_button);
        bx.set_margin_top(18);
        bx.set_margin_bottom(18);
        bx.set_margin_start(18);
        bx.set_margin_end(18);

        window.set_child(Some(&bx));
        window.show();
    });

    application.run();
}
fn update() {
    Command::new("alacritty")
    .args(["--command","sh","-c","cd ~/.dotfiles && task pupdate"])
    .output()
    .expect("failed to execute process");
    //println!("{:?}",out.stdout);
}
