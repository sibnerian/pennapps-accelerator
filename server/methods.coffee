Meteor.methods
    addResponse: (teamObject)->
        teamObject.createdAt = moment().valueOf()
        Responses.insert teamObject
        return true
    getResponses: (username, password)->
        if username = Meteor.settings["admin-username"] and 
            password = Meteor.settings["admin-password"]
                return Responses.find({}, {sort: {createdAt: 1}}).fetch()

