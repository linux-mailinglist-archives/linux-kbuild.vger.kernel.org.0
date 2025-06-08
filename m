Return-Path: <linux-kbuild+bounces-7401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D6AD1382
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 19:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31D6F188B9C0
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 17:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B8D1B042C;
	Sun,  8 Jun 2025 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUd+z0bk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61F1AE877;
	Sun,  8 Jun 2025 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749402475; cv=none; b=Gax1sFH52b7e9YHh66JlrovcFHgt2RE2yzQjtwk8LZcBc1vz14TunZ9nHIxUoq4tXfsBsssIaGn+IKTpmZeAiYthIOzGaSsTcOIoZ2Cq/CQsU7LoGEAFMEignjZJbKSgKE0lawDVBF0A0zHPJSJYJPFiB0XXqvuaZ9AagHNdjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749402475; c=relaxed/simple;
	bh=XGXKFYfuGAh3UhYG9vEej00fYY9RQmMB0/rqilPtp90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtlAGy8vheK3w9f2yN1JddZ15EiDs5HyM/yG8jcFRM08CHFdTOrnIVFRsYwbDDM+RUWH/pyh0Ol8x8gCuvbbt6WCjQfKWNVyIky8zHZA916bks33AyQzHUsMb3BCybZdzDvWkh+YtX6V0VDT42YHGOcr6uLH3WovxH/jFbEIm44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUd+z0bk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377E4C4CEEE;
	Sun,  8 Jun 2025 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749402475;
	bh=XGXKFYfuGAh3UhYG9vEej00fYY9RQmMB0/rqilPtp90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUd+z0bk92OnUg6MhxFLREQDzzLgqnOYxX23f1r36fL5/Q48fJfn46dQzUV2XuF0s
	 5hpwKP5ceDlfYvxribsDDF2pWq+TgXlzFImQ64U8lgm3deiddK735kEvbQpmBL4oIC
	 v2Ze0/I3sorW0LbCLK0l9v5OVsWx+N88hCPpKeW+8/pDUGJzNLV4pkUjRIlSJzN0Th
	 x+uFkFyskjL1xmRVy54L36Y36Y0G+fiyT+EH4Gv4TkBxVqn6QMM3G5SGOjzkTH1/a7
	 EDyT408mTm3Q/P5Pk/DBRUmXDidvkLWs6BBI3KA+M7Pgiz3qoY91XCpJFQLqkBkDaJ
	 l0gY5SJp6FP5A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kheaders: double-quote variables to satisfy shellcheck
Date: Mon,  9 Jun 2025 01:59:57 +0900
Message-ID: <20250608170746.3480391-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608170746.3480391-1-masahiroy@kernel.org>
References: <20250608170746.3480391-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following:

In kernel/gen_kheaders.sh line 48:
    -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
       ^-^ SC2086 (info): Double quote to prevent globbing and word splitting.
               ^------^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/gen_kheaders.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 919bdcf989f4..c64e5a00a3d9 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -45,6 +45,6 @@ rm -f "${tmpdir}.contents.txt"
 # Create archive and try to normalize metadata for reproducibility.
 tar "${timestamp:+--mtime=$timestamp}" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
-    -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
+    -I "${XZ}" -cf "${tarfile}" -C "${tmpdir}/" . > /dev/null
 
 rm -rf "${tmpdir}"
-- 
2.43.0


