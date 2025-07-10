resource "aws_key_pair" "deployer" {
  depends_on = [ time_sleep.wait_10_seconds ]
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-aorozaliev"
  force_destroy = true
}

resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  bucket = "kaizen-aorozaliev"
  key    = "main.tf"
  source = "main.tf"

}

resource "time_sleep" "wait_10_seconds" {
  create_duration = "10s"
}