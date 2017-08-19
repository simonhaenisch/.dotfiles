module.exports = {
	config: {
		fontSize: 13,
		fontFamily: '"Source Code Pro", monospace',
		cursorShape: 'UNDERLINE',

		padding: '12px 14px',

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

		shellArgs: ['--login'],

		env: {},

		bell: 'SOUND',

		copyOnSelect: true,
	},

	plugins: [
		'hyper-blink',
		'hyperlinks',
		'hyperterm-alternatescroll',
		'hyper-sierra-vibrancy',
	],

	localPlugins: [],
};
