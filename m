Return-Path: <linux-kbuild+bounces-11931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMVSI0tutWlz0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11931-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:18:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0892528D789
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D7013028EFA
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 14:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F8137997A;
	Sat, 14 Mar 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGseERTq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E443793D2;
	Sat, 14 Mar 2026 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497911; cv=none; b=ozvGM2EvMlJtKKZj5O2a1JwW9y8c9gZ2svN1NU8jQzeXeCkpqDlf3YWZbKb087G0t8ZlYUUkqdcyGeo/ige8ZjAhkbBuae2UVqX9b6iy2w4JN98hddGzsutJDP76QrQpuepH4oKaIs32klnx3StYimpFKt8ZQahwvr4Q+4+tPkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497911; c=relaxed/simple;
	bh=AXumW6HXOmazXM7FvHVA3w8Ta2j/RD3IL+MZjJT8dsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgLwwOlGrunxalSX4Vi3kSpG4G7M1Ca2GbmFIMpkBxI2mpnpYsWv+oQVaDEJTnMp9CBZshlbGoO+snKVQALFILg0j6lioa0dkEfU7UQ3hQqoNtzhi4G+UqLNq0qXzkuZx7sh7+hTpFs4K4Ngs+aLh+o/nl0blNbn8MSWOSbHDtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGseERTq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BD6C19424;
	Sat, 14 Mar 2026 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773497910;
	bh=AXumW6HXOmazXM7FvHVA3w8Ta2j/RD3IL+MZjJT8dsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZGseERTqZP+tt0Q8PxEyLv1q8B0SVG+WOUeX3RsgUemLWzFIo7WbKsgrvxUGYnYxV
	 v7U4aBZKcZ0IUN476ddbPMz4IWLPB26G/M1d+jhRjAzOBMwiRMmu9rgTYhmrgWU+Zh
	 WQZZJ5eCrLjipA+nJKZlvyTayy5ZYNvTRMxjptBcqSxe5j7o3deVMO7zb5UpBR8XV8
	 t6AzoyzKwAMBdrwu7sGkkLnd5w7FJnayDvtf73slFU441mHQhBZgIIWG/yohDKfy5B
	 A4TDcaZk0cAMeSqc76KvR2nLf9Eao8tAmc+O7Ed5kJ3hUi0W8rNzhI6WuDP4jUQtGL
	 hOVwCgYq41WXw==
From: Sasha Levin <sashal@kernel.org>
To: oberpar@linux.ibm.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	nathan@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 1/4] gcov: fix gcov_info_add() merge semantics for IOR counters
Date: Sat, 14 Mar 2026 10:17:46 -0400
Message-ID: <20260314141749.3382679-2-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260314141749.3382679-1-sashal@kernel.org>
References: <20260314141749.3382679-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11931-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0892528D789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gcov_info_add() unconditionally uses += to merge all counter types.
This is wrong for counters that use IOR merge semantics (bitwise OR),
such as GCOV_COUNTER_IOR and GCC 14's GCOV_COUNTER_CONDS (MC/DC
condition coverage). These counters store bitsets that must be merged
with |=, not accumulated with +=.

Detect IOR merge semantics by comparing the merge function pointer
against __gcov_merge_ior, matching how GCC's own libgcov identifies
merge semantics. This fixes the pre-existing bug for GCOV_COUNTER_IOR
and also enables correct merging for MC/DC condition coverage data.

Fixes: 5f41ea0386a5 ("gcov: add support for gcc 4.7 gcov format")
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/gcov/gcc_4_7.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/kernel/gcov/gcc_4_7.c b/kernel/gcov/gcc_4_7.c
index 8fa22ababd943..923cfb34966b2 100644
--- a/kernel/gcov/gcc_4_7.c
+++ b/kernel/gcov/gcc_4_7.c
@@ -18,6 +18,8 @@
 #include <linux/mm.h>
 #include "gcov.h"
 
+extern void __gcov_merge_ior(gcov_type *, unsigned int);
+
 #if (__GNUC__ >= 15)
 #define GCOV_COUNTERS			10
 #elif (__GNUC__ >= 14)
@@ -187,6 +189,15 @@ static int counter_active(struct gcov_info *info, unsigned int type)
 	return info->merge[type] ? 1 : 0;
 }
 
+/*
+ * Determine whether a counter uses IOR merge semantics (bitwise OR of
+ * bitsets). Used for condition coverage (MC/DC) and other IOR-based counters.
+ */
+static bool counter_is_ior(struct gcov_info *info, unsigned int type)
+{
+	return info->merge[type] == __gcov_merge_ior;
+}
+
 /* Determine number of active counters. Based on gcc magic. */
 static unsigned int num_counter_active(struct gcov_info *info)
 {
@@ -259,9 +270,17 @@ void gcov_info_add(struct gcov_info *dst, struct gcov_info *src)
 			if (!counter_active(src, ct_idx))
 				continue;
 
-			for (val_idx = 0; val_idx < sci_ptr->num; val_idx++)
-				dci_ptr->values[val_idx] +=
-					sci_ptr->values[val_idx];
+			if (counter_is_ior(src, ct_idx)) {
+				for (val_idx = 0; val_idx < sci_ptr->num;
+				     val_idx++)
+					dci_ptr->values[val_idx] |=
+						sci_ptr->values[val_idx];
+			} else {
+				for (val_idx = 0; val_idx < sci_ptr->num;
+				     val_idx++)
+					dci_ptr->values[val_idx] +=
+						sci_ptr->values[val_idx];
+			}
 
 			dci_ptr++;
 			sci_ptr++;
-- 
2.51.0


