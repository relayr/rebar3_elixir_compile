%%%-------------------------------------------------------------------
%% @doc demo top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(demo_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, { {one_for_all, 0, 1}, [
        'Elixir.Plug.Adapters.Cowboy2':child_spec([
            {scheme, http},
            {plug, 'Elixir.PlugDemo.Router'},
            {options, [{port, 4002}]}
        ])
      ]}
    }.

%%====================================================================
%% Internal functions
%%====================================================================
