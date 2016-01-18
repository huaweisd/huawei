package com.lz.yh.system.bean;

import java.io.PrintStream;
import java.io.PrintWriter;

public class PPException extends RuntimeException
{

    /**
     * 
     */
    private static final long serialVersionUID = -6468352029138033138L;

    public PPException()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public PPException(String message)
    {
        super(message);
        // TODO Auto-generated constructor stub
    }

    public PPException(String message, Throwable cause)
    {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

    public PPException(Throwable cause)
    {
        super(cause);
        // TODO Auto-generated constructor stub
    }

    @Override
    public synchronized Throwable fillInStackTrace()
    {
        // TODO Auto-generated method stub
        return super.fillInStackTrace();
    }

    @Override
    public Throwable getCause()
    {
        // TODO Auto-generated method stub
        return super.getCause();
    }

    @Override
    public String getLocalizedMessage()
    {
        // TODO Auto-generated method stub
        return super.getLocalizedMessage();
    }

    @Override
    public String getMessage()
    {
        // TODO Auto-generated method stub
        return super.getMessage();
    }

    @Override
    public StackTraceElement[] getStackTrace()
    {
        // TODO Auto-generated method stub
        return super.getStackTrace();
    }

    @Override
    public synchronized Throwable initCause(Throwable cause)
    {
        // TODO Auto-generated method stub
        return super.initCause(cause);
    }

    @Override
    public void printStackTrace()
    {
        // TODO Auto-generated method stub
        super.printStackTrace();
    }

    @Override
    public void printStackTrace(PrintStream s)
    {
        // TODO Auto-generated method stub
        super.printStackTrace(s);
    }

    @Override
    public void printStackTrace(PrintWriter s)
    {
        // TODO Auto-generated method stub
        super.printStackTrace(s);
    }

    @Override
    public void setStackTrace(StackTraceElement[] stackTrace)
    {
        // TODO Auto-generated method stub
        super.setStackTrace(stackTrace);
    }

    @Override
    public String toString()
    {
        // TODO Auto-generated method stub
        return super.toString();
    }

}
