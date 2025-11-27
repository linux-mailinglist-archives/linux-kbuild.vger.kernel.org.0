Return-Path: <linux-kbuild+bounces-9896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D6C8FF28
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 19:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D850F3ACCCD
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 18:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345C93019D0;
	Thu, 27 Nov 2025 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xBMutdIn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC765301468
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764269611; cv=none; b=sjCJBd1S2YhjCnmwp8J/Vn8r/ox5VAqlIeJv5I1ItwTkJSW9DzRnTM/V2B+84oDwqFfSJJygYmDl4uRRtXYUTsIyFoAQEJqN3A2A2wYTKhbMsWrT1aQJ2AeCgPjenNxpuNVJjjNdNrd4f3OFwDjYUIdg8LzeEC1MV6zgNesru0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764269611; c=relaxed/simple;
	bh=UiX1KHXAYHBqfEnpkaLtaeiHRckaGHIX0/LdcZAokkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkJYxP52O5fxkhfQfgYmhgr/6gYrXgPIAxbkVgcw1H20ZvaYGzuTiNGnmKfcDoOliyhfiORvlHl/RgxD9ZE7v5B8++KYNofR/S/X0GgrXzOUM+NcV/uOTRjzIVmPfPpCGeS+Lt6XCFCMhNwRhVpdD9k0NQvumTiY6mwX5FXqTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xBMutdIn; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764269606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nm+akLsLdjhLrTZLoo5eicKi1CYuvGgFHN9rYjxvECU=;
	b=xBMutdInCkFzD5kQQlokMRHPsBlZyrRxe+vUe69kzKjUqFQS6bF2zywpYkn5u72j+7DgUb
	+WarAEtZtG2E/T1wrm57+ibpjwfvcovb7Lm5XIuLNt03OpbUQet8havF6WlUmi9Wq0iSr1
	/K4yHOQkqbH0HEOuS8cfYpnwmL2ED38=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Donglin Peng <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org,
	dwarves@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v2 2/4] resolve_btfids: factor out load_btf()
Date: Thu, 27 Nov 2025 10:52:40 -0800
Message-ID: <20251127185242.3954132-3-ihor.solodrai@linux.dev>
In-Reply-To: <20251127185242.3954132-1-ihor.solodrai@linux.dev>
References: <20251127185242.3954132-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Increase the lifetime of parsed BTF in resolve_btfids by factoring
load_btf() routine out of symbols_resolve() and storing the base_btf
and btf pointers in the struct object.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/bpf/resolve_btfids/main.c | 47 ++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index 164f0c941f04..b4caae1170dd 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -116,6 +116,9 @@ struct object {
 	const char *btf_path;
 	const char *base_btf_path;
 
+	struct btf *btf;
+	struct btf *base_btf;
+
 	struct {
 		int		 fd;
 		Elf		*elf;
@@ -529,16 +532,10 @@ static int symbols_collect(struct object *obj)
 	return 0;
 }
 
-static int symbols_resolve(struct object *obj)
+static int load_btf(struct object *obj)
 {
-	int nr_typedefs = obj->nr_typedefs;
-	int nr_structs  = obj->nr_structs;
-	int nr_unions   = obj->nr_unions;
-	int nr_funcs    = obj->nr_funcs;
-	struct btf *base_btf = NULL;
-	int err, type_id;
-	struct btf *btf;
-	__u32 nr_types;
+	struct btf *base_btf = NULL, *btf = NULL;
+	int err;
 
 	if (obj->base_btf_path) {
 		base_btf = btf__parse(obj->base_btf_path, NULL);
@@ -546,7 +543,7 @@ static int symbols_resolve(struct object *obj)
 		if (err) {
 			pr_err("FAILED: load base BTF from %s: %s\n",
 			       obj->base_btf_path, strerror(-err));
-			return -1;
+			goto out_err;
 		}
 	}
 
@@ -555,9 +552,30 @@ static int symbols_resolve(struct object *obj)
 	if (err) {
 		pr_err("FAILED: load BTF from %s: %s\n",
 			obj->btf_path ?: obj->path, strerror(-err));
-		goto out;
+		goto out_err;
 	}
 
+	obj->base_btf = base_btf;
+	obj->btf = btf;
+
+	return 0;
+
+out_err:
+	btf__free(base_btf);
+	btf__free(btf);
+	return err;
+}
+
+static int symbols_resolve(struct object *obj)
+{
+	int nr_typedefs = obj->nr_typedefs;
+	int nr_structs  = obj->nr_structs;
+	int nr_unions   = obj->nr_unions;
+	int nr_funcs    = obj->nr_funcs;
+	struct btf *btf = obj->btf;
+	int err, type_id;
+	__u32 nr_types;
+
 	err = -1;
 	nr_types = btf__type_cnt(btf);
 
@@ -615,8 +633,6 @@ static int symbols_resolve(struct object *obj)
 
 	err = 0;
 out:
-	btf__free(base_btf);
-	btf__free(btf);
 	return err;
 }
 
@@ -824,6 +840,9 @@ int main(int argc, const char **argv)
 	if (symbols_collect(&obj))
 		goto out;
 
+	if (load_btf(&obj))
+		goto out;
+
 	if (symbols_resolve(&obj))
 		goto out;
 
@@ -833,6 +852,8 @@ int main(int argc, const char **argv)
 	if (!(fatal_warnings && warnings))
 		err = 0;
 out:
+	btf__free(obj.base_btf);
+	btf__free(obj.btf);
 	if (obj.efile.elf) {
 		elf_end(obj.efile.elf);
 		close(obj.efile.fd);
-- 
2.52.0


