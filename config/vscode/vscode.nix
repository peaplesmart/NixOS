{ pkgs, ... }:
let
  jonathanharty.gruvbox-material-icon-theme =
    pkgs.vscode-utils.buildVscodeMarketplaceExtension
      {
        mktplcRef = {
          name = "gruvbox-material-icon-theme";
          publisher = "JonathanHarty";
          version = "1.1.5";
          hash = "sha256-86UWUuWKT6adx4hw4OJw3cSZxWZKLH4uLTO+Ssg75gY=";
        };
      };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # nix language
      jnoortheen.nix-ide
      # nix-shell suport
      arrterian.nix-env-selector
      # Zig
      ziglang.vscode-zig

      # Color theme
      jdinhlife.gruvbox
      # sainnhe.gruvbox-material
      jonathanharty.gruvbox-material-icon-theme
    ];
    userSettings = {
      "update.mode" = "none";
      "extensions.autoupdate" = false;
      "window.tittleBarStyle" = "custom";

      "window.menuBarVisibility" = " toggle";
      "workbench.iconTheme" = "gruvbox-material-icon-theme";
      "material-icon-theme.folders.theme" = "classic";
      "vsicons.dontShowNewVersionMessage" = true;
      "explorer.confirmDragAndDrop" = false;
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.startupEditor" = "none";

      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.formatOnPaste" = true;
    };
  };
}
