// $(document).ready(function(){
//     var timer = 0;
//     setInterval(function () {
//         ++timer;
//         document.getElementById("timer").value = timer;
//     },1000);
//
//     var flashcards = new Vue ({
//         el: '#flashcards',
//         data: {
//             original_text: 'not-initialized',
//             card_id: gon.card_id,
//             notice: 'non-initialized',
//             check_text: '',
//             current_timer: [],
//             timer: []
//         },
//         methods: {
//             check_translate: function(event) {
//                 var self = this;
//                 var check_data = {
//                     check_text: self.check_text,
//                     card_id: self.card_id,
//                     timer:  self.current_timer - self.timer
//                 };
//                 this.$http.post('/home', check_data).then((responce)=> {
//                     this.$http.get('/home').then((result) => {
//                         if (result.body.card){
//                             self.original_text = result.body.card['translated_text'],
//                                 self.check_text = '',
//                                 self.card_id = result.body.card['id'],
//                                 self.current_timer = timer
//                         }
//                         else{
//                             self.original_text = 'no_cards'
//                         }
//                     });
//                     self.notice = responce.body.notice
//                 });
//             }
//         }
//     })
// });
