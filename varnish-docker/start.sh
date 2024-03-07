#!/bin/bash -
set -e

exec bash -c \
	"exec varnishd -F \
	-a :8080 \
	-f $VCL_CONFIG \
	-s malloc,$CACHE_SIZE \
	$VARNISHD_PARAMS"


