//go:build transparent

package main

import "github.com/wailsapp/wails/v3/pkg/application"

var isFrameless = true

func configureWindow(app *application.App) {
	app.Window.NewWithOptions(application.WebviewWindowOptions{
		Title:            "wails-template",
		Width:            600,
		Height:           900,
		Frameless:        true,
		BackgroundColour: application.NewRGB(0, 0, 0),
		BackgroundType:   application.BackgroundTypeTransparent,
		Windows: application.WindowsWindow{
			DisableFramelessWindowDecorations: true,
		},
	})
}
