Return-Path: <linux-kbuild+bounces-13464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHSzJgEGHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13464-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:21:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18482625E76
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADBD430125D3
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6707A342CB3;
	Mon,  1 Jun 2026 22:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OP/4amE7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099CB35F179
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352370; cv=none; b=EoRTjI4Bt276oaNngRp//3e7ei03gBZ9kjJ9pqCmKYyKSakZhcOObe8dBAKU/AIS+oE/EM/hQ8zWa0wy19YP/HfjUoN02eKyLnzsmFE4NJi85AmSECPbmYDMfuxGDn1wrp3Prd8JJAVT8WfnHUbYw4SKbISB53jJimGk7YtqN4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352370; c=relaxed/simple;
	bh=6xRyIMibde3/c/92n2QYgJkqFi4f1L+PtuCaJEwQuO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiDpNav4VHrJr52GsUt9+R190e4psiTYhnKuIFdUxAoVHZIUXKoLD7Kbq+Rsn4YA5L2xzwg/TQ11fWXTLatbuaNk9dKTxo8a4IOBmhmPO5exVBvMxsrMwZYL69JUeki1e+ZuJ0Z3WTZnMsWzFubVEoH5WlcaCxRBGdnfw+RUh2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OP/4amE7; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GDpRC74ytd3Jb8Bu66NX+ocLh0VdcaVylQamEOJ2yC4=;
	b=OP/4amE7Ss+VhnBF4yHlV6jdI6VzVVrSNue+GSKAqGcWlGST0FXJuEqqB4XgNtr0/tpVJT
	jtR+kwC+rrcnXFvAdbbJi+FwXBn198PVsCuurVnJFb+KC5bYBtLxpM8OhND+pM8/nw6+m4
	3/5wdgNf7/C8l11kHrrIuHZoZ1sx9+s=
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
Subject: [PATCH bpf-next v1 14/14] docs, resolve_btfids: Document kfunc BTF annotation emission
Date: Mon,  1 Jun 2026 15:18:05 -0700
Message-ID: <20260601221805.821394-15-ihor.solodrai@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13464-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 18482625E76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

resolve_btfids now emits the bpf_kfunc and bpf_fastcall BTF decl tags
and the arena address_space(1) type attribute for kfuncs, which were
previously produced by pahole.

Reflect this in the in-tree comments and documentation.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 Documentation/bpf/kfuncs.rst    |  8 ++++++++
 scripts/Makefile.btf            |  3 +++
 tools/bpf/resolve_btfids/main.c | 11 +++++++++++
 3 files changed, 22 insertions(+)

diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
index 4c814ff6061e..d98e666f03a3 100644
--- a/Documentation/bpf/kfuncs.rst
+++ b/Documentation/bpf/kfuncs.rst
@@ -437,6 +437,14 @@ type. An example is shown below::
         }
         late_initcall(init_subsystem);
 
+At kernel build time the ``resolve_btfids`` tool discovers all kfuncs from the
+registered ``BTF_SET8_KFUNCS`` sets and emits their BTF annotations into the
+kernel's BTF; these annotations were historically produced by pahole. For each
+discovered kfunc ``resolve_btfids`` emits a ``bpf_kfunc`` BTF decl tag, a
+``bpf_fastcall`` decl tag when the kfunc is flagged ``KF_FASTCALL``, and the
+``address_space(1)`` type attribute on the return value and/or arguments flagged
+``KF_ARENA_RET``, ``KF_ARENA_ARG1`` or ``KF_ARENA_ARG2`` (see section 2.8).
+
 2.7  Specifying no-cast aliases with ___init
 --------------------------------------------
 
diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
index a1812985a61a..717e76ce96a7 100644
--- a/scripts/Makefile.btf
+++ b/scripts/Makefile.btf
@@ -14,6 +14,9 @@ pahole-flags-$(call test-ge, $(pahole-ver), 125)	+= --skip_encoding_btf_inconsis
 else
 
 # Switch to using --btf_features for v1.26 and later.
+#
+# kfunc BTF annotations (bpf_kfunc/bpf_fastcall decl tags and the arena
+# address_space(1) type attribute) are emitted by resolve_btfids, not pahole.
 pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=encode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consistent_func
 
 pahole-flags-$(call test-ge, $(pahole-ver), 131) += --btf_features=layout
diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index aafbcfec755b..5a4683d11426 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -58,6 +58,17 @@
  *             __BTF_ID__func__vfs_fallocate__5:
  *             .zero 4
  *	       .word (1 << 3) | (1 << 1) | (1 << 2)
+ *
+ * In addition to resolving BTF IDs, resolve_btfids performs kernel-specific
+ * BTF-to-BTF transformations for kfuncs found in BTF_SET8_KFUNCS sets. For
+ * each such kfunc it:
+ *
+ *   - emits a "bpf_kfunc" decl tag, and "bpf_fastcall" when KF_FASTCALL is set;
+ *   - wraps the return value and/or arguments flagged KF_ARENA_RET,
+ *     KF_ARENA_ARG1 or KF_ARENA_ARG2 with the "address_space(1)" type attribute;
+ *   - rewrites the prototype of KF_IMPLICIT_ARGS kfuncs.
+ *
+ * These kfunc annotations were historically produced by pahole.
  */
 
 #define  _GNU_SOURCE
-- 
2.54.0


