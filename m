Return-Path: <linux-kbuild+bounces-10010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF96CA97F9
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Dec 2025 23:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07EBB314ECD0
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Dec 2025 22:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7805C2E764C;
	Fri,  5 Dec 2025 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nw6Jnbe3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A799F2D8796
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Dec 2025 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764973905; cv=none; b=K4e9V21IfsI/848ZyjS2tGcz5vOvrcGsk3F+ipfVH/eozPjmGqt6Rn4jZnMR2wwZ2SSjPSxf+2biImsls0sHwdGjcMc5vlnBu2DPaUguhnnMSxIi/uqCKrRDoRvRmAyI8MxJStRJuLWYoM9Rd6UcVZ6d8a6zQ9pOnesj8cIVsz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764973905; c=relaxed/simple;
	bh=OGljzmU0DkQ+x9fsECZTDJgZ2OLFsyJKQITIodlLZY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LG2yau4sW/Di7Wmsr/xlh6GiiQwSkULCNjxeO/z+FlMN7TRJUAGC9U6pe2HjoKFJPOV0nqCInaHhhNf5hEiHhsa5hG0inUJdmbxIANmL7RybHP9tZXMc7G0wkJKQ/S7N2h7E8ewmGRZNOriKJoHYEbEcOG1iMHm1IVzPBw2LTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nw6Jnbe3; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764973900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkubKcSTNE4kKDdz7gUmlKO6JRAaq9Yff0unvyM5a5E=;
	b=nw6Jnbe3DO/H3Tiqm9LcEFhzMZY3dQctd+Lar9FgMfZV6rvFYCoctQRAXwMHIcLu+UNDfd
	a02s02EE3q0EjZbAeaNIgDcIyjSC/8Xfg1FlDD/3jtnma7Ux3VFWJjMEqVcL6cHhXu3yD1
	IhmO99CH+KzHXMdPGInddz5FYTR65P0=
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
Subject: [PATCH bpf-next v3 1/6] resolve_btfids: Rename object btf field to btf_path
Date: Fri,  5 Dec 2025 14:30:41 -0800
Message-ID: <20251205223046.4155870-2-ihor.solodrai@linux.dev>
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

Rename the member of `struct object` holding the path to BTF data if
provided via --btf arg. `btf_path` is less ambiguous.

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


