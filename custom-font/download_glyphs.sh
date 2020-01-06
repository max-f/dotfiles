#!/usr/bin/env bash

# Check https://github.com/ryanoasis/nerd-fonts/tree/master/src/glyphs

glyph_arr=("FontAwesome.otf"
    "NerdFontsSymbols 1000 EM Nerd Font Complete Blank.otf"
    "NerdFontsSymbols 2048 EM Nerd Font Complete Blank.otf"
    "Pomicons.otf"
    "PowerlineExtraSymbols.otf"
    "PowerlineSymbols.otf"
    "Symbols Template 1000 em.ttf"
    "Symbols Template 2048 em.ttf"
    "Symbols-1000-em Nerd Font Complete.ttf"
    "Symbols-2048-em Nerd Font Complete.ttf"
    "Unicode_IEC_symbol_font.otf"
    "devicons.ttf"
    "font-awesome-extension.ttf"
    "font-logos.ttf"
    "materialdesignicons-webfont.ttf"
    "octicons.ttf"
    "original-source.otf"
    "weathericons-regular-webfont.ttf")

for i in "${!glyph_arr[@]}"; do
    curl -L https://github.com/ryanoasis/nerd-fonts/blob/master/src/glyphs/"${glyph_arr[$i]}"?raw=true --output src/glyphs/"${glyph_arr[$i]}"
    echo "${glyph_arr[$i]}" loaded
done
