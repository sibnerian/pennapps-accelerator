Session.setDefault "submissions", false

Template.admin.helpers
    submissions: ()->
        Session.get "submissions"
    hasSubmissions: ()->
        Session.get "submissions"

Template.admin.events
    'click #submit': (event, template)->
        username = $('#name').val()
        console.log username
        password = $('#password').val()
        console.log password
        Meteor.call "getResponses", username, password, (err, result)->
            Session.set "submissions", result
