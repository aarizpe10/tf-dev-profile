module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "terraform-aws-modules-example.com" = {
      comment = "terraform-aws-modules-example.com"
      tags = {
        env = "production"
      }
    }
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"
  zone_name = keys(module.zones.route53_zone_zone_id)[0]

  records = [
    {
      name = "hostedZones"
      type = "A"
      alias = {
        name    = "testings3arizpe.s3-website.${var.AWS_REGION}.amazonaws.com"
      }
    },
    {
      name = "www.adrian-arizpe.com	"
      type = "A"
      ttl  = 3600
      records = [
        "10.10.10.10",
      ]
    },
  ]

  depends_on = [module.zones]
}