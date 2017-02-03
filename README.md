![megadots][]

## Bits and bobs

I started off with a modified version of my own dotfiles, based on
[Holman's][holman/dotfiles], but have slowly been updating it to be
more akin to what [Pengwynn][pengwynn/dotfiles] and
[Yonk][adamyonk/dotfiles] have built/modified.

Check theirs out, or many others at [octodots][dotfiles].

![screencap][]

## Get your own ##

If you're new to dotfiles, this probably isn't the best starter repository for
you. While these started as a clone of [Holman's][holman/dotfiles], many
utilities are unique to my workflow. I recommend other [dotfile frameworks][dotfiles]
out there.

### Installation ###

If you want to kick the tires, then simply:

- `git clone https://github.com/megalithic/bits-and-bobs.git ~/.dotfiles`
- `cd ~/.dotfiles`
- `setup/bootstrap`

The install script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though. All files and folders ending in `.symlink` get, you guessed it,
symlinked. For example: `~/.dotfiles/vim/vimrc.symlink` gets symlinked to
`~/.vimrc`.

This also sets up things like homebrew if you're on a mac, and even allows for a
private repository setup.

I highly recommend you dig into the scripts and configs to see what all
is going on before you willy-nilly install a stranger's shell scripts. :)

## Main elements ##

A few of the flavors I roll with:

- Homebrew
- Hammerspoon
- 24-bit color patched version of [tmux](https://github.com/choppsv1/homebrew-term24)
- Teamocil for automagic tmux layouts
- Several shell scripts for getting the info I want on my tmux statusbar (take
a gander at `~/.dotfiles/bin` for `tmux-` prefixed scripts).
- Font: Source Code Pro (patched with powerline, octicon, fontawesome glyphs)
- iTerm2 colorscheme: base16-ocean dark
- Neovim colorscheme: base16-ocean dark
- Zsh prompt: a base of [pure](https://github.com/sindresorhus/pure), with some
modified VCS functionality (for super in-depth vcs status output).
- Weechat

The file hierarchy:

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.

## .localrc and sensitive data
![Keep it secret, keep it safe](https://dl.dropboxusercontent.com/u/81794/secret_safe.jpg)

Use `~/.localrc` as your location for sensitive information. Optionally, you
can let `setup/bootstrap` handle the cloning of your private repo to
~/.dotfiles/private, which will execute an install script, assuming it's
located at `~/.dotfiles/private/install.sh`.

## Handy references ##

- [nerd fonts!!!!](https://github.com/ryanoasis/nerd-fonts)
- [patched fonts](https://github.com/powerline/fonts) [more (with tools)](https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy)
- [xterm color chart](https://raw.github.com/foize/go.sgr/master/xterm_color_chart.png)
- [https://github.com/herrbischoff/awesome-command-line-apps][]
- [https://github.com/herrbischoff/awesome-osx-command-line][]

## Those that came before me ##

My original dotfiles and this revamped version began as a fork of
(and is heavily inspired by) [Zach Holman's dotfiles][holman/dotfiles],
whose topic-based symlinking approach makes this so easy.

I also have stolen freely from:

* [Wynn Netherland](https://github.com/pengwynn/dotfiles)
* [Adam Yonk](https://github.com/adamyonk/dotfiles)
* [Zach Holman](https://github.com/holman/dotfiles)
* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
* [Yan Pritzker](https://github.com/skwp/dotfiles)
* [Josh Clayton](https://github.com/joshuaclayton/dotfiles)
* [Adam Jahnke](https://github.com/adamyonk/dotfiles)
* [Tom Ryder](https://github.com/tejr/dotfiles)
* [Steve Losh](https://github.com/sjl/dotfiles)

## Share your dots

If you've got a great set of dots (or want to get started), check out
[dotfiles.github.com][dotfiles]. Ping @[octodots][] with great dot sets
you've found or tips and tricks for your favorite tools. If you have any
questions about my specific setup here, feel free to hit me up at @[megalithic].

[dotfiles]: http://dotfiles.github.com
[octodots]: https://twitter.com/octodots
[megalithic]: https://twitter.com/megalithic
[yonk]: https://twitter.com/adamyonk
[pengwynn]: https://twitter.com/pengwynn
[holman/dotfiles]: https://github.com/holman/dotfiles
[pengwynn/dotfiles]: https://github.com/pengwynn/dotfiles
[adamyonk/dotfiles]: https://github.com/adamyonk/dotfiles
[megadots]:
https://dl.dropboxusercontent.com/u/81794/megadotfiles.png
[screencap]:
https://dl.dropboxusercontent.com/u/81794/screencap.png
