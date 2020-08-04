# Remove Balance from iPKO pdfs

## How it works?

Imagemagick split pdf's into `jpg` files, later Imagemagick put white rectangle onto `balance` places.
After this operations, we back merge to `pdf` files. That's all.

## Dependencies

1. Install ImageMagick
2. Make sure `/etc/ImageMagick-6/policy.xml` has proper settings

```
<policy domain="coder" rights="read|write" pattern="PDF" />
```

## How to use it?

1. Copy your `pdf` files from https://ipko.pl (transaction history) to catalog: `files`
2. Open `Terminal` or your shell with `bash` and run:

```
run.sh
```

3. When script finished, you got files in `merged` catalog.
