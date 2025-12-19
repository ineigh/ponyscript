#!/bin/bash
tracks=("lcmc" "mmm" "mg" "tf" "cm" "dks" "wgm" "dc" "kc" "mt" "gv" "ddr" "mh" "bcw" "rr" "rPB" "rYF" "gv2" "rMR" "rSL" "rSGB" "dsds" "rWS" "rDH" "bc3" "dkjp" "rMC" "mc3" "rPB" "dkm" "rBC")

for track in "${tracks[@]}"; do
    mkdir -p "$track"
done
