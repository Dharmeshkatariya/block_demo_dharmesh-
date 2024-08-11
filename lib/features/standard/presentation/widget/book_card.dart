
import '../../../../core/widget/common.dart';
import '../../../../export.dart';

class BookCardView extends StatefulWidget {
  const BookCardView({super.key, this.onTap, required this.imageUrl, required this.title});
  final Function()? onTap ;
  final String imageUrl ;
  final String title ;

  @override
  State<BookCardView> createState() => _BookCardViewState();
}

class _BookCardViewState extends State<BookCardView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Common.bookCardNetworkImg(widget.imageUrl),
            ),
            5.verticalSpace ,
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: poppinsSemiBold,
                fontWeight: FontWeight.bold,
              ),
            ),

            8.verticalSpace ,
            // Text(
            //   'Author Name',
            //   style: TextStyle(
            //     color: AppColors.grey,
            //     fontSize: Responsive.text * 1.8,
            //
            //     fontFamily: poppinsSemiBold,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // WBox.y0 ,
            // Container(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: Responsive.width * 1.4),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(Responsive.text * 1.5),
            //     border: Border.all(
            //       color: Colors.black,
            //       width: 1.5,
            //     ),
            //   ),
            //   child: Text(
            //     "Get",
            //     style: TextStyle(
            //       fontFamily: poppinsSemiBold,
            //       fontSize: Responsive.text * 2,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
