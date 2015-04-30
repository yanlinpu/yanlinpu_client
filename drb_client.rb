#encoding: utf-8
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'yanlinpu'
begin
  u = Yanlinpu::User.new({name: 'yanlinpu',email: 'yanlinpu66@163.com',age: 25})
  p u.name
  p u.myself
  p Yanlinpu::User.sing('yes i do')
end
