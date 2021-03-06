package com.telus.workforcemgmt.async.state;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.telus.workforcemgmt.async.AsyncConfigurable;
import com.telus.workforcemgmt.async.AsyncRequest;
import com.telus.workforcemgmt.async.AsyncRequestDecorator;

public class OnHoldState implements AsyncState {


	Logger logger = LoggerFactory.getLogger(NewState.class);
	AsyncConfigurable config;
    
    public OnHoldState(AsyncConfigurable configurable) {
    	config = configurable;
	}

	public boolean process(StateContext context, AsyncRequestDecorator req) {
	AsyncRequest request = req.getRequest();
	if (request.getAttempts() > config.getMaxRetryForOnHold()) {
		logger.debug("Status is changed to BLOCKED: " + req.getRequest().getId());
	    request.setStatus(ASYNCSTSATE.BLOCKED.toString());
	    req.setRequest(request);
	    context.getPostProcessor().retry(req, config.getDelayForResendingWait());
	    return false;
	} else {
		logger.debug("Status is changed to NEW: " + req.getRequest().getId());
	    request.setStatus(ASYNCSTSATE.NEW.toString());
	    return context.isExcutable(req);
	}
    }

    public boolean isCapableOf(AsyncRequest request) {
	return (ASYNCSTSATE.ONHOLD.toString().equals(request.getStatus()));
    }
}
