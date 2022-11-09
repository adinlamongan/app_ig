@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row ">
        <div class="col-3 p-5">

            @if ($user->stories->count() > 0)
                <a href="/stories/{{$user->username}}" >
                    <img src="{{ asset($user->profile->getProfileImage()) }}" class="border-linear  w-100">
                </a>
            @else
                <img src="{{ asset($user->profile->getProfileImage()) }}" class="rounded-circle w-100">
            @endif
        </div>

        <div class="col-9 pt-5">
            <div class="d-flex align-items-center">
                <div class="d-flex">
                    <div class="p-1">
                        <input type="hidden" id="txt_url" value="{{url('follow/')}}/{{$user->username}}">
                        <h1>{{ $user->username }}</h1>
                    </div>
                </div>

                @can('update', $user->profile)
                    <div class="p-2">
                        <a class="btn btn-primary ml-3" href="/profile/{{$user->username}}/edit" role="button">
                            Edit Profile
                        </a>
                    </div>
                @else
                    <div class="p-2">
                        <a type="button" class="btn btn-primary ml-3" data-user_id="{{$user->id}}" id="btn_follow" role="button">
                            @if ($follows)
                                <span id="lbl_follow">Unfollow</span>  
                            @else
                                <span id="lbl_follow">Follow</span>  
                            @endif
                        </a>
                    </div>
                @endcan
            </div>
            <div class="d-flex">
                <div class="p-1"><strong> {{ $postCount }} </strong> posts</div>
                <div class="p-1"><strong> <span id="follower"> {{ $followersCount }} </span> </strong> followers</div>
                <div class="p-1"><strong> {{ $followingCount }} </strong> following</div>
            </div>
            <div class="d-flex">
                <div class="p-1">
                    <div class="pt-1 fw-bold ">{{ $user->name }}</div>
                </div>
            </div>
            <div class="d-flex">
               <div class="p-1">
                    {!! nl2br(e($user->profile->bio)) !!}
                </div>
            </div>
             <div class="d-flex">
               <div class="p-1">
                    <div class="fw-bold">
                        <a href="{{ $user->profile->website }}" target="_blanc">
                            {{ $user->profile->website }}
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="row pt-4 border-top">

        @forelse ($user->posts as $post)
            <div class="col-4 col-md-4 mb-4 align-self-stretch">
                <a href="/p/{{ $post->id }}">
                    <img class="img border" height="300" src="{{ asset("storage/$post->image") }}">
                </a>
            </div>
        @empty
            <div class="col-12 d-flex justify-content-center text-muted">
                <div class="card border-0 text-center bg-transparent" >
                    <img src="{{asset('img/noimage.png')}}" class="card-img-top" alt="...">
                    <div class="card-body ">
                        <h1>No Posts Yet</h1>
                    </div>
                </div>
            </div>
        @endforelse

    </div>
</div>
@endsection


