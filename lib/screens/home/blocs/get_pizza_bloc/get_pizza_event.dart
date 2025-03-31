part of 'get_pizza_bloc.dart';

@immutable
sealed class GetPizzaEvent extends Equatable{
  const GetPizzaEvent();

   @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetPizza extends GetPizzaEvent{}