#!/bin/bash
 
if [[ "${BLOCK_BUTTON}" -eq 1 ]];
then
	~/repos/galendae/galendae
fi
 
FORMAT="${BLOCK_INSTANCE:-%I:%M %p}"
DATETIME=$(date "+${FORMAT}")
 
echo "${DATETIME}"
