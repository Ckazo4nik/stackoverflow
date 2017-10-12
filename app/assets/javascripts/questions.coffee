$ ->
  $('.link_new').click (e) ->
    e.preventDefault();
    $('.new_question_create').show();
    $('.submit-create-question').click (e) ->
      $('.new_question_create').hide();

