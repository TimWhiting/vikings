Riverpod 2.0 announcement
  - release coming soon

Shift if direction for Riverpod
  - no longer considered "state management" and "dependency injection".
    It is, but in the mind of Flutter developers, it makes them expect
      - a listenable + observable object, with some form of setState/notifyListeners/emit/...
      - some generic "get" method for reading object

 - Instead, Riverpod will now promote itself as a "caching" and "data-binding" framework.
   What it does doesn't actually change. But hopefully the expectations should shift a bit.

   For example "caching" can invoke your "ChangeNotifier" equivalent, typically used
   for storing the result of asynchronous requests.
   But a ChangeNotifier-equivalent is a bit low-level. Riverpod includes utilities that
   go further, such as:
   - offering utilties for invalidating cache
   - adding built-in error handling
   - natively supporting scenarios like pull-to-refresh

Realistically, it doesn't change how Riverpod works. But hopefully people learning about
Riverpod will view it in a different way.


In particular, I want to make it clear that Riverpod is different than your
typical "State management" package.
Riverpod offers new unique ways to solve some problems, and it has a different experience.


-----


Ok, with that out of the way, you likely want to know what's in for Riverpod 2.0.

We could do that the classical way, iterating over the new features one by one.
But that's a bit boring. 

And I also just told you that Riverpod is a unique experience. It may not be exactly
clear how some of these features are helpful.
And at the same time, a common request is for Riverpod to provide tutorials
on how to solve common problems.
 

So, let's me be crazy today. Let's do some live coding.

Time to make a counter application, yay!
Just kidding. let's build a real app for once
_____

Pub app:
- start with a synchronous using Provider<int>
- refactor to @riverpod and showcase hot-reload 
  - those who hate code-generation should be aware that with a tiny bit of boilerplate you can still use riverpod
  - you won't get hot-reload automatically on save, but can still trigger an invalidation of the provider by supplying an extra parameter
- refactor to fetching the first page of the packages API -> show "when" 
- extract PubRepository to a separate provider -> testing
- infinite list -> ListView.builder + family with page parameter
- Add detail package -> family with packageName parameter
- like a package -> notifier
  - when liking a package, should update the metrics
- add search as we type

+++

- cancel network request of detail page if leaving quickly
- debouncing search as we type ?
- pull to refresh details
- http polling for the likes count
  - mention how the polling automatically stops when leaving the page
- using cacheTime such that leaving then re-entering a detrail page quickly doesn't refetch it immediately
- reusable cancellation logic

??
- optimistic like update (modifying it before network request, and if fail, revert)


- generate riverpod_graph
- open flutter devtool to inspect providers


- offline caching -> listenSelf
