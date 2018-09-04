/**
 * @see https://hyper.is#cfg
 */
module.exports = {
	config: {
		fontFamily: '"Source Code Pro", Menlo, monospace',
		fontSize: 11,

		cursorShape: 'UNDERLINE',
		cursorBlink: true,

		backgroundColor: '#1E1E1E',
		borderColor: 'transparent',
		scrollbarColor: 'whitesmoke',

		env: {},

		bell: false,
		copyOnSelect: true,
	},

	plugins: ['hyper-named-css-colors', 'hyper-always-on-top', 'hyper-fading-scrollbar'],
	localPlugins: [],
	keymaps: {},
};
