//go:build transparent

package main

import (
	"github.com/wailsapp/wails/v2/pkg/options"
	"github.com/wailsapp/wails/v2/pkg/options/windows"
)

var isFrameless = true

func configureWindow(opts *options.App) {
	opts.Frameless = true
	opts.BackgroundColour = &options.RGBA{R: 0, G: 0, B: 0, A: 1}
	opts.Windows = &windows.Options{
		WebviewIsTransparent:              true,
		WindowIsTranslucent:               true,
		DisableWindowIcon:                 false,
		DisableFramelessWindowDecorations: true,
		WebviewUserDataPath:               "",
		WebviewBrowserPath:                "",
		Theme:                             windows.SystemDefault,
	}
}
