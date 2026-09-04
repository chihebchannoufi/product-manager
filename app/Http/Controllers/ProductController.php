<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::latest()->get();
        return Inertia::render('Products/Index',compact('products'));
    }
    public function create()
    {
        return Inertia::render('Products/Create',[]);
    }
    public function store(Request $request)
    {
        // Validate the request data
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        // Create a new product using the validated data
        Product::create($validatedData);

        // Redirect to the products index page with a success message
        return redirect()->route('products.index')->with('success', 'Product created successfully.');
    }
    public function edit(Product $product)
    {
        return Inertia::render('Products/Edit', compact('product'));
    }
    public function update(Request $request, Product $product)
    {
        // Validate the request data
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        // Update the product with the validated data
        $product->update($validatedData);

        // Redirect to the products index page with a success message
        return redirect()->route('products.index')->with('success', 'Product updated successfully.');
    }
    public function destroy(Product $product)
    {
        // Delete the product
        $product->delete();

        // Redirect to the products index page with a success message
        return redirect()->route('products.index')->with('success', 'Product deleted successfully.');
    }

}
