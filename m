Return-Path: <linux-kbuild+bounces-13461-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHvVBmwFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13461-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFD625DCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF1AF302BBE4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7342E35F179;
	Mon,  1 Jun 2026 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QCpcDBTy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5235FF6C
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352361; cv=none; b=SgLKOAz+bzUCUs12vZwjk4bqZ2RDdXEio70RzIdUTBIiluI/RvtS0455ENqNryU8Gl3/Bp5jROzisXQgpifgbccDBVc2h5DFYJ/Q+RY/zigXT3PyaphLHfSvXMyUVDGgJjJX1V+E82MkKIcWpfbo/nlceMbGyN7ttiPcHRKcc2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352361; c=relaxed/simple;
	bh=S/g123l9nDHobLKKcMxqV28UGPLdv8WOtNKDuslgRiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2/E3Dn7dnP1dcUZqwTkGTg79C8qPXWrHXVSsxQKH+bChcj+AHc9TJVN5V7RPMGs6fkkZmA618O9ucl1Z/Qb8DlZh8sGJG8VcootEL2wHzLPXaZHb8v2Njhy7DyE+CYNL99EMwRCXldUlAN06+n8nR59zOYCaD39byg0lFQOt0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QCpcDBTy; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHQSxWWgAYkCSvyuP1yR36VlMTZB212qWD0Q6u5Wtv0=;
	b=QCpcDBTy86J6faU59zLNYoOmyRQ+ti7IBU1Ul4pkxx50j/faf39Xcnsq6REpXeOAKqq08+
	cqa/ZnOxwMi7EhJEDDEgjeFh8VfcKIjFSgvwIzjW1Z72Zv5O9MOuKAj809IIR9bBhfRlLQ
	xDmwODkxsKEq8QBY7NwFzH0d61KG9jU=
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
Subject: [PATCH bpf-next v1 11/14] resolve_btfids: Process KF_ARENA_* flags in resolve_btfids
Date: Mon,  1 Jun 2026 15:18:02 -0700
Message-ID: <20260601221805.821394-12-ihor.solodrai@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-13461-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: C4CFD625DCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For kfuncs flagged KF_ARENA_RET, KF_ARENA_ARG1 or KF_ARENA_ARG2,
address_space(1) attribute (type tag with kflag=1) needs to be emitted
to BTF for the return type or arg type respectively.

So far this has been done by pahole [1].

Implement the emission of the arena attributes in resolve_btfids: for
flagged kfuncs create a new function prototype with updated BTF types,
adding tags as necessary.

Similar to decl tags emission, the transformation is idempotent: if
the types are already tagged with address_space(1), it's a noop.

[1] https://lore.kernel.org/dwarves/20250228194654.1022535-1-ihor.solodrai@linux.dev/

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/bpf/resolve_btfids/main.c | 131 ++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index f276200b1a68..aafbcfec755b 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -162,6 +162,9 @@ struct object {
 };
 
 #define KF_FASTCALL (1 << 12)
+#define KF_ARENA_RET (1 << 13)
+#define KF_ARENA_ARG1 (1 << 14)
+#define KF_ARENA_ARG2 (1 << 15)
 #define KF_IMPLICIT_ARGS (1 << 16)
 #define KF_IMPL_SUFFIX "_impl"
 
@@ -1294,6 +1297,128 @@ static int ensure_decl_tag(struct btf2btf_context *ctx, const char *tag_name,
 	return push_decl_tag_id(ctx, new_id);
 }
 
+static bool is_arena_type_attr(struct btf *btf, u32 id)
+{
+	const struct btf_type *t = btf__type_by_id(btf, id);
+	const char *name;
+
+	if (!t || !btf_is_type_tag(t) || !btf_kflag(t))
+		return false;
+	name = btf__name_by_offset(btf, t->name_off);
+	return name && strcmp(name, "address_space(1)") == 0;
+}
+
+static s32 ensure_arena_tagged_ptr(struct btf *btf, u32 ptr_id)
+{
+	const struct btf_type *ptr = btf__type_by_id(btf, ptr_id);
+	s32 tag_id;
+
+	if (!ptr || !btf_is_ptr(ptr))
+		return -EINVAL;
+
+	if (is_arena_type_attr(btf, ptr->type))
+		return ptr_id;
+
+	tag_id = btf__add_type_attr(btf, "address_space(1)", ptr->type);
+	if (tag_id < 0)
+		return tag_id;
+
+	return btf__add_ptr(btf, tag_id);
+}
+
+/*
+ * Build a FUNC_PROTO for @kfunc with each arena-flagged return/parameter
+ * pointer tagged with address_space(1). Pointers already tagged are kept as is.
+ *
+ * If nothing needs tagging, the original proto id is returned unchanged.
+ * Otherwise a new FUNC_PROTO is created and its id returned. The original
+ * proto may be shared with sibling FUNCs, so it must not be modified in place.
+ */
+static s32 ensure_arena_tagged_proto(struct btf *btf, struct kfunc *kfunc)
+{
+	const struct btf_type *func = btf__type_by_id(btf, kfunc->btf_id);
+	u32 proto_id = func->type;
+	const struct btf_type *proto = btf__type_by_id(btf, proto_id);
+	const struct btf_param *params = btf_params(proto);
+	u32 nr_params = btf_vlen(proto);
+	s32 arg0_type_id = nr_params > 0 ? (s32)params[0].type : -1;
+	s32 arg1_type_id = nr_params > 1 ? (s32)params[1].type : -1;
+	s32 ret_type_id = proto->type;
+	s32 new_proto_id, id;
+	bool changed = false;
+	int err;
+
+	if (kfunc->flags & KF_ARENA_RET) {
+		id = ensure_arena_tagged_ptr(btf, ret_type_id);
+		if (id < 0)
+			return id;
+		changed |= id != ret_type_id;
+		ret_type_id = id;
+	}
+
+	if (nr_params > 0 && (kfunc->flags & KF_ARENA_ARG1)) {
+		id = ensure_arena_tagged_ptr(btf, arg0_type_id);
+		if (id < 0)
+			return id;
+		changed |= id != arg0_type_id;
+		arg0_type_id = id;
+	}
+
+	if (nr_params > 1 && (kfunc->flags & KF_ARENA_ARG2)) {
+		id = ensure_arena_tagged_ptr(btf, arg1_type_id);
+		if (id < 0)
+			return id;
+		changed |= id != arg1_type_id;
+		arg1_type_id = id;
+	}
+
+	if (!changed)
+		return proto_id;
+
+	new_proto_id = btf__add_func_proto(btf, ret_type_id);
+	if (new_proto_id < 0)
+		return new_proto_id;
+
+	for (int i = 0; i < nr_params; i++) {
+		s32 param_type_id;
+		const char *name;
+
+		proto = btf__type_by_id(btf, proto_id);
+		params = btf_params(proto);
+		name = btf__name_by_offset(btf, params[i].name_off);
+
+		if (i == 0)
+			param_type_id = arg0_type_id;
+		else if (i == 1)
+			param_type_id = arg1_type_id;
+		else
+			param_type_id = params[i].type;
+
+		err = btf__add_func_param(btf, name ?: "", param_type_id);
+		if (err < 0)
+			return err;
+	}
+
+	pr_debug("resolve_btfids: added arena-tagged proto for kfunc %s: %d\n", kfunc->name, new_proto_id);
+
+	return new_proto_id;
+}
+
+static int process_kfunc_with_arena_flags(struct btf2btf_context *ctx, struct kfunc *kfunc)
+{
+	struct btf_type *t;
+	s32 proto_id;
+
+	proto_id = ensure_arena_tagged_proto(ctx->btf, kfunc);
+	if (proto_id < 0)
+		return proto_id;
+
+	t = (struct btf_type *)btf__type_by_id(ctx->btf, kfunc->btf_id);
+	t->type = proto_id;
+
+	return 0;
+}
+
 static int btf2btf(struct object *obj)
 {
 	struct btf2btf_context ctx = {};
@@ -1321,6 +1446,12 @@ static int btf2btf(struct object *obj)
 			if (err)
 				goto out;
 		}
+
+		if (kfunc->flags & (KF_ARENA_RET | KF_ARENA_ARG1 | KF_ARENA_ARG2)) {
+			err = process_kfunc_with_arena_flags(&ctx, kfunc);
+			if (err)
+				goto out;
+		}
 	}
 
 	err = 0;
-- 
2.54.0


