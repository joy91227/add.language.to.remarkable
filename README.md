This is a bash script intended to simplify the process of loading a new type of font to ReMarkable.

##Use cases:
1. Adding a language that is not supported by ReMarkable i.e. Chinese, Korean, Japanese
2. Adding a font style you like.

##First Step, adding your own fonts:
1. download a font package you want from https://www.google.com/get/noto/help/cjk/
2. after downloading the fonts, copy the .otf files and paste them into ~/add.font.remarkable/fonts
3. continue to follow usage instructions

##Second, usage:
```
$ git clone repository-url
$ chmod +x ./addFontToReMarkable.sh
$ ./addFontToReMarkable.sh
```
1. you will be prompted for IP and password input. These can be located by going into settings>>about>>general information section on your ReMarkable and scrolling all the way to the bottom.
2. after the script runs, restart your device and open a book of your choice. Click on text settings and change the font.