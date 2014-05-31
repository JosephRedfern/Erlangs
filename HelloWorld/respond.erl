-module(respond).
-export([start/0]).

start() ->
   spawn(fun() -> response_loop() end).

response_loop() ->
   receive
      hello ->
         io:format("Hello There. ~n"),
         response_loop();
     
      time ->
          {Hours, Minutes, _} = time(),
          io:format("Current Time: " ++ integer_to_list(Hours) ++ ":" ++ integer_to_list(Minutes) ++ "~n"),
          response_loop();

      bye->
         ok
   end.
