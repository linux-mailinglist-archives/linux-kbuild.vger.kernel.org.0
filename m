Return-Path: <linux-kbuild+bounces-13615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zWgQCuFoJmpOWAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13615-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 09:01:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43B653536
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 09:01:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=jUeiL4Qr;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13615-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13615-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37CB23006161
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 07:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5CC32B11D;
	Mon,  8 Jun 2026 07:01:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7B3859C3;
	Mon,  8 Jun 2026 07:01:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902067; cv=fail; b=tY6dRDhGTqhXP1bI0e6d9HFJKrcaCPfRk5bk/lugSR7KvKem9WPqMwsxMra6aERrXviPUnm0xOQ0OlB1bGL1Wn7xcXcOHYLBZDTd6XZSYCwW933tDAEAPX2PdylzRu7S6xMwumYh96PvuX+Hoiv8HnYjnzNVCyxQgrwYp5f0RsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902067; c=relaxed/simple;
	bh=ipYyDHJwRhkJC+aophKFGcIUyYkEPAUF34JC0qz27lE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bEYISbPLi0O5F+edHTdEHtr7bqWkWnRGbuhP+wT2nKvU7NItTd20B2qh3e6bYmK1a7ZLJfZUU4LPbbcENwDTk7Qwr6o8Av/W0XoVNCKcY5XlFDak4m3IZRBygS5U+g/YjuaQaiJM3VcB9j6o3dMo9iszardOIdcl1+RZlVeHBiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jUeiL4Qr; arc=fail smtp.client-ip=40.93.195.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmUeEwywZxsLDU+l2h0WO46yaQCIcGEfVLl2hbGiVr2V4lIHEwJQV5gwN0l7JVZlKydHmk7CGWQpaHDJd5epLcOKMINg+i8jConw/tmCeIgn0JbHwbkxPkGffXHcUy0wLqOqZQgZUfe2rqULl8+9ypYLBih94d0HW3o8c8VCHnyyZwUgjUfuL7RAVROfTpDQGFafXzTDJyrPnhJar7URwrEkEU9CuB+Imn0kEUj9CexO3rHkcYV4kxLNi8psxM/Hw1tj2vUv9h4V3LPrnrApeD98ygRLXNjre3T8QPFiaSW8ka44N+whofuam5kzxHVSPIDkf+rtWT+U5uWWYpx+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/3l14Chan+FwXr/F6DRacqUh2qlDN+m6izy5H20WtA=;
 b=UX1FmzQUpT1zPau4nv3SjubLpFgKLUcHxSC9+Ft781osN59rD5fygSxnPA2VCFyyMHehRhDX5TZfU0lwOsVQsgZrKvrSIKy38BIrvW1YN1/d7Ibi2CfaF9rxvmnMVP63sRjSA4h4C5I9QCU/M+JzLB9ygmfW601AN0bptoDwJd49dzmcZY5/H5BROHIPWFSPOljG8QMMDmrpvOOT+l9HGq4n5dvoiZAs553omfKCLLVnqzWlVTvok7n7XibQkiU7UBKXk3qkl5CLaZk2HJkDmrLpHI3fNGb2pHpnivDTMGC4ttGDNl5W0Huq49EiM7Gh+WZt4qQQlom/79dtvihkjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/3l14Chan+FwXr/F6DRacqUh2qlDN+m6izy5H20WtA=;
 b=jUeiL4QrCnsEgQjHKJSjYLN7Bu2BsnvZpSqSb4S2MO/NGBiscbGalDBhx3i4HIZIkRQrr/rMOU/jCc3MCE7H0m4xkEHosu3b6NSeOdPgxYhM/aZJFFnMvKrnkukCutmjyVREB2znge76H6PvxDf/kN2sbfEF7pjIGPFiwt7vL3k=
Received: from DM6PR17CA0024.namprd17.prod.outlook.com (2603:10b6:5:1b3::37)
 by LVUPR12MB999159.namprd12.prod.outlook.com (2603:10b6:408:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 8 Jun
 2026 07:00:58 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:1b3:cafe::5b) by DM6PR17CA0024.outlook.office365.com
 (2603:10b6:5:1b3::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 07:00:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Mon, 8 Jun 2026 07:00:58 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 02:00:56 -0500
From: Yang Wang <kevinyang.wang@amd.com>
To: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amd-gfx@lists.freedesktop.org>
CC: <nathan@kernel.org>, <nsc@kernel.org>
Subject: [PATCH] kbuild: normalize paths in quiet compile output
Date: Mon, 8 Jun 2026 15:00:39 +0800
Message-ID: <20260608070039.4069917-1-kevinyang.wang@amd.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|LVUPR12MB999159:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7f7535-3fcf-460e-b95b-08dec52bb16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	boNVC69SO4ExiZEKYJ/h+FcfGIEQUJ4QltOn2e7CJwvf1Xtbqboood8bRaqOddFUtOCxNEXEmSOkfZKBf8UQUDSXNfubv2ngxAKL/E/OLjJ0XsRc8ZaxPRe8NdxjsD8Ih0NstAs7ZA6VXnpnQTes6Ylroohkvcjlxozhvfpdu9CQgm8tU4M6Kx0IuEKuMluYgtIQt0/jMbq76Tij9UVB+L+kQoSnl8F/OoPub6cxUhmygaXuEHITfBafrj6SepsSBMI5gFSkGNH7JJ33f9/ziVyfeLzn3koSMyetN7kth/HW+ad618iXGs/Gvzciq8kkJkQNQosWLEkP8PyDA/hNsPifONYN9vQ6KUPb79cewPPfkSMidSmD6OoRM6c4CWjadTWCVZ8hCrm9IR+Mz1AjTK+ZUzro3WPRj29hb5HXnCMHu3ltErJogb7VdilGZvVy/82WeKQU+uogpepaqGxIWb6wFtXbLOaDdYBb588W40nXS+tBJW8PC2fwQAXtkyFYv9XzHx3mJGtDePx0tdtxXpXPVQSoz7LdHrZ0EOx6bCPPYsOTlXrxnOcD7d0GB3ezQeL+ESE7rGpEb0Bq2HL8AN5AB8+CGZ0BN4QnL9DtMGmSwJVDvTiMzmKQNvQKOfSu9G3jQEqeewP0lYqY3mnosNJaTYF91b5dv7XWnJUbMwyIVch78bCJ8ezYVnKFTT0SMqWin6hpiJQz2DDYYU44myvEg3e+IPNUanP2Vf577CU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d0xcNzPap6mn0VIZZtXzFsHsn0t0VaZovh1vVb18RjokiG441FBDrlXTVDXkgbw/2ZFcZuDngmQJgSONcEuxudbZWVxTuMjq/1q0ELejk5w4wnB1pVZbBTp3KOq5AGFNetJIqg9xWGsAgGkEnjx6fjYO0YAqsGeOaD30rRiOdBZOv2CQRqvAyIpv8skT/fgAvQJUv744Tj/9TXpYg4xLcT/mf54uiDXg7oq+EIgvA4pidRNhcUWn1Pzf19qIOdZBU4j2RohGeMvIPcJTrjsGcLlAbxigMrfoANymJF/h3n9LZEIyHROJfymY24EbEnFl3pLsUqCcUuZFWklNbH+mue30FLFhjLm5Bumdd4BKmKVU7ZGOtTNvOuC1DG8FrXSpPS0n+SVP1F22Y+bhKlrhLowfIhaaBvNpsnhvhFUFJi84Z27DZkfOjkNxYDwUr2WL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 07:00:58.3895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7f7535-3fcf-460e-b95b-08dec52bb16d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nathan@kernel.org,m:nsc@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kevinyang.wang@amd.com,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13615-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevinyang.wang@amd.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA43B653536

Composite objects may contain relative components in their member object
paths. This can make quiet compile output include noisy dot-dot components,
for example:

  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o

Use the existing normalize_path helper for quiet C and assembly compile
output so the same target is printed as:

  CC [M]  drivers/gpu/drm/amd/amdkfd/kfd_module.o

The actual compile commands still use $@, so object paths, dependency
tracking and generated files are unchanged.

Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
---
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..7d1589d993a8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -239,7 +239,7 @@ ifdef CONFIG_LTO_CLANG
 cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
 endif
 
-quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
+quiet_cmd_cc_o_c = CC $(quiet_modtag)  $(call normalize_path,$@)
       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
 		$(cmd_ld_single) \
 		$(cmd_objtool)
@@ -254,7 +254,7 @@ define rule_cc_o_c
 	$(call cmd,warn_shared_object)
 endef
 
-quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
+quiet_cmd_as_o_S = AS $(quiet_modtag)  $(call normalize_path,$@)
       cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
 
 define rule_as_o_S
-- 
2.47.3


