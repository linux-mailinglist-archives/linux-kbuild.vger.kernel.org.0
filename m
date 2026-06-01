Return-Path: <linux-kbuild+bounces-13456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEtZLpcFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13456-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:20:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF4625E25
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4525D3008A61
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0910366570;
	Mon,  1 Jun 2026 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LvvOC4c8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E442E0901
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352345; cv=none; b=fXDUoFgoc1+AZTr4MciH+59al+b4C7capCAWLTFQIi7JgXEGRO9s8u1Q+hTHfiuTV64NzadRyfPY5pwI6NsD1c0IhoNaL3qn8X1Utw5FXYKuR1byqim8hGc3Eqkm3vysqcupwDYjB2JIFlQPTI9kaNN0YT9YgF/E70ScoHhVxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352345; c=relaxed/simple;
	bh=fq4Fi0BOJK0Oz6zVU6IIXcEKdJYk+18W7XxnOpKl1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWoKLIDB44hjQyurIpU1b0eG/M4d3T3Wf3GPjzJpfNnsHL6jgjfQqhjD4CqKQiR8TntWoOfKCr9+AKatKxZTrgI2zzjEqLNYq53RWMKPcnucO8KegsWGMmmt77NE1rAMSs8LH5v/4n6DUldbL15ptaDKd4A9YxEAzJCBt8n1ldQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LvvOC4c8; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oFL2QSsKRpe1cM9JJbX1erVFMkXIc/qmCec2wIJYU2A=;
	b=LvvOC4c8W1niwXSZB2WJ7kmLL7uJYNWCRjJPRlKIciIVrEwZoSLQGiDRKqyp+TMsJy7lPq
	jXwNUbf4vEWF79Bq3fzNmajs0RdGgoKQgXsUtEktOUuqm7GLpJjJ37vUhBWl/UPfHrV/db
	1Lr1ReMwFllCUzxeZJv7FoEftGGZ6AM=
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
Subject: [PATCH bpf-next v1 06/14] resolve_btfids: Discover kfuncs from BTF ID sets
Date: Mon,  1 Jun 2026 15:17:57 -0700
Message-ID: <20260601221805.821394-7-ihor.solodrai@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-13456-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 17EF4625E25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

collect_kfuncs() currently uses bpf_kfunc decl tags to identify the
list of kfuncs. The decl tags are generated by pahole, which makes
current implementation implicitly rely on those tags being generated.

The authoritative source, used by the the BPF verifier for kfunc
registration, of functions being BPF kfuncs are
BTF_KFUNCS_START()/END() declarations. These are BTF_ID_SET8 under the
hood. Currently resolve_btfids reads kfunc flags from these sets, and
populates them with BTF IDs.

Implement kfunc discovery from BTF_ID_SET8 symbols in resolve_btfids,
removing the dependency on pahole's emmission of decl tags.

Walk BTF_ID_KIND_SET8 sets, and use the address-to-symbol index to
look up set entry's BTF_ID symbol name (before .BTF_ids is patched),
recording the paired flags directly. This makes find_kfunc_flags()
helper unnecessary, so it's removed.

Kernel functions can appear in more than one set, which is legitimate,
since kfunc sets are prog-type dependent in the kernel. So for btf2btf
processing deduplicate kfuncs by BTF ID, accumulate (OR) the flags,
and warn on flags mismatch to catch inconsistent declarations.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/bpf/resolve_btfids/main.c | 122 ++++++++++++++------------------
 1 file changed, 55 insertions(+), 67 deletions(-)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index 43512af13148..d35a7b2460e8 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -970,6 +970,23 @@ static int push_kfunc(struct btf2btf_context *ctx, struct kfunc *kfunc)
 	struct kfunc *arr = ctx->kfuncs;
 	u32 cap = ctx->max_kfuncs;
 
+	/*
+	 * A kfunc can be listed in multiple BTF ID sets.
+	 * In this case, dedup by btf_id and accumulate kfunc flags.
+	 */
+	for (u32 i = 0; i < ctx->nr_kfuncs; i++) {
+		if (ctx->kfuncs[i].btf_id != kfunc->btf_id)
+			continue;
+
+		if (ctx->kfuncs[i].flags != kfunc->flags) {
+			pr_err("WARN: resolve_btfids: inconsistent flags for kfunc %s: 0x%x != 0x%x\n",
+			       kfunc->name, ctx->kfuncs[i].flags, kfunc->flags);
+			warnings++;
+		}
+		ctx->kfuncs[i].flags |= kfunc->flags;
+		return 0;
+	}
+
 	if (ctx->nr_kfuncs + 1 > cap) {
 		cap = max(cap + 256, cap * 2);
 		arr = realloc(arr, sizeof(struct kfunc) * cap);
@@ -1003,92 +1020,63 @@ static int collect_decl_tags(struct btf2btf_context *ctx)
 	return 0;
 }
 
-/*
- * To find kfunc flags, scan BTF_SET8_KFUNCS entries and use the entry
- * address to recover the corresponding BTF_ID symbol name.
- * Return 0 (no flags!) if not found.
- */
-static u32 find_kfunc_flags(struct object *obj, struct btf_id *kfunc_id)
+static int collect_kfuncs(struct object *obj, struct btf2btf_context *ctx)
 {
-	const u32 *elf_data_ptr = obj->efile.idlist->d_buf;
-	struct btf_id *set_id;
+	Elf_Data *idlist = obj->efile.idlist;
+	struct btf *btf = ctx->btf;
 	struct rb_node *next;
-	u64 idx, set_addr;
-	u32 set_flags;
+
+	if (!idlist || !idlist->d_buf)
+		return 0;
 
 	for (next = rb_first(&obj->sets); next; next = rb_next(next)) {
+		struct btf_id_set8 *set8;
+		struct btf_id *set_id;
+		unsigned long off;
+		u64 set_addr;
+		int err;
+
 		set_id = rb_entry(next, struct btf_id, rb_node);
 		if (set_id->kind != BTF_ID_KIND_SET8 || set_id->addr_cnt != 1)
 			continue;
 
 		set_addr = set_id->addr[0];
-		idx = (set_addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
-		set_flags = elf_data_ptr[idx];
-		if (!(set_flags & BTF_SET8_KFUNCS))
+		off = set_addr - obj->efile.idlist_addr;
+		set8 = idlist->d_buf + off;
+		if (!(set8->flags & BTF_SET8_KFUNCS))
 			continue;
 
 		for (u32 i = 0; i < set_id->cnt; i++) {
 			Elf64_Addr addr = set_addr + sizeof(u64) * (i + 1);
 			const char *name = find_name_by_addr(obj, addr);
+			struct kfunc kfunc;
+			s32 func_id;
 
-			if (!name || strcmp(name, kfunc_id->name) != 0)
+			if (!name) {
+				pr_err("WARN: resolve_btfids: no kfunc symbol for set %s entry %u\n",
+				       set_id->name, i);
+				warnings++;
 				continue;
+			}
 
-			pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
-				 kfunc_id->name, set_id->name);
-
-			idx = (addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
-			return elf_data_ptr[idx];
-		}
-	}
-
-	return 0;
-}
-
-static int collect_kfuncs(struct object *obj, struct btf2btf_context *ctx)
-{
-	const char *tag_name, *func_name;
-	struct btf *btf = ctx->btf;
-	const struct btf_type *t;
-	u32 flags, func_id;
-	struct kfunc kfunc;
-	struct btf_id *id;
-	int err;
-
-	if (ctx->nr_decl_tags == 0)
-		return 0;
-
-	for (u32 i = 0; i < ctx->nr_decl_tags; i++) {
-		t = btf__type_by_id(btf, ctx->decl_tags[i]);
-		if (btf_kflag(t) || btf_decl_tag(t)->component_idx != -1)
-			continue;
-
-		tag_name = btf__name_by_offset(btf, t->name_off);
-		if (strcmp(tag_name, "bpf_kfunc") != 0)
-			continue;
-
-		func_id = t->type;
-		t = btf__type_by_id(btf, func_id);
-		if (!btf_is_func(t))
-			continue;
-
-		func_name = btf__name_by_offset(btf, t->name_off);
-		if (!func_name)
-			continue;
-
-		id = btf_id__find(&obj->funcs, func_name);
-		if (!id || id->kind != BTF_ID_KIND_SYM)
-			continue;
+			func_id = btf__find_by_name_kind(btf, name, BTF_KIND_FUNC);
+			if (func_id < 0) {
+				pr_err("WARN: resolve_btfids: no BTF FUNC for kfunc %s in set %s\n",
+				       name, set_id->name);
+				warnings++;
+				continue;
+			}
 
-		flags = find_kfunc_flags(obj, id);
+			pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n", name, set_id->name);
 
-		kfunc.name = id->name;
-		kfunc.btf_id = func_id;
-		kfunc.flags = flags;
+			kfunc.name = name;
+			kfunc.btf_id = func_id;
+			kfunc.flags = set8->pairs[i].flags;
 
-		err = push_kfunc(ctx, &kfunc);
-		if (err)
-			return err;
+			err = push_kfunc(ctx, &kfunc);
+			if (err)
+				return err;
+		}
 	}
 
 	return 0;
@@ -1108,7 +1096,7 @@ static int build_btf2btf_context(struct object *obj, struct btf2btf_context *ctx
 
 	err = collect_kfuncs(obj, ctx);
 	if (err) {
-		pr_err("ERROR: resolve_btfids: failed to collect kfuncs from BTF\n");
+		pr_err("ERROR: resolve_btfids: failed to collect kfuncs from BTF ID sets\n");
 		return err;
 	}
 
-- 
2.54.0


