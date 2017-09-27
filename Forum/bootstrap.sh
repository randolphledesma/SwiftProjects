#!/bin/sh
mkdir /tmp/vapor
cd /tmp/vapor
ln -sv /vapor/Package.swift Package.swift
ln -sv /vapor/Sources Sources
ln -sv /vapor/Config Config
vapor build
vapor run serve