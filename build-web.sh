#! /bin/bash


die()
{
    echo "$*"
    exit 1
}

build_web()
{
    latex '\def\iswebpage{1} \input{cv.tex}'
    tex4ht cv.tex
}

build_pdf()
{
    pdflatex cv.tex
}

echo "Building CV"

echo -n "Which version do you want to make?: [pdf] "
read VERSION
if [ -z "$VERSION" ]; then
    VERSION="pdf"
fi

case "$VERSION" in
    "pdf" )
        build_pdf
        ;;
    "web" )
        build_web
        ;;
    * )
        die "Unrecognised type"
        ;;
esac

