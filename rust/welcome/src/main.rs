
use gtk4::glib::clone;
use gtk4::glib::signal::Inhibit;
use gtk4::prelude::*;
use std::process::Command;
use std::process::exit;

use std::rc::Rc;

fn main() {
    let application = gtk4::Application::builder()
        .application_id("com.github.gtk-rs.examples.dialog")
        .build();

    application.connect_activate(build_ui);
    application.run();
}

fn build_ui(application: &gtk4::Application) {
    let button = gtk4::Button::builder()
        .label("Update")
        .halign(gtk4::Align::Center)
        .valign(gtk4::Align::Center)
        .build();

    let window = Rc::new(
        gtk4::ApplicationWindow::builder()
            .application(application)
            .title("Welcome")
            .default_width(350)
            .default_height(70)
            .child(&button)
            .visible(true)
            .build(),
    );

    button.connect_clicked(clone!(@strong window =>
        move |_| {
            gtk4::glib::MainContext::default().spawn_local(dialog(Rc::clone(&window)));
        }
    ));

    window.connect_close_request(move |window| {
        if let Some(application) = window.application() {
            application.remove_window(window);
        }
        Inhibit(false)
    });
}

async fn dialog<W: IsA<gtk4::Window>>(window: Rc<W>) {
    let question_dialog = gtk4::MessageDialog::builder()
        .transient_for(&*window)
        .modal(true)
        .buttons(gtk4::ButtonsType::OkCancel)
        .text("Answer OK if you want to update.")
        .build();

    let answer = question_dialog.run_future().await;
    question_dialog.close();

    println!("{}",answer);
    if format!("{}",answer) == format!("ResponseType::Ok") {
            Command::new("alacritty")
            .args(["--command","sh","-c","cd ~/.dotfiles && task pupdate"])
            .output()
            .expect("failed to execute process");
    } else {
        exit(0);
    }
    let info_dialog = gtk4::MessageDialog::builder()
        .transient_for(&*window)
        .modal(true)
        .buttons(gtk4::ButtonsType::Close)
        .text("Update done")
        .secondary_text(&format!("Update done"))
        .build();


    info_dialog.run_future().await;
    info_dialog.close();
    window.close();
}
