%dw 2.0
output application/json
---
{
	"notificationType": "email",
	"email": {
		toAddress: p('common.notifications.email.to-address'),
		emailSubject: p('mule.env') default "" ++ "-" ++ p('app.name') default "" ++ " httpStatus -" ++ vars.httpStatus default "",
		emailBody: "correlationId=" ++ correlationId default "" ++ ", appName= " ++ p('app.name') default "" ++ ", timeStamp=" ++ 
		now() ++ ", uriPath=" ++ message.attributes.requestPath default  "" ++ ", method=" ++ message.attributes.method default "" ++", errorDescription=" ++ error.description default ""
	}
}