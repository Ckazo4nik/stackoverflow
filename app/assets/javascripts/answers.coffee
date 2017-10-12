$ ->
  $('.edit-answer-link').click (e) ->
    e.preventDefault();
    $(this).hide();
    asnwer_id = $(this).data('answerId');
    $("form#edit-answer-" + answer_id).show();

