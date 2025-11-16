import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Sparkles, TrendingUp, Heart, Shield, Gamepad2, ChevronRight } from 'lucide-react';

export function LandingPage() {
  const navigate = useNavigate();
  const [scrollY, setScrollY] = useState(0);

  useEffect(() => {
    const handleScroll = () => setScrollY(window.scrollY);
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const features = [
    {
      icon: Sparkles,
      title: 'Vibe-Based Discovery',
      description: 'Find games that match your mood, not just your genre preferences.',
      gradient: 'from-cyan-500 to-blue-500',
    },
    {
      icon: Heart,
      title: 'Curated Collection',
      description: '100+ handpicked indie gems that deserve your attention.',
      gradient: 'from-pink-500 to-rose-500',
    },
    {
      icon: TrendingUp,
      title: 'Smart Recommendations',
      description: 'Get personalized suggestions based on your favorite vibes.',
      gradient: 'from-purple-500 to-indigo-500',
    },
    {
      icon: Shield,
      title: 'Secure & Private',
      description: 'Your gaming preferences are safe with enterprise-grade security.',
      gradient: 'from-green-500 to-emerald-500',
    },
  ];

  const vibes = [
    { emoji: '🌙', name: 'Cozy', color: '#F59E0B' },
    { emoji: '🎭', name: 'Melancholic', color: '#6366F1' },
    { emoji: '⚔️', name: 'Adventurous', color: '#10B981' },
    { emoji: '🔮', name: 'Mysterious', color: '#8B5CF6' },
    { emoji: '🌟', name: 'Uplifting', color: '#FBBF24' },
    { emoji: '🎨', name: 'Surreal', color: '#A78BFA' },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950 overflow-hidden">
      <nav className="fixed top-0 w-full z-50 bg-slate-900/80 backdrop-blur-xl border-b border-slate-800/50 transition-all duration-300">
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
              </div>
            </div>
            <div className="flex items-center gap-4">
              <button
                onClick={() => navigate('/auth')}
                className="text-slate-300 hover:text-white transition-all duration-300 hover:scale-105 px-4 py-2"
              >
                Sign In
              </button>
              <button
                onClick={() => navigate('/games')}
                className="px-6 py-2.5 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white font-semibold rounded-lg transition-all duration-300 shadow-lg shadow-cyan-500/25 hover:shadow-cyan-500/40 hover:scale-105 active:scale-95"
              >
                Browse Games
              </button>
            </div>
          </div>
        </div>
      </nav>

      <section className="relative min-h-screen flex items-center justify-center px-4 pt-16">
        <div
          className="absolute inset-0 opacity-30"
          style={{
            transform: `translateY(${scrollY * 0.5}px)`,
            background: 'radial-gradient(circle at 50% 50%, rgba(6, 182, 212, 0.1) 0%, transparent 50%)',
          }}
        />

        <div className="relative z-10 max-w-6xl mx-auto text-center animate-fade-in">
          <div className="inline-block mb-6 px-6 py-2 bg-gradient-to-r from-cyan-500/10 to-blue-500/10 border border-cyan-500/20 rounded-full backdrop-blur-sm animate-slide-up">
            <span className="text-cyan-400 font-medium">Discover Games by Vibe, Not Hype</span>
          </div>

          <h1 className="text-5xl sm:text-6xl lg:text-7xl font-bold text-white mb-6 leading-tight animate-slide-up">
            Find Your Next
            <br />
            <span className="bg-gradient-to-r from-cyan-400 via-blue-400 to-purple-400 bg-clip-text text-transparent">
              Soul-Touching Game
            </span>
          </h1>

          <p className="text-xl text-slate-400 mb-12 max-w-3xl mx-auto leading-relaxed animate-slide-up">
            Cut through the noise of gaming libraries. GameSoul helps you discover indie masterpieces
            based on how they make you feel, not just what they look like.
          </p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center animate-slide-up">
            <button
              onClick={() => navigate('/games')}
              className="group px-8 py-4 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white font-bold rounded-xl transition-all duration-300 shadow-2xl shadow-cyan-500/25 hover:shadow-cyan-500/50 hover:scale-105 active:scale-95 flex items-center gap-2"
            >
              Start Exploring
              <ChevronRight className="group-hover:translate-x-1 transition-transform" size={20} />
            </button>
            <button
              onClick={() => {
                const featuresSection = document.getElementById('features');
                featuresSection?.scrollIntoView({ behavior: 'smooth' });
              }}
              className="px-8 py-4 bg-slate-800/50 hover:bg-slate-800/80 text-white font-bold rounded-xl transition-all duration-300 border border-slate-700/50 hover:border-slate-600/50 hover:scale-105 active:scale-95 backdrop-blur-sm"
            >
              Learn More
            </button>
          </div>

          <div className="mt-16 flex flex-wrap justify-center gap-3 animate-fade-in">
            {vibes.map((vibe) => (
              <div
                key={vibe.name}
                className="px-5 py-3 rounded-full font-medium backdrop-blur-md shadow-lg border transition-all duration-300 hover:scale-110 hover:shadow-2xl cursor-pointer"
                style={{
                  backgroundColor: `${vibe.color}15`,
                  color: vibe.color,
                  borderColor: `${vibe.color}40`,
                }}
              >
                <span className="mr-2">{vibe.emoji}</span>
                {vibe.name}
              </div>
            ))}
          </div>
        </div>

        <div className="absolute bottom-10 left-1/2 -translate-x-1/2 animate-bounce">
          <div className="w-6 h-10 border-2 border-slate-600 rounded-full flex items-start justify-center p-2">
            <div className="w-1.5 h-3 bg-slate-500 rounded-full" />
          </div>
        </div>
      </section>

      <section id="features" className="relative py-32 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-20">
            <h2 className="text-4xl sm:text-5xl font-bold text-white mb-6 animate-slide-up">
              Why GameSoul?
            </h2>
            <p className="text-xl text-slate-400 max-w-2xl mx-auto animate-slide-up">
              A smarter way to discover games that truly resonate with your soul
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {features.map((feature, index) => (
              <div
                key={feature.title}
                className="group relative bg-slate-800/30 backdrop-blur-sm rounded-2xl p-8 border border-slate-700/50 hover:border-slate-600/50 transition-all duration-500 hover:scale-105 hover:shadow-2xl animate-slide-up"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <div
                  className={`inline-flex p-4 rounded-xl bg-gradient-to-br ${feature.gradient} shadow-lg mb-6 group-hover:scale-110 transition-transform duration-300`}
                >
                  <feature.icon className="text-white" size={28} />
                </div>
                <h3 className="text-2xl font-bold text-white mb-4">{feature.title}</h3>
                <p className="text-slate-400 leading-relaxed">{feature.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="relative py-32 px-4 bg-gradient-to-br from-slate-900 to-slate-950">
        <div className="max-w-7xl mx-auto">
          <div className="grid lg:grid-cols-2 gap-16 items-center">
            <div className="animate-slide-up">
              <h2 className="text-4xl sm:text-5xl font-bold text-white mb-6">
                Over 100+ Indie Games
              </h2>
              <p className="text-xl text-slate-400 mb-8 leading-relaxed">
                From cozy farming sims to challenging roguelikes, we've curated the best indie
                experiences across all moods and vibes.
              </p>
              <div className="flex items-center gap-8 mb-8">
                <div>
                  <div className="text-4xl font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">
                    100+
                  </div>
                  <div className="text-slate-400">Curated Games</div>
                </div>
                <div>
                  <div className="text-4xl font-bold bg-gradient-to-r from-pink-400 to-rose-400 bg-clip-text text-transparent">
                    12+
                  </div>
                  <div className="text-slate-400">Unique Vibes</div>
                </div>
              </div>
              <button
                onClick={() => navigate('/games')}
                className="px-8 py-4 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white font-bold rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl hover:scale-105 active:scale-95 inline-flex items-center gap-2"
              >
                <Gamepad2 size={20} />
                Explore Collection
              </button>
            </div>

            <div className="relative animate-scale-in">
              <div className="grid grid-cols-2 gap-4">
                {[1, 2, 3, 4].map((i) => (
                  <div
                    key={i}
                    className="aspect-square rounded-xl bg-gradient-to-br from-slate-800 to-slate-900 border border-slate-700/50 hover:scale-105 transition-transform duration-300 overflow-hidden group"
                  >
                    <div className="w-full h-full bg-gradient-to-br from-cyan-500/20 to-blue-500/20 group-hover:from-cyan-500/30 group-hover:to-blue-500/30 transition-colors duration-300 flex items-center justify-center">
                      <Gamepad2 className="text-slate-600 group-hover:text-slate-500 transition-colors" size={48} />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="relative py-32 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-4xl sm:text-5xl font-bold text-white mb-6 animate-slide-up">
            Ready to Discover Your Next Favorite Game?
          </h2>
          <p className="text-xl text-slate-400 mb-12 animate-slide-up">
            Join thousands of gamers finding their perfect matches through vibe-based discovery
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center animate-slide-up">
            <button
              onClick={() => navigate('/auth')}
              className="px-8 py-4 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white font-bold rounded-xl transition-all duration-300 shadow-2xl shadow-cyan-500/25 hover:shadow-cyan-500/50 hover:scale-105 active:scale-95"
            >
              Get Started Free
            </button>
            <button
              onClick={() => navigate('/games')}
              className="px-8 py-4 bg-slate-800/50 hover:bg-slate-800/80 text-white font-bold rounded-xl transition-all duration-300 border border-slate-700/50 hover:border-slate-600/50 hover:scale-105 active:scale-95 backdrop-blur-sm"
            >
              Browse Without Account
            </button>
          </div>
        </div>
      </section>

      <footer className="relative py-12 px-4 border-t border-slate-800/50">
        <div className="max-w-7xl mx-auto text-center">
          <div className="flex items-center justify-center gap-3 mb-4">
            <div className="bg-gradient-to-br from-cyan-400 to-blue-500 p-2 rounded-lg">
              <Sparkles className="text-white" size={20} />
            </div>
            <span className="text-xl font-bold text-white">GameSoul</span>
          </div>
          <p className="text-slate-500 text-sm">
            Discover games by vibe, not marketing. Built with love for indie games.
          </p>
        </div>
      </footer>
    </div>
  );
}
