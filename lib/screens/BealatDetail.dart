import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BealatDetail extends StatefulWidget {
  const BealatDetail({super.key});

  @override
  State<BealatDetail> createState() => _BealatDetailState();
}

class _BealatDetailState extends State<BealatDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 237, 213, 8),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(225, 159, 105, 0.694),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: Navigator.of(context).pop,
        ),
        title: const Text(
          "ሳምንታዊ የዝክረ ቅዱሳን መርሐግብር",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Text(
                    "በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።ጥር ፩ በዝህች ቀን  የሰማዕታት መጀመሪያ ሊቀ ዲያቆናት ቅዱስ እስጥፋኖስ በሰማዕትነት አረፈ።ጸሎቱና በረከቱ በህዝበ ክርስቲያን ላይ ለዘለዓለም ጸንቶ ይኑር እና  እስጢፋኖስ የሚለው ቃል የግሪክ ቋንቋ ቃል ሲሆን ትርጓሜውም አክሊል ማለት ነው ቅዱስ እስጢፋኖስ በግሪክ ሀገር እንደተወለደ የሚነገርለትና ከክርስቶስ እርገት በኋላም አስራ ሁለቱም ሐዋርያት በጋራ ተሰብስበውና ለአገለግሎት ከመረጡዋቸው ሰባት(፯ )ዲያቆናት መካከል አንዱና ዋነኛው ነበር።ሕዝቡን በማዕድ ያገለግሉ ዘንድ ሰባት ዲያቆናት ተመርጠዋል ከእነዚህ መካከል ቅዱስ  እስጢፋኖስ አንዱ ሲሆን ለስድስቱ ዲያቆናት ደግሞ አለቃ ( ሊቀ ዲያቆን ) ሆኖ ተሹሟል ቅዱስ እስጢፋኖስ በማዕድ አገልግሎት ሕዝቡን ከማገልገሉ በተጨማሪ ወንጌልን ይሰብክ ነበር።ተአምራትን የማድረግ ፀጋም ተሰጥቶት ነበር በዚህም አገልግሎቱ ብዙዎችን ወደ  ክርስትና መልሷል በዚህም አይሁድ በቅናት ተነሳስተው በሐሰት ከሰሱት ከከተማውም ወደ ውጭ አውጥተው ቄዳር በተባለ ቦታ በድንጋይ ወገሩት በሚወግሩትም ጊዜ ሰማያት ተከፍተው ምሥጢረ ሥላሴን እግዚአብሔርን በሦስትነቱ ተመለከተ።ኢየሱስ ክርስቶስንም በአብ ቀኝ ተቀምጦ አየ  ለሚወግሩትም ሰዎች ከአምላኩ እንዲህ በማለት ምሕረትን ለመነ ጌታ ሆይ ይህንን ኃጢአት አትቁጠርባቸው በመጨረሻም ጌታ ኢየሱስ ሆይ ነፍሴን ተቀበል ብሎ ነፍሱን ሰጠ።"
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
