<script setup lang="ts">
import Button from '@/components/ui/button/Button.vue';
import Input from '@/components/ui/input/Input.vue';
import Label from '@/components/ui/label/Label.vue';
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head } from '@inertiajs/vue3';
import { useForm } from "@inertiajs/vue3";


const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Products - Create',
        href: '/products/create',
    },
];

const form = useForm({
    name: '',
    price: 0,
    description: '',
});

const handleSubmit = () => {
    form.post(route('products.store'), {
        onSuccess: () => {
            form.reset();
        },
    });
}
</script>

<template>

    <Head title="Products - Create" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <Form @submit.prevent="handleSubmit" class="max-w-md space-y-6">
                <div class="flex flex-col gap-2">
                    <Label for="product-name" class="block">Product Name</Label>
                    <Input id="product-name" v-model="form.name" name="name" type="text"
                        placeholder="Enter product name" class="block w-full" />
                    <div v-if="form.errors.name" class="text-red-500 text-sm">{{ form.errors.name }}</div>
                </div>
                <div class="flex flex-col gap-2">
                    <Label for="product-price" class="block">Product Price</Label>
                    <Input id="product-price" v-model="form.price" name="price" type="number"
                        placeholder="Enter product price" class="block w-full" />
                    <div v-if="form.errors.price" class="text-red-500 text-sm">{{ form.errors.price }}</div>
                </div>
                <div class="flex flex-col gap-2">
                    <Label for="product-description" class="block">Product Description</Label>
                    <Input id="product-description" v-model="form.description" name="description" type="text"
                        placeholder="Enter product description" class="block w-full" />
                    <div v-if="form.errors.description" class="text-red-500 text-sm">{{ form.errors.description }}</div>
                </div>
                <Button type="submit" :disabled="form.processing">Add Product</Button>
            </Form>
        </div>
    </AppLayout>
</template>
