jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true

window.fbAsyncInit = ->
  facebook_response = null

  FB.init(appId: '311453372339962', cookie: true)

  FB.getLoginStatus (response) ->
    if response.status is "connected"
      facebook_response = response

  $('#sign-in').click (e) ->
    e.preventDefault()
    if facebook_response
      window.location = '/auth/facebook/callback'
    else
      FB.login ((response) ->
        window.location = '/auth/facebook/callback' if response.authResponse
      ),
        scope: "email"