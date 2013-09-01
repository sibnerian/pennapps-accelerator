Router.map ->
	@route 'home', {path: '/', layout: 'layout'}, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('home')
	@route 'notFound', { path: '*' }, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('notFound')




Router.configure
	layout: 'layout',
	loadingTemplate: 'loading'
