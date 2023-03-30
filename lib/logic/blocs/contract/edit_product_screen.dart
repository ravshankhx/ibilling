// import 'package:flutter/material.dart';
// import 'package:my_market/models/product.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/products.dart';
//
// class EditProductScreen extends StatefulWidget {
//   const EditProductScreen({Key? key}) : super(key: key);
//
//   static const routeName = '/edit_product';
//
//   @override
//   State<EditProductScreen> createState() => _EditProductScreenState();
// }
//
// class _EditProductScreenState extends State<EditProductScreen> {
//   // final _priceFocus = FocusNode();
//   var _product = Product(
//     id: '',
//     title: '',
//     description: '',
//     imageUrl: '',
//     price: 0.0,
//   );
//   var _hasImage = true;
//
//   var _init = true;
//   var isLoading = false;
//
//   @override
//   void didChangeDependencies() {
//     if (_init) {
//       super.didChangeDependencies();
//       final productId = ModalRoute.of(context)!.settings.arguments;
//       print(productId);
//       if (productId != null) {
//         //mahsulotni eski malumotini olish
//         final _editingProduct =
//             Provider.of<Products>(context).findById(productId as String);
//         _product = _editingProduct;
//       }
//     }
//     _init = false;
//   }
//
//   final _form = GlobalKey<FormState>();
//   final _imageForm = GlobalKey<FormState>();
//
//   void _showImageDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (ctx) {
//           return AlertDialog(
//             title: const Text("Rasm URL - ni kiriting"),
//             content: Form(
//               key: _imageForm,
//               child: TextFormField(
//                 initialValue: _product.imageUrl,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Iltimos, rasm URL kiriting.";
//                   } else if (value.startsWith('http')) {
//                     "Iltimos to'g'ri rasm url kiriting";
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                     labelText: "Rasm URL", border: OutlineInputBorder()),
//                 keyboardType: TextInputType.url,
//                 onSaved: (newValue) {
//                   _product = Product(
//                       id: _product.id,
//                       title: _product.title,
//                       description: _product.description,
//                       imageUrl: newValue!,
//                       price: _product.price,
//                       isFavorite: _product.isFavorite);
//                 },
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: Text(
//                   "Bekor qilish",
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: saveImageForm,
//                 child: Text(
//                   "Saqlash",
//                 ),
//               ),
//             ],
//           );
//         });
//   }
//
//   Future<void> _saveForm() async {
//     FocusScope.of(context).unfocus();
//     final isValid = _form.currentState!.validate();
//     setState(() {
//       _hasImage = _product.imageUrl.isNotEmpty;
//     });
//
//     if (isValid && _hasImage) {
//       _form.currentState!.save();
//       setState(() {
//         isLoading = true;
//       });
//       if (_product.id.isEmpty) {
//         try {
//           await Provider.of<Products>(context, listen: false)
//               .addProduct(_product);
//         } catch (error) {
//           await showDialog<Null>(
//             context: context,
//             builder: (ctx) {
//               return AlertDialog(
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(ctx).pop();
//                     },
//                     child: Text(
//                       "OK",
//                     ),
//                   ),
//                 ],
//                 content: Text(
//                     "${error.toString()}Mahsulot qo'shishda xatolik sodir bo'ldi"),
//                 title: Text("Xatolik!"),
//               );
//             },
//           );
//         }
//         // finally {
//         //   setState(() {
//         //     isLoading = false;
//         //   });
//         //   Navigator.of(context).pop();
//         // }
//       } else {
//         await Provider.of<Products>(context, listen: false)
//             .updateProduct(_product);
//
//         try {} catch (e) {
//           await showDialog<Null>(
//             context: context,
//             builder: (ctx) {
//               return AlertDialog(
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(ctx).pop();
//                     },
//                     child: Text(
//                       "OK",
//                     ),
//                   ),
//                 ],
//                 content: Text("}Mahsulot qo'shishda xatolik sodir bo'ldi"),
//                 title: Text("Xatolik!"),
//               );
//             },
//           );
//         }
//       }
//       setState(() {
//         isLoading = false;
//       });
//       Navigator.of(context).pop();
//     }
//   }
//
//   void saveImageForm() {
//     final isValid = _imageForm.currentState!.validate();
//     if (isValid) {
//       _imageForm.currentState!.save();
//       print(_product.imageUrl);
//       setState(() {
//         _hasImage = true;
//       });
//       Navigator.of(context).pop();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Mahsulot qo'shish"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: _saveForm,
//             icon: Icon(
//               Icons.save,
//             ),
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : GestureDetector(
//               onTap: () => FocusScope.of(context).unfocus(),
//               child: Form(
//                 key: _form,
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         initialValue: _product.title,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Iltimos, mahsulot nomini kiriting. ';
//                           }
//                           return null;
//                         },
//                         onSaved: (newValue) {
//                           _product = Product(
//                               id: _product.id,
//                               title: newValue!,
//                               description: _product.description,
//                               imageUrl: _product.imageUrl,
//                               price: _product.price,
//                               isFavorite: _product.isFavorite);
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Nomi',
//                           border: OutlineInputBorder(),
//                         ),
//                         textInputAction: TextInputAction.next,
//                         // onFieldSubmitted: (_) {
//                         //
//                         //   FocusScope.of(context).requestFocus(
//                         //
//                         //     _priceFocus
//                         //   );
//                         //
//                         // },
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         initialValue: _product.price == 0
//                             ? ''
//                             : _product.price.toStringAsFixed(2),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Iltimos, mahsulot narxini kiriting. ';
//                           } else if (double.tryParse(value) == null) {
//                             return "Iltimos to'g'ri narx kiriting";
//                           } else if (double.parse(value) < 1) {
//                             return "Mahsulot narxi noldan katta bo'lishi kerak";
//                           }
//                           return null;
//                         },
//                         onSaved: (newValue) {
//                           _product = Product(
//                               id: _product.id,
//                               title: _product.title,
//                               description: _product.description,
//                               imageUrl: _product.imageUrl,
//                               price: double.parse(newValue!),
//                               isFavorite: _product.isFavorite);
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Narxi',
//                           border: OutlineInputBorder(),
//                         ),
//                         keyboardType: TextInputType.number,
//                         // focusNode: _priceFocus,
//                         textInputAction: TextInputAction.next,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         initialValue: _product.description,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Iltimos, mahsulot tarifini kiriting. ';
//                           } else if (value.length < 10) {
//                             return "Iltimos batafsil ma'lumot kiriting";
//                           }
//                           return null;
//                         },
//                         onSaved: (newValue) {
//                           _product = Product(
//                               id: _product.id,
//                               title: _product.title,
//                               description: newValue!,
//                               imageUrl: _product.imageUrl,
//                               price: _product.price,
//                               isFavorite: _product.isFavorite);
//                         },
//                         decoration: InputDecoration(
//                           labelText: "Qo'shimcha ma'lumot",
//                           alignLabelWithHint: true,
//                           border: OutlineInputBorder(),
//                         ),
//                         maxLines: 5,
//                         keyboardType: TextInputType.multiline,
//                         // focusNode: _priceFocus,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Card(
//                         margin: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                           side: BorderSide(
//                             color: _hasImage
//                                 ? Colors.grey
//                                 : Theme.of(context).errorColor,
//                           ),
//                         ),
//                         child: InkWell(
//                           splashColor: Theme.of(context).primaryColor,
//                           highlightColor: Colors.transparent,
//                           borderRadius: BorderRadius.circular(5),
//                           onTap: () {
//                             _showImageDialog(context);
//                           },
//                           child: Container(
//                             width: double.infinity,
//                             height: 180,
//                             alignment: Alignment.center,
//                             child: _product.imageUrl.isEmpty
//                                 ? Text(
//                                     "Asosiy Rasm Url-ini kiriting!",
//                                     style: TextStyle(
//                                       color: _hasImage
//                                           ? Colors.black
//                                           : Theme.of(context).errorColor,
//                                     ),
//                                   )
//                                 : Image.network(
//                                     _product.imageUrl,
//                                     fit: BoxFit.cover,
//                                     width: double.infinity,
//                                   ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
// }
