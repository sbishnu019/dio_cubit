import 'package:dio_cubit/city/data/repositories/city_repository.dart';
import 'package:dio_cubit/city/data/services/providers.dart';
import 'package:dio_cubit/city/presentation/bloc/cities_cubit.dart';
import 'package:dio_cubit/common/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityPage extends StatelessWidget {

  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CitiesCubit>(
      create: (context) =>
          CitiesCubit(
              CityRepository(
                  CityProvider(
                      ApiClient()
                  )
              )
          ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('City'),
          ),
          body: SafeArea(
              child: BlocBuilder<CitiesCubit, CitiesState>(
                builder: (context, state) {
                  if (state is CitiesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (state is CitiesFailed) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  else if (state is CitiesLoaded) {
                    return ListView.builder(
                        itemCount: state.cities.length,
                        itemBuilder: (context, index) => Card(
                            child: ListTile(
                                title: Text(state.cities[index].name)
                            )
                        )
                    );
                  }
                  return Container();
                },
              )
          )
      ),
    );
  }
}
