Meteor.methods
    addResponse: (teamObject)->
        teamObject.createdAt = moment().valueOf()
        required = ['members', 'description', 'whereIsStartup', 'goals']
        valid = true 
        missing_fields = []
        for prop in required
            if teamObject[prop] is ""
                missing_fields.push prop
            valid = valid && teamObject[prop] isnt ""
        if valid
            Responses.insert teamObject
            return {accepted: true}
        else
            return {errors: missing_fields}
    getResponses: (username, password)->
        right_user = Meteor.settings["admin-username"]
        right_password = Meteor.settings["admin-password"]
        if right_user != username or right_password != password
            return false
        else
            return Responses.find({}, {sort: {createdAt: 1}}).fetch()
