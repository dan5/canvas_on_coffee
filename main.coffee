get_ctx = ->
  canvas = document.getElementById('canvassample')
  ctx = canvas.getContext('2d')

stroke_rect = (x, y, w, h) ->
  ctx = get_ctx()
  ctx.beginPath()
  ctx.strokeRect(x, y, w, h)
  return

stroke_arc = (x, y, r) ->
  ctx = get_ctx()
  ctx.beginPath()
  ctx.arc(x, y, r, 0, Math.PI * 2, false)
  ctx.stroke()

doc = document.getElementById('main')
doc.innerHTML = 'hello coffeescript'

stroke_rect(20, 40, 80, 80)
stroke_rect(30, 50, 80, 80)
stroke_arc(130, 50, 40)
