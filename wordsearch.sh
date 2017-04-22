echo "Cleaning Text"
./textcleaner -g -e stretch -f 25 -o 20 -s 1 $1 textclean_$1

echo "Resizing Text"
convert textclean_$1 -resize 7000x7000 resize_$1

echo "Running Tesseract OCR"
tesseract -psm 6 resize_$1 a

echo "Running OCR.Space OCR"
python ocrspace.py $2 > b.txt

echo " "
echo "OCR Results:"
cat a.txt
cat b.txt

echo "Algorithm Results:"
./wordsearchsolver a.txt b.txt

echo "Cleaning Up"
rm a.txt
rm b.txt
rm resize_$1
rm textclean_$1
