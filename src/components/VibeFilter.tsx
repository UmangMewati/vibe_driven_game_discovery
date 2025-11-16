import { Vibe } from '../lib/supabase';

type VibeFilterProps = {
  vibes: Vibe[];
  selectedVibes: string[];
  onToggleVibe: (vibeName: string) => void;
};

export function VibeFilter({ vibes, selectedVibes, onToggleVibe }: VibeFilterProps) {
  return (
    <div className="bg-slate-800/30 backdrop-blur-sm rounded-xl p-6 border border-slate-700/50">
      <h2 className="text-xl font-bold text-white mb-4 flex items-center gap-2">
        <span className="text-2xl">✨</span>
        Filter by Vibe
      </h2>
      <div className="flex flex-wrap gap-2">
        {vibes.map((vibe) => {
          const isSelected = selectedVibes.includes(vibe.name);
          return (
            <button
              key={vibe.id}
              onClick={() => onToggleVibe(vibe.name)}
              className={`px-4 py-2 rounded-full font-medium transition-all duration-200 ${
                isSelected
                  ? 'shadow-lg transform scale-105'
                  : 'hover:scale-105 opacity-70 hover:opacity-100'
              }`}
              style={{
                backgroundColor: isSelected ? `${vibe.color}` : `${vibe.color}20`,
                color: isSelected ? '#FFFFFF' : vibe.color,
                borderWidth: '1px',
                borderColor: `${vibe.color}${isSelected ? '' : '40'}`,
              }}
            >
              <span className="flex items-center gap-2">
                {vibe.emoji && <span>{vibe.emoji}</span>}
                <span>{vibe.name}</span>
              </span>
            </button>
          );
        })}
      </div>
      {selectedVibes.length > 0 && (
        <div className="mt-4 pt-4 border-t border-slate-700/50">
          <button
            onClick={() => selectedVibes.forEach(onToggleVibe)}
            className="text-sm text-cyan-400 hover:text-cyan-300 transition-colors"
          >
            Clear all filters
          </button>
        </div>
      )}
    </div>
  );
}
