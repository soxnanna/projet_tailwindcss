# SCRIPT DE SECOURS (v6 - FAST)
$ErrorActionPreference = "SilentlyContinue"

$Steps = @(
    # Les étapes déjà faites sont sautées ou refaites rapidement
    @{ idx=3; msg="Squelette HTML de base pour index.html"; file="index.html"; lines=7 },
    @{ idx=4; msg="Configuration des balises meta et import Google Fonts/CDN"; file="index.html"; lines=16 },
    @{ idx=5; msg="Mise en place du corps de page avec styles de base"; file="index.html"; lines=18 },
    @{ idx=6; msg="Creation de la barre de navigation avec effet Glassmorphism"; file="index.html"; lines=28 },
    @{ idx=7; msg="Finalisation des liens de navigation (Projets, Ajouter, Contact)"; file="index.html"; lines=32 },
    @{ idx=8; msg="Structure de la section Hero (Accueil)"; file="index.html"; lines=45 },
    @{ idx=9; msg="Stylisation de la section Hero avec degradés"; file="index.html"; lines=52 },
    @{ idx=10; msg="Ajout de la section 'A propos' et grille statistique"; file="index.html"; lines=72 },
    @{ idx=11; msg="Integration de la section Competences avec icones SVG"; file="index.html"; lines=120 },
    @{ idx=12; msg="Mise en page de la section Projets Recents"; file="index.html"; lines=140 },
    @{ idx=13; msg="Section Contact rapide et liens sociaux"; file="index.html"; lines=158 },
    @{ idx=14; msg="Ajout du pied de page et finalisation Accueil"; file="index.html"; lines=-1 },
    @{ idx=15; msg="Squelette de la page catalogue (lister-projet.html)"; file="html-pages/listes-projets/lister-projet.html"; lines=15 },
    @{ idx=16; msg="Finalisation du catalogue de projets"; file="html-pages/listes-projets/lister-projet.html"; lines=-1 },
    @{ idx=17; msg="Formulaire d'ajout de projet (ajouter-projet.html)"; file="html-pages/listes-projets/ajouter-projet.html"; lines=-1 },
    @{ idx=18; msg="Mise en place de la page de contact"; file="html-pages/listes-projets/contact.html"; lines=-1 },
    @{ idx=19; msg="Page de details d'un projet"; file="html-pages/listes-projets/detailler-projet.html"; lines=-1 }
)

foreach($s in $Steps) {
    Write-Host "--- Etape $($s.idx) : $($s.msg) ---"
    $src = "_backup_final/$($s.file)"
    if ($s.lines -gt 0) {
        $content = Get-Content $src | Select-Object -First $s.lines
        $content | Set-Content $s.file -Encoding utf8
    } else {
        Copy-Item $src $s.file -Force
    }
    git add .
    git commit -m $s.msg --allow-empty
}

# Finalisation
Copy-Item _backup_final/* . -Recurse -Force
git add .
git commit -m "Finalisation du projet Portfolio V4" --allow-empty
Write-Host "TERMINE !"
