# Hyprtoolkit

Generates background, base, text, and accent colors for applications using Hyprtoolkit.

Enable **Hyprtoolkit** in **Noctalia Settings -> Templates**. The template writes `$XDG_CONFIG_HOME/hypr/hyprtoolkit.conf` (`~/.config/hypr/hyprtoolkit.conf` by default).

Use this with applications that read Hyprtoolkit's configuration. The generated file contains only color assignments and replaces any existing file at that path, so back up custom settings before enabling. There are no hooks, extra command dependencies, or automatic reload commands.
