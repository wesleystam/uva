function PiaQuestionnaireModel(modal) {
  this.modal = modal;
  this.form = modal.find('form');

  this.onSubmit = this.onSubmit.bind(this);
  this.onSuccess = this.onSuccess.bind(this);
  this.onError = this.onError.bind(this);
  this.form.on('submit', this.onSubmit);
}

PiaQuestionnaireModel.prototype.onSubmit = function(event) {
  event.preventDefault();

  $.ajax({
    url: this.form.attr('action'),
    data: this.form.serialize(),
    dataType: 'json',
    type: this.form.attr('method'),
    success: this.onSuccess,
    error: this.onError
  });
};

PiaQuestionnaireModel.prototype.onSuccess = function(response) {
  if (response.errors) {
    validation_errors(this.form, response.errors)
  } else {
    window.location.reload();
  }
};

PiaQuestionnaireModel.prototype.onError = function(response) {
  Rails.enableElement(this.form[0])
  validation_errors(this.form, { base: [response.responseText] });
};

$(document).on('turbolinks:load', function() {
  var modal = $('#newPiaQuestionnaireModel');

  if (modal.length) {
    new PiaQuestionnaireModel(modal);
  }
});

var validation_errors = function(form, errors) {
  var form_id = $(form).attr('id');
  var form_name = form_id.substring(form_id.indexOf('_') + 1).replace(/_\d+$/, '');

  $.each(errors, function(key, values){
    $.each(values, function(k, v){
      if (key === 'base') {
        form.find('.form-group').first().before('<p class="alert alert-danger danger error">'+v+'</p>');
      } else {
        var inputEl = form.find('#'+form_name+'_'+key);
        if (inputEl.parent().hasClass('input-group')) {
          inputEl.parent().after('<p class="alert alert-danger danger error">'+v+'</p>');
        } else {
          inputEl.after('<p class="alert alert-danger danger error">'+v+'</p>');
        }
      }
    });

    setTimeout(function() {
      $('.error').fadeOut('slow', function() { this.remove(); });
    }, 1500);
  });
};
