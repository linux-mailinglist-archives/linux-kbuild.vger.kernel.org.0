Return-Path: <linux-kbuild+bounces-10190-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA79CCE38A
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 03:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D139D3068D7B
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 02:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C6F285C96;
	Fri, 19 Dec 2025 02:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bEqqbtZA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036DD284669
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 02:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109639; cv=none; b=l5vIkUntkFpSFuftUS9jQH1WBQSw0zWrkJCUFW2CA2tGxC5grcVxAZY+8yYHQ7xUaPsgFf6bHyHn6iNMvYCaF0F/WphNHDkOwUf2AJe5/+6NMQOHIwXZ60Wo31r584ieNyxYOK5+YG1qtE8aqOp+HhpEZge/c4ZVQhBE9a0DgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109639; c=relaxed/simple;
	bh=/9EOX2T4PsSLKlslCku6owIx615Wd85jFXGLADC8i+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxU7WAoZ+/fI71r2HxL7SnNkqul1PTdHdryQpv9Ca4AusAOxHoUt3MWrVI3K5LFOhISBubSd1UvSouY3ug1ofCW+Cz4gGbxeLyHfmqrZhH3QJ/P0wRWZhriIetfkTBG89qYOjl669hqmoWFuKDjA6CNkCXNMn9O36bR7B1om/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bEqqbtZA; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766109631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMrhGEo8g6IdHWJcU5PThGSVr6JdXvAM3OyddrEgcdU=;
	b=bEqqbtZArRLeH/CREI40YEM7Gaxl9jaOOjS2M4aDKsW7976JDF2Q3ZjwpH7gbciIJRNopb
	G0uGhUWUPt+r01Kb9bPCMSaDI+9kTLA+rI0DcDMDsye5Nrhtirgxhu43U5Peh38MxXc6RC
	1nXiz3fe2mh/rpFnjkWnrSMgOEaiFE4=
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
	Jonathan Corbet <corbet@lwn.net>,
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
	linux-kbuild@vger.kernel.org,
	sched-ext@lists.linux.dev
Subject: [PATCH bpf-next v6 1/8] resolve_btfids: Rename object btf field to btf_path
Date: Thu, 18 Dec 2025 17:59:59 -0800
Message-ID: <20251219020006.785065-2-ihor.solodrai@linux.dev>
In-Reply-To: <20251219020006.785065-1-ihor.solodrai@linux.dev>
References: <20251219020006.785065-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Rename the member of `struct object` holding the path to BTF data if
provided via --btf arg. `btf_path` is less ambiguous.

Acked-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/bpf/resolve_btfids/main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index d47191c6e55e..164f0c941f04 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -113,7 +113,7 @@ struct btf_id {
 
 struct object {
 	const char *path;
-	const char *btf;
+	const char *btf_path;
 	const char *base_btf_path;
 
 	struct {
@@ -550,11 +550,11 @@ static int symbols_resolve(struct object *obj)
 		}
 	}
 
-	btf = btf__parse_split(obj->btf ?: obj->path, base_btf);
+	btf = btf__parse_split(obj->btf_path ?: obj->path, base_btf);
 	err = libbpf_get_error(btf);
 	if (err) {
 		pr_err("FAILED: load BTF from %s: %s\n",
-			obj->btf ?: obj->path, strerror(-err));
+			obj->btf_path ?: obj->path, strerror(-err));
 		goto out;
 	}
 
@@ -790,8 +790,8 @@ int main(int argc, const char **argv)
 	struct option btfid_options[] = {
 		OPT_INCR('v', "verbose", &verbose,
 			 "be more verbose (show errors, etc)"),
-		OPT_STRING(0, "btf", &obj.btf, "BTF data",
-			   "BTF data"),
+		OPT_STRING(0, "btf", &obj.btf_path, "file",
+			   "path to a file with input BTF data"),
 		OPT_STRING('b', "btf_base", &obj.base_btf_path, "file",
 			   "path of file providing base BTF"),
 		OPT_BOOLEAN(0, "fatal_warnings", &fatal_warnings,
-- 
2.52.0


