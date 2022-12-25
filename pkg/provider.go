package pkg 

import(
	"context"

  tfprovider "github.com/hashicorp/terraform-plugin-framework/provider"
 "github.com/hashicorp/terraform-plugin-framework/provider/schema"
  "github.com/hashicorp/terraform-plugin-framework/datasource"
  "github.com/hashicorp/terraform-plugin-framework/resource"
)

type Provider struct{

}

func NewProvider() tfprovider.Provider{
	return &Provider{}
}

func(*Provider)	Schema(ctx context.Context, req tfprovider.SchemaRequest, resp *tfprovider.SchemaResponse){
	resp.Schema = schema.Schema{}
}

func (p *Provider) Metadata(_ context.Context, _ tfprovider.MetadataRequest, resp *tfprovider.MetadataResponse) {
  resp.TypeName = "demo"
}

func(*Provider)	Configure(context.Context, tfprovider.ConfigureRequest, *tfprovider.ConfigureResponse){
	return
}

func(*Provider)	DataSources(context.Context) []func() datasource.DataSource{
	return []func() datasource.DataSource{
	}
}

func(*Provider)	Resources(context.Context) []func() resource.Resource{
	return []func()resource.Resource{}
}
