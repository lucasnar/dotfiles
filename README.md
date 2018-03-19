# Dotfiles

My personal dotfiles created based on this [Hacker News' thread](https://news.ycombinator.com/item?id=11070797) and [this article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Setting up

To my future self: to setup this dotfiles locally, run the following commands.

```
cd $HOME
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/lucasnar/dotfiles.git dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -rf dotfiles-tmp
source .bash_profile
gdot config status.showUntrackedFiles no
```

Feel free to contact me at lucasnar@gmail.com if you have any questions. :)
