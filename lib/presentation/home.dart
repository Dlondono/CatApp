import 'package:cat_app/presentation/blocs/cat_bloc.dart';
import 'package:cat_app/presentation/widgets/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCats();
  }
  void getCats() {
    Future.microtask(() => context.read<CatBloc>().getCats());
  }
  void getCatsByBreed(String breed) {
    Future.microtask(() => context
        .read<CatBloc>()
        .getCatsByBreed(breed));

  }
  @override
  Widget build(BuildContext context) {

    TextEditingController breedController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "CatBreeds",
            style: GoogleFonts.coiny(
              textStyle: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          centerTitle: true),
      body: Consumer<CatBloc>(
        builder: (context, bloc, child) {
          return bloc.catState == CatState.loading
              ? const Center(
                  child: CircularProgressIndicator(
                  strokeWidth: 4,
                    color: Colors.orange,
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40)
                            .copyWith(top: 12),
                        child: TextFormField(
                          controller: breedController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color:
                                Colors.orange)),
                            hintText: 'Busca una raza',

                            suffixIcon: GestureDetector(
                                onTap: () {
                                  if (breedController.text.isNotEmpty) {
                                    getCatsByBreed(breedController.text);
                                    return;
                                  }
                                  getCats();
                                },
                                child: const Icon(Icons.search,color: Colors.orange,)),
                          ),
                          onEditingComplete: () {
                            getCatsByBreed(breedController.text);
                          },
                        ),
                      ),
                      bloc.breeds.isEmpty && breedController.text.isNotEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0)
                                      .copyWith(top: 16),
                              child: const Text(
                                  "No encontramos imágenes con tu búsqueda"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: breedController.text.isEmpty
                                  ? bloc.cats.length
                                  : bloc.breeds.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CatCard(
                                  cat: breedController.text.isEmpty
                                      ? bloc.cats[index]
                                      : bloc.breeds[index].catModel![0],
                                  imageUrl: breedController.text.isEmpty
                                      ? bloc.cats[index].imageUrl
                                      : bloc.breeds[index].imageUrl,
                                );
                              },
                            ),
                    ],
                  ),
                );
        },
      ),
    );

  }


}
