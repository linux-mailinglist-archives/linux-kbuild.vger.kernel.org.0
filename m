Return-Path: <linux-kbuild+bounces-13803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bZwFCWgMM2p58wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13803-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:06:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC6069C771
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:06:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=k3Bw24LS;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13803-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13803-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78377301A078
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2007F31282F;
	Wed, 17 Jun 2026 21:06:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D825A655
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 21:06:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730404; cv=none; b=c4XQcfO245xokp8Q60cUROOIkVGbhGhJc+QTPlv/CR/6CyWiRLaI0CN03aPxatSDyEcOgM1qZz4RWipu+xbimqLjp32NF2zeHTpGAaaQFqyuQz0D3/WKRz25XaTpPv5N9p6g2t0UKGFsQ5mxE+vaP9++5CaXJXCSddhtbWm+teU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730404; c=relaxed/simple;
	bh=VCuQCamzURAXhkUcVHs9AceciyL50c8Q9GbkifxYTWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghbGnpBWxShcGXetvIl479Ko9oDewxTQzi7egp+299b0BxGjyTNA/gKhxVykD75rpDrCTMMw2LFvmfcBtrN9Gz+SeJRIMybkJiKF3mwoZNVrq+47Z+GgGFeWaqyC71tIIRybphpOlAIZyEnvI1KFMI9BtBNVvu2vmMFwhIi+ZXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k3Bw24LS; arc=none smtp.client-ip=95.215.58.174
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781730398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YY7HMUWtdD5YbdAHVywrKFG/UFb+GO8Waf/MpNU3iNg=;
	b=k3Bw24LS6swjKrTz2Ixmc9h/kFzFnuvS8n3NhkIjD9reWWhqQDXTfkl2DXmhBV0SWpT8HJ
	stT+A90eEr66QAlVCJF1KpPkjqOsBZny24Cixbbw55Yp2AfQos8H3Su/Ln1BoeWLl2RX/w
	5XJ0e8s5HTST1ybJLMyzPWUxj5edROc=
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
Subject: [PATCH bpf-next v1 1/4] tools/bpf: Sync btf_ids.h to tools
Date: Wed, 17 Jun 2026 14:06:16 -0700
Message-ID: <20260617210619.1562858-2-ihor.solodrai@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13803-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etsalapatis.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AC6069C771

Sync tools/include/linux/btf_ids.h with include/linux/btf_ids.h so
tools-side code can use BTF_ID_FLAGS(), BTF_SET8_START(), and
BTF_KFUNCS_START().

Keep the tools copy's existing compiler header dependency:
tools/include/linux/compiler.h already provides __maybe_unused and
tools/include/linux/compiler_attributes.h does not exist.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/include/linux/btf_ids.h | 78 ++++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 5 deletions(-)

diff --git a/tools/include/linux/btf_ids.h b/tools/include/linux/btf_ids.h
index 72ea363d434d..4fe5c5f1558c 100644
--- a/tools/include/linux/btf_ids.h
+++ b/tools/include/linux/btf_ids.h
@@ -10,6 +10,9 @@ struct btf_id_set {
 	u32 ids[];
 };
 
+/* This flag implies BTF_SET8 holds kfunc(s) */
+#define BTF_SET8_KFUNCS		(1 << 0)
+
 struct btf_id_set8 {
 	u32 cnt;
 	u32 flags;
@@ -22,6 +25,7 @@ struct btf_id_set8 {
 #ifdef CONFIG_DEBUG_INFO_BTF
 
 #include <linux/compiler.h> /* for __PASTE */
+#include <linux/stringify.h>
 
 /*
  * Following macros help to define lists of BTF IDs placed
@@ -35,7 +39,7 @@ struct btf_id_set8 {
 
 #define BTF_IDS_SECTION ".BTF_ids"
 
-#define ____BTF_ID(symbol)				\
+#define ____BTF_ID(symbol, word)			\
 asm(							\
 ".pushsection " BTF_IDS_SECTION ",\"a\";       \n"	\
 ".local " #symbol " ;                          \n"	\
@@ -43,10 +47,11 @@ asm(							\
 ".size  " #symbol ", 4;                        \n"	\
 #symbol ":                                     \n"	\
 ".zero 4                                       \n"	\
+word							\
 ".popsection;                                  \n");
 
-#define __BTF_ID(symbol) \
-	____BTF_ID(symbol)
+#define __BTF_ID(symbol, word) \
+	____BTF_ID(symbol, word)
 
 #define __ID(prefix) \
 	__PASTE(__PASTE(prefix, __COUNTER__), __LINE__)
@@ -56,7 +61,14 @@ asm(							\
  * to 4 zero bytes.
  */
 #define BTF_ID(prefix, name) \
-	__BTF_ID(__ID(__BTF_ID__##prefix##__##name##__))
+	__BTF_ID(__ID(__BTF_ID__##prefix##__##name##__), "")
+
+#define ____BTF_ID_FLAGS(prefix, name, flags) \
+	__BTF_ID(__ID(__BTF_ID__##prefix##__##name##__), ".long " #flags "\n")
+#define __BTF_ID_FLAGS(prefix, name, flags, ...) \
+	____BTF_ID_FLAGS(prefix, name, flags)
+#define BTF_ID_FLAGS(prefix, name, ...) \
+	__BTF_ID_FLAGS(prefix, name, ##__VA_ARGS__, 0)
 
 /*
  * The BTF_ID_LIST macro defines pure (unsorted) list
@@ -155,10 +167,58 @@ asm(							\
 ".popsection;                                 \n");	\
 extern struct btf_id_set name;
 
+/*
+ * The BTF_SET8_START/END macros pair defines sorted list of
+ * BTF IDs and their flags plus its members count, with the
+ * following layout:
+ *
+ * BTF_SET8_START(list)
+ * BTF_ID_FLAGS(type1, name1, flags)
+ * BTF_ID_FLAGS(type2, name2, flags)
+ * BTF_SET8_END(list)
+ *
+ * __BTF_ID__set8__list:
+ * .zero 8
+ * list:
+ * __BTF_ID__type1__name1__3:
+ * .zero 4
+ * .word (1 << 0) | (1 << 2)
+ * __BTF_ID__type2__name2__5:
+ * .zero 4
+ * .word (1 << 3) | (1 << 1) | (1 << 2)
+ *
+ */
+#define __BTF_SET8_START(name, scope, flags)		\
+__BTF_ID_LIST(name, local)				\
+asm(							\
+".pushsection " BTF_IDS_SECTION ",\"a\";       \n"	\
+"." #scope " __BTF_ID__set8__" #name ";        \n"	\
+"__BTF_ID__set8__" #name ":;                   \n"	\
+".zero 4                                       \n"	\
+".long " __stringify(flags)                   "\n"	\
+".popsection;                                  \n");
+
+#define BTF_SET8_START(name)				\
+__BTF_SET8_START(name, local, 0)
+
+#define BTF_SET8_END(name)				\
+asm(							\
+".pushsection " BTF_IDS_SECTION ",\"a\";      \n"	\
+".size __BTF_ID__set8__" #name ", .-" #name "  \n"	\
+".popsection;                                 \n");	\
+extern struct btf_id_set8 name;
+
+#define BTF_KFUNCS_START(name)				\
+__BTF_SET8_START(name, local, BTF_SET8_KFUNCS)
+
+#define BTF_KFUNCS_END(name)				\
+BTF_SET8_END(name)
+
 #else
 
-#define BTF_ID_LIST(name) static u32 __maybe_unused name[5];
+#define BTF_ID_LIST(name) static u32 __maybe_unused name[128];
 #define BTF_ID(prefix, name)
+#define BTF_ID_FLAGS(prefix, name, ...)
 #define BTF_ID_UNUSED
 #define BTF_ID_LIST_GLOBAL(name, n) u32 __maybe_unused name[n];
 #define BTF_ID_LIST_SINGLE(name, prefix, typename) static u32 __maybe_unused name[1];
@@ -166,6 +226,10 @@ extern struct btf_id_set name;
 #define BTF_SET_START(name) static struct btf_id_set __maybe_unused name = { 0 };
 #define BTF_SET_START_GLOBAL(name) static struct btf_id_set __maybe_unused name = { 0 };
 #define BTF_SET_END(name)
+#define BTF_SET8_START(name) static struct btf_id_set8 __maybe_unused name = { 0 };
+#define BTF_SET8_END(name)
+#define BTF_KFUNCS_START(name) static struct btf_id_set8 __maybe_unused name = { .flags = BTF_SET8_KFUNCS };
+#define BTF_KFUNCS_END(name)
 
 #endif /* CONFIG_DEBUG_INFO_BTF */
 
@@ -215,5 +279,9 @@ MAX_BTF_TRACING_TYPE,
 };
 
 extern u32 btf_tracing_ids[];
+extern u32 bpf_cgroup_btf_id[];
+extern u32 bpf_local_storage_map_btf_id[];
+extern u32 btf_bpf_map_id[];
+extern u32 bpf_kmem_cache_btf_id[];
 
 #endif
-- 
2.54.0


