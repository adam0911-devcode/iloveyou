<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Pour Irina</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght=300;400;500;600&display=swap');

        * {
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
        }

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1f0b24 0%, #0a030c 100%);
            color: #ffffff;
            font-family: 'Montserrat', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            /* Curseur cœur par défaut */
            cursor: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' style='font-size:16px'><text y='16'>❤️</text></svg>"), auto !important;
        }

        /* Curseur cœur forcé sur les zones cliquables */
        button, a, [onclick] {
            cursor: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' style='font-size:16px'><text y='16'>❤️</text></svg>"), pointer !important;
        }

        /* Pluie de cœurs en arrière-plan */
        #bgCanvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            pointer-events: none;
        }

        /* Écran d'accueil */
        #intro-card {
            text-align: center;
            background: rgba(255, 255, 255, 0.04);
            padding: 40px 50px;
            border-radius: 24px;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4), inset 0 1px 2px rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.08);
            max-width: 450px;
            width: 90%;
            transition: all 1s cubic-bezier(0.4, 0, 0.2, 1);
            z-index: 20;
        }

        .envelope-icon {
            font-size: 50px;
            margin-bottom: 20px;
            display: inline-block;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        h1 {
            font-size: 22px;
            font-weight: 300;
            letter-spacing: 2px;
            margin-bottom: 15px;
            color: #fce4ec;
        }

        p {
            font-size: 14px;
            color: #b3a2b6;
            line-height: 1.6;
            margin-bottom: 30px;
            font-weight: 300;
        }

        #open-btn {
            background: linear-gradient(45deg, #ff4081, #ff80ab);
            color: white;
            border: none;
            padding: 14px 35px;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 30px;
            box-shadow: 0 5px 20px rgba(255, 64, 129, 0.4);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            position: relative;
            z-index: 25;
        }

        #open-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 64, 129, 0.7);
        }

        /* Zone de l'animation finale */
        #animation-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            display: none;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 2s ease;
            z-index: 5;
        }

        #heartCanvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 5;
        }

        /* Bloc texte central (Parfait pour Ordi) */
        #love-block {
            position: relative;
            z-index: 10;
            text-align: center;
            pointer-events: none;
            animation: pulse 2.5s ease-in-out infinite;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .main-title {
            font-size: 32px;
            font-weight: 600;
            letter-spacing: 3px;
            color: #ffffff;
            text-shadow: 0 0 20px rgba(255, 64, 129, 0.8), 0 0 10px rgba(255, 255, 255, 0.5);
            margin: 0;
        }

        .sub-title {
            font-size: 16px;
            font-weight: 300;
            letter-spacing: 1px;
            color: #ff80ab;
            text-shadow: 0 0 15px rgba(255, 128, 171, 0.6);
            margin: 0;
            font-style: italic;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.04); }
        }

        /* --- CHANGEMENTS UNIQUEMENT POUR TÉLÉPHONE --- */
        @media (max-width: 767px) {
            #intro-card {
                padding: 35px 25px;
                width: 85%;
            }
            .envelope-icon { font-size: 45px; margin-bottom: 15px; }
            h1 { font-size: 20px; }
            p { font-size: 13px; margin-bottom: 25px; }
            #open-btn { padding: 12px 30px; font-size: 14px; }
            
            #love-block {
                width: 80%;
                max-width: 320px;
                gap: 6px;
            }
            .main-title { font-size: 22px; letter-spacing: 2px; line-height: 1.3; }
            .sub-title { font-size: 13px; }
        }
    </style>
</head>
<body>

    <!-- Arrière-plan permanent (Pluie de particules) -->
    <canvas id="bgCanvas"></canvas>

    <!-- Écran d'accueil -->
    <div id="intro-card">
        <div class="envelope-icon">✉️</div>
        <h1>Un message pour toi...</h1>
        <p>Spécialement pour la meilleure des copines que j'aime très beaucoup.</p>
        <!-- Remplacement du onclick classique par un event listener robuste pour mobile -->
        <button id="open-btn">Ouvrir le message secret</button>
    </div>

    <!-- Zone du Grand Cœur -->
    <div id="animation-container">
        <div id="love-block">
            <h2 class="main-title">Pour ma petite reine, Irina</h2>
            <p class="sub-title">Je t'aime un peu plus chaque jour.</p>
        </div>
        <canvas id="heartCanvas"></canvas>
    </div>

    <script>
        // --- 1. PLUIE DE PARTICULES EN ARRIÈRE-PLAN ---
        const bgCanvas = document.getElementById('bgCanvas');
        const bgCtx = bgCanvas.getContext('2d');
        const particles = [];

        function resizeBg() {
            bgCanvas.width = window.innerWidth;
            bgCanvas.height = window.innerHeight;
        }
        window.addEventListener('resize', resizeBg);
        resizeBg();

        class Particle {
            constructor() {
                this.reset();
                this.y = Math.random() * bgCanvas.height; 
            }
            reset() {
                this.x = Math.random() * bgCanvas.width;
                this.y = -10;
                this.size = window.innerWidth < 768 ? Math.random() * 4 + 3 : Math.random() * 5 + 4;
                this.speedY = Math.random() * 0.8 + 0.4;
                this.speedX = Math.random() * 0.4 - 0.2;
                this.opacity = Math.random() * 0.4 + 0.2;
                this.type = Math.random() > 0.5 ? 'heart' : 'petal';
            }
            update() {
                this.y += this.speedY;
                this.x += this.speedX;
                if (this.y > bgCanvas.height) this.reset();
            }
            draw() {
                bgCtx.save();
                bgCtx.globalAlpha = this.opacity;
                bgCtx.fillStyle = this.type === 'heart' ? '#ff4081' : '#ff80ab';
                
                if (this.type === 'heart') {
                    bgCtx.font = `${this.size * 1.5}px Arial`;
                    bgCtx.fillText('❤️', this.x, this.y);
                } else {
                    bgCtx.beginPath();
                    bgCtx.ellipse(this.x, this.y, this.size, this.size/1.5, Math.PI/4, 0, Math.PI*2);
                    bgCtx.fill();
                }
                bgCtx.restore();
            }
        }

        const maxParticles = window.innerWidth < 768 ? 25 : 45;
        for (let i = 0; i < maxParticles; i++) {
            particles.push(new Particle());
        }

        function animateBg() {
            bgCtx.clearRect(0, 0, bgCanvas.width, bgCanvas.height);
            particles.forEach(p => {
                p.update();
                p.draw();
            });
            requestAnimationFrame(animateBg);
        }
        animateBg();


        // --- 2. ANIMATION DU GRAND CŒUR ---
        const canvas = document.getElementById('heartCanvas');
        const ctx = canvas.getContext('2d');

        function resizeCanvas() {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        }
        window.addEventListener('resize', resizeCanvas);
        resizeCanvas();

        const words = [];
        // Garde la grosse densité de 850 sur ordi, et adapte à 600 uniquement sur mobile
        const wordCount = window.innerWidth < 768 ? 600 : 850; 
        let animationStarted = false;

        function getHeartPoint(t) {
            // Le scale s'adapte à l'écran uniquement si c'est un mobile
            const scale = Math.min(canvas.width, canvas.height) / (window.innerWidth < 768 ? 50 : 40); 
            const x = 16 * Math.pow(Math.sin(t), 3);
            const y = 13 * Math.cos(t) - 5 * Math.cos(2*t) - 2 * Math.cos(3*t) - Math.cos(4*t);
            return {
                x: canvas.width / 2 + x * scale,
                y: canvas.height / 2 - (y + 1.2) * scale
            };
        }

        class FloatingWord {
            constructor() {
                this.x = Math.random() * canvas.width;
                this.y = Math.random() * canvas.height;
                this.init();
            }
            init() {
                this.targetT = Math.random() * Math.PI * 2;
                this.speed = 0.015 + Math.random() * 0.02;
                this.alpha = 0;
                this.fontSize = window.innerWidth < 768 ? Math.floor(8 + Math.random() * 6) : Math.floor(10 + Math.random() * 8);
                
                const spread = window.innerWidth < 768 ? 35 : 50;
                this.offsetX = (Math.random() - 0.5) * spread;
                this.offsetY = (Math.random() - 0.5) * spread;

                const r = 255;
                const g = Math.floor(50 + Math.random() * 70);
                const b = Math.floor(130 + Math.random() * 50);
                this.color = `${r}, ${g}, ${b}`;
            }
            update() {
                const targetPoint = getHeartPoint(this.targetT);
                const destX = targetPoint.x + this.offsetX;
                const destY = targetPoint.y + this.offsetY;

                this.x += (destX - this.x) * this.speed;
                this.y += (destY - this.y) * this.speed;

                if (this.alpha < 1) this.alpha += 0.008;
            }
            draw() {
                ctx.save();
                ctx.globalAlpha = this.alpha;
                ctx.fillStyle = `rgba(${this.color}, ${this.alpha})`;
                ctx.font = `600 ${this.fontSize}px 'Montserrat', sans-serif`;
                ctx.textAlign = "center";
                ctx.textBaseline = "middle";
                ctx.fillText("I love you", this.x, this.y);
                ctx.restore();
            }
        }

        function revealLove() {
            if (animationStarted) return;
            animationStarted = true;

            const intro = document.getElementById('intro-card');
            intro.style.opacity = '0';
            intro.style.transform = 'scale(0.9)';
            
            setTimeout(() => {
                intro.style.display = 'none';
                const container = document.getElementById('animation-container');
                container.style.display = 'flex';
                
                setTimeout(() => {
                    container.style.opacity = '1';
                }, 50);
                
                for (let i = 0; i < wordCount; i++) {
                    words.push(new FloatingWord());
                }
                
                animateHeart();
            }, 1000);
        }

        function animateHeart() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            words.forEach(word => {
                word.update();
                word.draw();
            });
            requestAnimationFrame(animateHeart);
        }

        // Fix de sécurité pour garantir que le bouton réponde au clic sur n'importe quel appareil
        const mainButton = document.getElementById('open-btn');
        mainButton.addEventListener('click', revealLove);
        mainButton.addEventListener('touchend', function(e) {
            e.preventDefault(); // Évite les doubles clics fantômes sur mobile
            revealLove();
        });
    </script>
</body>
</html>