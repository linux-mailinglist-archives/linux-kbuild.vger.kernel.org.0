Return-Path: <linux-kbuild+bounces-2228-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFDA9113CD
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 22:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429311F229EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 20:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C79374E25;
	Thu, 20 Jun 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OyhSTxV3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79568745EF;
	Thu, 20 Jun 2024 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916939; cv=fail; b=XyaKA4zsLNo2MLyGQFqM/7JF3IcBtZzcOkUwf+kuBqxWgHaWM2lBm2mJqCSO1tuyfcH8f6dTkpPrpJrMng5dfhnTqWdEkEBlG4w9SVfZFWJJVvgp3LPrGB/yn6nM3R29bYzet+qexpte7AuAJpeChhfsb/IxqUg2E5vNfL+nq5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916939; c=relaxed/simple;
	bh=gEW0Qzk7NYTx0I9Wl5ee62xalotuoXzf7K1ys/cnkWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HKTN/aIcf3NcJVdLqdE6rRYKAvIth28WfvQkj1XjHaQ+8eA+lNjxNH6uO0iN8aWTqYQW2KPmNKr5FMZRawsYJMt+5ZMZ42b2rLyuMir79fVM6SWzTZgpUuPVcy9AqmwUABZ4Q+rgQAW3/lsqMhNTdwXCu/wDtGJFZ6AMWNZgeTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OyhSTxV3; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNHBSqc/TaMmwPohAvZji5bGQivz8QxdBybUuFc8yxM+Z5w32evBdf5yJ6rqLqMabNnlcqVcqoUc5Q279X2zoDkA2HQVDl0XvOSQ2Vsi0CBkKXBTg5nRPbbCv7bcz4pvjnDK3XGJkXChYeY3CX4cMDkfsWRByoa/XPhR2gMTNx6ImRi8cV9ZkLmsMGLqRBRDl4xTzBOVTq1W5ZNq7XZd3wSBNaAOMDczpV9BwTJ/R0Ecs5CCwdEw4rt3tGqHSy76O3zXswmBmaaWImYGl8Y0z/4eo2OksCwZ6ARFr8eMACr1HbYsZ5/uJrX2H1rrYsHRrPpjYsADVikY9F1vGWKCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJIkgydprIfhco73hI4F7Q7Hut6FRTjs8lUCKsE5vGY=;
 b=ECFdvW1d+YXp0Vg3qCoo2rKCEuHKZh4AoVqF4/OwyGmwcaFlMwilGtvrXoESzwRHbh2oDYwtKLzidZWsTF1yJl6kqfgDHGg1J1Xu2GiIo76SAsy0Ca3KFaDPAo42bdHemn4n7+zMUEguRethzUvRcbme3HCc5nON7XS55c4CgZ2Y1syLq5ZoWjzc2eJ8pykQSuBbYhn5Ew3lZzdnZnYwmVn/vQ0qHjJaiseZNcDe47LyTC/LqDZ4LBa9ggd3kwP6S6IMkmqr4X2xhdVlno60c4Fof1oKUZLv2aRVNDWyZdT5XWXV5IvxRC0dzq2XEdbxOhzEH2jI+yUkgcTw9vtCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJIkgydprIfhco73hI4F7Q7Hut6FRTjs8lUCKsE5vGY=;
 b=OyhSTxV3gfSJBSZyc8aQJFXwL33+TRMrY0RXfSZQAdbQmHOIey2dwSap5hieN6oMkyrV1I97HDntRMuV6QqG/2hkyBGPITmR23Bw5rAhPVwzq8uJdH0IR+GTtFltbkHxmHRrYMKTvvW1qT5zMwRyMPiqF5GDf4IKYmtx22vcf8OLklGIPwjz0eWcNM4MfFYukhSjV8sLkrmjeLyFOzn+uZnmZRyHCVtuozRe68/eILjU95+gmtiMOwV3tDWopNhnBg4M6U9AAhr9L4PtN8yZpyeIUAnkZcU3v69tSoe7W4GDx/1UPcQzYxL0ptKBwJ7oG3udADdqCzqIb2OYBgriXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 20:55:34 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 20:55:33 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg KH <greg@kroah.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 2/2] Makefile: improve comment documentation for the rust-analyzer target
Date: Thu, 20 Jun 2024 13:54:53 -0700
Message-ID: <20240620205453.81799-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620205453.81799-1-jhubbard@nvidia.com>
References: <20240620205453.81799-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a10174b-cc5e-4690-31cd-08dc916b541b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|7416011|366013|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FyCGwSgjcSG40mz1RqTxdKHwk7zoImTWibQjfbSR9bkB56Wv5ZYz4NxPu4WG?=
 =?us-ascii?Q?ZvOqYgoVUjo8+Oqagi1I/hujJWnwiCsIDNEvoXqU6BfDYL7a69OmVrTYRWgh?=
 =?us-ascii?Q?vxvmT8RdCHrqKu1i8HS9DQcsn1Qniqs4HKHBUKOHTRnDKNxS1A3eMl0A1VSa?=
 =?us-ascii?Q?y/tQBhyyuXQwoh3wZWi4m4+7EbWxeHtdgEYT3oQY4tOVJgwIdAcowH9e2YJ4?=
 =?us-ascii?Q?2F7yF1YMbuG+esefp3qwRkjd8dTzAhMh92zv2LpEd3hNwFfbYJoW/K5UMy4R?=
 =?us-ascii?Q?FQ8kHvG3Rq7AbneCtjKEl65y2IR1Ac9MAMbEu/qsVzAdwh2ETB0U4NgJCIdI?=
 =?us-ascii?Q?fqEGhov71snbjpWY2/jf4uMuPxjUm08pZGL06lvL2qVKZCST+CFrlIFJ1K6v?=
 =?us-ascii?Q?OLvOuFDP7BvJrH4A7yYz2N9Ara5D+Ibh1C/D/5ifqQNHnVHnIFwttmlfJMGo?=
 =?us-ascii?Q?q64f/HaIifHLOE4nl1yV7oiIcP9zzhP8Kv832c3q0rYgSGa3GMsaSCzeh3tP?=
 =?us-ascii?Q?II/XKNoLjv4/x3aEGu3PfTjbx+LHnkFgqmJ0U/sZjrxlW/hpiqYVuJ06mQzg?=
 =?us-ascii?Q?1mvtlzK3S/tePeFUVrynpctCCpHgRHM2KqdSe5xxFpEN7R7xhnUARpupWZfG?=
 =?us-ascii?Q?RSRCt/aTdgPAQc5CaWm8dZ8nzXpy3AYGyheeCqagm24MStZEilu/Oi0wa20g?=
 =?us-ascii?Q?wO8dMhzYEomFLQhW5tCSUrSjcP+DS1KCpPtsgkKWTFV+AsEjB924j779KzFb?=
 =?us-ascii?Q?Q6sBC9HsQ0iQo2uOsd/WTF6ENovlBJu5g5WMxSxkMBWi64jbQjmNwU2fx31h?=
 =?us-ascii?Q?n2rDyyhsOn5LVbSq+j+knnJRDlwtPP/IH22rXGL94Kh63Q4EkQQEQfHZtlfo?=
 =?us-ascii?Q?tiXhte3yZg828VpwyElnAhCNmDUZzx9fzFo42IYUAGq+hRdhpTVHRspiHLii?=
 =?us-ascii?Q?ZQNqfiH2taTvIlDOTk+XlbeDveKgMEMCH2ozEy1EYzXSf8aFNbgHAKMcCFhV?=
 =?us-ascii?Q?1IKOQY4dwwEtsK/hXUiMEvyYb2EEQxS7SGLjR/ZuVS4vbNDadQ/oQo6egHO7?=
 =?us-ascii?Q?0kT4Iohe2eqbfXp0/4322MIgic2PscErudMGTLNwEeu4kaZGCS4xzmEQLoWG?=
 =?us-ascii?Q?SafX6f59K3SdVlAMG4BFzhLZ32aAu1lhiBhPq5HLml2RRqLfTyqGbgB3p3lv?=
 =?us-ascii?Q?3E34OQMZkHBdTbGwBtlM+h1PhXdksnkaXL3qVr7WZI3TWb1NRDZ4wLx+o4m0?=
 =?us-ascii?Q?XgUPT+Qj1gmcnwWiQLvI1Ho9BfL+FAe672IIiF7xvlPEC42uXRN4Jpf35dos?=
 =?us-ascii?Q?4YQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W285xFwkxNqYg2UfPzkKV5TtEBC/3P9TgDScMaTXcOwzMhrfzKJCxiyWI1qK?=
 =?us-ascii?Q?j6NRE7EfDPhaJls0+n2KE+ohCkm+uTU3bfGonUTcagd/0lJ0WXS3HXwBpaau?=
 =?us-ascii?Q?2IgQVRlwYiHu3/Cd6jzSfvm/na4HdX5YRFuf3KC0O5jfUy66v3vq4Hsv67wE?=
 =?us-ascii?Q?fz1BlkjB9HeaRaLOo1B3tRbDjuRYo6QP5Sop3Hfjb1O11T7da0ZHMPUFhM+a?=
 =?us-ascii?Q?m8QjiTiGPa0QSHtKwXKWzs1/8X6EbdVK8Y4jbBX+SUf4mWOLYA7IDKBcmLsT?=
 =?us-ascii?Q?WjpjQuy6BjQR03n6Dla8sMgXPvCENWTDwdh2b8FqsdffAOhHQyS+Zkk6QKwq?=
 =?us-ascii?Q?Uq2Ppu42mA6UVE332YsWqE6s40i61dgv7bPOwrUkX/ayTocwMoTXU22rneLB?=
 =?us-ascii?Q?mtLbPxIGj0UALNHC317DekxLHYwaSqEXs87hW1hyC8soGYV7oy9CfabId+NF?=
 =?us-ascii?Q?0U5pEQx0W6mUahPB/MDWWxqXO5xelbRWldVcn9qWBbD+sPlkwaElgPutOWf4?=
 =?us-ascii?Q?ZnPO9WBeM8e/08KusSAiJSDr5aycwwl0E3k9CYDgvM/cRjlOL8Ia46b1QW+t?=
 =?us-ascii?Q?GEcf1/uJIMNt3OL7eSxAMBa5B6byGR+hfADq/kAvObgx2xfdGvckDbWfzI0m?=
 =?us-ascii?Q?Qkdt2D8vyTKjHy11FAqJ6zLrfK8NqANs2mXvSVnaB+vk3iagKmUQ5S9GAJrB?=
 =?us-ascii?Q?HM/liWRiM9xWTM4dpp78V+eLgMejKz3CoOGIq5q+Hmbs+EUpGiGPmd/nMtiG?=
 =?us-ascii?Q?+WIyWs+hLlTnHtV0tRvmfdW6XoeXlqIajtA0yO7znyHD9vTS5lvSWEV0JTS4?=
 =?us-ascii?Q?4j/Dy+DWuBs65VhDjEG6j7+lW5i4EQzF7lsfJqaIDAnHGO3Ow1KbmiplfxEI?=
 =?us-ascii?Q?ovEXklIHPcROOE5QFNFBDKIzwsk+WeVO4qMZ3ebEbR5f6LtUKTYsY3zu1zo2?=
 =?us-ascii?Q?GPa1QsM0dlBaCPDLsYsdOsdmiZtpqBK/Yl3mhZ/e3FKI/FveVQN+Ykf6LW5p?=
 =?us-ascii?Q?nEBFgThTPT1/ktYu1nH4T3pponNOsPRhTRtbkQFvn+1oez+o0RyACruW0oXV?=
 =?us-ascii?Q?w+pwatSDiCpbd+i0ry5QglfFm+ExW6HMeKNXjtAsZuObM1Sn2qRmAQfTZgu+?=
 =?us-ascii?Q?TPpqHXoJ0Ln8Yp4hXwdhCQphuayrRNcLwzXgKxqo5Feh06vTSJPmnqwu6KOU?=
 =?us-ascii?Q?a45yhnDdPcUxJj360vl8zrIQ7tMWAlfoeANrJoQBjiU5euAakYyDxS/jsmVa?=
 =?us-ascii?Q?HTEHUMvwWwEyc4Agdddfh/hfOPBYSoPOiFHSAYe3dRMCo1ra8TW4XDDOEVCl?=
 =?us-ascii?Q?8dNSL3L/0Dmi9lBYmD/9DZMy55GK7jcalMzR0OeH0yD2Asgy3fi+KBCzEKDl?=
 =?us-ascii?Q?BbIZPbdP7dBWpXUKpATtIPpKlKO2ySom6EJv3nB8cENswoIcu9TYBekpSHqz?=
 =?us-ascii?Q?l42EXLOqk2+fPw5tBYWbg450wyEkEXyH6uVWeySRVShYBAUj9lA8wr+h1qU7?=
 =?us-ascii?Q?sPMx2Nf8aCIwqHV2kSbxe563sJZ77TlUwzNP7+c8FL3Q1HxxCoHyGGTkA6EZ?=
 =?us-ascii?Q?Gi20zwVpQ4a3o4APMD05iW5pHQXMWlQiLM7eYxmnY0Yumv36CSW41RPXN4s9?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a10174b-cc5e-4690-31cd-08dc916b541b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 20:55:33.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVjGiysGF9c6xkyAniwIklCQWpdN9x+jxeo3vPhIXLIAV++3K4+FlGJYWGfigEl3824U3XfecvKIjjdUoCE01g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725

Replace the cryptic phrase ("IDE support targets") that initially
appears to be about how to support old hard drives, with a few sentences
that explain what "make rust-analyzer" provides.

Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 07308277a6f5..d22491184af6 100644
--- a/Makefile
+++ b/Makefile
@@ -1967,7 +1967,9 @@ quiet_cmd_tags = GEN     $@
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
 
-# IDE support targets
+# Generate rust-project.json, which does for Rust what clangd's
+# compile_commands.json does for C/C++: provides a symbol browsing database for
+# code editors and IDEs (Integrated Development Environments).
 PHONY += rust-analyzer
 rust-analyzer:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
-- 
2.45.2


