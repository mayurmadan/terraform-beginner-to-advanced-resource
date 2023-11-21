//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
provider "github" {
  token = "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"
}
resource "github_repository" "using-terraform" {
  name        = "using-terraform"
  description = "My awesome codebase"
  visibility = "private"
}
