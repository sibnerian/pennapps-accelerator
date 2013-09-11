counter = 0

newMemberObject = ()->
    counter++
    name: ""
    email: ""
    phone: ""
    fieldsOfStudy: ""
    classYear: ""
    relevantLinks: ""
    teamMemberIndex: counter
    index: counter

Session.set("members", [newMemberObject()])



Template.applicant.events
    "click .addMember": (event, template)->
        if counter <= 4
            arr = Session.get("members")
            arr.push newMemberObject()
            Session.set("members", arr)

Template.applicant.helpers
    showAddButton: ()->
        @teamMemberIndex == counter and counter <= 4

Template.application.helpers
    members: ()->
        return Session.get "members"

Template.application.events
    'click #submit': ()->
        members = []
        $('.applicant').each ()->
            member = 
                teamMemberIndex: $(this).attr('index')
                name: $(this).find('.name').val()
                email: $(this).find('.email').val()
                phone: $(this).find('.phone').val()
                fieldsOfStudy: $(this).find('.fieldsOfStudy').val()
                classYear:  $(this).find('.classYear').find(':checked').first().val()
                relevantLinks: $(this).find('.relevantLinks').val()
            members.push member
        application = 
            members: members
            description: $('#description').val()
            whereIsStartup: $('#whereIsStartup').val()
            goals: $('#goals').val()
        Meteor.call "addResponse", application, (err, res)->
            console.log 'success'
