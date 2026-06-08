//go:build !transparent

package main

import "github.com/wailsapp/wails/v3/pkg/application"

var isFrameless = false

func configureWindow(app *application.App) {
	app.Window.NewWithOptions(application.WebviewWindowOptions{
		Title:            "wails-template",
		Width:            600,
		Height:           900,
		BackgroundColour: application.NewRGB(27, 38, 54),
	})
}
