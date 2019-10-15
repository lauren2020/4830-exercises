
public aspect TraceAspectShultz {

	pointcut classToTrace(): within(*App);
	pointcut methodToTrace():  classToTrace() &&  execution(String getName());

before(): methodToTrace() {
	//THe message signature
	//The method line number
   String info = thisJoinPointStaticPart.getSignature() + ", " //
         + thisJoinPointStaticPart.getSourceLocation().getLine();
   System.out.println("\t-->" + info);
}

after(): methodToTrace() {
	//The method file name
   System.out.println("\t<--" + thisJoinPointStaticPart.getSourceLocation().getFileName());
}
}
