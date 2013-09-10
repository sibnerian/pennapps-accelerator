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

Session.set("members", [newMemberObject()])

Template.application.helpers
    members: ()->
        return Session.get "members"

Template.applicant.events
    "click .addMember": (event)->
        arr = Session.get("members")
        arr.push newMemberObject()
        Session.set("members", arr)
        console.log Session.get "members"
        event.stopPropagation()