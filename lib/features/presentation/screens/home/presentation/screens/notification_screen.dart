import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/mint_app_bar_row.dart';

/// Notification screen.
///
/// A short mint header (about a fifth of the screen) holds the app bar; the
/// overlapping white card hosts grouped notifications and the bottom nav.
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double headerHeight = constraints.maxHeight * 0.18;
            final double cardTop = headerHeight - 36;

            return Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: headerHeight,
                  child: const _HeaderSection(),
                ),
                Positioned(
                  top: cardTop,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(36),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            padding:
                                const EdgeInsets.fromLTRB(24, 28, 24, 16),
                            children: const <Widget>[
                              _SectionHeading(
                                AppStrings.notificationToday,
                              ),
                              SizedBox(height: 12),
                              _NotificationItem(
                                icon: Icons.notifications_none,
                                title: AppStrings.notificationReminderTitle,
                                description: AppStrings
                                    .notificationReminderDescription,
                              ),
                              _ItemDivider(),
                              _NotificationItem(
                                icon: Icons.star_border_rounded,
                                title: AppStrings.notificationNewUpdateTitle,
                                description: AppStrings
                                    .notificationReminderDescription,
                              ),
                              SizedBox(height: 24),
                              _SectionHeading(
                                AppStrings.notificationYesterday,
                              ),
                              SizedBox(height: 12),
                              _NotificationItem(
                                icon: Icons.attach_money_rounded,
                                title:
                                    AppStrings.notificationTransactionsTitle,
                                description: AppStrings
                                    .notificationTransactionsDescription,
                                tags: AppStrings.notificationTagsGroceries,
                              ),
                              _ItemDivider(),
                              _NotificationItem(
                                icon: Icons.notifications_none,
                                title: AppStrings.notificationReminderTitle,
                                description: AppStrings
                                    .notificationReminderDescription,
                              ),
                              SizedBox(height: 24),
                              _SectionHeading(
                                AppStrings.notificationThisWeekend,
                              ),
                              SizedBox(height: 12),
                              _NotificationItem(
                                icon: Icons.south_west_rounded,
                                title:
                                    AppStrings.notificationExpenseRecordTitle,
                                description: AppStrings
                                    .notificationExpenseRecordDescription,
                              ),
                              _ItemDivider(),
                              _NotificationItem(
                                icon: Icons.attach_money_rounded,
                                title:
                                    AppStrings.notificationTransactionsTitle,
                                description: AppStrings
                                    .notificationTransactionsDescription,
                                tags: AppStrings.notificationTagsDinner,
                              ),
                              SizedBox(height: 24),
                            ],
                          ),
                        ),
                        const BottomNavBar(activeIndex: -1),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Mint top bar holding the app bar row.
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.fromLTRB(
        24,
        MediaQuery.paddingOf(context).top + 8,
        24,
        8,
      ),
      child: const MintAppBarRow(title: AppStrings.notificationTitle),
    );
  }
}

/// Group subheading (e.g. "Today").
class _SectionHeading extends StatelessWidget {
  const _SectionHeading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: AppColors.textPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

/// One notification row: mint square icon, title + description and a
/// bottom-right timestamp.
class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.icon,
    required this.title,
    required this.description,
    this.tags,
  });

  final IconData icon;
  final String title;
  final String description;

  /// Optional second description line rendered in blue category tags.
  final String? tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.inputFill,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.darkGreen, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                if (tags != null) ...<Widget>[
                  const SizedBox(height: 2),
                  Text(
                    tags!,
                    style: GoogleFonts.poppins(
                      color: AppColors.link,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            AppStrings.notificationTime,
            style: GoogleFonts.poppins(
              color: AppColors.link,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

/// Thin separator between notification items.
class _ItemDivider extends StatelessWidget {
  const _ItemDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 1, color: AppColors.border);
  }
}