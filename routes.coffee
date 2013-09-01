Router.map ->
	@route 'home', {path: '/', layout: 'layout'}, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('home')

Router.configure
	layout: 'layout',
	notFoundTemplate: 'notFound',
	loadingTemplate: 'loading'
