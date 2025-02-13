Return-Path: <linux-kbuild+bounces-5734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6BA33761
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 06:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF8F0188834D
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 05:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD022066EF;
	Thu, 13 Feb 2025 05:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6rcKJOj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E1F2063E9;
	Thu, 13 Feb 2025 05:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739425221; cv=none; b=bauZbOmzTMciVBWKvzDADttKDaTKz7VFhZ9ppXqyiGtOwLpQoRI0yiU5qLuOBPxUkl9OnCUvuV1sap9azzTqBFLFkcQ8/WKIwwjplZmAvjh0gwmZx1sA8HhKYxVfFVSt2ioTMXjAXuPIkjoOM5k683W+BcJx/kytpxwlGku1JlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739425221; c=relaxed/simple;
	bh=B16XwbIRmI4CFuGdRxdrxzRK7K3mc8bjZBB0xuTkTC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQqixH5mfchv8V/Hao2lNGtPxIPlMMkx7KgyG7aEdBERwBdFyOKOwkjFbZQVovkVMPADS+7hpXddcR4kshvvaKw6GEI5+Cvzwt/IySbaX5deV7mlx5Z6rHvVqKktFUh3alJ12gxlxrKXoz73WxVRUqAXOg2myzHUXBzkadWRro4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6rcKJOj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90915C4CED1;
	Thu, 13 Feb 2025 05:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739425220;
	bh=B16XwbIRmI4CFuGdRxdrxzRK7K3mc8bjZBB0xuTkTC4=;
	h=From:To:Cc:Subject:Date:From;
	b=J6rcKJOjpVsD8GJFOMkKWBXuooy2A7SEgcNnr36cksl82tIFZwjtk5qHXdqr63SHw
	 VzCQVUORSzpGRdsjF+zC+YLu28NFcT0rgy1ukY23GAtAfSBVqZZ8ikEts42KSSmCSZ
	 WH1xMpwbhKBIKIgeOf74qR0Bj3dy62bF+1gPXyN9pu5JqYuQNPql2W8jjAV6eW+JdW
	 AICS96u0Q6uDsUXbGcfy0M/d4fWqAK1tCtDmdJYRMyGCk2FtP7LXXyHXJ2cl4YjGip
	 n0C3A2GzK1cBnLD92xxzQ9KEWWzJ09wskOt0fxHdpaaMntZQ/BzNiKKx+QcWzzAwwM
	 gfTp875UO+Ubg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: fix linux-headers package build when $(CC) cannot link userspace
Date: Thu, 13 Feb 2025 14:40:11 +0900
Message-ID: <20250213054014.320248-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 5f73e7d0386d ("kbuild: refactor cross-compiling
linux-headers package"), the linux-headers Debian package fails to
build when $(CC) cannot build userspace applications, for example,
when using toolchains installed by the 0day bot.

The host programs in the linux-headers package should be rebuilt using
the disto's cross-compiler, ${DEB_HOST_GNU_TYPE}-gcc instead of $(CC).
Hence, the variable 'CC' must be expanded in this shell script instead
of in the top-level Makefile.

Commit f354fc88a72a ("kbuild: install-extmod-build: add missing
quotation marks for CC variable") was an incorrect fix because
CC="ccache gcc" is unrelated when rebuilding userspace tools.

Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers package")
Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-kbuild/CAK7LNARb3xO3ptBWOMpwKcyf3=zkfhMey5H2KnB1dOmUwM79dA@mail.gmail.com/T/#t
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index b724626ea0ca..104614ac215c 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
 	# shellcheck disable=SC2016 # $(MAKE), $(CC), and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC="$(CC)" VPATH= srcroot=. $(build)='"${destdir}"/scripts
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"${destdir}"/scripts
 
 	rm -f "${destdir}/scripts/Kbuild"
 fi
-- 
2.43.0


