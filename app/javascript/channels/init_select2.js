import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  if (document.querySelector('#card_word_id')) {
    const user_id = document.querySelector('#card_user_id').value

    $('#card_word_id').select2({
      width: '100%',
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

  if (document.querySelector('#list-of-videos')) {
    $('#list-of-videos').select2({
      width: '100%',
      ajax: {
        url: '/videos',
        dataType: 'json',
        data: function(params) {
          var query = {
            search: params.term,
          }
          return query;
        },
        processResults: function(data) {
          return {
            results: data.map((video) => {
              return { id: video.id, text: `${video.title} - ${video.level} ` }
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
