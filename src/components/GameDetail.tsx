import { X, Heart, Calendar, Clock, Gamepad2, User, ExternalLink } from 'lucide-react';
import { Game } from '../lib/supabase';

type GameDetailProps = {
  game: Game;
  isFavorite: boolean;
  onToggleFavorite: (gameId: string) => void;
  onClose: () => void;
  isAuthenticated: boolean;
};

export function GameDetail({
  game,
  isFavorite,
  onToggleFavorite,
  onClose,
  isAuthenticated,
}: GameDetailProps) {
  const getVibeColor = (vibe: string) => {
    const colors: Record<string, string> = {
      Cozy: '#F59E0B',
      Melancholic: '#6366F1',
      Adventurous: '#10B981',
      Mysterious: '#8B5CF6',
      Nostalgic: '#EC4899',
      Peaceful: '#06B6D4',
      Whimsical: '#F97316',
      Dark: '#64748B',
      Uplifting: '#FBBF24',
      Surreal: '#A78BFA',
      Challenging: '#EF4444',
      Meditative: '#34D399',
    };
    return colors[vibe] || '#94A3B8';
  };

  return (
    <div className="fixed inset-0 bg-black/80 backdrop-blur-md flex items-center justify-center z-50 p-4 overflow-y-auto">
      <div className="bg-slate-900 rounded-2xl max-w-4xl w-full shadow-2xl border border-slate-700/50 my-8">
        <div className="relative">
          <div className="relative h-80 overflow-hidden rounded-t-2xl">
            <img
              src={game.cover_image || ''}
              alt={game.title}
              className="w-full h-full object-cover"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-slate-900/60 to-transparent" />
          </div>

          <button
            onClick={onClose}
            className="absolute top-4 right-4 p-2 rounded-full bg-slate-900/80 text-white hover:bg-slate-800 backdrop-blur-sm transition-all"
          >
            <X size={24} />
          </button>

          {isAuthenticated && (
            <button
              onClick={() => onToggleFavorite(game.id)}
              className={`absolute top-4 right-16 p-3 rounded-full backdrop-blur-sm transition-all duration-200 ${
                isFavorite
                  ? 'bg-red-500/90 text-white shadow-lg shadow-red-500/50'
                  : 'bg-slate-900/80 text-slate-300 hover:bg-slate-800 hover:text-white'
              }`}
            >
              <Heart size={20} className={isFavorite ? 'fill-current' : ''} />
            </button>
          )}

          <div className="absolute bottom-6 left-6 right-6">
            <h1 className="text-4xl font-bold text-white mb-2">{game.title}</h1>
            <div className="flex flex-wrap gap-2">
              {game.vibe_tags.map((vibe) => (
                <span
                  key={vibe}
                  className="px-3 py-1 rounded-full text-sm font-medium backdrop-blur-md shadow-lg"
                  style={{
                    backgroundColor: `${getVibeColor(vibe)}20`,
                    color: getVibeColor(vibe),
                    borderWidth: '1px',
                    borderColor: `${getVibeColor(vibe)}40`,
                  }}
                >
                  {vibe}
                </span>
              ))}
            </div>
          </div>
        </div>

        <div className="p-6 space-y-6">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="bg-slate-800/50 rounded-lg p-4 border border-slate-700/50">
              <div className="flex items-center gap-2 text-slate-400 mb-1">
                <User size={16} />
                <span className="text-xs font-medium">Developer</span>
              </div>
              <p className="text-white font-semibold">{game.developer}</p>
            </div>

            <div className="bg-slate-800/50 rounded-lg p-4 border border-slate-700/50">
              <div className="flex items-center gap-2 text-slate-400 mb-1">
                <Calendar size={16} />
                <span className="text-xs font-medium">Released</span>
              </div>
              <p className="text-white font-semibold">{game.release_year || 'TBA'}</p>
            </div>

            <div className="bg-slate-800/50 rounded-lg p-4 border border-slate-700/50">
              <div className="flex items-center gap-2 text-slate-400 mb-1">
                <Clock size={16} />
                <span className="text-xs font-medium">Play Time</span>
              </div>
              <p className="text-white font-semibold">{game.estimated_hours || 'Varies'}</p>
            </div>

            <div className="bg-slate-800/50 rounded-lg p-4 border border-slate-700/50">
              <div className="flex items-center gap-2 text-slate-400 mb-1">
                <Gamepad2 size={16} />
                <span className="text-xs font-medium">Genre</span>
              </div>
              <p className="text-white font-semibold text-sm">
                {game.gameplay_style || 'Adventure'}
              </p>
            </div>
          </div>

          <div>
            <h2 className="text-xl font-bold text-white mb-3">About This Game</h2>
            <p className="text-slate-300 leading-relaxed text-lg">{game.description}</p>
          </div>

          {(game.store_url || game.play_url) && (
            <div className="flex gap-3">
              {game.store_url && (
                <a
                  href={game.store_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex-1 bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-500 hover:to-blue-400 text-white font-semibold py-4 px-6 rounded-xl transition-all duration-200 flex items-center justify-center gap-2 shadow-lg shadow-blue-500/30 hover:shadow-blue-500/50 hover:scale-105"
                >
                  <span>View on Store</span>
                  <ExternalLink size={20} />
                </a>
              )}
              {game.play_url && (
                <a
                  href={game.play_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex-1 bg-gradient-to-r from-green-600 to-green-500 hover:from-green-500 hover:to-green-400 text-white font-semibold py-4 px-6 rounded-xl transition-all duration-200 flex items-center justify-center gap-2 shadow-lg shadow-green-500/30 hover:shadow-green-500/50 hover:scale-105"
                >
                  <span>Play Now</span>
                  <ExternalLink size={20} />
                </a>
              )}
            </div>
          )}

          {!isAuthenticated && (
            <div className="bg-gradient-to-r from-cyan-500/10 to-blue-500/10 border border-cyan-500/30 rounded-lg p-4">
              <p className="text-cyan-400 text-center">
                Sign in to add this game to your favorites and create collections
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
