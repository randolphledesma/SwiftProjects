#!/bin/sh
mkdir /tmp/Forum
cd /tmp/Forum
ln -sv /vapor/Forum/Package.swift Package.swift
ln -sv /vapor/Forum/Sources Sources
ln -sv /vapor/Forum/Config Config
ln -sv /vapor/Forum/Tests Tests
ln -sv /vapor/Forum/Public Public