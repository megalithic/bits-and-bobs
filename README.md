
![all the dots](https://dl.dropboxusercontent.com/u/81794/megadotfiles.png)

## megadotfiles

Before you go any further... this is all specific to an OSX install; for my linux fam,
I recommend checking out [@cowboy's dotfiles repo](https://github.com/cowboy/dotfiles), as it has mostly safe
osx/linux alternatives and is also geared towards bash instead of zsh (my preferred shell).

## install

Pre-install stuffs: You'll obviously need git installed; if you're using
10.9+, just hit up `xcode-select --install`, click 'Install' when the
dialog pops up, disco.

Now that the pre-reqs are out of the way, run this:

```sh
curl https://raw.githubusercontent.com/megalithic/dotfiles/master/setup/bootstrap | sh

# OR, failing that, manually clone and run:

git clone https://github.com/megalithic/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
setup/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `setup/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/megalithic/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `setup/bootstrap`.

## .localrc and sensitive data
![Keep it secret, keep it safe](https://dl.dropboxusercontent.com/u/81794/secret_safe.jpg)

Use `~/.localrc` as your location for sensitive information. Optionally, you
can let `setup/bootstrap` handle the cloning of your private repo to
~/.dotfiles/private, which will execute an install script, assuming it's
located at `~/.dotfiles/private/install.sh`.

Handy references

- [patched fonts](https://github.com/powerline/fonts)
- [xterm color chart](https://raw.github.com/foize/go.sgr/master/xterm_color_chart.png)

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `chruby` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/megalithic/dotfiles/issues) and let me know
what's broke so I can sure this thing up!

## thanks

Big up to [@holman](https://github.com/holman/dotfiles) for providing
a solid starting point for having a mostly automated way of quickly
getting a new system (OSX for now) install up and running with preferred environment
tools and workflows.
