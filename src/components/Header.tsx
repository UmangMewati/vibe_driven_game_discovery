import { useState } from 'react';
import { useAuth } from '../contexts/AuthContext';
import { LogOut, User, Heart, Sparkles } from 'lucide-react';
import { Auth } from './Auth';

type HeaderProps = {
  onShowFavorites: () => void;
  showingFavorites: boolean;
};

export function Header({ onShowFavorites, showingFavorites }: HeaderProps) {
  const { user, signOut } = useAuth();
  const [showAuth, setShowAuth] = useState(false);
  const [showUserMenu, setShowUserMenu] = useState(false);

  return (
    <>
      <header className="sticky top-0 z-40 bg-slate-900/80 backdrop-blur-xl border-b border-slate-800/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            <div className="flex items-center gap-3">
              <div className="bg-gradient-to-br from-cyan-400 to-blue-500 p-2 rounded-lg shadow-lg shadow-cyan-500/25">
                <Sparkles className="text-white" size={24} />
              </div>
              <div>
                <h1 className="text-2xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">
                  GameSoul
                </h1>
                <p className="text-xs text-slate-400 leading-none">Discover by vibe</p>
              </div>
            </div>

            <nav className="flex items-center gap-3">
              {user ? (
                <>
                  <button
                    onClick={onShowFavorites}
                    className={`flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-all duration-200 ${
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
                      className="flex items-center gap-2 px-4 py-2 rounded-lg text-slate-300 hover:text-white hover:bg-slate-800 transition-all duration-200"
                    >
                      <User size={18} />
                      <span className="hidden sm:inline">Account</span>
                    </button>

                    {showUserMenu && (
                      <div className="absolute right-0 mt-2 w-48 bg-slate-800 border border-slate-700 rounded-lg shadow-xl overflow-hidden">
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
                  onClick={() => setShowAuth(true)}
                  className="px-5 py-2 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white font-semibold rounded-lg transition-all duration-200 shadow-lg shadow-cyan-500/25"
                >
                  Sign In
                </button>
              )}
            </nav>
          </div>
        </div>
      </header>

      {showAuth && <Auth onClose={() => setShowAuth(false)} />}
    </>
  );
}
