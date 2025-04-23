# My Dotfile setup

I'll add more to this gradually. But for now this is it!

This setup was mostly adapted from [This atlassian tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

## Script to copy these dotfiles

The following snipped clones this dotfile repository and sets up all needed dotfiles

```bash
git clone --bare git@github.com:B4T3S/dot.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```

>[!Note]
> If the checkout fails here, it might be because git is trying to override existing files. Simply back them up or delete them, then re-run `config checkout`

## Other software that I usually run with:
- [Albert](https://github.com/albertlauncher/albert)
- [Fish](https://github.com/fish-shell/fish-shell)
