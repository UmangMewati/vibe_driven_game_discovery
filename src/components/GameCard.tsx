import { useState } from 'react';
import { Heart, Clock, Plus } from 'lucide-react';
import { Game } from '../lib/supabase';

type GameCardProps = {
  game: Game;
  isFavorite: boolean;
  onToggleFavorite: (gameId: string) => void;
  onAddToCollection?: (gameId: string) => void;
  onClickCard: (game: Game) => void;
  isAuthenticated: boolean;
};

export function GameCard({
  game,
  isFavorite,
  onToggleFavorite,
  onAddToCollection,
  onClickCard,
  isAuthenticated,
}: GameCardProps) {
  const [imageLoaded, setImageLoaded] = useState(false);

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
    <div
      onClick={() => onClickCard(game)}
      className="group relative bg-slate-800/50 backdrop-blur-sm rounded-xl overflow-hidden border border-slate-700/50 hover:border-slate-600/50 transition-all duration-300 hover:shadow-xl hover:shadow-black/20 hover:-translate-y-1 cursor-pointer"
    >
      <div className="relative aspect-[3/4] overflow-hidden bg-slate-900">
        {!imageLoaded && (
          <div className="absolute inset-0 bg-gradient-to-br from-slate-800 to-slate-900 animate-pulse" />
        )}
        <img
          src={game.cover_image || ''}
          alt={game.title}
          className={`w-full h-full object-cover transition-all duration-500 ${
            imageLoaded ? 'opacity-100 scale-100' : 'opacity-0 scale-105'
          } group-hover:scale-110`}
          onLoad={() => setImageLoaded(true)}
        />
        <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-slate-900/40 to-transparent opacity-60 group-hover:opacity-80 transition-opacity" />

        {isAuthenticated && (
          <div className="absolute top-3 right-3 flex gap-2">
            <button
              onClick={(e) => {
                e.stopPropagation();
                onToggleFavorite(game.id);
              }}
              className={`p-2 rounded-full backdrop-blur-sm transition-all duration-200 ${
                isFavorite
                  ? 'bg-red-500/90 text-white shadow-lg shadow-red-500/50'
                  : 'bg-slate-900/60 text-slate-300 hover:bg-slate-900/80 hover:text-white'
              }`}
            >
              <Heart size={18} className={isFavorite ? 'fill-current' : ''} />
            </button>
            {onAddToCollection && (
              <button
                onClick={(e) => {
                  e.stopPropagation();
                  onAddToCollection(game.id);
                }}
                className="p-2 rounded-full bg-slate-900/60 text-slate-300 hover:bg-slate-900/80 hover:text-white backdrop-blur-sm transition-all duration-200"
              >
                <Plus size={18} />
              </button>
            )}
          </div>
        )}

        <div className="absolute bottom-0 left-0 right-0 p-4">
          <div className="flex flex-wrap gap-1.5 mb-2">
            {game.vibe_tags.slice(0, 3).map((vibe) => (
              <span
                key={vibe}
                className="px-2 py-0.5 rounded-full text-xs font-medium backdrop-blur-md shadow-lg"
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

      <div className="p-4">
        <h3 className="text-lg font-bold text-white mb-1 line-clamp-1">{game.title}</h3>
        <p className="text-sm text-slate-400 mb-2">{game.developer}</p>
        <p className="text-sm text-slate-300 line-clamp-2 mb-3 leading-relaxed">
          {game.description}
        </p>

        <div className="flex items-center justify-between text-xs text-slate-400 border-t border-slate-700/50 pt-3">
          <span className="flex items-center gap-1">
            <Clock size={14} />
            {game.estimated_hours}
          </span>
          <span className="font-medium">{game.release_year}</span>
        </div>
      </div>
    </div>
  );
}
