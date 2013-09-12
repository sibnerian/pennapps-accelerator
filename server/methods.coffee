Meteor.methods
    addResponse: (teamObject)->
        teamObject.createdAt = moment().valueOf()
        Responses.insert teamObject
        return {accepted: true}
    getResponses: (username, password)->
        right_user = Meteor.settings["admin-username"]
        right_password = Meteor.settings["admin-password"]
        if right_user != username or right_password != password
            return false
        else
            return Responses.find({}, {sort: {createdAt: 1}}).fetch()
