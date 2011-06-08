get_ctx = ->
  canvas = document.getElementById('canvas')
  ctx = canvas.getContext('2d')

clear_screen = ->
  ctx = get_ctx()
  ctx.clearRect(0, 0, 800, 400)
  return

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

class Ball
  constructor: (x, y) ->
    @x = x ? 0
    @y = y ? 0
    @vx = 100
    @vy = 0
  update: (dt) ->
    @vy += 50 * dt
    @x += @vx * dt
    @y += @vy * dt
  render: ->
    stroke_arc(@x, @y, 30)

Interval = 10
time = 0
balls = [
  new Ball(  0, 0),
  new Ball(100, 0),
  new Ball(200, 0),
  new Ball(300, 0),
]
main_loop = ->
  dt = Interval * 0.001
  clear_screen();
  for ball in balls
    ball.update(dt)
    ball.render()
  if (time += dt) < 3
    setTimeout main_loop, Interval
  return
  
doc = document.getElementById('main')
doc.innerHTML = 'hello coffeescript'

stroke_rect(20, 40, 80, 80)
stroke_rect(30, 50, 80, 80)
stroke_arc(130, 50, 40)

main_loop()
