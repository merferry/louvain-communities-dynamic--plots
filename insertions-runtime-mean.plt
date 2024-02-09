set term pdf
set terminal pdf size 4in,3.6in
set output 'insertions-runtime-mean.pdf'


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
set logscale y 10
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Runtime (s)}'
plot 'insertions.csv' \
     using 4:($5 /1000) title 'Static' linestyle  1 with linespoints, \
  '' using 4:($6 /1000) title 'ND'     linestyle  2 with linespoints, \
  '' using 4:($7 /1000) title 'DS'     linestyle  3 with linespoints, \
  '' using 4:($8 /1000) title 'DF'     linestyle  4 with linespoints, \
  '' using 4:($5 /1000):($4==1e-7? sprintf("%.1f", $5/$5) : "") with labels notitle offset character 2.2,character 0.6 textcolor linetype 6, \
  '' using 4:($5 /1000):($4>=1e-6 && $4 <1e-1? sprintf("%.1f", $5/$5) : "") with labels notitle offset character 0,character 0.8 textcolor linetype 6, \
  '' using 4:($5 /1000):($4==1e-1? sprintf("%.1f", $5/$5) : "") with labels notitle offset character -2.2,character -1.0 textcolor linetype 6, \
  '' using 4:($6 /1000):($4==1e-7? sprintf("%.1f", $5/$6) : "") with labels notitle offset character 2.2,character 0.6 textcolor linetype 7, \
  '' using 4:($6 /1000):($4>=1e-6 && $4 <1e-2? sprintf("%.1f", $5/$6) : "") with labels notitle offset character 0,character 0.6 textcolor linetype 7, \
  '' using 4:($6 /1000):($4==1e-2? sprintf("%.1f", $5/$6) : "") with labels notitle offset character -1.2,character -0.6 textcolor linetype 7, \
  '' using 4:($7 /1000):($4==1e-7? sprintf("%.1f", $5/$7) : "") with labels notitle offset character 2.2,character -0.6 textcolor linetype 2, \
  '' using 4:($7 /1000):($4>=1e-6 && $4 <1e-2? sprintf("%.1f", $5/$7) : "") with labels notitle offset character 0,character -0.6 textcolor linetype 2, \
  '' using 4:($7 /1000):($4==1e-2? sprintf("%.1f", $5/$7) : "") with labels notitle offset character -1.2,character 0.6 textcolor linetype 2, \
  '' using 4:($7 /1000):($4==1e-1? sprintf("%.1f", $5/$7) : "") with labels notitle offset character -2.2,character 0.4 textcolor linetype 2, \
  '' using 4:($8 /1000):($4==1e-7? sprintf("%.0f", $5/$8) : "") with labels notitle offset character 2.2,character -0.4 textcolor linetype 8, \
  '' using 4:($8 /1000):($4>=1e-6 && $4 <1e-1? sprintf("%.0f", $5/$8) : "") with labels notitle offset character 0,character -0.7 textcolor linetype 8, \
  '' using 4:($8 /1000):($4==1e-1? sprintf("%.1f", $5/$8) : "") with labels notitle offset character -1.7,character -1.5 textcolor linetype 8




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
