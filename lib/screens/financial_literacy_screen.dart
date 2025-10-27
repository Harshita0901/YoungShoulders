import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FinancialLiteracyScreen extends StatelessWidget {
  const FinancialLiteracyScreen({Key? key}) : super(key: key);

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Subtle financial gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            // Dynamic AppBar
            SliverAppBar(
              backgroundColor: Colors.indigo,
              floating: true,
              pinned: true,
              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
                title: const Text(
                  "💸 Financial Literacy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3F51B5), Color(0xFF303F9F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Master your money early. 💰 Small habits today build financial freedom tomorrow.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Body Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader("🧠 Learn the Basics"),
                    _buildTile(
                      title: "Budgeting 101",
                      subtitle: "Track your income and expenses with ease",
                      icon: Icons.pie_chart,
                      onTap: () => _launch("https://www.consumerfinance.gov/learn-more-budgeting/"),
                    ),
                    _buildTile(
                      title: "Smart Saving Habits",
                      subtitle: "Build savings even as a teen",
                      icon: Icons.savings,
                      onTap: () => _launch("https://www.themint.org/teens/saving.html"),
                    ),
                    _buildTile(
                      title: "Understanding Bank Accounts",
                      subtitle: "Checking vs. Savings explained",
                      icon: Icons.account_balance_wallet,
                      onTap: () => _launch("https://www.investopedia.com/terms/b/bank-account.asp"),
                    ),
                    const SizedBox(height: 28),

                    _buildSectionHeader("📈 Build Good Money Skills"),
                    _buildTile(
                      title: "Teen Credit Tips",
                      subtitle: "Learn how credit works before you need it",
                      icon: Icons.credit_score,
                      onTap: () => _launch("https://www.consumerfinance.gov/consumer-tools/credit-reports-and-scores/"),
                    ),
                    _buildTile(
                      title: "Needs vs. Wants",
                      subtitle: "Make smarter spending decisions",
                      icon: Icons.shopping_bag,
                      onTap: () => _launch("https://www.themint.org/teens/budgeting.html"),
                    ),
                    _buildTile(
                      title: "Using a Debit Card",
                      subtitle: "How to stay safe and not overspend",
                      icon: Icons.credit_card,
                      onTap: () => _launch("https://www.chase.com/personal/banking/debit-card"),
                    ),
                    const SizedBox(height: 28),

                    _buildSectionHeader("📲 Tools & Simulators"),
                    _buildTile(
                      title: "Mint: Budgeting App",
                      subtitle: "Track spending and goals (free app!)",
                      icon: Icons.mobile_friendly,
                      onTap: () => _launch("https://mint.intuit.com/"),
                    ),
                    _buildTile(
                      title: "Teen Budget Calculator",
                      subtitle: "Interactive budget planning tool",
                      icon: Icons.calculate,
                      onTap: () => _launch("https://www.jumpstart.org/resources/budget-calculator/"),
                    ),
                    _buildTile(
                      title: "Game: Payback by NGPF",
                      subtitle: "Play and learn how student debt works",
                      icon: Icons.videogame_asset,
                      onTap: () => _launch("https://www.ngpf.org/play/payback/"),
                    ),

                    const SizedBox(height: 24),

                    // Motivational Footer
                    Center(
                      child: Text(
                        "🌟 Take control of your future—money confidence starts here.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.indigo[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 14.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modern section headers
  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A237E),
        ),
      ),
    );
  }

  // Modern interactive tiles
  Widget _buildTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigo[100],
            child: Icon(icon, color: Colors.indigo[800]),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 13.5, color: Colors.black87),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.indigo),
        ),
      ),
    );
  }
}
