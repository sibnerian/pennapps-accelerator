counter = 0

humanReadable = (list)->
    if list.length is 1
        return list[0]
    if list.length is 2
        return list[0] + ' and ' + list[1]
    [list[0...-1].join(", "), list[list.length-1]].join(", and ")

readability_map =
    members: "Team members"
    description: "startup description"
    whereIsStartup: "where your startup is now"
    goals: "startup goals"

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
Session.set("app-errors", false)

Template.applicant.events
    "click .addMember": (event, template)->
        if counter < 4
            arr = Session.get("members")
            arr.push newMemberObject()
            Session.set("members", arr)

Template.applicant.helpers
    showAddButton: ->
        @teamMemberIndex == counter and counter < 4

Template.application.helpers
    members: -> Session.get "members"
    errors: -> Session.get("app-errors")

Template.application.events
    'click #submit': ->
        members = []
        $('.applicant').each ->
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
            if res.accepted == true
                Session.set('applied', true)
                Router.go('/')
            else
                Session.set('app-errors', humanReadable(_.map(res.errors, (val)-> '"' + readability_map[val] + '"')) )
                window.scrollTo(0, 0);