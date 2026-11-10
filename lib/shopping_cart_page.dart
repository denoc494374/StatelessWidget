import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Shared styling constants
// ---------------------------------------------------------------------------
const Color kBgTop = Color(0xFF1A0B2E);
const Color kBgBottom = Color(0xFF3A0F4F);
const Color kSurface = Color(0xFF2A1442);
const Color kSurfaceBorder = Color(0xFF4A2A6B);
const Color kPurple = Color(0xFFB06BFF);
const Color kPink = Color(0xFFFF4FA3);
const Color kTextPrimary = Colors.white;
const Color kTextMuted = Color(0xFFBBA6D6);

// Translucent tints (ARGB hex so no deprecated opacity helpers are needed).
const Color kPinkTint = Color(0x33FF4FA3);
const Color kPurpleTint = Color(0x33B06BFF);
const Color kDangerTint = Color(0x33FF5C7A);
const Color kDanger = Color(0xFFFF7A93);

const LinearGradient kAccentGradient = LinearGradient(
  colors: [kPurple, kPink],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kPagePadding = 18;
const double kCardRadius = 24;

BoxDecoration surfaceDecoration() => BoxDecoration(
      color: kSurface,
      borderRadius: BorderRadius.circular(kCardRadius),
      border: Border.all(color: kSurfaceBorder),
    );

// ---------------------------------------------------------------------------
// Page
// ---------------------------------------------------------------------------
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  static const String studentName = 'Glenn Oliva';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kBgTop, kBgBottom],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              kPagePadding,
              8,
              kPagePadding,
              28,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _IntroSection(),
                SizedBox(height: 18),
                _DeliveryCard(name: studentName),
                SizedBox(height: 24),
                _OrderItemsHeader(),
                SizedBox(height: 14),
                CartItemCard(
                  name: 'Wireless Mouse',
                  price: 'PHP 450.00',
                  quantity: 1,
                  icon: Icons.mouse_outlined,
                ),
                SizedBox(height: 14),
                CartItemCard(
                  name: 'USB-C Hub',
                  price: 'PHP 850.00',
                  quantity: 1,
                  icon: Icons.usb,
                ),
                SizedBox(height: 14),
                CartItemCard(
                  name: 'Laptop Stand',
                  price: 'PHP 700.00',
                  quantity: 1,
                  icon: Icons.laptop_mac,
                ),
                SizedBox(height: 20),
                _DiscountBanner(),
                SizedBox(height: 20),
                _PaymentSummaryCard(),
                SizedBox(height: 22),
                _PlaceOrderButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kSurface,
            side: const BorderSide(color: kSurfaceBorder),
          ),
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: kTextPrimary, size: 18),
          onPressed: () => debugPrint('Back clicked'),
        ),
      ),
      title: const Text(
        'My Cart',
        style: TextStyle(
          color: kTextPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kSurface,
              side: const BorderSide(color: kSurfaceBorder),
            ),
            onPressed: () => debugPrint('Cart clicked'),
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_bag_outlined,
                    color: kTextPrimary, size: 24),
                Positioned(
                  right: -8,
                  top: -8,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: kAccentGradient,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Introduction section (gradient hero card)
// ---------------------------------------------------------------------------
class _IntroSection extends StatelessWidget {
  const _IntroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF5B2A9E), Color(0xFFB0307F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: const Color(0x66FFFFFF)),
            ),
            child: const Text(
              'CAMPUS STORE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Ready for checkout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Review your items before placing your order.',
            style: TextStyle(color: Color(0xDDFFFFFF), fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Delivery card
// ---------------------------------------------------------------------------
class _DeliveryCard extends StatelessWidget {
  final String name;

  const _DeliveryCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: surfaceDecoration(),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              gradient: kAccentGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.location_on_rounded,
                color: Colors.white, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to $name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kTextPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Matina, Davao City',
                  style: TextStyle(color: kTextMuted, fontSize: 13),
                ),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kPinkTint,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 14),
            ),
            onPressed: () => debugPrint('Change delivery address clicked'),
            child: const Text(
              'Change',
              style: TextStyle(
                color: kPink,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Order items header
// ---------------------------------------------------------------------------
class _OrderItemsHeader extends StatelessWidget {
  const _OrderItemsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Order Items',
          style: TextStyle(
            color: kTextPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: kPurpleTint,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            '3 items',
            style: TextStyle(
              color: kPurple,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable cart item card
// ---------------------------------------------------------------------------
class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: surfaceDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product icon in a rounded tile
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: kPurpleTint,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kSurfaceBorder),
            ),
            child: Icon(icon, size: 34, color: kPurple),
          ),
          const SizedBox(width: 14),

          // Name, price and stepper
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kTextPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: const TextStyle(
                    color: kPink,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                _QuantityStepper(
                  quantity: quantity,
                  onDecrease: () => debugPrint('Decrease quantity: $name'),
                  onIncrease: () => debugPrint('Increase quantity: $name'),
                ),
              ],
            ),
          ),

          // Delete button
          IconButton(
            style: IconButton.styleFrom(backgroundColor: kDangerTint),
            icon: const Icon(Icons.delete_outline_rounded,
                color: kDanger, size: 22),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

/// Single pill containing [-]  qty  [+]
class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const _QuantityStepper({
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xFF1A0B2E),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: kSurfaceBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RoundButton(icon: Icons.remove, onPressed: onDecrease),
          SizedBox(
            width: 40,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kTextPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          _RoundButton(icon: Icons.add, onPressed: onIncrease, filled: true),
        ],
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool filled;

  const _RoundButton({
    required this.icon,
    required this.onPressed,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Ink(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: filled ? kAccentGradient : null,
            color: filled ? null : kSurface,
          ),
          child: Icon(icon, size: 18, color: Colors.white),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Discount banner
// ---------------------------------------------------------------------------
class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kPinkTint,
        borderRadius: BorderRadius.circular(kCardRadius),
        border: Border.all(color: kPink),
      ),
      child: Row(
        children: [
          const Icon(Icons.sell_rounded, color: kPink, size: 28),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: kTextPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '10% discount on items',
                  style: TextStyle(color: kTextMuted, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle_rounded, color: kPink, size: 30),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Payment summary
// ---------------------------------------------------------------------------
class _PaymentSummaryCard extends StatelessWidget {
  const _PaymentSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: surfaceDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(
              color: kTextPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 16),
          _SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          SizedBox(height: 10),
          _SummaryRow(label: 'Discount (10%)', amount: '- PHP 200.00'),
          SizedBox(height: 10),
          _SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          SizedBox(height: 14),
          Divider(color: kSurfaceBorder, thickness: 1, height: 1),
          SizedBox(height: 14),
          _SummaryRow(label: 'Total', amount: 'PHP 1,850.00', isTotal: true),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? kTextPrimary : kTextMuted,
            fontSize: isTotal ? 20 : 15,
            fontWeight: isTotal ? FontWeight.w900 : FontWeight.w400,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: isTotal ? kPink : kTextPrimary,
            fontSize: isTotal ? 22 : 15,
            fontWeight: isTotal ? FontWeight.w900 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Place order button (gradient pill)
// ---------------------------------------------------------------------------
class _PlaceOrderButton extends StatelessWidget {
  const _PlaceOrderButton();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: kAccentGradient,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66FF4FA3),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 58,
        child: ElevatedButton.icon(
          onPressed: () =>
              debugPrint('Place order clicked! Total: PHP 1850.00'),
          icon: const Icon(Icons.lock_rounded, color: Colors.white),
          label: const Text(
            'Place Order',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: const StadiumBorder(),
          ),
        ),
      ),
    );
  }
}