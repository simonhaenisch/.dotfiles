module.exports = {
	config: {
		updateChannel: 'canary',

		// fontSize: 13,
		fontFamily: '"Source Code Pro", monospace',

		cursorShape: 'UNDERLINE',
		cursorBlink: true,

		colors: {
			black: '#282828',
			red: '#f92672',
			green: '#a6e22e',
			yellow: '#fd971f',
			blue: '#ae81ff',
			magenta: '#66d9ef',
			cyan: '#38ccd1',
			white: '#ffffff',
			lightBlack: '#49483e',
			lightRed: '#f92672',
			lightGreen: '#a6e22e',
			lightYellow: '#fd971f',
			lightBlue: '#ae81ff',
			lightMagenta: '#66d9ef',
			lightCyan: '#38ccd1',
			lightWhite: '#ffffff',
		},

		backgroundColor: 'rgba(0, 0, 0, 0.5)',

		css: '',
		termCSS: '',

		bell: false,

		copyOnSelect: true,

		overlay: {
			animate: false,
			size: 1.0,
			startAlone: true,
			startup: false,
			unique: false,
			hideOnBlur: true,
			tray: false,
			hotkeys: ['Alt+Space'],
		},
	},

	plugins: [
		'hyperlinks',
		// 'hyperterm-alternatescroll', // crashes in canary
		'hyper-statusline',
		'hyperterm-overlay',
	],

	localPlugins: [],
};
