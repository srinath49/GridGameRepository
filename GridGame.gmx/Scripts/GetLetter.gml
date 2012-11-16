//made by Miles Lombardi
letter = argument0
if ord(letter) >= ord("A") and ord(letter) <= ord("Z") //if it is an uppercase letter 
 {
  return (32 + (ord(letter) - ord("A"))) //return a value for the letter
 }
if ord(letter) >= ord("a") and ord(letter) <= ord("z") //if it is a lowercase letter
 {
  return (64 + (ord(letter) - ord("a"))) //return a value for the letter
 }
if letter = "!" //exclamation mark
 {
  return 0
 }
if letter = '"' //quotations
 {
  return 1 
 }
if letter = "#" //number sign
 {
  return 2
 }
if letter = "$" //dollar sign
 {
  return 3 
 }
if letter = "%" //percent sign
 {
  return 4
 }
if letter = "&" //ampersand
 {
  return 5
 }
if letter = "'" //semi-qute
 {
  return 6
 }
if letter = "(" //parentheses
 {
  return 7 
 }
if letter = ")" //parentheses
 {
  return 8
 }
if letter = "*" //asterisk
 {
  return 9
 }
if letter = "+" //plus sign
 {
  return 10
 }
if letter = "," //comma
 {
  return 11
 }
if letter = "-" //dash
 {
  return 12
 }
if letter = "." //period
 {
  return 13
 }
if letter = "/" //slash
 {
  return 14
 }
if letter = "0" //0
 {
  return 15
 }
if letter = "1" //1
 {
  return 16
 }
if letter = "2" //2
 {
  return 17 
 }
if letter = "3" //3
 {
  return 18
 }
if letter = "4" //4
 {
  return 19
 }
if letter = "5" //5
 {
  return 20
 }
if letter = "6" //6
 {
  return 21
 }
if letter = "7" //7
 {
  return 22
 }
if letter = "8" //8
 {
  return 23
 }
if letter = "9" //9
 {
  return 24
 }
if letter = ":" //colon
 {
  return 25
 }
if letter = ";" //semi colon
 {
  return 26
 }
if letter = "<" //less than
 {
  return 27
 }
if letter = "=" //equal to
 {
  return 28
 }
if letter = ">" //greater than
 {
  return 29
 }
if letter = "?" //question mark
 {
  return 30
 }
if letter = "@" //at sign
 {
  return 31
 }
if letter = "[" //bracket
 {
  return 58
 }
if letter = "\" //slash
 {
  return 59
 }
if letter = "]" //bracket
 {
  return 60
 }
if letter = "^" //carot
 {
  return 61
 }
if letter = "_" //underscore
 {
  return 62
 }
if letter = "'" //quotation mark
 {
  return 63
 }
