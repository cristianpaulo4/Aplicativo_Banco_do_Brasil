import 'package:banco_brasil/app/modules/home/components/botao.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

Color azul = Color(0xff034DA2);
Color amarelo = Color(0xffFEF200);

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller
  int index = 0;
  TabController _tabController;
  ScrollController _scrollController = ScrollController();
  double space = 50;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      initialIndex: 0,
      length: 4,
    );
    super.initState();

    _scrollController.addListener(
      () {
        double espaco_extra = 75;
        print(_scrollController.position.pixels);

        //ScrollDirection.forward
        bool direcao = _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse;

        if (direcao) {
          print('Subindo');

          //print(_scrollController.position.pixels);
          if (_scrollController.position.pixels <= 139) {
            controller.space += 0.4;
          }

          //setState(() {});
        } else {
          print('Descendo');
          if (_scrollController.position.pixels >= 0 &&
              _scrollController.position.pixels <= 139) {
            controller.space -= 0.4;
          }
          //controller.space--;

        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          Observer(builder: (_) {
            return SliverAppBar(
              excludeHeaderSemantics: true,
              floating: false,
              pinned: true,
              leadingWidth: 75,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('lib/app/modules/home/assets/logo.jpg'),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                  ),
                  onPressed: () {},
                )
              ],
              backgroundColor: Color(0xff034DA2),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Cristian',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                titlePadding: EdgeInsets.only(
                  left: controller.space,
                  bottom: 18,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(10, 0),
                child: Container(
                  color: Color(0xffFEF200),
                  height: 6,
                ),
              ),
            );
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, d) {
                return Column(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'R\$ 12.02,00',
                                  style: TextStyle(
                                    color: azul,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Saldo disponível'),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black45,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'R\$ 1.000,00',
                                  style: TextStyle(
                                    color: azul,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Lançamentos futuro'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 280,
                      child: GridView.count(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        childAspectRatio: 0.7,
                        padding: const EdgeInsets.all(20),
                        addAutomaticKeepAlives: false,
                        addSemanticIndexes: true,
                        addRepaintBoundaries: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          Botao(
                            icon: Icon(Icons.border_all_rounded),
                            titulo: "Extratos",
                            onPressed: () {},
                          ),
                          Botao(
                            icon: Icon(Icons.compare_arrows),
                            titulo: "Transferencia",
                            onPressed: () {},
                          ),
                          Botao(
                            icon: Icon(Icons.monetization_on),
                            titulo: "Emprestimos",
                            onPressed: () {},
                          ),
                          Botao(
                            icon: Icon(Icons.fit_screen),
                            titulo: "Pagamento",
                            onPressed: () {},
                          ),
                          Botao(
                            icon: Icon(Icons.bar_chart_sharp),
                            titulo: "Investimento",
                            onPressed: () {},
                          ),
                          Botao(
                            icon: Icon(Icons.phone),
                            titulo: "Recarga",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(20),
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.add_circle_outline),
                      ),
                    )
                  ],
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: azul,
        unselectedLabelColor: Colors.black45,
        labelPadding: EdgeInsets.all(0),
        indicatorPadding: EdgeInsets.all(0),
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: azul,
              width: 3,
            ),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: azul,
        indicatorWeight: 0,
        dragStartBehavior: DragStartBehavior.start,
        tabs: [
          Tab(
            icon: Icon(
              Icons.menu,
              size: 28,
            ),
            iconMargin: EdgeInsets.all(5),
            text: "Menu",
          ),
          Tab(
            icon: Icon(
              Icons.home,
              size: 28,
            ),
            iconMargin: EdgeInsets.all(5),
            text: "Home",
          ),
          Tab(
            icon: Icon(
              Icons.account_balance,
              size: 28,
            ),
            iconMargin: EdgeInsets.all(5),
            text: "Vantagens",
          ),
          Tab(
            iconMargin: EdgeInsets.all(5),
            icon: Icon(
              Icons.person_outline,
              size: 28,
            ),
            text: "Perfil",
          ),
        ],
      ),
    );
  }
}
