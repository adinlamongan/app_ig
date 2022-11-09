<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div id="app">
        <nav class="navbar fixed-top navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    MIRIP IG
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav me-auto">

                    </ul>
                    
                    <form action="/search" method="POST" role="search" class="m-auto d-inline w-80">
                        @csrf
                        <div class="input-group">
                            <input class="form-control" name="q" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" style="border-color: #ced4da"><i class="fas fa-search"></i></button>
                        </div>
                    </form>
                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ms-auto">
                        <!-- Authentication Links -->
                        @guest
                            @if (Route::has('login'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                                </li>
                            @endif

                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else
                            <li class="nav-item px-2 {{ Route::is('post.index') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('/') }}">
                                    <i class="fas fa-home fa-2x"></i>
                                </a>
                            </li>
                            <li class="nav-item px-2 {{ Route::is('post.explore') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('/explore') }}">
                                    <i class="far fa-compass fa-2x"></i>
                                </a>
                            </li>
                            {{-- <li class="nav-item px-2 ">
                                <a class="nav-link" href="#">
                                    <i class="far fa-heart fa-2x"></i>
                                </a>
                            </li> --}}
                            <li class="nav-item pl-2">
                                <a href="/profile/{{Auth::user()->username}}" class="nav-link" style="width: 42px; height: 22px; padding-top: 6px;" >
                                    <img src="{{ asset(Auth::user()->profile->getProfileImage())  }}" class="rounded-circle w-100">
                                    {{-- <i class="far fa-user fa-2x"></i> --}}
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                </a>

                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                                    @can('update', Auth::user()->profile)
                                        <a class="dropdown-item" href="/p/create" role="button">
                                            Add New Post
                                        </a>
                                    @endcan

                                    @can('update', Auth::user()->profile)
                                        <a class="dropdown-item" href="/stories/create" role="button">
                                            Add New Story
                                        </a>
                                    @endcan
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>

        <main class="pt-3 mt-5 " role="main">
            @yield('content')
        </main>
    </div>
</body>
@section('exscript')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
        $(document).ready(function() {

            $.ajaxSetup({
                headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

        
            // button un follow profile
            $(document).on("click", "#btn_follow", function (e) {
                var follows = $("#lbl_follow").html();
                var user_id = $(this).data('user_id');
                var url = $("#txt_url").val();
                var jml_follower = $("#follower").html();

                if (follows == "Follow"){
                    $("#lbl_follow").html("Unfollow");
                    jml_follower = parseInt(jml_follower) + 1;
                }else{
                    $("#lbl_follow").html("Follow");
                    jml_follower = parseInt(jml_follower) - 1;
                }
               $("#follower").html(jml_follower);
                e.preventDefault();
                $.ajax({
                    type:"POST",
                    url: url,
                    data: {
                        "_token": "{{ csrf_token() }}"
                    },
                    dataType: 'json',
                    success: function(res){
                    
                    }
                });
            });

            // butoon love
            $(document).on("click", ".btn_love", function (e) {
                var post_id = $(this).data('id');
                var ketemu = $(this).find('i').attr('style');
                var url = $(this).data('url')+"/2";
                var jml_love = $("#count"+post_id).html();
                //<i class="fas fa-heart fa-2x bbb" style="color:red" data-id="2"></i>
                if(ketemu){
                     $(this).find('i').replaceWith(
                        `<i class="fas fa-heart fa-2x" ></i>`
                    );
                    jml_love = parseInt(jml_love) - 1;
                }else{
                    $(this).find('i').replaceWith(
                        `<i class="fas fa-heart fa-2x" style="color:red"></i>`
                    );
                    jml_love = parseInt(jml_love) + 1;

                }
                $("#count"+post_id).html(jml_love);
                
                e.preventDefault();
                $.ajax({
                    type:"POST",
                    url: url,
                    data: {
                        "_token": "{{ csrf_token() }}"
                    },
                    dataType: 'json',
                    success: function(res){
                    
                    }
                });
            });


        });

    </script>
</html>