# LuaLaTeX; all auxiliary files and the PDF go to build/
$pdf_mode = 4;
$lualatex = 'lualatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1 %O %S';
$out_dir = 'build';
