package test

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformCluster(t *testing.T) {

    terraformOptions := &terraform.Options{
        TerraformDir: "../examples/basic-cluster",
    }

    defer terraform.Destroy(t, terraformOptions)

    terraform.InitAndApply(t, terraformOptions)

}
