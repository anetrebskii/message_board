/**
 * Created by anetrebsky on 24/01/17.
 */
this.rootModule.controller('AdvertisementNewController', ['$scope', function ($scope) {
    $scope.title_max_number_letters = 120;

    $scope.ad = {
        title: '',
        description: '',
        price: 0
    };


}]);