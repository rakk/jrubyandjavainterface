

import org.jruby.Ruby;
import org.jruby.RubyObject;
import org.jruby.javasupport.util.RuntimeHelpers;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.javasupport.JavaUtil;
import org.jruby.RubyClass;
import simplejavainterface.SimpleJavaInterface;


public class SimpleImplementation extends RubyObject implements SimpleJavaInterface {
    private static final Ruby __ruby__ = Ruby.getGlobalRuntime();
    private static final RubyClass __metaclass__;

    static {
        String source = new StringBuilder("require 'java'\n" +
            "\n" +
            "java_import \"simplejavainterface.SimpleJavaInterface\"\n" +
            "\n" +
            "class SimpleImplementation\n" +
            "  java_implements Java::simplejavainterface.SimpleJavaInterface\n" +
            " \n" +
            "  java_signature 'void testingMethod()'\n" +
            "	def testingMethod()\n" +
            "		p \"JRuby code run inside Java... :) I love Poznan!\"\n" +
            "	end\n" +
            "end\n" +
            "").toString();
        __ruby__.executeScript(source, "SimpleImplementation.rb");
        RubyClass metaclass = __ruby__.getClass("SimpleImplementation");
        metaclass.setRubyStaticAllocator(SimpleImplementation.class);
        if (metaclass == null) throw new NoClassDefFoundError("Could not load Ruby class: SimpleImplementation");
        __metaclass__ = metaclass;
    }

    /**
     * Standard Ruby object constructor, for construction-from-Ruby purposes.
     * Generally not for user consumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    private SimpleImplementation(Ruby ruby, RubyClass metaclass) {
        super(ruby, metaclass);
    }

    /**
     * A static method used by JRuby for allocating instances of this object
     * from Ruby. Generally not for user comsumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    public static IRubyObject __allocate__(Ruby ruby, RubyClass metaClass) {
        return new SimpleImplementation(ruby, metaClass);
    }
        
    /**
     * Default constructor. Invokes this(Ruby, RubyClass) with the classloader-static
     * Ruby and RubyClass instances assocated with this class, and then invokes the
     * no-argument 'initialize' method in Ruby.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    public SimpleImplementation() {
        this(__ruby__, __metaclass__);
        RuntimeHelpers.invoke(__ruby__.getCurrentContext(), this, "initialize");
    }

    
    public void testingMethod() {

        IRubyObject ruby_result = RuntimeHelpers.invoke(__ruby__.getCurrentContext(), this, "testingMethod");
        return;

    }

}
