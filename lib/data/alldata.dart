import 'package:flutter_getx_shayari/model/allshayari.dart';

import '../model/category.dart';

class AllData {
  List<CategoryModel> category = [
    CategoryModel(
        image:
            'https://i.pinimg.com/736x/4c/7a/70/4c7a7066b81cfba0324bda8927ea984b.jpg',
        name: 'Love'),
    CategoryModel(
      image:
          'https://i.pinimg.com/564x/85/e7/99/85e7990775438bb91f6a63a6330e3c9f.jpg',
      name: 'Sad',
    ),
    CategoryModel(
      image:
          'https://i.pinimg.com/564x/9b/ea/d0/9bead0d42608bbf26418732683675c83.jpg',
      name: 'Happiness',
    ),
    CategoryModel(
      image:
          'https://i.pinimg.com/564x/7b/ac/02/7bac027ae0c163556293c246dfcb2c52.jpg',
      name: 'Romantic',
    ),
  ];

  final List<AllShayari> allshayari = [
    AllShayari(category: "Love", shayariList: [
      "Tum mere ho, tum mere hi raho, Tumko nahi pata, main kitna tujhse pyaar karta hoon.",
      "Tere ishq mein dooba rahe, Din bhar tera intezar karte hain.",
      "Mohabbat mein teri deewana hoon, Tere ishq mein khud ko bhoolana hoon.",
      "Teri muskurahat meri pehchaan hai, Tujhse juda na ho paaye ye mere armaan hai.",
      "Dil ko chhoo jaye teri baatein, Tujhse mila har pal lagta hai kuch khaas hai.",
      "Tere bina saara jahan tham sa gaya hai, Teri yaadon mein har pal mera dil bekaraar hai.",
      "Tu meri zindagi ka maksad hai, Tujhse juda na ho paaye ye meri aarzoo hai.",
      "Teri aankhon mein kho jana hai, Teri baahon mein rehna hai, Yeh dil tere pyaar mein beqaraar hai.",
      "Tum mere dil ki dhadkan ho, Tumhe paake har khushi mujhe pyaari lagti hai.",
      "Tere ishq mein rangon ka jahan hai, Har pal tere saath bitana mere liye khuda se kam nahi."
    ]),
    AllShayari(category: "Sad", shayariList: [
      "Tanhaiyon mein muskurana ishq hai, Dard ko chhupana ishq hai, Koi nahi dekhta yahan dard-e-dil, Isliye rote-rote muskurana ishq hai.",
      "Raat bhar tere khayalon mein dooba, Meri subah ko bhi tere bina udaasi chha gayi hai.",
      "Tere bina zindagi adhoori si lagti hai, Har khushi tere saath na ho toh kya karein?",
      "Dil todna hume aata nahi, Par is dil ko bhi toh dard hota hai.",
      "Raat bhar aansu bahana is not a sign of weakness, It's a sign of being real in this fake world.",
      "Kyun teri yaadon mein guzarte hain raat bhar, Kyun teri muskurahat meri zindagi se khaas hai.",
      "Kisi ko fikr nahi meri takleefon ki, Har kisi ko apni kahani mein masroof hone do.",
      "Dard ki gehraaiyon se nikalkar, Kuch khushiyon ki talash mein chal pade hain.",
      "Zakhmon ka hisaab na kar sake, Par un zakhmon ko choo kar bhi toh dekhte hain.",
      "Khamosh rehkar bhi aksar keh dete hain, Sab kuch theek hai, bas dil toota hai."
    ]),
    AllShayari(category: "Happiness", shayariList: [
      "Khushiyan baantne se hi badhti hain, Chhota sa pyara saath ho, toh har mod pe saath ho.",
      "Hansi ka jahan hai, Dil se juda nahi, Muskurate raho, Zindagi khuda ki dua nahi.",
      "Rang birangi khushiyon ka mela hai yeh zindagi, Har pal khush raho, Yehi hai dua hamari.",
      "Haste haste guzar jaye zindagi ki raahen, Har mod pe mile khushiyan ka samaan.",
      "Chamakti rahe aapki muskurahat, Dil se juda na ho khushi ka safar.",
      "Khushi ki mehfilon mein rangin ho zindagi, Har kadam par mile pyaar ki raahein.",
      "Hasna sikho, dil se jeena sikho, Khushiyo ka safar hai yeh zindagi ka asli maayne.",
      "Haste haste guzar jaye zindagi ki raahen, Har musibat ka hal hai pyaar bhara dil.",
      "Zindagi ki har khushi ko gale lagao, Har pal mein basa lo pyaar ka izhaar.",
      "Khushiyan bikherti rahein aapki zindagi mein, Har pal ho aapke liye khaas."
    ]),
    AllShayari(category: "Romantic", shayariList: [
      "Tere bina jeena mushkil hai, Tujhse juda na ho paaye ye meri tamanna hai.",
      "Teri baatein hain mere dil ki roshni, Tere bina har pal lagta hai adhoora sa.",
      "Tum meri zindagi ka maksad ho, Tumse juda na ho paaye ye meri aarzoo hai.",
      "Meri har khushi tere liye hai, Tujhse juda na ho paaye ye meri dua hai.",
      "Tere ishq mein dooba rahe hain, Meri har subah tere intezaar mein hai.",
      "Teri muskurahat meri zindagi hai, Tere bina har pal lagta hai bekaar hai.",
      "Tum mere ho, tum mere hi raho, Tumko nahi pata, main kitna tujhse pyaar karta hoon.",
      "Teri baahon mein rehna hai, Tere bina jeena mushkil hai.",
      "Tujhse juda na ho paaye ye meri tamanna hai, Tere bina har pal lagta hai adhoora sa.",
      "Tere ishq mein khud ko bhoolana hoon, Teri baatein hain mere dil ki dastaan."
    ]),
  ];
}
