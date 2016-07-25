class FibonacciController < ApplicationController
  def index
  	arr=[]
  	f0=0;
  	arr << f0;
  	f1=1;
  	arr << f1;
  	arr[2]=1;
  	input=8181;
  	@result=myfunc(arr,input);
  	puts @result.last;
  	render layout: false
  end

  private 
  def myfunc(arr,n)
  	if(n > 2)
	  	for i in 2..n
	  		n1=i-1;
	  		n2=i-2;
	  		arr[i]=arr[n1] + arr[n2]
	  	end
	end
  	return arr;
  end
end
