Return-Path: <linux-kbuild+bounces-2020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6F8FF4D2
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 20:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA1F9281AAB
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 18:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4725145945;
	Thu,  6 Jun 2024 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMz8MMFc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD158821;
	Thu,  6 Jun 2024 18:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717699182; cv=none; b=W2qTYrTBYi6iZgt8tu1E41Q5v1gno5juguyLrbRGK00Q58C9lRrDA+ARztJxGVU0QftiosJ52IdUj6moUvwPVQH5NwZmwx6JUiV8AYQMGRXyKdxLDlq2XjsDd6czCs9DV/PQNLoowcQDYlFrsA+El0330gGz96JzzBuvv4xhn3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717699182; c=relaxed/simple;
	bh=1NykNkolOVcEKW3E4P67NwS3NXZhiGMcNcek2ArRyaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIWAB1/YCzZZfhVMU1GhQ6WSeCXRb0l+THqbXH+9KVR+eYAnCG+ZF0i9YqB8HKr6gs7c37T1t+RIcRrQgOfD9OYehc0UthedMrwz/ugwQU9eKQw4ka/KK6OCqJKGYEfjm3Vxd0TAUqzehu+KA579y7q4cATJVS7nHNOnL3Gc5a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMz8MMFc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A94C32786;
	Thu,  6 Jun 2024 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717699181;
	bh=1NykNkolOVcEKW3E4P67NwS3NXZhiGMcNcek2ArRyaw=;
	h=From:To:Cc:Subject:Date:From;
	b=UMz8MMFc/ChN6ra4FHUOuSOAPnsPpIOg0nX5PEQ+mbDqhNPpVWrPeiGJkJsVRj7MI
	 PHLkp+cmUKkurThu34hALXRJUa4D3YEFujiqi/637YEfUr/7cjve9/S5CTB2pGNaUE
	 +OGiHMOAm8fdjDEK1hQIQ+Q3/wnZyVax/1Bk3ws5UVdu1rx4U5ebzfzMv/VnWvXfvt
	 i9RR7ZzcnaN9E692Le9jczrQrCER3GffGfXWAHHjLVjvL2WJVifj+iMFs8sVj0FPiq
	 KpkBoIsc0YBIjvje3ZP1RwLZhxjhXuJu7fE2U5LRXWp4KKNUKPuhRWIs8ZGWiEcSqL
	 hyP0LzFUSK+8Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH] modpost: do not warn about missing MODULE_DESCRIPTION() for vmlinux.o
Date: Fri,  7 Jun 2024 03:36:12 +0900
Message-ID: <20240606183921.1128911-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with W=1 incorrectly emits the following warning:

  WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o

This check should apply only to modules.

Fixes: 1fffe7a34c89 ("script: modpost: emit a warning when the description is missing")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 937294ff164f..f48d72d22dc2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1647,10 +1647,11 @@ static void read_symbols(const char *modname)
 			namespace = get_next_modinfo(&info, "import_ns",
 						     namespace);
 		}
+
+		if (extra_warn && !get_modinfo(&info, "description"))
+			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
 	}
 
-	if (extra_warn && !get_modinfo(&info, "description"))
-		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
-- 
2.43.0


