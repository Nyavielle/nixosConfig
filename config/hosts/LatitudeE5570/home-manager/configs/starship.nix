{ user, hostname, ... }:
{
  home.file.".config/starship.toml".text = ''
    add_newline = true

    format = "${user}@${hostname}: $directory$git_branch\n$character"

    [directory]
    truncation_length = 0
    read_only = "!"
    format = "[$path](bold cyan) [$read_only](bold red)"

    [character]
    success_symbol = "[>](bold green)"
    error_symbol = "[>](bold red)"

    [git_branch]
    format = "[| $branch ](bold cyan)"
  '';
}
