
<script lang="ts">
	import { Greet, LogPrintln } from "../wailsjs/go/main/App.js"
	import avatar from "./assets/images/onimai.png"
	const initText = "Please enter your name below 👇"
	let resultText: string = initText
	let name: string = ""
	let inputStyle: string = "input-primary"
	let avatarImg: string = avatar
	function greet(): void {
		if (name.length > 0) {
			inputStyle = "input-primary"
			Greet(name).then((result) => (resultText = result))
		} else {
			resultText = initText
			inputStyle = "input-error"
		}
	}

	function onFileInputChange(event: Event): void {
		const input = event.target as HTMLInputElement;
		const file = input.files[0];
		if (file) {
			LogPrintln(file.name);
			avatarImg = URL.createObjectURL(file);
		}
	}

	function reset(): void {
		avatarImg = avatar
		resultText = initText
		inputStyle = "input-primary"
		name = ""
	}
</script>

<main>
	<div class="flex flex-col justify-center w-screen h-screen">
		<div class="justify-center">
			<div class="text-center">
					<div class="avatar mb-8 cursor-pointer" on:click={() => document.getElementById("fileInput").click()}>
						<div
							class="ring ring-offset-4 ring-offset-base-100 ring-primary w-24 rounded-full"
						>
							<div class="overlay">Change Avatar</div>
							<img src={avatarImg} />
						</div>
					</div>
					<input
						type="file"
						id="fileInput"
						accept="image/*"
						class="hidden"
						on:change={onFileInputChange}
					/>
			</div>
			<h1 class="text-3xl font-bold">
				Wails-Svelte-DaisyUI-Tailwindcss<br />Template
			</h1>
			<div class="result mt-4" id="result">{resultText}</div>
			<div class="flex w-full justify-center">
				<label
					class="input input-bordered {inputStyle} flex grow items-center gap-2 max-w-[400px]"
				>
					<svg
						xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 16 16"
						fill="currentColor"
						class="h-4 w-4 opacity-70"
					>
						<path
							d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z"
						/>
					</svg>
					<input
						type="text"
						class="grow"
						bind:value={name}
						placeholder="Username"
					/>
				</label>
			</div>
			<div class="flex w-full mt-4 justify-center">
				<div class="flex max-w-[400px] grow gap-4">
					<button class="btn btn-success grow" on:click={greet}
						>Greet</button
					>
					<button class="btn btn-warning grow" on:click={reset}
						>Reset</button
					>
				</div>
			</div>
		</div>
	</div>
</main>

<style lang="postcss">
	:global(html) {
		background-color: theme(colors.black);
	}
	.overlay {
            position: absolute;
			user-select: none;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .avatar:hover .overlay {
            opacity: 1;
        }
</style>
