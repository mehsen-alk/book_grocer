import 'package:book_grocer/config/color_manager.dart';
import 'package:book_grocer/config/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../features/home/presentation/widgets/home_widgets.dart';

class Constants {
  static const String searchUrl = 'https://www.googleapis.com/books/v1/';
  static const String searchApiKey = 'AIzaSyB5zWwIEDqZhI8pAAsvFJ3KKpvUys2URaU';
  static const String homeUrl =
      'https://catalog.feedbooks.com/publicdomain/browse/';
  static List<BookGenresInfo> bookGenresInfoList = [
    BookGenresInfo(
      image1:
          "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1549389901-512Dk0Md54L.jpg?crop=1.00xw:0.932xh;0,0.00200xh&resize=768:*",
      image2:
          "http://books.google.com/books/content?id=HMWJWzdJ1WEC&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73EX-ABmX25oLJV-etzCCBzVUWxE4C_pQtvvqfwSh_lZrGSHw8QMGJ4x01C3RF2I-LlW-2p_PmTsoUcnzWBJzDRaBx2wFhAkCHfTLKNfK5_xVq2BREHFXbj63Rj6bJf8XVuq7jA&source=gbs_api",
      image3:
          "http://books.google.com/books/publisher/content?id=CHwmEAAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70HaJae-Oxgrjcv-x_pk_vcSRETrKEMR_uQWMS44XqeQ_yc-EOAEiFRIrwGXe9XaeIKSkgBFCfI86P5o6B9v5xymOrsSrZv9zVirIovZmYCREsuskBddEERWRVs5vAOBYN2Q2GK&source=gbs_api",
      packageName: AppStrings.romance.tr(),
      color: ColorManager.pink,
    ),
    BookGenresInfo(
      image1:
          "http://books.google.com/books/content?id=3433nQEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE71AK7fU1j3CdZ6DlW8t_H1-svhSWmz89yC8XkhUKHhKnEfKwOv-2OpQiFZ4YiZp5FIS5J-_N6CNipv8glrMSJLivQA4d6iCTx7YrhR6-KM22HstrwF7Vte73rI6u29dqTVlMX1P&source=gbs_api",
      image2:
          "http://books.google.com/books/content?id=TbXBgzR2DBQC&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE72jrr6OsiUrG2KG0LAv7Xvi5LaLYyiy8aeZ6eDHbRgqVJXLlGs8JN1QW5NPCKqp4GJfrxq-ikdTe2JVVOyTu-i0yaa5YsIqora5R6a5f6BNQZaH026awJb1KgSz5q_gfNAdDAB5&source=gbs_api",
      image3:
          "http://books.google.com/books/content?id=EBPjAQAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE729kGXC6iMBa6plL0M22xykJEYJaTdm4R3wIU4pWfAW7rnooijJ9pM3aCMAVCNCaiYgLGmaYfqCUImI4TOMKnG4O9YeuMQwHPkXoNv5j18JVUuv9Fkfv5B3R3hIctGek9HkniNa&source=gbs_api",
      packageName: AppStrings.mysteryDetective.tr(),
      color: ColorManager.deepPurple,
    ),
    BookGenresInfo(
      image1:
          "http://books.google.com/books/content?id=o6NzGNODRjkC&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70jl-rN_tuhqtXfx0zi6J_wec3xahEw1C8o5y9kOrLqil3Z5lEbbU0un-04q-JDrqnmbluABql09Ic38dPhvZLqKVb7yJglKfrCaEFe-Ji7z6QViYimov1dlyZ_NPHykAw7OsZJ&source=gbs_api",
      image2:
          "http://books.google.com/books/content?id=rgblc1_9IIkC&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71rIT_rlXaZCcQs7CjNvFcCK4fzz-txgfzaDy7IuLROQKpprb-wWqUBOlNwxQ9R6Q1dZBUw8bB9yVOl2QbejID6RIxWSg5Nl4G5jmBWsc6Ez9pFmhine9oflKbCV4ogC9EvueUe&source=gbs_api",
      image3:
          "http://books.google.com/books/publisher/content?id=SR-MDQAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70iHm0pMAU7iDhyy-wVl4lzaFAR5JC5-5Mk1VPXRmopRj8sF3SB4kW5t_HzU0zz891cpDj4zrZHHXP_cio54_anFWtD-YzqjKkkYtRrju7j-asKc41nnUetukPTYpXLsA6-Ps_E&source=gbs_api",
      packageName: AppStrings.horror.tr(),
      color: ColorManager.error,
    ),
    BookGenresInfo(
      image1:
          "http://books.google.com/books/publisher/content?id=xG9ZEAAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70LYx8AMTqz9S60Yec6KKUsWBjLcVunDairPfJC2SnDsIFqqxy0b-bhScSB4wjT55HZ_-JP17RmXgdT9KDim0wOWhJraupp5CSP-_gZX_MB2zTgw-m-S9gfnj_PRtO3LjI5drz_&source=gbs_api",
      image2:
          "http://books.google.com/books/content?id=H8ON-dTgQQYC&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71li1OKi2AKZVCUAsyO9G-sDpPjegMzUVNIH9HdKMAMyJGWXMU5tkfpBzNboteei8JIp2zBkpXkr0MA8vnqUwUgy1tRQ2WvLN1B1Y8OmDAPuYh3hFInQUdIdlEOdrdP5lqi2NfG&source=gbs_api",
      image3:
          "http://books.google.com/books/publisher/content?id=Mj5XDwAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73BLM0nJ1j3UQMHw67-WAcdtwspyvb9VoIiAszczFj_HGxAMPQ9dpThegwpuew5yjsjogZL29iBwg2q9JJ1iEjnc_G_LpLOHpBKv77dicYvsfUjpuZ6tO_4PqFzBTqGgDmnuz8o&source=gbs_api",
      packageName: AppStrings.actionAndAdventure.tr(),
      color: ColorManager.green,
    ),
    BookGenresInfo(
      image1:
          "http://books.google.com/books/publisher/content?id=e_9MDwAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70T3N7VfmM8-E8qVWx06a1eJ2KlH0da3IqxUMApvscsbtViN-Pl8TZAHrFDg0rl2m8lLuzWgKYz7-h-ThKZCYThtt0SRuTflwbvQ-aggBg-DBEn2PzX1M4E14kxyWfTb92wt1k-&source=gbs_api",
      image2:
          "http://books.google.com/books/publisher/content?id=OPAgEAAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE723X92Pr1tmaAGfXrEE0m8sZL9nnnWzEUqtK3om0LDBwR4iTLuuzanF0h-lEvvLEG1fNHyokvudcAaKNXR6hs9x6W7EtNqqU7f1VAVFgZUIBDO8nyvkBNQZIH3Av1Y7UFPrJ_Cl&source=gbs_api",
      image3:
          "http://books.google.com/books/publisher/content?id=95gQDgAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE72NSCrb3ACFAWg-gQyJhf9x4NfWCx_CdHEZvC4oFKMsSQVqD11j2PFjjxxuF2w0zulLegLdCb5HPL6YbIEdZThDReM9Kp6Z-NSAT66KWHyWY3eqYsCBrH_I27Z3hXzeuCyiT_kW&source=gbs_api",
      packageName: AppStrings.scienceFiction.tr(),
      color: ColorManager.indigo,
    ),
  ];
}
