//* Use this function for handle usecase result
import 'package:dartz/dartz.dart';
import 'package:salon/src/core/errors/exceptions.dart';
import 'package:salon/src/core/errors/failures.dart';

Future<Either<Failure, T>> exceptionHandler<T>(Function usecase,
    {bool needParse = true}) async {
  try {
    var res = await usecase();
    return !needParse ? Right(res) : Right((res).toEntity);
  } on BadRequestException catch (e) {
    return Left(BadRequestFailure(e.message, e.request));
  } on BadGatewayException catch (e) {
    return Left(BadGatewayFailure(e.message, e.request));
  } on NotFoundException catch (e) {
    return Left(NotFoundFailure(e.message, e.request));
  } on InternalServerException catch (e) {
    return Left(InternalServerFailure(e.message, e.request));
  } on MaintainServerException catch (e) {
    return Left(MaintainServerFailure(e.message, e.request));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message, e.request));
  } on AppException catch (e) {
    return Left(AppFailure(e.message));
  } on NetworkException {
    return const Left(NetworkFailure());
  } on AuthenticationException catch (e) {
    return Left(AuthenticationFailure(e.message));
  } on Exception catch (e) {
    return Left(AppFailure(e.toString()));
  } catch (err) {
    return Left(AppFailure(err.toString()));
  }
}
