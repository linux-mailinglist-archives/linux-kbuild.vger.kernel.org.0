Return-Path: <linux-kbuild+bounces-9696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 623EBC74790
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 15:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C32A4E8AAF
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 14:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D32A33F395;
	Thu, 20 Nov 2025 14:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="OUUsIKq6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8033033C;
	Thu, 20 Nov 2025 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763647630; cv=fail; b=ixezCnqdnV2p8alAsvOwlQmy20xDojXknZziaUaYYV5w8rncr9NeqzoxaAngFOSNL9JXHpjcMr3Ee3pVpUutVtlO4VAODmJbLUIPKMxxLl1e0rgjLZPzavs07H70/TnCXb8GNUgUm5gB2d/fyjDYkHQsvT52HuCeR6naKxHMNXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763647630; c=relaxed/simple;
	bh=JgnCs7nLBQ7YOkjcqVr5m3g+jINjLXfOtz4Y65v4rx0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lVFP7W9Fk9Z6pbvLrwTp2JOcQzG+QORWBpqZCzmT3SqApNDRsLIett4lhn3yF6KNkeVuXeshq6AcyzYl05FXXP3y5u6R36TgQ4v6MJLGugTcUyDErncTTZEIazl0DvXsgdKHnMWVSASakpo0qRzmzCr1I7YglQ58Jzu1yqGllas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=OUUsIKq6; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMXl4cCSxdI4v03GHkEWMyRYONW7bwsBVuhMwwp9jsiTtOfy6QBYBmqVOaIFzNoPdxaumWgKSEtCDVaAfylY5B0Ug9nzDRLuqJjIj7jO+vIrUZFyR26XcfHALMT8tgqdfsdYWJbkvxKnG6cKSjdpEoYJgEH2J8ZiFtp1F7/Y8lyFen6AsejBi7AbZbUyxdLZg1ovARQ0lei9J/4jQ0o0RNvr8KEqvwWG9hLOpHgxtTeOfbrPckgMNATXd3lR8jnN3PR9WRigy61PMiwXAhOS6hqhulRnmdgd9w0uLg9zdRcZiwVmwSYphjiVzCQt/Wx9VcKkk/TbyOeibfU771u2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdponZb3PsGh79OuVajZ9amMVsmZ631PK1axP4pakwY=;
 b=Rcp/ujIiZfahQSWRKvJvf7frYparqLa1jM2w6Zb3v+soDy5UXsyy+BZmdFd6EfErDFl46isjqFWLaK5EvvQDPuOa24iuOiRPl98MJ0EQjP5EanFPhtY4NkqPrRHQQvJNSj8iOpu3rXy9pgN4PURGVcx9CTDfUuoHMVJmJyC3rlaC2H1Tj0G/RmwUHxM6AeakBAn1nXDi98tMJEq++NCXLEWcy/A4fmEQrwx/663gvNV/DkjgvKEGc+5m0n8CQqQwPeWOdr3EQbnOMTT4s0v0Wl/1YISYGLDwXFv6femyBRZK0SlDjFs6byNCvPHEIpQkqbH+tIeeAWOUhlro59+mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdponZb3PsGh79OuVajZ9amMVsmZ631PK1axP4pakwY=;
 b=OUUsIKq6BA78wyKOKqZQW37AMZjno/AA6aXciLQkQlxs2LEvtt4npldyKKA92V1LW02KoKdrhT4fsK3J52uyUmLRZW0hVkfsVx2iBk+xi7WLhiDhK4dd7XSO2TR/8/P9gP3QVlxZglg7qpiPzP0Banp088ANG33SKn6/7ArDdWRw0pn3da1uoYs4IMzRffdrioegl448a2srff8z5ZbyuWy21yc/gZxFzzfKyPvwdv978O9nTOYgAgp1KC3ev4AcrB8obaKWx4qA5l7ZQhL6fsdPYlVxCIkT7CBXAlK89tUpey5BTt6NkNRjVd7YcH4uAvM/7Pkt+pKwy4/U0zSSLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM9PR07MB7282.eurprd07.prod.outlook.com (2603:10a6:20b:2c6::9)
 by DB9PR07MB8822.eurprd07.prod.outlook.com (2603:10a6:10:2ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 14:07:04 +0000
Received: from AM9PR07MB7282.eurprd07.prod.outlook.com
 ([fe80::554e:4916:29d6:da3b]) by AM9PR07MB7282.eurprd07.prod.outlook.com
 ([fe80::554e:4916:29d6:da3b%4]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 14:07:04 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: linux-kbuild@vger.kernel.org
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: fix compilation of dtb specified on command-line without make rule
Date: Thu, 20 Nov 2025 15:06:43 +0100
Message-ID: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0202.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::27) To AM9PR07MB7282.eurprd07.prod.outlook.com
 (2603:10a6:20b:2c6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR07MB7282:EE_|DB9PR07MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: c57eeb10-d463-4b9c-f7ee-08de283e1529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Xqt0uBTNo0TsTdmtVDR+3hNQAlYLcpEDMw4ltqKOlDLGilzdeA/YW2YHO+u?=
 =?us-ascii?Q?v+wtoY8S58CqD3BXVaynczn13tdXrer9Gb6Bdj/pb4tGneE3b+0+hyPxeS7F?=
 =?us-ascii?Q?3kVoM8jRuGo/VWmRyJnmSSG3HPbL7tGtvdz6I0pyWKP6bquCEQAp4YqlRY1T?=
 =?us-ascii?Q?1uAoiDKm9CnxrondYPz3WlRjvqZ24MsglG1RCLxrDFFh8PlXLk1SIvX91Yb1?=
 =?us-ascii?Q?LGPSQyq5QfAM9y+YJWCnS2nf1VYNV3hqW9CHCgxkc3hdGp9tArQAZV/5sJKb?=
 =?us-ascii?Q?WFtFI91FzWjmv3tuWpPOjEoBkgoqtKynVEQSR35EFbtNGa9nNNvtkerRAizw?=
 =?us-ascii?Q?Lpqxzd67S9PxRnWQCI1fyqSsSI2YILI3YAQ7LGgTWiSo0dOpZkf+4jqZDw/Z?=
 =?us-ascii?Q?YOxtWDNTsOkDnzZco8NNRdt0OaAQbkOjucChE3mtN42V2h+sqsKXwmNESgRK?=
 =?us-ascii?Q?Rk1lbdn4Ix9poVhIBBJ74+3IceLem+AhoDw7I6PhhzUMlQ/+X0KQ0u/bLMQB?=
 =?us-ascii?Q?jHNgqU40OPcSzOdgvOQjXz0T995mkWKYBs8isI1ckzM7FXCVoNJlZN09l1dj?=
 =?us-ascii?Q?l38Yzjp/IRjjOOtZ6TuKzl9I9wNHTjmkBsb8BK6vueOsrp251azyG6PnyVr4?=
 =?us-ascii?Q?Y+4/O7ycnhxR9/Lfn7Hcxc4y16fxDIsCF7cp+ucln7kT1I2JLb831I2UXAdY?=
 =?us-ascii?Q?KmQ097rohV6KYwwwK+lxeCSDsOjiLz7iLuzPpxhXbRQkPdPDPVm/sHdTtU8y?=
 =?us-ascii?Q?rnHUEe2sRmid9qO43VhbcTSkzevGo8+6tglxhlVGf9h6+Wp7tNoBXxYhviqx?=
 =?us-ascii?Q?0aZ/5aMlmOTbP+VqXyQnNoNwut0KV+Ml/1eutgxtJTL9deHxd2AdIT+GXSsK?=
 =?us-ascii?Q?O10CTkO9GWiXVlerrHxBTXHISaFtp5qqZdWGWX+8grzdu4gbmJU3kTiRk4bu?=
 =?us-ascii?Q?8722vnaoOGU5jEz+9vzQ3Zr6YfySjr9IdbWryzW5D3ZDYbBCzfwrn5o/10FQ?=
 =?us-ascii?Q?QYWrwV18TLEQ8QKakmDi3n30nUFQKEoSyil/lby0uB6FFtrAtXKU861LsL+7?=
 =?us-ascii?Q?mGI1w0v2rPMFoUEmHzBLfOw7HcssNCoU1NY/nK0sMU7KGk87TuVjLcyQ5uTC?=
 =?us-ascii?Q?9ysrpf8pEK7YHrTuv2GbXncrzlRxehxNx2hXACAbXkkTnelo6fLrAmCKilUh?=
 =?us-ascii?Q?QelNJJXC6WRxwprXq4vo3bkugC5KGQL/+Q1fV5KU6eKm2fe2dovSyT5tXTlR?=
 =?us-ascii?Q?b51POuEPmDRny8EySNos5Ip4dz6ZjJLYMB1HS6Y+ENS+DtZgnxaqLNXvOPWv?=
 =?us-ascii?Q?NvDnCP0Yq+6p/gln5rnJclOZB8ktarkNLykkD0Nq4muKcXjYo5I2qjeDi7lF?=
 =?us-ascii?Q?SO7PRVfi3dTCQq0mbr1EQr9m/sBOG1EpX/BE28qh37Jfru3YcKptRCJ5/1G2?=
 =?us-ascii?Q?JLFK06gtXQRDxMRECILI/Pf+KEwux6I6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR07MB7282.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OFs3PQ3oX3/+oG16VZuxMPqj6+KY1nr1LXjHRt7cEnSZH+K7hTDThvOFwNEF?=
 =?us-ascii?Q?od4f/NHFQOg+tPILPY6UNoOGyooUL3o+yKjzOq8H2bl76WzrEd/XdNy6Vn0h?=
 =?us-ascii?Q?6Vut1lOYeW88ui+zzdmpODmI8u3qYydD/ZP2BQW/0HCTBDtC18MOstXf3lsp?=
 =?us-ascii?Q?52xWefIClCYzbL4zp7+ni88lhimSDZPn5Ehug5cUKaJALgguaC9aE7mAoFyY?=
 =?us-ascii?Q?XpuzUq87VqrqD4oEBKvB9Rjjo6wXcmhLHZM/Mnpi8gJf5Jy5ISI2/T27YCu8?=
 =?us-ascii?Q?wlrnNTBKDWS0eINEVR9NtCnVJPCcXer6lOS9cfedSECOA9Ew+7BhBvOHwJc1?=
 =?us-ascii?Q?IPgaZa+kZAgWvgD7zO0npxLs6kRtxL5dsveTY1rVtV16rge3yD1qSMt3yntr?=
 =?us-ascii?Q?DGNUK2TvnoFl3E+esZ2M6/G2dExu/fH0cAD8GgCq57WdwU5Mpg9728IOL76q?=
 =?us-ascii?Q?Ze0UEhtHSOP75Hp31DZi+1sLF6cpG9BZ3hrGmISeJRj+3LLoXYWW1741dIXh?=
 =?us-ascii?Q?Koae7n2NL8svgnEkvxa2GFzTfTxQoJ3YQ+i8y6BXlhFIUN9Cay8E+VkTRb2R?=
 =?us-ascii?Q?2y5JvCwwS4eWogpagO+wB/V58zRK+8L00IzeLVsZ86VCZ+HF1JlZKGyeeg1B?=
 =?us-ascii?Q?Ioq1N/bdLtD/xaf7cMSS8w4fmvBkfark6berh9J9WvPPbR1H7maE2Z0c0p8i?=
 =?us-ascii?Q?p0fbmIKUokAGesor07L6FnMBqTUTQjFIhQBOIDGDJfKzRV2GNSE7LNxCnahr?=
 =?us-ascii?Q?N9ZbqGoy+UU861pXmas7qA1LcyC6XoQeUqD4MBq+5univ5kfwhqjltNn8gH+?=
 =?us-ascii?Q?UU24+jkJPzxROnZtRPzDYZZ7LmYMgqnPqSJhhcNj+yBqTiCApQDa7WT7r0OH?=
 =?us-ascii?Q?eWyzM+vCzlBZrzPtBpoeAIF2RlMUpM6B38aNr6nvQA98zj7KeDM2v2SrQ9dU?=
 =?us-ascii?Q?qdrfsY61w6sj7OQvwXlCc5CyqlnGzOYoG5286OSzyFD+BPobwse2lco/FJ3t?=
 =?us-ascii?Q?ICtS4eSTm7sMX966rzNk/RJ+a04PUKLGcNauqQic74UPi+1WalR7LnGo0I/I?=
 =?us-ascii?Q?CN14PC2PLY7pp+K+etBZPZFjKrfRccG29BfAYeitK42AwkH43uu31Zm9bwmg?=
 =?us-ascii?Q?1iSZWMrmljuEzsSDYlk2aO3H9/yxqlZnMRfoEJFmP0QoJNgzRVfJKKyA71h6?=
 =?us-ascii?Q?aY6smxntnHzSMNFQUTL2IwM04FsAwijSPxlR2eVOV8Bvlf67YpAo8BcshAlR?=
 =?us-ascii?Q?RRRlMN9bnVnr5fS6cN39KGJ60QXSvQnyRJO53qJJ+mYV0Iyse4JkTgWPGY8T?=
 =?us-ascii?Q?DhQszO9KVfHMRN2oJJD4SdDcI73tt55+pv3SHNMlJwiUKJJrdrNjT102vSGF?=
 =?us-ascii?Q?ygiWFom9Q+Gcl37kW9MjdX4HRFCy0bOQV+thdMIKqFojm9+QNyUb+NZ60CxJ?=
 =?us-ascii?Q?jb1yGUDZ83J4kE5BbimbKLbd5kgpfFPx7VoaEHZXKKFhFDsWsdD9VvnHXToy?=
 =?us-ascii?Q?FBQ0GFLxALYzM+WbNb73/rY/pgeOoqbUVE/zWCYfAi3YeV0XONL6Aeavgrv7?=
 =?us-ascii?Q?QtnpYtZdzp6tW1D6xRpTZVC1QqVnHbeTrprrbNxX1a9+ekHJ6SXsa36LeJXM?=
 =?us-ascii?Q?EPtuN9SWf3KTkoKSl2LZT3Y=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57eeb10-d463-4b9c-f7ee-08de283e1529
X-MS-Exchange-CrossTenant-AuthSource: AM9PR07MB7282.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:07:04.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX5JENdEKFvk8dybtaVU/JS1BjqU+qtVWoop1aziLfNdZN1xkAk/24iBI/i9ggZw4PDURiP0DF42q3wBR2KZCCswIMkf/bbUDpoevTc6ENnd/jrJukxUBEwWVtBzQj3Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB8822

Since commit e7e2941300d2 ("kbuild: split device tree build rules into
scripts/Makefile.dtbs"), it is no longer possible to compile a device tree
blob that is not specified in a make rule
like:
    dtb-$(CONFIG_FOO) += foo.dtb

Before the mentioned commit, one could copy a dts file to e.g.
arch/arm64/boot/dts/ (or a new subdirectory) and then convert it to a dtb
file using:
    make ARCH=arm64 foo.dtb

In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusion of
scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS. The
value of 'targets', however, is only final later in the code.

Move the conditional include of scripts/Makefile.dtbs down to where the
value of 'targets' is final.

Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/Makefile.dtbs")
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 scripts/Makefile.build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..6e0f9e922c68 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -527,10 +527,6 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif
 
-ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
-include $(srctree)/scripts/Makefile.dtbs
-endif
-
 # Build
 # ---------------------------------------------------------------------------
 
@@ -568,6 +564,11 @@ FORCE:
 targets += $(filter-out $(single-subdir-goals), $(MAKECMDGOALS))
 targets := $(filter-out $(PHONY), $(targets))
 
+# Now that targets is fully known, include dtb rules if needed
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
+include $(srctree)/scripts/Makefile.dtbs
+endif
+
 # Read all saved command lines and dependencies for the $(targets) we
 # may be building above, using $(if_changed{,_dep}). As an
 # optimization, we don't need to read them if the target does not

base-commit: deab487e0f9b39ae4603e22d7d00908ebfc9753c
-- 
2.51.0


