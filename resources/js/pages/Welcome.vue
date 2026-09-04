<script setup lang="ts">
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Welcome">
        <link rel="preconnect" href="https://rsms.me/" />
        <link rel="stylesheet" href="https://rsms.me/inter/inter.css" />
    </Head>

    <div class="flex min-h-screen flex-col items-center bg-[#FDFDFC] p-6 text-[#1b1b18] dark:bg-[#0a0a0a] lg:justify-center lg:p-8">
        <header class="mb-6 w-full max-w-[335px] text-sm lg:max-w-2xl">
            <nav class="flex items-center justify-end gap-4">
                <Link
                    v-if="$page.props.auth.user"
                    :href="route('dashboard')"
                    class="inline-block rounded-sm border border-[#19140035] px-5 py-1.5 text-sm leading-normal text-[#1b1b18] hover:border-[#1915014a] dark:border-[#3E3E3A] dark:text-[#EDEDEC] dark:hover:border-[#62605b]"
                >
                    Dashboard
                </Link>
                <template v-else>
                    <Link
                        :href="route('login')"
                        class="inline-block rounded-sm border border-transparent px-5 py-1.5 text-sm leading-normal text-[#1b1b18] hover:border-[#19140035] dark:text-[#EDEDEC] dark:hover:border-[#3E3E3A]"
                    >
                        Log in
                    </Link>
                    <Link
                        :href="route('register')"
                        class="inline-block rounded-sm border border-[#19140035] px-5 py-1.5 text-sm leading-normal text-[#1b1b18] hover:border-[#1915014a] dark:border-[#3E3E3A] dark:text-[#EDEDEC] dark:hover:border-[#62605b]"
                    >
                        Register
                    </Link>
                </template>
            </nav>
        </header>

        <div class="flex w-full max-w-[335px] items-center justify-center lg:max-w-2xl lg:grow">
            <main class="w-full rounded-lg bg-white p-6 text-[14px] leading-[22px] shadow-[inset_0px_0px_0px_1px_rgba(26,26,0,0.16)] dark:bg-[#161615] dark:text-[#EDEDEC] dark:shadow-[inset_0px_0px_0px_1px_#fffaed2d] lg:p-12">
                <h1 class="mb-2 text-2xl font-semibold">
                    Product Manager — CRUD Laravel + Vue 3 (Inertia)
                </h1>
                <p class="mb-6 text-[#706f6c] dark:text-[#A1A09A]">
                    Une application simple de gestion de produits (CRUD) construite avec
                    <span class="font-medium text-[#1b1b18] dark:text-[#EDEDEC]">Laravel</span> pour le backend et
                    <span class="font-medium text-[#1b1b18] dark:text-[#EDEDEC]">Vue 3 + Inertia.js + TypeScript</span>
                    pour le frontend, avec des composants
                    <span class="font-medium text-[#1b1b18] dark:text-[#EDEDEC]">shadcn-vue</span>.
                </p>

                <h2 class="mb-3 text-lg font-medium">Fonctionnalités</h2>
                <ul class="flex flex-col gap-2">
                    <li class="flex items-center gap-3">
                        <span class="flex h-1.5 w-1.5 shrink-0 rounded-full bg-[#f53003] dark:bg-[#FF4433]" />
                        Lister tous les produits
                    </li>
                    <li class="flex items-center gap-3">
                        <span class="flex h-1.5 w-1.5 shrink-0 rounded-full bg-[#f53003] dark:bg-[#FF4433]" />
                        Ajouter un nouveau produit
                    </li>
                    <li class="flex items-center gap-3">
                        <span class="flex h-1.5 w-1.5 shrink-0 rounded-full bg-[#f53003] dark:bg-[#FF4433]" />
                        Modifier un produit existant
                    </li>
                    <li class="flex items-center gap-3">
                        <span class="flex h-1.5 w-1.5 shrink-0 rounded-full bg-[#f53003] dark:bg-[#FF4433]" />
                        Supprimer un produit (avec confirmation)
                    </li>
                    <li class="flex items-center gap-3">
                        <span class="flex h-1.5 w-1.5 shrink-0 rounded-full bg-[#f53003] dark:bg-[#FF4433]" />
                        Messages de succès/erreur via flash messages
                    </li>
                    <li class="flex items-center gap-3">
                        <span class="flex h-1.5 w-1.5 shrink-0 rounded-full bg-[#f53003] dark:bg-[#FF4433]" />
                        Interface avec composants réutilisables (Table, Button, Input, Label...)
                    </li>
                </ul>
            </main>
        </div>
    </div>
</template>
