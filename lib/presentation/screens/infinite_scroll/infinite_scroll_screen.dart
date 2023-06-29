import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [10,12,13,14,15];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }
        
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void addFiveImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  Future<void> onRefersh () async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));
    if (!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId +1);
    addFiveImages();
    setState(() {});
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void moveScrollToBottom(){
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      //esta es la posición donde estamos, si es 0 sube hasta arriba
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefersh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder:(context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          if (!isLoading) context.pop();
        },
        child: 
        isLoading
        ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded)
        )
        : FadeIn(child: const Icon(Icons.arrow_back))
      ),
    );
  }
}