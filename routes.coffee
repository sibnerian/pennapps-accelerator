HomeController = undefined

Router.map ->
	@route 'home', {path: '/'}, ()->
		@render('navbar', {to: 'navbar', data: false})
		@render('home')
			
