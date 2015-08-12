# 创建遮罩
# 基于zepto
# binnng
# 2015/07/10
# var Mask = require("mask");
# var myMask = Mask({
#   style: {
#     zIndex: 1000
#   },
#   animate: false # 默认true,
#   preventTouch: false # 默认true
# });
# myMask.show();

WIN = window
DOC = document

$ = WIN.$

elBody = $ "body"
elHtml = $ "html"


CLASS_NAME = "wallet-mask"
MASK_ANIMATE_TIME = 300


DEFAULT_MASK_STYLE =
  left: 0
  top: 0
  right: 0
  width: "100%"
  background: "rgba(0, 0, 0, .6)"
  zIndex: 10
  position: "absolute"
  display: "none"

getMax = require "../get_max/get_max.js"


class Mask

  constructor: (params = {}) ->
    {
      style
      animate
    } = params

    $.extend @, params

    @params = params

    style = style or {}

    if typeof animate is "undefined"
      animate = yes

    @animate = animate

    if animate
      trans = "all #{@animateTime or MASK_ANIMATE_TIME}ms ease"
      $.extend style, 
        webkitTransition: trans
        transition: trans
        opacity: 0

    style = $.extend DEFAULT_MASK_STYLE, style

    @style = style

  init: ->
    html = "<div class='#{CLASS_NAME}'></div>"
    elMask = @el = $ html
    elMask.css @style
    elBody.append elMask

    # 组织mask的touch

    elMask.on "touchmove mousemove", (e) ->
      e.preventDefault()
      no

    @

  show: ->
    el = @el
    winHeight = getMax [
      $(WIN).height()
      elHtml.height()
      elBody.height()
    ]
    el.height winHeight

    el.show()

    if @animate
      setTimeout ->
        el.css "opacity", 1
      , 10

    @

  hide: ->
    el = @el
    if @animate
      el.css "opacity", 0
        .hide()
    else
      el.hide()

    @

  destroy: ->

    @el.remove()

    @


entry = (params) ->
  (new Mask(params)).init()


module.exports = entry

