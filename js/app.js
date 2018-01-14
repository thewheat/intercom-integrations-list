"use strict";







var appControllers = angular.module('appControllers', []);

appControllers.controller('listCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.isLoading = true;
  $scope.tableView = false;
  $scope.showImages = true;
  $scope.searchTagData = {};
  $scope.matchedData = [];
  $scope.data = [];
  $scope.uniqueTags = [];

  $http.get("data/data.json").success(function(data) {
      var tags = [];
      for(var i = 0; i < data.length; i++){
        tags = _.union(tags,data[i].tags);
      }
      var uniqueTags = _.uniq(tags.map(function(x){ return x.trim()})).sort();
      var orderedTags = uniqueTags;
      orderedTags = _.without(orderedTags,"iOS","Android","Cordova");
                      orderedTags.unshift("iOS","Android","Cordova");
      orderedTags = _.without(orderedTags, "Official","3rd party/Community");
                       orderedTags.unshift("Official","3rd party/Community");
      $scope.uniqueTags = orderedTags;
      $scope.data = data;
      $scope.isLoading = false;
  });


  $scope.filteredData = function(){
      var tagsToSearchOn = [];
      for(var d in $scope.searchTagData){
        if($scope.searchTagData[d])
          tagsToSearchOn.push(d);
      }

      $scope.matchedData = $scope.data.filter(function(item){ 
            var match = true;
            for(var i = 0; i < tagsToSearchOn.length; i++){
              var tag = tagsToSearchOn[i];
              match = match && (item.tags.indexOf(tag) != -1)
            }
            if ($scope.searchText){
              var regex = new RegExp($scope.searchText, "i");

              // search on name and description
              match = match && (item.name.match(regex) || item.description.match(regex))
            }
            return match;
        });
      return $scope.matchedData;
  }
}]);

var theApp = angular.module('myApp', [
  'appControllers'
]);
