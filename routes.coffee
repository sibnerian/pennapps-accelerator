Router.map ->
	@route 'home', {path: '/'}, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('home')
	@route 'about', {path: '/about'}, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('about')
	@route 'apply', {path: '/apply'}, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('application')
	@route 'notFound', { path: '*' }, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('notFound')




Router.configure
	layout: 'layout',
	loadingTemplate: 'loading'
