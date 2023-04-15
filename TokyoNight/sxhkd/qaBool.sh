#!/bin/sh

QA=$(eww get qaBool)
if [ "$QA" = "true" ]
then
  eww update qaBool=false
else
  eww update qaBool=true
fi

