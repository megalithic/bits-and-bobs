# @megalithic dotfiles
## a fork of [@holman](https://github.com/holman/dotfiles)'s dotfiles
### which is an offshoot of [@rbates](https://github.com/ryanb/dotfiles)'s dotfiles

## dotfiles

This for now is just a reminder of things i need to setup on a new osx
install. the install script is there, but not complete.. more to come on that
soon enough.

Oh, before i forget, this is all specific to an osx install; for my linux fam
just replace `brew` with `apt-get` (or your package manager of choice on your
distro)

In case you want to see what these dotfiles can get you, check out:
[![Boom!  Awesomeness.](http://cl.ly/image/1d2J0G053I0C/image_large.png)](http://cl.ly/image/1v461h0r3w1l "Bigger++")


## install
Run this:

```sh
git clone https://github.com/megalithic/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

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
  symlinked in when you run `script/bootstrap`.

## localrc
![Keep it secret, keep it safe](http://i.qkme.me/3ppbat.jpg)

Use `~/.localrc` as your location for sensitive information.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rvm` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/holman/dotfiles/issues) on @holman's repo
and i'll periodically merge upstream.

## thanks

Just wanted to thank [@holman](https://github.com/holman/dotfiles) for providing
a solid starting point "framework" for having a mostly automated way of quickly
getting a new system install up and running with your preferred environment
tools and workflows.
