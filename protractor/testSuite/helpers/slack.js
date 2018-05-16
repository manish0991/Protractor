var Slack = require('slack-node');
 
var SlackHelper = function () {

  webhookUri = "https://hooks.slack.com/services/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";
   
  slack = new Slack();
  slack.setWebhook(webhookUri);

  this.post = function(msg){

    slack.webhook({
      //channel: "#general",
      username: "Protractor Alien",
      text: msg
    }, function(err, response) {
         //console.log(response);
        });

    //How to add a link in the payload: <file://geek/qa/protractor/reports/htmlReports/index.html|Click here for the report>

  };

};

module.exports = new SlackHelper();
