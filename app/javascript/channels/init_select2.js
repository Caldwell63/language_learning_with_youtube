import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  const cardUser = document.querySelector('#card_user_id');

  if (cardUser) {
    const user_id = cardUser.value

    $('#card_word_id').select2({
      width: '100%',
      height: '20%',
      ajax: {
        url: '/words',
        dataType: 'json',
        data: function(params) {
          var query = {
            search: params.term,
            type: 'public',
            user_id: user_id
          }
          // Query parameters will be ?search=[term]&type=public
          return query;
        },
        processResults: function(data) {
          return {
            results: data.map((word) => {
              return { id: word.id, text: word.en }
            })
          };
        },
      }
    })
  }
};

export {
  initSelect2
};
