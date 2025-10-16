Return-Path: <linux-kbuild+bounces-9195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DBBE2526
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 11:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7765F1892C30
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 09:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B41128BA81;
	Thu, 16 Oct 2025 09:14:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130003254AD
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Oct 2025 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606090; cv=none; b=bmmN8XVbhxNtakD4vFj5NoFSLaJMCSNWjxwesyO75SZ8D5YyxiiNYsJY3n6kDdkakIj4xs3TuAGkv3P0hB8oUMlSM3dMFlqypg4/u4j5UVdRrdXREZfFSNSyelPiX7ecTd/InHWLW4pHyjQcF570SV/I7G63nqwCvxgP1+I4jpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606090; c=relaxed/simple;
	bh=MSstcFxAABvYvA3yFoEcAnjUZ2zNyiuLwOB+Tu5N4aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajXXRQruMCQ84ueaqT6zK9lTC4Tgk3MFn3vCVldlttLOk+gKIesv1P9UUSde//Bw4Bw8JQ9P7o3BeBBQi6MvkKpGf+ZH3fh/qsw6qP8X9GyPnkT4ek//ZixQ6WF6hkGv+xLqHGAKls3yiI5CPrKp4ZUbCN6ld9EY30zdCSoBlx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ignea (unknown [194.69.103.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: chewi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 469C2340FB1;
	Thu, 16 Oct 2025 09:14:46 +0000 (UTC)
From: James Le Cuirot <chewi@gentoo.org>
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH] kbuild: install-extmod-build: Fix when given dir outside the build dir
Date: Thu, 16 Oct 2025 10:14:17 +0100
Message-ID: <20251016091417.9985-1-chewi@gentoo.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b5e395653546 ("kbuild: install-extmod-build: Fix build when
specifying KBUILD_OUTPUT") tried to address the "build" variable
expecting a relative path by using `realpath --relative-base=.`, but
this only works when the given directory is below the current directory.
`realpath --relative-to=.` will return a relative path in all cases.

Fixes: b5e395653546 ("kbuild: install-extmod-build: Fix build when specifying KBUILD_OUTPUT")
Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index b96538787f3d..054fdf45cc37 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
 	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-base=. "${destdir}")"/scripts
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
 
 	rm -f "${destdir}/scripts/Kbuild"
 fi
-- 
2.51.0


