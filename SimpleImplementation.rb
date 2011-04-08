require 'java'

java_import "simplejavainterface.SimpleJavaInterface"

class SimpleImplementation
  java_implements Java::simplejavainterface.SimpleJavaInterface
 
  java_signature 'void testingMethod()'
	def testingMethod()
		p "testing method implemented in JRuby"
	end
end
