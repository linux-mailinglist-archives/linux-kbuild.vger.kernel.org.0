Return-Path: <linux-kbuild+bounces-13457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJIsF2AFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13457-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DAD625DA9
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C47A230154A1
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE297372ED6;
	Mon,  1 Jun 2026 22:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hQ3Be0/T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43B349CC3
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352349; cv=none; b=GtcywRHZGd5vG0rrAvj2Hg3HKj0cCydCnCWPJL3NaN6LKvf4E9DS1tfU+hz1nOq7M8Xj+11l0aHXnjp28Rz+qLNqYCK4d9O28rUUoApz9Q4uoBb71r7zaYlVwBOYLOg8B0xVdGIGSESZcKIuOHjO5uHf6SVINNK+N+QjZTEbdFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352349; c=relaxed/simple;
	bh=C64AbZSx9PTRhhKL55bbeOj/X0Q9XVlqLonW+yYNU7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0p7LNwN62mAHx6LleB00XYwIP8Exr/Bu+fYhCifKmlGDgSdOFEWUBhRBZqU+y693j32NYT6s7KBU1HpxUsMn4ZiY8LhniC45zVckLFmQTLho5X8vJXMWlU/PQh6iv/TuWM+7vQzVuT1aiKXIUzvhC/t6BiT0IziQVlzZoPysBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hQ3Be0/T; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24QUti9p8crQ1fq2MIgb7AmdF0Tk09WIhO6J+YRmMLA=;
	b=hQ3Be0/TvuvuHipL1H/7T2hvgEqN8DsW8Atqs1QFj4W4Y/F9DqNywzS7bpFiwPZbedjfyG
	xs7Sh+ryuF/KkfHVoAh6EA7wQBPRZMRSAeKhkFvGIG+9+S1yRjc1NCUbeaDAaG0czjUo8Z
	UfPm90pwbdIuXNqLeVJJmpHmEA4dISo=
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
Subject: [PATCH bpf-next v1 07/14] resolve_btfids: Emit bpf_kfunc BTF decl tag for discovered kfuncs
Date: Mon,  1 Jun 2026 15:17:58 -0700
Message-ID: <20260601221805.821394-8-ihor.solodrai@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13457-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C9DAD625DA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that collect_kfuncs() discovers kfuncs from BTF_SET8_KFUNCS sets,
resolve_btfids can also be the source of truth for the bpf_kfunc decl
tag in BTF.

Today pahole emits it under --btf_features=decl_tag_kfuncs; moving the
emission in-tree lets that flag be dropped from the kernel build once
the rest of the kfunc annotations follow.

The implementation in resolve_btfids is idempotent: if a decl_tag
exists in the input BTF, no new tag will be emitted. This allows to be
more independent of pahole's version and runtime flags used to
generate the BTF.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/bpf/resolve_btfids/main.c | 49 ++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index d35a7b2460e8..30a07ec4ebb6 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -1255,6 +1255,44 @@ static int process_kfunc_with_implicit_args(struct btf2btf_context *ctx, struct
 	return 0;
 }
 
+static bool btf_has_decl_tag(struct btf2btf_context *ctx, const char *tag_name,
+			     u32 target_btf_id, int component_idx)
+{
+	const struct btf_type *t;
+	const char *name;
+
+	for (u32 i = 0; i < ctx->nr_decl_tags; i++) {
+		t = btf__type_by_id(ctx->btf, ctx->decl_tags[i]);
+		if (t->type != target_btf_id)
+			continue;
+		if (btf_decl_tag(t)->component_idx != component_idx)
+			continue;
+		name = btf__name_by_offset(ctx->btf, t->name_off);
+		if (name && strcmp(name, tag_name) == 0)
+			return true;
+	}
+	return false;
+}
+
+/* Add a decl tag if an identical one is not already present. */
+static int ensure_decl_tag(struct btf2btf_context *ctx, const char *tag_name,
+			   u32 target_btf_id, int component_idx)
+{
+	int new_id;
+
+	if (btf_has_decl_tag(ctx, tag_name, target_btf_id, component_idx))
+		return 0;
+
+	new_id = btf__add_decl_tag(ctx->btf, tag_name, target_btf_id, component_idx);
+	if (new_id < 0) {
+		pr_err("ERROR: resolve_btfids: failed to add '%s' decl tag for BTF id %u: %d\n",
+		       tag_name, target_btf_id, new_id);
+		return new_id;
+	}
+
+	return push_decl_tag_id(ctx, new_id);
+}
+
 static int btf2btf(struct object *obj)
 {
 	struct btf2btf_context ctx = {};
@@ -1267,12 +1305,15 @@ static int btf2btf(struct object *obj)
 	for (u32 i = 0; i < ctx.nr_kfuncs; i++) {
 		struct kfunc *kfunc = &ctx.kfuncs[i];
 
-		if (!(kfunc->flags & KF_IMPLICIT_ARGS))
-			continue;
-
-		err = process_kfunc_with_implicit_args(&ctx, kfunc);
+		err = ensure_decl_tag(&ctx, "bpf_kfunc", kfunc->btf_id, -1);
 		if (err)
 			goto out;
+
+		if (kfunc->flags & KF_IMPLICIT_ARGS) {
+			err = process_kfunc_with_implicit_args(&ctx, kfunc);
+			if (err)
+				goto out;
+		}
 	}
 
 	err = 0;
-- 
2.54.0


