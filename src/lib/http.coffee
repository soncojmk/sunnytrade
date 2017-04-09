urlEscape = (obj) ->
  if obj is undefined then ""
  else "?" + ("#{k}=#{v}" for k, v of obj).join("&")

toForm = (obj) ->
  form = new FormData()
  for k, v of obj
    form.append(k, v)
  return form

module.exports.get = (url, params) ->
  fetch url + urlEscape(params),
    method: "GET"

module.exports.put = (url, body) ->
  fetch url,
    method: "PUT"
    body: toForm(body)

module.exports.post = (url, body) ->
  fetch url,
    method: "POST"
    body: toForm(body)

module.exports.delete = (url) ->
  fetch url,
    method: "DELETE"

module.exports.getcors = (url, params) ->
  fetch url + urlEscape(params),
    method: "GET"
    mode: "cors"
    credentials: "include"

module.exports.putcors = (url, body) ->
  fetch url,
    method: "PUT"
    mode: "cors"
    credentials: "include"
    body: toForm(body)

module.exports.postcors = (url, body) ->
  fetch url,
    method: "POST"
    mode: "cors"
    credentials: "include"
    body: toForm(body)

module.exports.deletecors = (url) ->
  fetch url,
    method: "DELETE"
    mode: "cors"
    credentials: "include"
