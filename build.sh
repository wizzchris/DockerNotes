#!/bin/env bash
docker build -t dockernotes_app -f appdockerfile .
docker build -t dockernotes_db -f dbdockerfile .
