resource "aws_s3_bucket_policy" "day67_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = data.aws_iam_policy_document.allow_read_only_access.json
}

data "aws_iam_policy_document" "allow_read_only_access" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["193351675856"]
    }
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.my_bucket.arn,
      "${aws_s3_bucket.my_bucket.arn}/*",
    ]
  }
}