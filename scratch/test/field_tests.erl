-module(field_tests).
-include_lib("eunit/include/eunit.hrl").
-include("include/core.hrl").

any_test() ->
    ?assert(true).

field_cell_number_test() ->
    FCellNumber = #field_cell_number{},
    ?assertMatch(
       #field_cell_number { field = #field { id = 'field cell number', type = 'cell_number()' },
                            value = undefined },
       FCellNumber
      ),
    ?assertMatch(
       #field_cell_number { field = #field { id = 'field cell number', type = 'cell_number()' },
                            value = { "0939", "527", "292" }
                          },
       FCellNumber#field_cell_number { value = { "0939", "527", "292" } }
      ),
    ok.
