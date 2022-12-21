package main

import (
	"context"
	"log"

	tfprovider "github.com/hashicorp/terraform-plugin-framework/provider"
	"github.com/hashicorp/terraform-plugin-framework/providerserver"

	"github.com/pigfall/terraform-provider-demo/pkg"
)

func main() {
	opts := providerserver.ServeOpts{
		Address: "registry.terraform.io/pigfall/tzzpg",
	}
	err := providerserver.Serve(context.Background(), func() tfprovider.Provider { return pkg.NewProvider() }, opts)
	if err != nil {
		log.Fatal(err.Error())
	}
}

