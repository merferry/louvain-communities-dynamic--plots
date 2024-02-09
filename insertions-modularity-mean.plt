set term pdf
set terminal pdf size 4in,3.6in
set output 'insertions-modularity-mean.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set format x "10^{%L}"
set grid y
set key above font ",12"


## Set line styles
set style line  1 linewidth 2 linetype 6 pointtype 5 dashtype 1
set style line  2 linewidth 2 linetype 7 pointtype 9 dashtype 1
set style line  3 linewidth 2 linetype 2 pointtype 2 dashtype 1
set style line  4 linewidth 2 linetype 8 pointtype 3 dashtype 1


## Draw plot
set logscale x 10
set yrange [0:]
set ytics 0.2
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Modularity}'
plot 'insertions.csv' \
     using 4:($9 ) title 'Static' linestyle  1 with linespoints, \
  '' using 4:($10) title 'ND'     linestyle  2 with linespoints, \
  '' using 4:($11) title 'DS'     linestyle  3 with linespoints, \
  '' using 4:($12) title 'DF'     linestyle  4 with linespoints




## Columns in CSV file.
# 01. graph
# 02. batch_deletions_fraction
# 03. batch_insertions_fraction
# 04. batch_fraction
# 05. lousta-t
# 06. lounai-t
# 07. loudel-t
# 08. loufro-t
# 09. lousta-m
# 10. lounai-m
# 11. loudel-m
# 12. loufro-m
