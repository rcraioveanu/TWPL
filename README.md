# TWPL LaTeX class

This class provides the style for submissions to the Toronto Working Papers in Linguistics. 

In order to use the style, you will need to have the `TWPL.cls` file in the same directory as your `.tex` file. I recommend using the `TWPLStyleSheet.tex` file as a starting point for your manuscript, skimming through and seeing how everything is structured in that file, and then substituting your own text where appropriate.

### A note about fonts

Small caps fonts in the body text (TNR) use TeX Gyre Termes, as all versions of Times New Roman before Windows 8.1 do not have small caps. If you are using Windows 8.1 or 10, this can be changed in the `.cls` file if you wish.
Small caps fonts in the paper title and section titles (Arial) use TeX Gyre Heros, for similar reasons.

Packages for these fonts should be installed with your LaTeX install, but that does not mean that XeLaTeX will automatically find them. You must install these with the rest of your system fonts, either by copying them from your TeX directory (search your filesystem for `tex-gyre`) or by downloading them from [here](http://www.ctan.org/tex-archive/fonts/tex-gyre/fonts/opentype/public/tex-gyre "TeX Gyre fonts on CTAN"). They must be added to your operating system's font folder.
To prevent these fonts from being loaded, use `notexgyre` as a documentclass option. This will probably only be the case if you don't need small caps or if your TNR and Arial have small caps (Windows 8.1+).

This class file also loads SIL's Doulos font to supplement TNR's character set. If you do not have this font installed, and do not need it for your manuscript, load the documentclass with the option `nodoulos`. If you do need IPA support but do not have Doulos, you can download it from [here](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=doulossil_download "Doulos SIL").


---

If you have questions or have spotted any errors or inconsistencies, I encourage you to email me at radu [dot] craioveanu [at] utoronto [dot] ca.
