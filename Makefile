# Recolor the unlock logo and build the Plymouth preview.
# Colors are read from colors.toml.

logo := unlock.png
background := $(shell awk -F'"' '/^background =/{print $$2; exit}' colors.toml)
foreground := $(shell awk -F'"' '/^foreground =/{print $$2; exit}' colors.toml)

DISTDIR := dist/the-invincible
THEME_NAME := the-invincible
USER_THEME := $(HOME)/.config/omarchy/themes/$(THEME_NAME)

.PHONY: all preview clean dist install

all: dist

preview:
	omarchy plymouth preview '$(background)' '$(foreground)' $(logo) preview-unlock.png

# omarchy theme install always git-clones, so the installed copy has .git and
# Omarchy drops hyprland.lua. There is no official install path that keeps Lua.
# Stage a .git-free tree, copy it into the user themes dir, then apply it.
dist:
	rm -rf $(DISTDIR)
	mkdir -p $(DISTDIR)
	rsync -a --exclude '.git' --exclude '/dist' ./ $(DISTDIR)/

install: dist
	mkdir -p $(dir $(USER_THEME))
	rm -rf $(USER_THEME)
	cp -a $(DISTDIR) $(USER_THEME)
	omarchy theme set $(THEME_NAME)

clean:
	rm -f preview-unlock.png
	rm -rf dist
