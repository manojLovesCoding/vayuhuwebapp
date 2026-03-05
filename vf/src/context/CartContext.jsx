import React, { createContext, useContext, useState } from "react";

const CartContext = createContext();

export const CartProvider = ({ children }) => {
  // Load cart from localStorage on first render
  const [cart, setCart] = useState(() => {
    const storedCart = localStorage.getItem("cart");
    return storedCart ? JSON.parse(storedCart) : [];
  });

  const addToCart = (newItem) => {
    setCart((prev) => {
      /**
       * REQUIREMENT SOLUTION:
       * To allow different timings for the same workspace (e.g., Video Conferencing),
       * we generate a unique cartId if it doesn't already exist.
       * We also remove the logic that replaces items with the same workspace ID.
       */
      const uniqueItem = {
        ...newItem,
        cartId: newItem.cartId || `${newItem.id}-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`
      };

      const newCart = [...prev, uniqueItem];

      // Save updated cart to localStorage
      localStorage.setItem("cart", JSON.stringify(newCart));
      return newCart;
    });
  };

  const removeFromCart = (cartId) => {
    setCart((prev) => {
      /**
       * REQUIREMENT SOLUTION:
       * Filter items using the unique cartId instead of the generic workspace id.
       */
      const newCart = prev.filter((i) => (i.cartId || i.id) !== cartId);
      localStorage.setItem("cart", JSON.stringify(newCart));
      return newCart;
    });
  };

  const clearCart = () => {
    setCart([]);
    localStorage.removeItem("cart");
  };

  const totalAmount = cart.reduce((sum, item) => sum + Number(item.final_amount || 0), 0);

  return (
    <CartContext.Provider value={{ cart, addToCart, removeFromCart, clearCart, totalAmount }}>
      {children}
    </CartContext.Provider>
  );
};

export const useCart = () => useContext(CartContext);