<script setup lang="ts">
import Button from '@/components/ui/button/Button.vue';
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, Link, router, usePage } from '@inertiajs/vue3';
import {
    Table,
    TableBody,
    TableCaption,
    TableCell,
    TableFooter,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';


const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Products',
        href: '/products',
    },
];
const page = usePage<{
    flash: {
        success?: string;
        error?: string;
    };
}>();


const handleDelete = (id: number) => {
    // Send a DELETE request to the server
    if (confirm('Are you sure you want to delete this product?')) {
        router.delete(route('products.destroy', { id }))
    }
}
    ;

interface Product {
    id: number;
    name: string;
    price: number;
    description: string;
}

interface Props {
    products: Product[];
}
const props = defineProps<Props>();


</script>

<template>

    <Head title="Products" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div v-if="page.props?.flash.success" class="p-4 bg-green-100 text-green-800 rounded mb-4">
            {{ page.props.flash?.success }}
        </div>
        <div v-if="page.props.flash?.error" class="p-4 bg-red-100 text-red-800 rounded mb-4">
            {{ page.props.flash?.error }}
        </div>
        <div class="p-4">
            <Link :href="'/products/create'"><Button>Add Product</Button></Link>
        </div>
        <div class="p-4">
            <Table>
                <TableCaption>List of products</TableCaption>
                <TableHeader>
                    <TableRow>
                        <TableHead class="w-[100px]">ID</TableHead>
                        <TableHead>Name</TableHead>
                        <TableHead>Price</TableHead>
                        <TableHead>Description</TableHead>
                        <TableHead>Actions</TableHead>
                    </TableRow>
                </TableHeader>
                <TableBody>
                    <TableRow v-for="product in props.products" :key="product.id">
                        <TableCell>{{ product.id }}</TableCell>
                        <TableCell>{{ product.name }}</TableCell>
                        <TableCell>{{ product.price }}</TableCell>
                        <TableCell>{{ product.description }}</TableCell>
                        <TableCell class="text-center space-x-2">
                            <Link :href="route('products.edit', { id: product.id })"><Button
                                    class="bg-slate-600">Edit</Button></Link>
                            <Button class="bg-red-500" @click="handleDelete(product.id)">Delete</Button>
                        </TableCell>
                    </TableRow>
                </TableBody>
            </Table>
        </div>
    </AppLayout>
</template>
