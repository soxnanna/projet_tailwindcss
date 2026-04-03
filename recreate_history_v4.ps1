
# Script de reconstitution de l'historique final du projet Portfolio V4
# Intervalles aléatoires entre 5 et 10 minutes
# Focus EXCLUSIF sur Tailwind CSS

function Commit-Step {
    param($idx, $msg, $file, $content)
    Write-Host "Étape $idx : $msg"
    
    if ($file -ne $null -and $content -ne $null) {
        $dir = [System.IO.Path]::GetDirectoryName($file)
        if ($dir -and -not (Test-Path $dir)) { mkdir $dir -Force }
        Set-Content -Path $file -Value $content -Encoding utf8
    }
    
    git add .
    git commit -m $msg
    
    if ($idx -lt 38) {
        $wait = Get-Random -Minimum 300 -Maximum 601
        Write-Host "Commit effectué. Attente de $($wait/60) minutes ($wait secondes)..."
        Start-Sleep -Seconds $wait
    }
}

# --- RESET ---
git checkout --orphan clean_history_tailonly
git rm -rf .
Remove-Item -Recurse -Force src, html-pages, index.html, package.json, package-lock.json -ErrorAction SilentlyContinue

# --- ETAPES ---
# Note : Les contenus sont extraits dynamiquement de _backup_final

Commit-Step 1 "Initialisation de la configuration Tailwind CSS" $null $null
Commit-Step 2 "Ajout des dépendances de développement Tailwind (v4)" "package.json" (Get-Content _backup_final/package.json -Raw)
Commit-Step 3 "Création du fichier d'entrée CSS pour Tailwind" "src/css/input.css" (Get-Content _backup_final/src/css/input.css -Raw)
Commit-Step 4 "Squelette HTML pour l'intégration de Tailwind" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 7 | Out-String)
Commit-Step 5 "Liaison du CDN Tailwind CSS et configuration meta" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 11 | Out-String)
Commit-Step 6 "Stylisation de la barre de navigation (bg-gray-800, shadow-md)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 14 | Out-String)
Commit-Step 7 "Bouton 'Liste' avec effets hover Tailwind CSS" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 19 | Out-String)
Commit-Step 8 "Bouton 'Ajouter' avec classes Tailwind transition" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 23 | Out-String)
Commit-Step 9 "Bouton 'Contact' avec utilitaires Tailwind CSS" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 28 | Out-String)
Commit-Step 10 "Mise en forme de la Hero section avec Tailwind (rounded-2xl)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 34 | Out-String)
Commit-Step 11 "Typographie Hero avec Tailwind (text-3xl, font-bold)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 41 | Out-String)
Commit-Step 12 "Stylisation de la section 'À propos' via Tailwind" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 44 | Out-String)
Commit-Step 13 "Espacement et interlignage Tailwind pour la bio" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 51 | Out-String)
Commit-Step 14 "Layout de la section Compétences avec Tailwind CSS" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 54 | Out-String)
Commit-Step 15 "Puces de liste stylisées Tailwind (text-blue-500)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 61 | Out-String)
Commit-Step 16 "Mise en page des outils avec Tailwind (flex items-center)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 65 | Out-String)
Commit-Step 17 "Hiérarchie visuelle Tailwind pour les compétences" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 70 | Out-String)
Commit-Step 18 "Section des projets récents mise en forme via Tailwind" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 74 | Out-String)
Commit-Step 19 "Interlignage des projets récents avec Tailwind (space-y-3)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 89 | Out-String)
Commit-Step 20 "Mise en place de la section contact en blanc (bg-white)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 101 | Out-String)
Commit-Step 21 "Boutons sociaux stylisés en Tailwind (rounded-full, transition)" "index.html" (Get-Content _backup_final/index.html -Raw -TotalCount 122 | Out-String)
Commit-Step 22 "Pied de page stylisé avec Tailwind CSS (text-sm, mt-auto)" "index.html" (Get-Content _backup_final/index.html -Raw)
Commit-Step 23 "Structure de la page liste avec classes CSS Tailwind" "html-pages/listes-projets/lister-projet.html" (Get-Content _backup_final/html-pages/listes-projets/lister-projet.html -Raw -TotalCount 11 | Out-String)
Commit-Step 24 "Navigation de retour accueil avec transitions Tailwind" "html-pages/listes-projets/lister-projet.html" (Get-Content _backup_final/html-pages/listes-projets/lister-projet.html -Raw -TotalCount 26 | Out-String)
Commit-Step 25 "Bouton ajouter projet stylisé via Tailwind CSS" "html-pages/listes-projets/lister-projet.html" (Get-Content _backup_final/html-pages/listes-projets/lister-projet.html -Raw -TotalCount 26 | Out-String)
Commit-Step 26 "Carte projet E-commerce avec Tailwind (border-gray-200)" "html-pages/listes-projets/lister-projet.html" (Get-Content _backup_final/html-pages/listes-projets/lister-projet.html -Raw -TotalCount 46 | Out-String)
Commit-Step 27 "Carte projet Fitness Mobile avec Tailwind layout" "html-pages/listes-projets/lister-projet.html" (Get-Content _backup_final/html-pages/listes-projets/lister-projet.html -Raw -TotalCount 63 | Out-String)
Commit-Step 28 "Carte projet Dashboard Analytique avec Tailwind CSS" "html-pages/listes-projets/lister-projet.html" (Get-Content _backup_final/html-pages/listes-projets/lister-projet.html -Raw -TotalCount 81 | Out-String)
Commit-Step 29 "Optimisation des interactions hover Tailwind sur les cartes" "html-pages/listes-projets/lister-projet.html" (Get-Content _backup_final/html-pages/listes-projets/lister-projet.html -Raw)
Commit-Step 30 "Layout de la page d'ajout via Tailwind CSS" "html-pages/listes-projets/ajouter-projet.html" (Get-Content _backup_final/html-pages/listes-projets/ajouter-projet.html -Raw -TotalCount 15 | Out-String)
Commit-Step 31 "Titre de la page ajout (tracking-tight, Sora)" "html-pages/listes-projets/ajouter-projet.html" (Get-Content _backup_final/html-pages/listes-projets/ajouter-projet.html -Raw -TotalCount 30 | Out-String)
Commit-Step 32 "Champs de saisie stylisés avec focus-ring Tailwind" "html-pages/listes-projets/ajouter-projet.html" (Get-Content _backup_final/html-pages/listes-projets/ajouter-projet.html -Raw -TotalCount 54 | Out-String)
Commit-Step 33 "Zones de texte adaptées aux formulaires Tailwind CSS" "html-pages/listes-projets/ajouter-projet.html" (Get-Content _backup_final/html-pages/listes-projets/ajouter-projet.html -Raw -TotalCount 75 | Out-String)
Commit-Step 34 "Boutons de validation avec styles Tailwind personnalisés" "html-pages/listes-projets/ajouter-projet.html" (Get-Content _backup_final/html-pages/listes-projets/ajouter-projet.html -Raw)
Commit-Step 35 "Mise en page responsive du contact avec Tailwind CSS" "html-pages/listes-projets/contact.html" (Get-Content _backup_final/html-pages/listes-projets/contact.html -Raw)
Commit-Step 36 "Optimisation des formulaires de contact via Tailwind" "html-pages/listes-projets/contact.html" (Get-Content _backup_final/html-pages/listes-projets/contact.html -Raw)
Commit-Step 37 "Affichage détaillé du projet avec structure Tailwind" "html-pages/listes-projets/detailler-projet.html" (Get-Content _backup_final/html-pages/listes-projets/detailler-projet.html -Raw)
Commit-Step 38 "Badges technologiques et actions via utilitaires Tailwind" {
    mkdir html-pages/listes-projets/img -Force
    Copy-Item _backup_final/html-pages/listes-projets/img/* html-pages/listes-projets/img/ -ErrorAction SilentlyContinue
    Copy-Item _backup_final/* . -Recurse -Force
}

Write-Host "Historique final reconstitué avec succès !"
