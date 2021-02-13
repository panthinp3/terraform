resource "aws_s3_bucket" "my_bucket" {
  bucket = "nabin-web-01"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
  }
  versioning {
    enabled = false
  } 
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

}

resource "aws_s3_bucket_object" "Nabin-Web-01-index" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "index"
  source = "../modules/web/html/index.html"
  content_type = "html"
  acl = "public-read"
}


resource "aws_s3_bucket_object" "Nabin-Web-01-error" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "error"
  source = "../modules/web/html/error.html"
  content_type = "html"
  acl = "public-read"
}


