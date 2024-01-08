# Oh-My-Zsh Plugin for Baywatch

> **Warning**
> Baywatch dotfiles must be cloned in the following directory: `$HOME/.baywatch/baywatch-dotfiles`

## Installation

Clone this repository in your custom plugins directory:

```zsh
git clone git@github.com:padok-team/baywatch-zsh-plugin.git $ZSH_CUSTOM/plugins/baywatch
```

Then add the plugin to your `.zshrc`:

```zsh
omz plugin enable baywatch
```

## Baywatch auto-completion

This plugin provides auto-completion for the baywatch command.

## Powerlevel10k Prompt Integration

If you are using the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme, you can add the following to your `.p10k.zsh` to display the current Baywatch client in your prompt:

```diff
 typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    ...
    ...
+   baywatch_client
    # =========================[ Line #2 ]=========================
    ...
    ...
 )
```

## Baywatch aliases and functions

```zsh
b -> baywatch
bo -> baywatch open
bli -> baywatch login
blo -> baywatch logout
bs -> baywatch setup
bck -> baywatch check
bcka -> baywatch check_all
bsw <client> -> go to client directory (works with autocomplete)
bvs <client> -> open client directory in VSCode (works with autocomplete)
```
