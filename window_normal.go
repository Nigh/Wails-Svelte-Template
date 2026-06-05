//go:build !transparent

package main

import "github.com/wailsapp/wails/v2/pkg/options"

var isFrameless = false

func configureWindow(opts *options.App) {
	opts.BackgroundColour = &options.RGBA{R: 27, G: 38, B: 54, A: 1}
}
