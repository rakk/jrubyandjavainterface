#!/bin/bash

#~/.m2/repository/org/jruby/jruby/1.6.0/jruby-1.6.0.jar

# UPDATE THIS:
 JRUBY_JAR="/path/to/YOUR/jruby"
#JRUBY_JAR="~/.m2/repository/org/jruby/jruby/1.6.0/jruby-1.6.0.jar"
JAD_PATH=/path/to/YOUR/jad_file
#JAD_PATH=~/dev/bin/tools/jad

function print_header {
	echo "============================="
	echo " "$1
	echo "============================="
}

if [ "/path/to/YOUR/jruby" == "$JRUBY_JAR" ]; then
	echo "update JRUBY_JAR variable in run.sh file!"
else
	if [ "/path/to/YOUR/jad_file" == "$JAD_PATH" ]; then
	echo "update JAD_PATH variable in run.sh file!"
	else
		rm -rf output_jrubyc/*
		rm -rf output_jrubyc_with_java/*
		rm -rf output_jrubyc_with_javac/*

		echo "...............jruby jar:"
		echo "  "$JRUBY_JAR
		echo ""

		print_header "jrubyc --javac"
		echo "...............compile SimpleImplementation.rb"
		jrubyc --javac -c SimpleJavaInterface-1.0.jar:$JRUBY_JAR:. SimpleImplementation.rb -t output_jrubyc_with_javac
		echo "...............we get..."	
		echo "output_jrubyc_with_javac/SimpleImplementation.java"
		echo "(...)"
		head -n 15 output_jrubyc_with_javac/SimpleImplementation.java | tail -n 5
		echo "(...)"
		echo "output_jrubyc_with_javac/SimpleImplementation.class"
		$JAD_PATH/jad -d output_jrubyc_with_javac output_jrubyc_with_javac/SimpleImplementation.class
		echo "(...)"
		head -n 15 output_jrubyc_with_javac/SimpleImplementation.jad | tail -n 5
		echo "(...)"


		print_header "jrubyc --java"
		echo "...............compile SimpleImplementation.rb"
		jrubyc --java -c SimpleJavaInterface-1.0.jar:$JRUBY_JAR:. SimpleImplementation.rb -t output_jrubyc_with_java
		echo "...............we get..."
		echo "output_jrubyc_with_java/SimpleImplementation.java:"
		echo "(...)"
		head -n 15 output_jrubyc_with_java/SimpleImplementation.java | tail -n 5
		echo "(...)"


		print_header "jrubyc"
		echo "...............compile SimpleImplementation.rb"
		jrubyc -c SimpleJavaInterface-1.0.jar:$JRUBY_JAR. SimpleImplementation.rb -t output_jrubyc
		echo "...............we get..."	
		echo "output_jrubyc/SimpleImplementation.class:"
		$JAD_PATH/jad -d output_jrubyc output_jrubyc/SimpleImplementation.class
		echo "(...)"
		head -n 19 output_jrubyc/SimpleImplementation.jad | tail -n 9
		echo "(...)"


		# javac -cp $JRUBY_JAR:SimpleInterface-1.0.jar:. JavaCallerApp.java

		#echo "....................."
		#echo "...run..............."
		#echo "....................."
		#java -cp ~/.m2/repository/org/jruby/jruby/1.6.0/jruby-1.6.0.jar:PerformanceInterface-1.0.jar:.JavaCallerApp"
	fi
fi
