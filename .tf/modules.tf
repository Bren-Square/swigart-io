module "app" {
  source = "github.com/Bren-Square/tf-infra/aws/ecs"

  app_name          = local.app_name
  container_version = var.container_version
  tier              = local.tier
}