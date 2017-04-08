urlEscape = (obj) ->
  "?" + ("#{k}=#{v}" for k, v of obj).join("&")

toForm = (obj) ->
  form = new FormData()
  for k, v of obj
    form.append(k, v)
  return form

module.exports.get = (url, params) ->
  fetch url + urlEscape(params),
    method: "GET"
    credentials: "include"

module.exports.put = (url, body) ->
  fetch url,
    method: "PUT"
    credentials: "include"
    body: toForm(body)

module.exports.post = (url, body) ->
  fetch url,
    method: "POST"
    credentials: "include"
    body: toForm(body)

module.exports.delete = (url) ->
  fetch url,
    method: "DELETE"
    credentials: "include"
