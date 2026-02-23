import { ShoppingCart } from "lucide-react";
import { useCart } from "../context/CartContext";

const FloatingCartButton = ({ onClick }) => {
  const { cart } = useCart();

  return (
    <button
      onClick={onClick}
      className="bg-orange-500 text-white p-3 rounded-full shadow-lg hover:bg-orange-600 relative flex items-center justify-center transition-all duration-200"
    >
      <ShoppingCart className="w-6 h-6" />
      {cart.length > 0 && (
        <span className="absolute -top-2 -right-2 bg-white text-orange-600 text-xs font-bold w-5 h-5 rounded-full flex items-center justify-center">
          {cart.length}
        </span>
      )}
    </button>
  );
};

export default FloatingCartButton;