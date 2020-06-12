use std::process;
use std::str;
fn main() {
let output = process::Command::new("xrandr")
        .arg("--listactivemonitors").output()
        .expect("failed to get active monitors");

    let out = str::from_utf8(&output.stdout).unwrap();
    let monitors = get_monitor(out);
    for mon in monitors {
        println!("{}", mon);
    }
}

fn get_monitor(string :&str) -> Vec<String> {

    let mut monitors: Vec<String> = vec!();
    for line in string.lines() {
        for word in line.split_whitespace(){
            if word.len() > 4 && (&word[0..4] == "HDMI" || &word[0..3] == "DVI") {
                monitors.push(String::from(word));
            }
        }
    }
    monitors
}

