#!/bin/sh

cp site/img/remote/* img/remote/
cp site/img/* img/
git status
git add img/
git commit -m "Persist images"
