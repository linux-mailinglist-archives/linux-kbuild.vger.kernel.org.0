Return-Path: <linux-kbuild+bounces-10915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JpPJUqueWnTyQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10915-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:35:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D49D730
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D4A63011779
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 06:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB4E325495;
	Wed, 28 Jan 2026 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RSslbPB2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012070.outbound.protection.outlook.com [52.103.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15892DB785;
	Wed, 28 Jan 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582151; cv=fail; b=fVp3hadVHKKzkKKpiXXn09OA94mVa6IRQW5QagtO7qWyDgg1wrWo1LktzgkjmQkraw6LnngGICiqLTDp30+FIvG+ftTT1Yw042q+CJ9TvO5HTBWjeWzEFybxN9gCAT+F9XeUj/SEF6kMbcXFAMV0VVnqMBuP/4DvIwpncDHCnMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582151; c=relaxed/simple;
	bh=Gr/uePpTXmIT7T73iOAOcc9wbYO71QJwxRM0mPGSnrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VuyS3jIUG1k+GkJp7Ut+u3xudqgRcPAuAOgfdMDra4n1lFqy5KB8WviK2Ky1AEapLJehqxm/y2L7PJXSnlWp/DAaxa3t3maQ9JzBN0XS0Yt0ON28aGtMkppvZb6a8FTEzKH2agjEdTO/erQKDxcGc95GxJneSWfmekGeb3n8CgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RSslbPB2; arc=fail smtp.client-ip=52.103.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwKMBZXBiVl/z0O14Fy652KKlYmwtNdceRzcas8bROB8J1+t5QCGLVsnBsAvPyDWqj43wdosRwERpVARQ0FUewruSt2vrDh4a41cvh/SG9yMFql191LGq0U4BirZYusT8VLmVVL/zxaCkZPdl6m9v4EDTcSswIMGrUqPrjaVXGzRpm59qoUsiRsYpKFrszUG8UlUhGJdq77jTwtyS0Tf6x3y5Vj2yOIy7H05QZ8kw8xRxmSZDGCEmNEa1pyp71XQHe21UysGMBUu7GqJxK7YaZdgHp+OZKvgU3x79FTTMcRJuC0zXieBvlyivw+dV/CuUopv6wmnvkjzsDCD9w1zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV21SD8aXojg8VR7o4hMBeZzgPq02MWwpbmFQ+Pvu8o=;
 b=XwZkwNNO6kt9hcSoYQnosRouOZ4hUNK1LdXBrN8ADsK6RDGvEMwUPT/hm7n3ZJKijJbacVaYmB+05yfIcAYw9gFtrB74OFGXXd3uRAOBZ/uFCo5RU3jn1wYReB6eT9L/+ZgOB+b/K04VhQ6/2rOi9NsCG/X5P8qQ6m7qB3eotW4XcLIP2VGSh2Eliov0k12FOiphQwq/4BLdedNeUgQ01WD0hmPArtgnsVXAuZo+ntLsseWXz6WHHEEGjlcOFjfXZrSq0TmrZpnXobptY/uMorarLcnaiLvRW8I/5sBUQ+0MnipR63zGK3Vu+MSsfblIAbrN7oalMdsATV99CcdLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV21SD8aXojg8VR7o4hMBeZzgPq02MWwpbmFQ+Pvu8o=;
 b=RSslbPB2qXzJGG+75dfJFuptXAM5yT8hCnvlRezg7ylTkkqyuCoth91f57rQ/odaJuCp5NY/Cv6GI2RaBkLmO8CyYzUZb7ftTv/7lNtuhrgTn3YsOhhuLfzLGe9xdYsuC5EOWibvvMjELx+FrqabmoOGddPqOpxVpLv+lW0qKSue1JMrXOLcGg89jEN8Dl1P/b6yZ1OoducC7PycqC/tUqLrlhDkdrvkPp1p5g/qvE9mFPBw+98JwlCMbsI72gIdGGcMKZG7FzbyuEZsIl8YMcVUgYMjj9Hm313jT1DeW8Vv8F0Kd2kF/vc0Xcs4378E+/ME8U7vZWwr6ZqZgO/cVg==
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:285::21)
 by SY9P300MB1595.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 06:35:46 +0000
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618]) by SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 06:35:46 +0000
From: Ethan Zuo <yuxuan.zuo@outlook.com>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Zuo <yuxuan.zuo@outlook.com>
Subject: [PATCH] kbuild: Fix permissions of modules.builtin.modinfo
Date: Wed, 28 Jan 2026 14:35:04 +0800
Message-ID:
 <SY0P300MB0609F49D4B4BD7B553C0D92D9C91A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127205915.GA3856796@ax162>
References: <20260127205915.GA3856796@ax162>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0108.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::7) To SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:285::21)
X-Microsoft-Original-Message-ID:
 <20260128063504.5458-1-yuxuan.zuo@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB0609:EE_|SY9P300MB1595:EE_
X-MS-Office365-Filtering-Correlation-Id: 705f1d29-c8a2-423a-bd85-08de5e377759
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|15080799012|51005399006|8060799015|5072599009|23021999003|19110799012|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0gQ1Wi+iY+gH/kXgsbmOwTRFeM60GEgvhPtcHfYJcsHLtQ0lz0gptO8V43dn?=
 =?us-ascii?Q?JjTXbYcF5pqBYiioAWQfiqYP1NZep8kVhCjPQ55j4Nak4Uekv62yOrzVVmky?=
 =?us-ascii?Q?R4TaM0Qyr5L+dFuAcpwdgU4eWNSS9loWkE0WjxjyyRvjdeyfELXzJYRvUpO1?=
 =?us-ascii?Q?zj9BRAhVq0NXFyCz3qteZXm8/1vnKOp6u/P9CRdAMuoRISfdJvHQCR0Ukq1T?=
 =?us-ascii?Q?/KTyUX/6GHOoAhdB5nGU+133W/vTK6+64tqAVPhcCRFviYybD2XOLSgwz1U1?=
 =?us-ascii?Q?CGdLgGO+y5tqNwnKqNMhvcrBcWrgNU8fHrk7qxL4QuOkZ30WVleqST0N0TOE?=
 =?us-ascii?Q?lKy0YXDqxlSvvyuktg9r501a3pjx/mVM70J0XpsXXQmfPQb0u8dG2gIKZC0I?=
 =?us-ascii?Q?FWdzMW0QhbNwXaenAyDokkkmY6WnmNdEw83xX7pys1jNMJT/wVMOVceeREZ1?=
 =?us-ascii?Q?hhLGHN6EgIxveEGAWC2XvruvayXTRFUV1KKX2p33kAYcgnIC1scMyep7vGRd?=
 =?us-ascii?Q?4ySfjfGxcldPKYhC+m7sDYp/j/9S5LY2/ELyhK7Soz41qYIRosjWpUWmZEeV?=
 =?us-ascii?Q?voAkXjpvGuxfwoDYDMt1Bvb3ddCZvseApamJZKyrpiQS8C/ZxcwlbbtJPo9P?=
 =?us-ascii?Q?eY/h7KzgMnZ2009ebDcU2vII7wcL6MtAQROUnjC/B2YoC1b7nnCYLZQobHga?=
 =?us-ascii?Q?MxXKdKbGmiH4agh/IAFhM5TECvkadx8E4NUZw1SD41kz8AypkbQd7ymuOUMY?=
 =?us-ascii?Q?lSQUEu1iyY/vbo+EiP17zQHcXCenfYUpUog7xk+HzjFR8SDzkOYGSDtp02RJ?=
 =?us-ascii?Q?S6raoegvB1dq4uTg9zyVOATiY2+thqX4Fegkx1yR+ofRJTmt7cWN8yPF0k83?=
 =?us-ascii?Q?tWCGcZJ8x2KJvtQ5IoPs0vrQL4wexwG0XFqFf4+DAYuiCj/dr8ZYmjVbteVL?=
 =?us-ascii?Q?qLEwS+aMI0I4VvjKg5dRh4yjUR9WUchdjHMSSUx5VPbwcRvS5uVisknKisWi?=
 =?us-ascii?Q?gSSWHRu6kSZ/X0X5Lbp97gsOO63HwThPgDt4RiOAQqVC76Y3Sz6eNB09BrFS?=
 =?us-ascii?Q?7pBTE3/XznzVlZs9bH84P7FtUwPEaf7CasWaZd0m4F39qUcpmAI9nunbcRY4?=
 =?us-ascii?Q?RrjspAJ+F+/NMtp8IOWOfAGQV4Ui4672JJK3kueHGqeYFHdRL84CQJxEiruY?=
 =?us-ascii?Q?8VcBs23K7XzA/kxoAqnMktwlMRc7h/xFQnYOJA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lG6Q0A+UoJ4rKJtineulXA5SdRVAQqgqVKWX0MmyFPOEVmofwWlsHO1cgogF?=
 =?us-ascii?Q?cLXx8zu3Ik0ZQPXg6bsyFmC6oOTeJjWAoefmJMRje7oXhwdqceKK8i/b1m4M?=
 =?us-ascii?Q?fFN7qYoMh+oOQZBFG7aJz5AlKAooG/ZowKV/9Gh/mRMkk1M/fBUOPUU4QxaK?=
 =?us-ascii?Q?/uufg3w6GcvXuUwVW4oT28OMQKF9cINmE1hgvASAVZ2QPHUeHOX5Dkk/jJqL?=
 =?us-ascii?Q?GNCzZ2QAtdQ5HjED1RSFpmUz1rBM+3iC9XiOEhVvEMDvtjNwLfEyYfhdIPPm?=
 =?us-ascii?Q?4bR14aUrKfKoyI5LDF9JWuVQ0arI6yoDULA+ovguRLc3NOsqHuZoAHojAPns?=
 =?us-ascii?Q?9vql5ABog7IGQpquvNL0zQQXKZ+K6KKjakxSqBoSUl37vMOVa8vwcwuALuC/?=
 =?us-ascii?Q?k8PKJ548f46lM27dBDBgtcDpQCskHPzPpAYsQZe5LRYihnSxYnNgtr9Z03Ks?=
 =?us-ascii?Q?zRRebb2xjXPJZ2KTaDJIFgFUxSDWumEvUBdBqCVRK5tvIUewFCoRhppahWS+?=
 =?us-ascii?Q?+EZ/ODyn9x5tC89N9MAHOrro8+4YVPLixeNdvxhCsacSL8YEEwOZre6Tjc2b?=
 =?us-ascii?Q?hA5yksnATZBvT634a0NPuMrrV4Q3RBZmo/Tst0ieUqa7EUKfD6P8vK3HXD6r?=
 =?us-ascii?Q?rbdyxYnJU5bzhgmiS2pIA1hgClta+PRasbuqdQEEYWOxisV5FWIv6Y9ufaTm?=
 =?us-ascii?Q?jYDwEVrgRu4mhsTolZTm6nqrtho/QTRd80KP0JHJXOBiOsaCThuhSVr459z4?=
 =?us-ascii?Q?L9i40rFdUJvRs5ptHAdUiePrQIdRHR8PfPZgr4ufxYOSgGzns03AzeqIx8Ni?=
 =?us-ascii?Q?51IzZpMy0+oEFRwxarwR2KQ/8V2bIVi+G6/+HpbygD4rQD9FQMmn6I+lwZU/?=
 =?us-ascii?Q?dGEETsNTtiL710RU+1qlyNdXpQ1TY7tXfDR5bpUSkr7M4TtFJ6XrVxUObZE9?=
 =?us-ascii?Q?NZ8VI6X3Nf1paR7w3KDQYOmReh+JDCMwvQrvCRGON7YeniOH9vhAN6i1BLRc?=
 =?us-ascii?Q?EAG39VIjWdIOHWahyJ03IX/3uWe2nTyG3bBC8PBpUtIjG8JG9HggGURG2WCF?=
 =?us-ascii?Q?vSIxW5EQx6D4HSbkdRLHrLmhpGNROTWRcLwkQJMBjPnAbDLf1ut0hNrx7O01?=
 =?us-ascii?Q?+UYUpDTWRiG6RxUnM7EZeb1f6QQILujynk8vQwao15TnioG3paSswC+1tbgs?=
 =?us-ascii?Q?1lke3Zt6kUI/+yfqovnGumdvfsH7LlkoxNXVfC8wlkMHeTd0lPxjv7c9U1lT?=
 =?us-ascii?Q?5GBqA/GcoAAgP2xMa+HD8iwo8i53kdqHpOxoocw97us06H/CiWfqLqvXGPYX?=
 =?us-ascii?Q?IHcb4eHzJq9RCNmsR1u8Ke1k2nVOdo7W/d+EIw09drUnkoR1zIsnLu4S8D1m?=
 =?us-ascii?Q?1yKEHHls7dvvH/Uw01qtg+vutdsA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705f1d29-c8a2-423a-bd85-08de5e377759
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 06:35:45.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY9P300MB1595
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TAGGED_FROM(0.00)[bounces-10915-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuxuan.zuo@outlook.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: EA8D49D730
X-Rspamd-Action: no action

Currently, modules.builtin.modinfo is created with executable permissions
(0755). This is because after commit 39cfd5b12160 ("kbuild: extract
modules.builtin.modinfo from vmlinux.unstripped"), modules.builtin.modinfo
is extracted from vmlinux.unstripped using objcopy. When extracting
sections, objcopy inherits attributes from the source ELF file.

Since modules.builtin.modinfo is a data file and not an executable,
it should have 0644 permissions. The executable bit can trigger
warnings in Debian's Lintian tool.

Explicitly set the permissions to 0644 after generation.

Fixes: 39cfd5b12160 ("kbuild: extract modules.builtin.modinfo from vmlinux.unstripped")
Signed-off-by: Ethan Zuo <yuxuan.zuo@outlook.com>
---
 scripts/Makefile.vmlinux | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index cd788cac9d91..c5305619b1d3 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -113,7 +113,8 @@ vmlinux: vmlinux.unstripped FORCE
 # what kmod expects to parse.
 quiet_cmd_modules_builtin_modinfo = GEN     $@
       cmd_modules_builtin_modinfo = $(cmd_objcopy); \
-                                    sed -i 's/\x00\+$$/\x00/g' $@
+                                    sed -i 's/\x00\+$$/\x00/g' $@; \
+                                    chmod 644 $@
 
 OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
 
-- 
2.51.0


