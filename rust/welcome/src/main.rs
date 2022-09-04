use gtk4::prelude::*;
use gtk4::glib::clone;
use std::process::Command;
use std::process::exit;

fn main() {
    let application = gtk4::Application::new(
        //Some("com.github.9glenda.dotfiles.welcome"),
        Some("com.github.gtk-rs.examples.orientable_subclass"),
        Default::default(),
    );
    application.connect_activate(|app| {
        let window = gtk4::ApplicationWindow::new(app);
        let bx = gtk4::Box::new(gtk4::Orientation::Vertical, 6);
        let update_button = gtk4::Button::with_label("Update");
        let wifi_button = gtk4::Button::with_label("Connect to Wifi");
        let quit_button = gtk4::Button::with_label("Quit");
        let label = gtk4::Label::new(Some("Welcome"));

        update_button.connect_clicked(clone!(@strong window =>
            move |_| {
                update();
            }
        ));
        wifi_button.connect_clicked(clone!(@strong window =>
            move |_| {
                Command::new("wpa_gui") 
                .output()
                .expect("failed to execute process");
            }
        ));
        quit_button.connect_clicked(clone!(@strong window =>
            move |_| {
                exit(0);
            }
        ));
     
        //orientable.set_halign(gtk4::Align::Center);
        bx.append(&label);
        bx.append(&update_button);
        bx.append(&wifi_button);
        bx.append(&quit_button); 
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
    .args(["--command","sh","-c","cd ~/.dotfiles && ./task pupdate"])
    .output()
    .expect("failed to execute process");
    //println!("{:?}",out.stdout);
}
