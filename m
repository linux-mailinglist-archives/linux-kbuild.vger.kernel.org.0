Return-Path: <linux-kbuild+bounces-9865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99AC89287
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 11:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0826C4E9A52
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 10:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A052D8792;
	Wed, 26 Nov 2025 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="qRD+Krc5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801242874F6;
	Wed, 26 Nov 2025 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151238; cv=fail; b=TitQFUkubfrDiNygSza2zwegXpN0UZEIZ+APkok2d1yU9JHGjO737NvogoU9Vdm69+HDkQC+gIWK32G3RbQfUkb8IFjE873nMtM3x/oaqtaNYBM5DX92rN1tR1WuoTBnjWhR1Po1CW+m9fSsYNHuJOh+Gcq7E12dM8hHztvw3YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151238; c=relaxed/simple;
	bh=aavT3x1+77Z19MS/2Cpi7QNjFC56tN6vqU3QdasjmEg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U13YX6xsVJmxfCk0B5z8gCrk2ljjkvRGv401YBpFBSO3zdPG+u9kPHHWgubazhE+D09vlQ7Isz8cnn0sQFIyyTAVcpvGboL6z22YPHQpYDpmmAxPwDLA1MLrya3omH0FnnylSI5VbywWvxWqjj7ND7RMmfubYjwir0bMxZbK3lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=qRD+Krc5; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHc9AXcxxZceGoA8E1jca9mXcEYWv3SvLFhRUsi+T0Mi+IscCqy54BhUkEE2R0qGhbBJGIO7/4Da4SCqhc7iRjw94pD6+nhQaDhvGtUO3MklcxM7MBr48QCt6kbYGrWbzF6wzNYpfryFWbKfspF1k/bT4tOji0kzB59K6wOZTnPAxZa0io8niCY3mQV02g0y2rvxj5/KhO/XUS3cKlea44cKSxO+ltEUhHxOnNkDjTOY7RxUg3ECk1npA/EyJMaFRccKfvVj2Qd3BiaQPovkvoWZWLTYY4Uhib0pHPwhSIGPQMM4gZlrB+xg5hSobAeGT4CsOriIqRAJchHwM0f4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h+eou0HtbU7u9+uq7x3/vBQ5JRS5YKcIWgZIFde8ZU=;
 b=M6oWrTtvjc0LKQICEhjUbK+Skyj2UnFY/26yAhFtULRlMhNF6o/7NMhdRunhwV7xuXWW/C9CcDkNdQMIjWDEmD0jYxCXSBiP/0g2zdbmg85KaMbL50nQWuJPwENC89Q0/x3THWfQnyg3UYr0aVW3QFshOYQ/ytZ3lVjF5dm1H3GScgzj1oBTld9d/j5/iwelUC+fCNYQPIj4JQdPcbudAYFjx7eJWi7hgzH/1aK/UbeMi5Hhw2IhkMr/fG/7nZ2b2Ti8y/7MWYU2Z3L+Y2oZOs6f8FJHWbIV9fh+DxrWNanD1QUUgDwoGNddwqNvaSj+D/C5M11SjP65nfe/Scl1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h+eou0HtbU7u9+uq7x3/vBQ5JRS5YKcIWgZIFde8ZU=;
 b=qRD+Krc59N5jjZchQTCI/QljdLwHP63JLhTNnV8qVBR/cOgHrI3c+84t3hjMFuDPxgbsPCIfFNqx7yDLoFBchU8hP+zbMC5MdNDTuo2vZPPF1K3p5wPqWgt0V3HBloLYLtuCeXR+fzyT3NtLuuU/uNLcbGeIjZvyEu3G0KPGkIZQajBxu6aGhwJO+WjNfWGCAvrez+tYKOwg4SY7fBHg1R+/iD/mBNm5KfbeVISwbvefgDWQmDXekkuL1/QNZQml+gtCfKVnK2eUOQt8qzApIN5t4Mn19HrWudXcy27ssIyKWXyzoer/GXc2BTFcXFmqyWfifmXSmRGDFUGbSdVrTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM9PR07MB7282.eurprd07.prod.outlook.com (2603:10a6:20b:2c6::9)
 by DB9PR07MB11117.eurprd07.prod.outlook.com (2603:10a6:10:607::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 10:00:31 +0000
Received: from AM9PR07MB7282.eurprd07.prod.outlook.com
 ([fe80::554e:4916:29d6:da3b]) by AM9PR07MB7282.eurprd07.prod.outlook.com
 ([fe80::554e:4916:29d6:da3b%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 10:00:31 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: linux-kbuild@vger.kernel.org
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
	Rob Herring <robh@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: fix compilation of dtb specified on command-line without make rule
Date: Wed, 26 Nov 2025 11:00:16 +0100
Message-ID: <20251126100017.1162330-1-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To AM9PR07MB7282.eurprd07.prod.outlook.com
 (2603:10a6:20b:2c6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR07MB7282:EE_|DB9PR07MB11117:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cac1231-4297-4711-708b-08de2cd2a26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h2Rrup4leT3o/nfUwNlFKyOw0nOX6MjhxQA53geReRPMhY4XWBpRCmtJgANo?=
 =?us-ascii?Q?K3iwxZhCc7Sxkl/MCcbMMAmEQc9LgncuwUFfioQ80pr3GitENrCs1t4F9oF/?=
 =?us-ascii?Q?IerdrpMROvFFXH4WmmuLTJinqEvUpEz+8aGzE0bV9WNOB0u44x3GCs+qC0vQ?=
 =?us-ascii?Q?i4W5lJV7Rmj8qAKUlAFSXFU1hnWhn2TmDS6Bq9XP7fK/qxI6tqGDHUV0ZU+k?=
 =?us-ascii?Q?0XdmxrXp8uWiVvLA/Q9A2zo7uUCutMlBcf0rU+PqOzVhcSbZ72LbBj1rRx05?=
 =?us-ascii?Q?K2Ffp4r/v73/be1HO/bkvoz959TbxNcdQ/qvQD+WBRhR7BwhTq5VUFdHWG1z?=
 =?us-ascii?Q?2pPi3tz7IqL6QgMuK7km/vYko0h6U/G0POMs1VmkSjyvsJ07uePGYxy79ACZ?=
 =?us-ascii?Q?ux60VjwpXl3k3O6RFfentw6s8UwjwxPVdXHFMQb4AufPlZy43gJdN/w8vBh0?=
 =?us-ascii?Q?Q7Gryqh8JFq0bsWhdy69CNz29ClFVeKwD1szVPdy/GDq7UrirkrO5GyMJmxP?=
 =?us-ascii?Q?kC1ceHhD2xtQXPP8sN92jEJUvqUzm3WtNty/UnBNUStpgm2XKI3ghz5Fc2zF?=
 =?us-ascii?Q?6gClhZmOz4DG7GXuB45uD6j2yvia4HJ1vMYTNPB5y7lhQg+H+X1PBrRhFW8f?=
 =?us-ascii?Q?vInS+Zx4fn2meqahC0vHEGIi/SfI8/VQD9cAYxryxLifHBuFhp6jrvvW7c0F?=
 =?us-ascii?Q?uq9dgxmcLYWlBGnSvbqs4DJBc31Ujg5BvthQevoMpamIb5gxoN3ujkMhATFI?=
 =?us-ascii?Q?VNZPiAW8lNEmbJ6/mKKmZiywAKzzcuBR+lNsoJnpma+oP8ZbRdQ7qs2kwyrZ?=
 =?us-ascii?Q?eJZMInGgdarxPwXmmeozVIUPsFa7LxZbLZnXdHzLZuTa6ivfYxyseGNOnu1K?=
 =?us-ascii?Q?X4w3cQmbDoieNGxAWA6/5mITBC4qHzV9I+Km/JqZYiaIMIKn9W507QDHMoD5?=
 =?us-ascii?Q?iORUL8ikJaYovjbk38o156YVIW8ocD+P4/fTXOa5we1ITjerXlVG2h6aX7ww?=
 =?us-ascii?Q?bGzeWvpwFGyfEZpoYB/la7iqKjC9JsStdBu9phLBb07t9cz6T+UEtFQALqug?=
 =?us-ascii?Q?0usrLAIxuo/C2eCOGPkd3ks+sR9m5PcMFaVjXUjrzyGoaS0mWseof+sGamzw?=
 =?us-ascii?Q?IRIjNn8YEAU0F3tXRCLh0DDUp/dvcG9O3LTpraC9TwrcAN1+JAie+NgrWUBs?=
 =?us-ascii?Q?XSwsMQNuIBXP9tSj19yQl0tD7CUpjvWFHAg0OoNmDkTVdNLel5WYuyX6RpX+?=
 =?us-ascii?Q?a/T5pqr5EdITouzh3zbs9oETMIcoaOvHUwereQCUyQB+eTlOwReioKONmV/e?=
 =?us-ascii?Q?IdIIPWFJIgQBtHFxjjrVyBLsgpNiuZc5dshEsQQPmrQCaO0JEjEuobmMzH+Q?=
 =?us-ascii?Q?+62KlTkD292AOQsIpp7+BZDiQiRYf+i7zF4bMmAdT1CmXCgl5BThwLqJhaOx?=
 =?us-ascii?Q?FEAICm2vWbXZUCwQHPTYzv6rMZiMofys?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR07MB7282.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EW2kclbKLrxKEa1lyTBCrqWdK2x1DyV3SMdGk0a5dSgzFPs2V7N+BB0qaYZu?=
 =?us-ascii?Q?aQToskb0zbSnXl1XS7BQXmc+RfdzSXD/Rx79VEA+1k4crNhQJLMm7TVn3UlE?=
 =?us-ascii?Q?Z58jOJmZAmxJZUpC8cRaOFGkdUSfubQEbuQTjrXo/AH6K1xfT9Rav2gHriSg?=
 =?us-ascii?Q?wUvffQ6VDw2/tHI4V5inXFKKoINoyp1qwEuc97WTs6nlcWAFjAtLDSWB0dWk?=
 =?us-ascii?Q?s82vDWgbyrMpe5MElrbapoue6TqzS9Ya0s722zysNmdcY2eGO8ZEErAw6wP0?=
 =?us-ascii?Q?n7Bzq3xjCIiCWlH5jjh//zYJlimsjczLdbjIa7H8OyVwyKJt5MfOhKzKsHph?=
 =?us-ascii?Q?nEv/Y6J4n/+mw88JsG+DZNwzU1VYeBO4HzVTLbDtKhRGhJ4+4EgUkOJHWQTp?=
 =?us-ascii?Q?ABSjMJnNi28MUSOKdcIb5AVHaE8id7goSeAyoBGnluDbcCkVF+cYGoWQLkVo?=
 =?us-ascii?Q?HaoKBbe2pD87Mys2GaRcByADx0MIrhrIwHZZsUOwsRPncNClvX6HbNg/0jj/?=
 =?us-ascii?Q?DA0ZcJaH6qXMaZCV77zg1N4LCzf46gbTviCFsFlYV6JKYpWww7AOL00HvXs+?=
 =?us-ascii?Q?gzutYrz9umTxYoaNVc4Juyoq/chYL9lwKHPnTM9YjudxLJDJeE81tixj02oW?=
 =?us-ascii?Q?ynOLXK/5dLGOlylgJF4aKkAp9x8IKpA0eH1kcluShulTqklVWNjzYE3vGqZP?=
 =?us-ascii?Q?b0jQKAnYQSNrtnDbE2xQjRDynNLwxd+igcnxuEr2p7Ad3fv7Szb88dV/wazy?=
 =?us-ascii?Q?wulfSYNj320zPzsYW9jsvWL05enzw/tFAeQAQpp920dpCkqjPp26+cu4p0tP?=
 =?us-ascii?Q?CvL1Gp56/hlF4lf+hV9iG+rB3LSTUzXlPqb06mKvaMMOq9HTT3tIGxYlswqV?=
 =?us-ascii?Q?AV1Jmyl7xc53w6ibE4oBnAjNLx3dTAGr758KKzFlghEpXtWqNKlVdB9/SfR/?=
 =?us-ascii?Q?FhuGssG31V3oakfKoYaLCmrA0ukrjZHF7FYg3e7AqlImdHgmlg+3vGGdH+o3?=
 =?us-ascii?Q?fQbTMAIigRS9VA5DWrdzrhmMgi+9i6q/V4YrOYgLCkmJVqjLfhSqBS6dS5Gq?=
 =?us-ascii?Q?mKu6vTHCbFtf0nXlxJxTKOxhUaq1UxopUs+QQ9R+p3I74f0lFV2ARICkwl/I?=
 =?us-ascii?Q?MTq0oUGb6iCfBhwkeSI+z6H/ePuStPvB56PR0luGH0/B5Bmjg4Sb9KJSrf+E?=
 =?us-ascii?Q?Zwd68FLr88Vu8ru6eNOLrWGM9V6ovwunzU2n2VRuTAtg0gpDyu1CsAIiGvuV?=
 =?us-ascii?Q?Q7Y9j49KYiuU1jOgVEoWC2Y657y7e76Ex/Anfn/qAyTV3Py+YOmLIrqjMfjy?=
 =?us-ascii?Q?K1SjYHOW+K5RAPh+IXcaqJ3BlvpQcQnjvjW1P7lDOy3fmakBDwk9khyAGanL?=
 =?us-ascii?Q?EAZHYRU4sj+i9jD64AHmSOX+lVcWdToH9DOy+NCQuOxUyMKmAboXHlFDQwFY?=
 =?us-ascii?Q?w/WZ3Oa4HlSfJ1VxDwjrfGSP61E22qV9E2P9UrNz1DMeJ50ADAXQFRnfP1dt?=
 =?us-ascii?Q?sTJkTqmXNOo5+Lh4T8O8r+iOgesQXJeXk4oArteqH15HymucFaUVpiFpFKfB?=
 =?us-ascii?Q?nlRSAus2NKwdq9x5kliNLD7R+VX2L/9d6MbhpMb/lP8J6YTZkZNTEPWGVEx3?=
 =?us-ascii?Q?Id3FVv0Lpj5SMRsWwLK6I20=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cac1231-4297-4711-708b-08de2cd2a26d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR07MB7282.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:00:31.5331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0VYLs0dM1yXQhLGOIgGkiiFQY6EFYoOM+mfAbV6pLepz5MmjRbk8JZRenuDAKwgQ9UYgdwJ9GCwL+kNh/diKdhdWe/nq+7r/uOZ1RTWM1hybyFiLCy+OHt29b5I5iEg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB11117

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
value of 'targets' is final. Since Makefile.dtbs updates 'always-y' which is
used as a prerequisite in the build rule, the build rule also needs to move
down.

Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/Makefile.dtbs")
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: fix 'make dtbs' by moving the 'Build' rule along

 scripts/Makefile.build | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..82a6e328ceee 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -527,18 +527,6 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif
 
-ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
-include $(srctree)/scripts/Makefile.dtbs
-endif
-
-# Build
-# ---------------------------------------------------------------------------
-
-$(obj)/: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
-	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
-	 $(subdir-ym) $(always-y)
-	@:
-
 # Single targets
 # ---------------------------------------------------------------------------
 
@@ -568,6 +556,20 @@ FORCE:
 targets += $(filter-out $(single-subdir-goals), $(MAKECMDGOALS))
 targets := $(filter-out $(PHONY), $(targets))
 
+# Now that targets is fully known, include dtb rules if needed
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
+include $(srctree)/scripts/Makefile.dtbs
+endif
+
+# Build
+# Needs to be after the include of Makefile.dtbs, which updates always-y
+# ---------------------------------------------------------------------------
+
+$(obj)/: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
+	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
+	 $(subdir-ym) $(always-y)
+	@:
+
 # Read all saved command lines and dependencies for the $(targets) we
 # may be building above, using $(if_changed{,_dep}). As an
 # optimization, we don't need to read them if the target does not

base-commit: deab487e0f9b39ae4603e22d7d00908ebfc9753c
-- 
2.51.0


