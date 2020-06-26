<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
var data = [{
	  "key1": "value1",
	  "key2": "value2",
	  "key3": "value3",
	  "array_key": ["array1", "array2", "array3"]
	}, {
	  "key1": "value1_1",
	  "key2": "value2_1",
	  "key3": "value3_1",
	  "array_key": ["array1_1", "array2_1", "array3_1", "array4"]

	}, {
	  "key1": "value1_last",
	  "key2": "value2_last",
	  "key3": "value3_last",
	  "array_key": ["array1_last"]

	}];

	var result = data.reduce(function(r, e) {
	  return Object.keys(e).forEach(function(k) {
	    if (!r[k]) r[k] = [].concat(e[k])
	    else r[k] = r[k].concat(e[k])
	  }), r
	}, {});

	console.log(result); 
</script>