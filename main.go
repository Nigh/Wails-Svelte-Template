package main

import (
	"embed"

	"github.com/wailsapp/wails/v3/pkg/application"
)

//go:embed frontend/dist
var assets embed.FS

func main() {
	app := application.New(application.Options{
		Name: "wails-demo",
		Services: []application.Service{
			application.NewService(&AppService{}),
		},
		Assets: application.AssetOptions{
			Handler: application.AssetFileServerFS(assets),
		},
	})

	configureWindow(app)

	if err := app.Run(); err != nil {
		println("Error:", err.Error())
	}
}
