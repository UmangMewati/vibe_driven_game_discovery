import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase, Game, Vibe, UserFavorite } from '../lib/supabase';
import { Sparkles, LogOut, User, Heart } from 'lucide-react';
import { VibeFilter } from '../components/VibeFilter';
import { SearchBar } from '../components/SearchBar';
import { GameCard } from '../components/GameCard';
import { GameDetail } from '../components/GameDetail';

export function GamesPage() {
  const navigate = useNavigate();
  const { user, signOut } = useAuth();
  const [games, setGames] = useState<Game[]>([]);
  const [vibes, setVibes] = useState<Vibe[]>([]);
  const [favorites, setFavorites] = useState<UserFavorite[]>([]);
  const [selectedVibes, setSelectedVibes] = useState<string[]>([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [loading, setLoading] = useState(true);
  const [showingFavorites, setShowingFavorites] = useState(false);
  const [selectedGame, setSelectedGame] = useState<Game | null>(null);
  const [showUserMenu, setShowUserMenu] = useState(false);

  useEffect(() => {
    loadVibes();
    loadGames();
  }, []);

  useEffect(() => {
    if (user) {
      loadFavorites();
    } else {
      setFavorites([]);
      setShowingFavorites(false);
    }
  }, [user]);

  const loadVibes = async () => {
    const { data, error } = await supabase
      .from('vibes')
      .select('*')
      .order('name');

    if (!error && data) {
      setVibes(data);
    }
  };

  const loadGames = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from('games')
      .select('*')
      .order('title');

    if (!error && data) {
      setGames(data);
    }
    setLoading(false);
  };

  const loadFavorites = async () => {
    if (!user) return;

    const { data, error } = await supabase
      .from('user_favorites')
      .select('*')
      .eq('user_id', user.id);

    if (!error && data) {
      setFavorites(data);
    }
  };

  const toggleFavorite = async (gameId: string) => {
    if (!user) {
      navigate('/auth');
      return;
    }

    const existingFavorite = favorites.find((f) => f.game_id === gameId);

    if (existingFavorite) {
      const { error } = await supabase
        .from('user_favorites')
        .delete()
        .eq('id', existingFavorite.id);

      if (!error) {
        setFavorites(favorites.filter((f) => f.id !== existingFavorite.id));
      }
    } else {
      const { data, error } = await supabase
        .from('user_favorites')
        .insert([{ user_id: user.id, game_id: gameId }])
        .select()
        .single();

      if (!error && data) {
        setFavorites([...favorites, data]);
      }
    }
  };

  const toggleVibe = (vibeName: string) => {
    setSelectedVibes((prev) =>
      prev.includes(vibeName)
        ? prev.filter((v) => v !== vibeName)
        : [...prev, vibeName]
    );
  };

  const filteredGames = games.filter((game) => {
    const matchesSearch =
      game.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
      game.developer.toLowerCase().includes(searchQuery.toLowerCase()) ||
      game.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
      game.vibe_tags.some((tag) => tag.toLowerCase().includes(searchQuery.toLowerCase()));

    const matchesVibes =
      selectedVibes.length === 0 ||
      selectedVibes.every((vibe) => game.vibe_tags.includes(vibe));

    const matchesFavorites =
      !showingFavorites || favorites.some((f) => f.game_id === game.id);

    return matchesSearch && matchesVibes && matchesFavorites;
  });

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950">
      <header className="sticky top-0 z-40 bg-slate-900/80 backdrop-blur-xl border-b border-slate-800/50 animate-slide-up">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            <button
              onClick={() => navigate('/')}
              className="flex items-center gap-3 hover:scale-105 transition-transform duration-300"
            >
              <div className="bg-gradient-to-br from-cyan-400 to-blue-500 p-2 rounded-lg shadow-lg shadow-cyan-500/25">
                <Sparkles className="text-white" size={24} />
              </div>
              <div>
                <h1 className="text-2xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">
                  GameSoul
                </h1>
                <p className="text-xs text-slate-400 leading-none">Discover by vibe</p>
              </div>
            </button>

            <nav className="flex items-center gap-3">
              {user ? (
                <>
                  <button
                    onClick={() => setShowingFavorites(!showingFavorites)}
                    className={`flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-all duration-300 hover:scale-105 active:scale-95 ${
                      showingFavorites
                        ? 'bg-gradient-to-r from-red-500 to-pink-500 text-white shadow-lg shadow-red-500/25'
                        : 'text-slate-300 hover:text-white hover:bg-slate-800'
                    }`}
                  >
                    <Heart size={18} className={showingFavorites ? 'fill-current' : ''} />
                    <span className="hidden sm:inline">Favorites</span>
                  </button>

                  <div className="relative">
                    <button
                      onClick={() => setShowUserMenu(!showUserMenu)}
                      className="flex items-center gap-2 px-4 py-2 rounded-lg text-slate-300 hover:text-white hover:bg-slate-800 transition-all duration-300 hover:scale-105 active:scale-95"
                    >
                      <User size={18} />
                      <span className="hidden sm:inline">Account</span>
                    </button>

                    {showUserMenu && (
                      <div className="absolute right-0 mt-2 w-48 bg-slate-800 border border-slate-700 rounded-lg shadow-xl overflow-hidden animate-scale-in">
                        <div className="px-4 py-3 border-b border-slate-700">
                          <p className="text-sm text-slate-400">Signed in as</p>
                          <p className="text-sm text-white font-medium truncate">
                            {user.email}
                          </p>
                        </div>
                        <button
                          onClick={() => {
                            signOut();
                            setShowUserMenu(false);
                          }}
                          className="w-full px-4 py-3 text-left text-red-400 hover:bg-slate-700 transition-colors flex items-center gap-2"
                        >
                          <LogOut size={16} />
                          Sign Out
                        </button>
                      </div>
                    )}
                  </div>
                </>
              ) : (
                <button
                  onClick={() => navigate('/auth')}
                  className="px-5 py-2 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white font-semibold rounded-lg transition-all duration-300 shadow-lg shadow-cyan-500/25 hover:shadow-cyan-500/40 hover:scale-105 active:scale-95"
                >
                  Sign In
                </button>
              )}
            </nav>
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="mb-8">
          <div className="text-center mb-8 animate-slide-up">
            <h2 className="text-4xl sm:text-5xl font-bold text-white mb-3">
              {showingFavorites ? 'Your Favorites' : 'Discover Your Next Adventure'}
            </h2>
            <p className="text-lg text-slate-400 max-w-2xl mx-auto">
              {showingFavorites
                ? 'Games that resonated with your soul'
                : 'Find soulful indie games through mood, not marketing'}
            </p>
          </div>

          <div className="space-y-6 animate-fade-in">
            <SearchBar value={searchQuery} onChange={setSearchQuery} />
            <VibeFilter
              vibes={vibes}
              selectedVibes={selectedVibes}
              onToggleVibe={toggleVibe}
            />
          </div>
        </div>

        {loading ? (
          <div className="animate-fade-in">
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
              {[...Array(8)].map((_, i) => (
                <div key={i} className="animate-pulse">
                  <div className="bg-slate-800/50 rounded-xl overflow-hidden border border-slate-700/50">
                    <div className="aspect-[3/4] skeleton" />
                    <div className="p-4 space-y-3">
                      <div className="h-6 skeleton rounded" />
                      <div className="h-4 skeleton rounded w-2/3" />
                      <div className="h-4 skeleton rounded" />
                      <div className="h-4 skeleton rounded w-3/4" />
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ) : filteredGames.length === 0 ? (
          <div className="text-center py-20 animate-fade-in">
            <div className="text-6xl mb-4 animate-scale-in">🎮</div>
            <h3 className="text-2xl font-bold text-white mb-2 animate-slide-up">
              {showingFavorites ? 'No favorites yet' : 'No games found'}
            </h3>
            <p className="text-slate-400 max-w-md mx-auto animate-slide-up">
              {showingFavorites
                ? 'Start exploring and add games to your favorites collection'
                : 'Try adjusting your filters or search query'}
            </p>
          </div>
        ) : (
          <>
            <div className="mb-6 text-slate-400 text-sm animate-fade-in">
              Found {filteredGames.length} {filteredGames.length === 1 ? 'game' : 'games'}
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
              {filteredGames.map((game) => (
                <GameCard
                  key={game.id}
                  game={game}
                  isFavorite={favorites.some((f) => f.game_id === game.id)}
                  onToggleFavorite={toggleFavorite}
                  onClickCard={setSelectedGame}
                  isAuthenticated={!!user}
                />
              ))}
            </div>
          </>
        )}
      </main>

      {selectedGame && (
        <GameDetail
          game={selectedGame}
          isFavorite={favorites.some((f) => f.game_id === selectedGame.id)}
          onToggleFavorite={toggleFavorite}
          onClose={() => setSelectedGame(null)}
          isAuthenticated={!!user}
        />
      )}
    </div>
  );
}
