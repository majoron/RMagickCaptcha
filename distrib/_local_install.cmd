echo off

Rem: set path 
SET PATH=
SET PATH=%PATH%;D:\Binutils\Ruby-186-27\bin
SET PATH=%PATH%;C:\Binutils\Ruby-186-27\bin
SET PATH=%PATH%;D:\Binutils\rubygems-1.3.5\bin
SET PATH=%PATH%;C:\Binutils\rubygems-1.3.5\bin

echo on
Rem: set enviroment and execute ant script
gem install .\output\rmagick_captcha-0.5.0.gem
rme gem uninstall rmagick_captcha
rem rem gem list --local

