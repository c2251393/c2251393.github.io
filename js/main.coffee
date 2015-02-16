
mul = (x, y, mod) ->
  res  = 0
  base = x
  tmp  = y
  while tmp > 0
    if tmp % 2 == 0
      tmp /= 2
    else
      res = (res + base) % mod
      tmp = (tmp-1) / 2
    base = (base + base) % mod
  return res

myPow = (x, n, mod) ->
  if n == 0
    return 1 % mod
  res = 0
  if n % 2 == 0
    res = myPow x, (n/2), mod
  else
    res = myPow x, ((n-1)/2), mod
  tmp = mul res, res, mod
  if n % 2 == 0
    return tmp
  else
    return mul tmp, x, mod

modInv = (e) ->
  e.preventDefault()
  txt1 = $('#x').val()
  txt2 = $('#MOD').val()
  x   = (parseInt txt1)
  mod = (parseInt txt2)
  inv = (myPow x, (mod - 2), mod)
  console.log(inv.toString())
  $('#modInvRes').html('$$ '+x.toString()+'^{-1} \\equiv'+inv.toString()+'\\mod{'+mod.toString()+'}'+' $$')
  MathJax.Hub.Queue ["Typeset", MathJax.Hub, "modInvRes"]

$(document).ready (->
  $('#infLbd').click(->
    alert('cofJIZZZZZZZfee')
  )
  $('#aboutMeH').click(->
    $('#about').fadeToggle(500)
  )
  
  $('#invFormx').submit(modInv)
  $('#invFormMOD').submit(modInv)
  $('#invBut').click(modInv)
)
