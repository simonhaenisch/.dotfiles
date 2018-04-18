// see https://hyper.is#cfg

module.exports = {
	config: {
		fontSize: 13,
		fontFamily: '"Source Code Pro", Menlo, monospace',

		cursorColor: 'tomato',
		cursorShape: 'UNDERLINE',
		cursorBlink: true,

		foregroundColor: 'whitesmoke',
		backgroundColor: '#252120',
		selectionColor: 'rgba(245, 245, 245, 0.3)', // transparent smokewhite
		borderColor: 'tomato',
		colors: {
			black: 'black',
			red: 'tomato',
			green: 'mediumseagreen',
			yellow: 'gold',
			blue: 'steelblue',
			magenta: 'mediumvioletred',
			cyan: 'mediumturquoise',
			white: 'whitesmoke',
			lightBlack: 'dimgray',
			lightRed: 'salmon',
			lightGreen: 'mediumspringgreen',
			lightYellow: 'khaki',
			lightBlue: 'lightskyblue',
			lightMagenta: 'hotpink',
			lightCyan: 'cyan',
			lightWhite: 'white',
		},

		env: {},

		bell: false,
		copyOnSelect: true,
	},

	plugins: [],
	localPlugins: [],
	keymaps: {},
};
