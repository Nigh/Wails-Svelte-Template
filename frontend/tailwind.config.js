/** @type {import('tailwindcss').Config} */
import daisyui from "daisyui"
export default {
	content: ["./src/**/*.{html,js,svelte,ts}"],
	theme: {},
	plugins: [daisyui],
	daisyui: {
		themes: [
			{
				dark: {
					...require("daisyui/src/theming/themes")["dark"],
					"background-color": "#00000000",
				},
			},
			"night",
		],
	},
}
