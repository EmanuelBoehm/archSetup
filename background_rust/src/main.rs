use structopt::StructOpt;
use std::path::PathBuf;
use std::{fs, io};
use std::process::Command;
use rand::Rng;

/// Search for a pattern in a file and display the lines that contain it.
#[derive(StructOpt, Debug)]
#[structopt(name = "basic")]
struct Cli {
    /// The pattern to look for
    #[structopt(short="i", long)]
    program: Option<String>,
    /// The path to the file to read
    #[structopt(short, long, parse(from_os_str))]
    path: Option<PathBuf>,
}

fn main() {
    let args = Cli::from_args();

    let dest = match args.path {
        Some(x) => x,
        None    => default_folder(),
    };
    match args.program {
        Some(x)=> {
            match &x[..] {
                "wal" => wal(dest),
                "feh" => feh(dest),
                _ => wal(dest),
            }
        },
        None => feh(dest),
    };

}
fn push_rand_file(mut path: PathBuf) -> PathBuf{
    let entries = fs::read_dir(&path).unwrap()
        .map(|res| res.map(|e| e.path()))
        .collect::<Result<Vec<_>, io::Error>>().unwrap();

    let file = &entries[rand::thread_rng().gen_range(1,entries.len())];
    path.push(file);
    path
}
fn feh(mut path: PathBuf) {
    //path = push_rand_file(path);

    // The entries have now been sorted by their path.

    Command::new("feh")
    .arg("--bg-scale")
    .arg(path)
    .output()
    .expect("failed to change background");
}
//checks if program exists
fn wal(path: PathBuf) {
    Command::new("wal")
    .arg("-i")
    .arg(path)
    .output()
    .expect("failed to change background");
}

fn default_folder() -> PathBuf {
    let mut res = "";
    for path in ["$HOME/Wallpaper","/home/emi/Wallpapers","$HOME/.local/Wallpaper"].iter() {
        if fs::metadata(path).is_ok() {
            res = path;
        }
    };
    if res != "" {
        PathBuf::from(res)
    } else {
        PathBuf::from("/usr/share/wallpaper")
    }

}
