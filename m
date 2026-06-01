Return-Path: <linux-kbuild+bounces-13454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BxYAnkFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13454-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0D625DF1
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35F83018D4A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06EE36AB5E;
	Mon,  1 Jun 2026 22:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="chnKYP+f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40442367B96
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352340; cv=none; b=MHx4TkxKODS63yUX2yhF4Vi1xTbGjLDGiI0p6qnhdRZ0x1lyAQboU10LITk1ABxkTsKpkOjYHS+UtDUDgvjsQ4zRf+FRktruEj24bMtgGPoIFcQlGOJcPzLkpT1ZhdXaE7kYxjD69EL+2GjB2Xzn3mLBbh597BR3Gxh5aPDggnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352340; c=relaxed/simple;
	bh=rn7XZkpOq9zhjq7GXEEWfmk3CO7iWL6VVEcO3FKmsh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IO/rs0wAxTSGGUr/ciKExv2Qx6dlEgaPiCnwsSMSjqPcnj5cqJGcGCzdaVCYMYCQDOb/DfAR8R72ArFCov6N7squvW1mWvXvL7g6tfUzeojQ9gzCUixJid2C+B8PRUfq6ihgYCHnlgul2ro1Kb7HZO+Hg4YJRVGKvFnan9bX334=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=chnKYP+f; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiTW/YU3nhI69fMhQ49e7dL522wCpyMaMskBOSirp64=;
	b=chnKYP+fx2m7hlI7R8Ho4DnWJNLAeV9bhKP8KXl5R5vRFwY/YC6AcTF3p/uN65cBwtX0/+
	A/EmX6GTNJI7jnj7NVzau2KXXfcNmNGX7pzr8nBIE2BPJAQjmY251OSqP+BX5oxtFAm0Of
	mHpXPFsC9IWozeuht0cTQMFyKG5oM5g=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1 04/14] selftests/bpf: Add kfunc set test to resolve_btfids
Date: Mon,  1 Jun 2026 15:17:55 -0700
Message-ID: <20260601221805.821394-5-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-1-ihor.solodrai@linux.dev>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13454-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 8AD0D625DF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the resolve_btfids selftest to cover kfunc sets defined with
BTF_KFUNCS_START/BTF_KFUNCS_END.

The test verifies that resolve_btfids correctly processes BTF_ID_FLAGS,
resolves function IDs, and checks the kfunc set is sorted.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 .../selftests/bpf/prog_tests/resolve_btfids.c | 56 +++++++++++++++++++
 tools/testing/selftests/bpf/progs/btf_data.c  | 10 ++++
 2 files changed, 66 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
index d0e51979d455..f6fd79b9dd23 100644
--- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
+++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
@@ -10,6 +10,10 @@
 #include <linux/btf_ids.h>
 #include "test_progs.h"
 
+#ifndef KF_FASTCALL
+#define KF_FASTCALL (1 << 12)
+#endif
+
 struct symbol {
 	const char	*name;
 	int		 type;
@@ -26,6 +30,17 @@ struct symbol test_symbols[] = {
 	{ "func",    BTF_KIND_FUNC,    -1 },
 };
 
+struct kfunc_symbol {
+	const char	*name;
+	s32		 id;
+	u32		 flags;
+};
+
+static struct kfunc_symbol kfunc_symbols[] = {
+	{ "kfunc_a", -1, 0 },
+	{ "kfunc_b", -1, KF_FASTCALL },
+};
+
 /* Align the .BTF_ids section to 4 bytes */
 asm (
 ".pushsection " BTF_IDS_SECTION " ,\"a\"; \n"
@@ -77,7 +92,13 @@ BTF_ID(union,   U)
 BTF_ID(func,    func)
 BTF_SET_END(test_set)
 
+BTF_KFUNCS_START(test_kfunc_set)
+BTF_ID_FLAGS(func, kfunc_a)
+BTF_ID_FLAGS(func, kfunc_b, KF_FASTCALL)
+BTF_KFUNCS_END(test_kfunc_set)
+
 #pragma GCC visibility pop
+
 static int
 __resolve_symbol(struct btf *btf, int type_id)
 {
@@ -108,6 +129,18 @@ __resolve_symbol(struct btf *btf, int type_id)
 			test_symbols[i].id = type_id;
 	}
 
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC) {
+		str = btf__name_by_offset(btf, type->name_off);
+		if (str) {
+			for (i = 0; i < ARRAY_SIZE(kfunc_symbols); i++) {
+				if (kfunc_symbols[i].id >= 0)
+					continue;
+				if (!strcmp(str, kfunc_symbols[i].name))
+					kfunc_symbols[i].id = type_id;
+			}
+		}
+	}
+
 	return 0;
 }
 
@@ -162,6 +195,29 @@ void test_resolve_btfids(void)
 			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
 	}
 
+	/* Check BTF_KFUNCS_START(test_kfunc_set) */
+	ASSERT_EQ(test_kfunc_set.flags, BTF_SET8_KFUNCS, "kfunc_set_flags");
+	ASSERT_EQ(test_kfunc_set.cnt, ARRAY_SIZE(kfunc_symbols), "kfunc_set_cnt");
+
+	for (i = 0; i < test_kfunc_set.cnt; i++) {
+		bool found = false;
+
+		for (j = 0; j < ARRAY_SIZE(kfunc_symbols); j++) {
+			if (kfunc_symbols[j].id != (s32)test_kfunc_set.pairs[i].id)
+				continue;
+			found = true;
+			ASSERT_EQ(test_kfunc_set.pairs[i].flags,
+				  kfunc_symbols[j].flags, "kfunc_flags_check");
+			break;
+		}
+
+		ASSERT_TRUE(found, "kfunc_id_found");
+
+		if (i > 0)
+			ASSERT_LE(test_kfunc_set.pairs[i - 1].id,
+				  test_kfunc_set.pairs[i].id, "kfunc_sort_check");
+	}
+
 out:
 	btf__free(btf);
 }
diff --git a/tools/testing/selftests/bpf/progs/btf_data.c b/tools/testing/selftests/bpf/progs/btf_data.c
index baa525275bde..8587658012c3 100644
--- a/tools/testing/selftests/bpf/progs/btf_data.c
+++ b/tools/testing/selftests/bpf/progs/btf_data.c
@@ -48,3 +48,13 @@ int func(struct root_struct *root)
 {
 	return 0;
 }
+
+int kfunc_a(struct root_struct *root)
+{
+	return 0;
+}
+
+int kfunc_b(struct root_struct *root)
+{
+	return 0;
+}
-- 
2.54.0


