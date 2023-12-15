import express from 'express'
import ProductController from '../controllers/ProductController.js'
import CartController from '../controllers/CartController.js'
import AddressController from '../controllers/AddressController.js'
import OrderController from '../controllers/OrderController.js'

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
router.delete('/cart/remove/:id', CartController.removeCartProduct)
router.patch('/cart/updateqnt/:id', CartController.updateCartQuantity)

//Address Route
router.post('/address/insert', AddressController.saveUserAddres)
router.get('/address/getAddress/:userId', AddressController.getUserAddress)

//Order Route
router.post('/order/save-order', OrderController.saveOrder)

export default router