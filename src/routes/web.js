import express from 'express'
import ProductController from '../controllers/ProductController.js'
import CartController from '../controllers/CartController.js'

const router = express.Router()

//Product Route
router.get('/products', ProductController.getProductList)  //this route is to get all product list
router.get('/product/:id', ProductController.getSingleProduct)  //this route is to get all product list

//Category Route
router.get('/category', ProductController.getCategoryList)  //this route is to get all category list
router.get('/category/:category', ProductController.getSingleCategoryData)  //this route is to get all category list

//Brand Route
router.get('/brand', ProductController.getBrandList)  //this route is to get all brand list
router.get('/brand/:brand', ProductController.getSingleBrandData)  //this route is to get all brand list

//Cart Route
router.get('/cart/:id', CartController.getCartDataByUserId)
router.post('/cart/store-cart', CartController.storeCartData)

export default router