Return-Path: <linux-kbuild+bounces-10011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85649CA97FF
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Dec 2025 23:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D67231A818B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Dec 2025 22:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A12D27462;
	Fri,  5 Dec 2025 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fDZ+ePTl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177672E8DE6
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Dec 2025 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764973911; cv=none; b=lFmsaZgQXIgjHRX9xV4yn3Jo/Rixpem0CzQO9A9Pgw1VX+mgLdDM3UDo8lq8b06mFRNbdCsbUhLOSKfZ3UpQMOOqCthoMmdIpReXA8eQ65ahqMjWsZMgCzgGq2eldv6rQfo+Qa6CwuX6k7vC/cYRuSc7jK1jFe2Zm0m1fzfbo1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764973911; c=relaxed/simple;
	bh=UiX1KHXAYHBqfEnpkaLtaeiHRckaGHIX0/LdcZAokkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNThJhCr+Mmei+pnzzJ8vTckW+NbV3UInUAFYYi0bm2DqmnoxDYaZx0tdLo4BE0liIBvG45AQI7KFO1w17mzx8jCzDSpKyVMlSOw8dv793ok2Uz4tVgN5XGhHpw2H5H6lfXF7T2PtGsFx5XzpAI2vUTbcWwp/UxU8kOLpg1f3Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fDZ+ePTl; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764973907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nm+akLsLdjhLrTZLoo5eicKi1CYuvGgFHN9rYjxvECU=;
	b=fDZ+ePTleON4PzejeNx71IO4Q+Q4z0w1/imC+MYDDc9moLAVvsL30GlcE2EIbv84TMpyDL
	X/wQ3afBsw0CwzTWEulI0T7ffEkFTsJUVjgkHZl9bNpZM40yOQbdqTzFV4H7kLGTMWSxae
	A9I0eUAstgPf6enPckQtbZ1+bV2c3qQ=
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
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Shuah Khan <shuah@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Donglin Peng <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org,
	dwarves@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v3 2/6] resolve_btfids: Factor out load_btf()
Date: Fri,  5 Dec 2025 14:30:42 -0800
Message-ID: <20251205223046.4155870-3-ihor.solodrai@linux.dev>
In-Reply-To: <20251205223046.4155870-1-ihor.solodrai@linux.dev>
References: <20251205223046.4155870-1-ihor.solodrai@linux.dev>
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


