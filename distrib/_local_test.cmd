echo off
rem examples of usage
rem
rem ruby ./anthill_test.rb
rem ruby ./anthill_test.rb -n test_news_events


Rem: set path 
SET PATH=
SET PATH=%PATH%;D:/Binutils/Ruby192/bin
SET PATH=%PATH%;C:/Binutils/Ruby192/bin
SET PATH=%PATH%;D:/Binutils/Ruby-186-27/bin
SET PATH=%PATH%;C:/Binutils/Ruby-186-27/bin
SET PATH=%PATH%;D:/Binutils/rubygems-1.3.5/bin
SET PATH=%PATH%;C:/Binutils/rubygems-1.3.5/bin

Rem: set enviroment and execute ant script
cd ./../test
ruby ./anthill_test.rb
ruby ./binary_decoder_test.rb
ruby ./binary_encoder_test.rb
ruby ./byte_buffer_test.rb
ruby ./decoder_base_test.rb
ruby ./encoder_base_test.rb
ruby ./outputter_base_test.rb
cd ./../distrib

