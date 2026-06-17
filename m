Return-Path: <linux-kbuild+bounces-13804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OhjwG2YMM2p38wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13804-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:06:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24369C76C
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=sEed93wU;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13804-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13804-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4199C30347D4
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16C831282F;
	Wed, 17 Jun 2026 21:06:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA93F5BFD
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 21:06:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730404; cv=none; b=ZTgRuTNZ1ZGWqm4pdrMNC3UGqXApgLjjt94+B5BCXHsd4u90nYd2PcsHyZi6yr03D8crhQR/6+Per+HMFovd68qAJouF0QMpshXOnL7NhX9yHDZ4Nu5kR2Vd3iMfWiaPFC6eB3OmPjyEU4s4hRrnWgw1Xr7ZrSI1E0O2X6KvVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730404; c=relaxed/simple;
	bh=LJT+v5Bj7CztO7u20P11FOf/BO9PC+sXLiHUJnwCRKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GH4RFn9g43bWWxsxQM0+t9QclMq3TtRAofXYR+vPOfEnGGupMVHOto79t7zyOzg72vFzDcd8IAd1YYmW666j6MQGWDxg53nYMYsgeacrQTobn6cKuRO1hjqsijZzsw1V/UZrqN7bVK55vxWp5F/mx1bq01Uq3El/MFZikPTnQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sEed93wU; arc=none smtp.client-ip=95.215.58.171
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781730401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKHh8fcalZlmNQ1lD/ahVWX0x8o3tOFgR03MiYmd4yk=;
	b=sEed93wU9coMCyN/wnau1I0ufVh5ZvBMoULBSOPc9qFiWBiQgwREHfkCam6RFQZdkTKT7S
	OhG9w1bMk3VgEgtcYmmbUyqi952mVPHIWzn/umOraLAZRvrv7E8FKTDVn3SZPP7fETPGNA
	62XN8x3AOawWfirNw6zpKP7RBlkBVSY=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1 2/4] selftests/bpf: Modernize resolve_btfids test scaffolding
Date: Wed, 17 Jun 2026 14:06:17 -0700
Message-ID: <20260617210619.1562858-3-ihor.solodrai@linux.dev>
In-Reply-To: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13804-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,etsalapatis.com:email,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D24369C76C

Refactor resolve_btfids test in order to:
  * use newer ASSERT_* macros instead of CHECK
  * extend the lifetime of loaded BTF to enable additional checks
  * cleanup unused/unnecessary code

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 .../selftests/bpf/prog_tests/resolve_btfids.c | 60 +++++++------------
 1 file changed, 20 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
index 41dfaaabb73f..e549780697c7 100644
--- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
+++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
@@ -10,7 +10,7 @@
 #include <linux/btf_ids.h>
 #include "test_progs.h"
 
-static int duration;
+#define BTF_DATA_FILE "resolve_btfids.test.o.BTF"
 
 struct symbol {
 	const char	*name;
@@ -70,10 +70,8 @@ __resolve_symbol(struct btf *btf, int type_id)
 	unsigned int i;
 
 	type = btf__type_by_id(btf, type_id);
-	if (!type) {
-		PRINT_FAIL("Failed to get type for ID %d\n", type_id);
+	if (!ASSERT_OK_PTR(type, "btf__type_by_id"))
 		return -1;
-	}
 
 	for (i = 0; i < ARRAY_SIZE(test_symbols); i++) {
 		if (test_symbols[i].id >= 0)
@@ -83,10 +81,8 @@ __resolve_symbol(struct btf *btf, int type_id)
 			continue;
 
 		str = btf__name_by_offset(btf, type->name_off);
-		if (!str) {
-			PRINT_FAIL("Failed to get name for BTF ID %d\n", type_id);
+		if (!ASSERT_OK_PTR(str, "btf__name_by_offset"))
 			return -1;
-		}
 
 		if (!strcmp(str, test_symbols[i].name))
 			test_symbols[i].id = type_id;
@@ -95,25 +91,15 @@ __resolve_symbol(struct btf *btf, int type_id)
 	return 0;
 }
 
-static int resolve_symbols(void)
+static int resolve_symbols(struct btf *btf)
 {
-	struct btf *btf;
+	__u32 nr = btf__type_cnt(btf);
 	int type_id;
-	__u32 nr;
-
-	btf = btf__parse_raw("resolve_btfids.test.o.BTF");
-	if (CHECK(libbpf_get_error(btf), "resolve",
-		  "Failed to load BTF from resolve_btfids.test.o.BTF\n"))
-		return -1;
-
-	nr = btf__type_cnt(btf);
 
 	for (type_id = 1; type_id < nr; type_id++) {
 		if (__resolve_symbol(btf, type_id))
-			break;
+			return -1;
 	}
-
-	btf__free(btf);
 	return 0;
 }
 
@@ -121,25 +107,22 @@ void test_resolve_btfids(void)
 {
 	__u32 *test_list, *test_lists[] = { test_list_local, test_list_global };
 	unsigned int i, j;
-	int ret = 0;
+	struct btf *btf;
 
-	if (resolve_symbols())
+	btf = btf__parse_raw(BTF_DATA_FILE);
+	if (!ASSERT_OK_PTR(btf, "btf_parse"))
 		return;
 
+	if (resolve_symbols(btf))
+		goto out;
+
 	/* Check BTF_ID_LIST(test_list_local) and
 	 * BTF_ID_LIST_GLOBAL(test_list_global) IDs
 	 */
 	for (j = 0; j < ARRAY_SIZE(test_lists); j++) {
 		test_list = test_lists[j];
-		for (i = 0; i < ARRAY_SIZE(test_symbols); i++) {
-			ret = CHECK(test_list[i] != test_symbols[i].id,
-				    "id_check",
-				    "wrong ID for %s (%d != %d)\n",
-				    test_symbols[i].name,
-				    test_list[i], test_symbols[i].id);
-			if (ret)
-				return;
-		}
+		for (i = 0; i < ARRAY_SIZE(test_symbols); i++)
+			ASSERT_EQ(test_list[i], test_symbols[i].id, test_symbols[i].name);
 	}
 
 	/* Check BTF_SET_START(test_set) IDs */
@@ -153,15 +136,12 @@ void test_resolve_btfids(void)
 			break;
 		}
 
-		ret = CHECK(!found, "id_check",
-			    "ID %d not found in test_symbols\n",
-			    test_set.ids[i]);
-		if (ret)
-			break;
+		ASSERT_TRUE(found, "id_in_test_symbols");
 
-		if (i > 0) {
-			if (!ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check"))
-				return;
-		}
+		if (i > 0)
+			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
 	}
+
+out:
+	btf__free(btf);
 }
-- 
2.54.0


