
SCHEMES_DIR = schemes
SCHEMES_FZZ = $(shell find $(SCHEMES_DIR) -name "*.fzz")
#SCHEMES_BB = $(SCHEMES_FZZ:%.fzz=%_breadboard.png)
SCHEMES_SCH = $(SCHEMES_FZZ:%.fzz=%_schematic.png)
CHAPTERS = $(shell find chapters -name "*.tex")

# %_breadboard.svg %_schematic.svg: %.fzz
#	fritzing -svg $(SCHEMES_DIR) $<

# %_nologo.svg: %.svg
#	./bin/unwatermark.py $< $@

#%_breadboard_fixed.svg: %_breadboard.svg
#	./bin/fzfixbb.py --breadboard postproc/halfbb.svg --arduino postproc/arduino.svg $< $@

#%_breadboard.rgb.png: %_breadboard_fixed.svg
#	inkscape --without-gui --export-area-drawing --export-dpi=300 --export-png=$@ $<

#%_breadboard.png: %_breadboard.rgb.png
#	convert $< -colorspace Gray +level 13%,100%,2.1 $@

#%_schematic.png: %_schematic_nologo.svg
#	inkscape --without-gui --export-area-drawing --export-dpi=300 --export-png=$@ $<

book.pdf: book.tex $(CHAPTERS)
	pdflatex -interaction=nonstopmode $< || true
	pdflatex -interaction=nonstopmode $< || true

#teacher.amperka.iso:
#	mkisofs -volid Amperka -follow-links -joliet -rational-rock -o $@ cd

all:
	book.pdf

.PHONY:
	all

.SECONDARY:
