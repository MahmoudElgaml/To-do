class Failure{
  String errorMessage;

  Failure(this.errorMessage);

}
class CacheFail extends Failure{
  CacheFail(super.errorMessage);


}