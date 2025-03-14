Return-Path: <linux-kbuild+bounces-6133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC7A60DF7
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 10:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3441416C1C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 09:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205F01F1523;
	Fri, 14 Mar 2025 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZApk60Ws"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C171EF0A5;
	Fri, 14 Mar 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946031; cv=none; b=gJqS45P/jzAyTS+JYL4/cYZfSVjn14cW9MUP31G3C+kzBPIkVendTP0HIJRC8qUY33SVlBsiX8vIbKIy6LaPSvAAziSBvZDeEle15Fn3yjriwGgZOguhsNH5IWChtfMF1xqLI4h5+527cjGVWGnsB7QqwcYAgC9yPt6tt1uA58E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946031; c=relaxed/simple;
	bh=NDKWPSLGvJ3Ug3WTN3vPKlY5C5wF9a4+rp8Xn+Biyiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOP3zZB1WcfeXb68/KMNkx/RtbUk7Hox3oLjsodc/H+YcpH7jpRzMMGfXdFko0CiMJSQK6zzLmEwk5ktO36pLuQvQxNunPbr2xMfRzJXAKb2EIsnJn3h28z7wVgBzYLVt7v0XkXLPyZnRY6iNMKFgq50/gOHarxhqa/vboNBJXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZApk60Ws; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5BEC4CEE3;
	Fri, 14 Mar 2025 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741946031;
	bh=NDKWPSLGvJ3Ug3WTN3vPKlY5C5wF9a4+rp8Xn+Biyiw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZApk60WsYXJyzXQzBWpQhsm5pwn6Lc+fuLyQAB2khhL41/ql7tpCzuR2WH5yJrh8W
	 9vB05pupO8wQ4OlN56OmohGT+1wSUVB6D28uUlu4Le9IahGh7CS0ultKH3RHY3yAUY
	 iACxW/eaLoX8hSrcgIeD1ABdEZGJ+ImHrVA/CsQX+rPhZMoyxvT/vz2N1rWwEaokfu
	 MkJr8kBwknV5Uylq27Q4lpkEEsd+s97Ay072uEl989Ytw3fdAamQ8N19mZDYlho8HK
	 nILt6cxoObR1kXi7b2J+B8Gt32mwbIDZg7yb81M1IIe9bzQmdqCsU9MH6tRt/h2DzF
	 Bkf6phJkwrplA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Matt Fleming <matt@readmodwrite.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] deb-pkg: add comment about future removal of KDEB_COMPRESS
Date: Fri, 14 Mar 2025 18:53:35 +0900
Message-ID: <20250314095337.2209653-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'man dpkg-deb' describes as follows:

    DPKG_DEB_COMPRESSOR_TYPE
        Sets the compressor type to use (since dpkg 1.21.10).

        The -Z option overrides this value.

When commit 1a7f0a34ea7d ("builddeb: allow selection of .deb compressor")
was applied, dpkg-deb did not support this environment variable.

Later, dpkg commit c10aeffc6d71 ("dpkg-deb: Add support for
DPKG_DEB_COMPRESSOR_TYPE/LEVEL") introduced support for
DPKG_DEB_COMPRESSOR_TYPE, which provides the same functionality as
KDEB_COMPRESS.

KDEB_COMPRESS is still useful for users of older dpkg versions, but I
would like to remove this redundant functionality in the future.

This commit adds comments to notify users of the planned removal and to
encourage migration to DPKG_DEB_COMPRESSOR_TYPE where possible.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 lib/Kconfig.debug            | 6 +++---
 scripts/package/debian/rules | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 17ccd913975d..be9f5af4c05c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -335,12 +335,12 @@ config DEBUG_INFO_COMPRESSED_ZLIB
 	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
 	  5.0+, binutils 2.26+, and zlib.
 
-	  Users of dpkg-deb via scripts/package/builddeb may find an increase in
+	  Users of dpkg-deb via debian/rules may find an increase in
 	  size of their debug .deb packages with this config set, due to the
 	  debug info being compressed with zlib, then the object files being
 	  recompressed with a different compression scheme. But this is still
-	  preferable to setting $KDEB_COMPRESS to "none" which would be even
-	  larger.
+	  preferable to setting KDEB_COMPRESS or DPKG_DEB_COMPRESSOR_TYPE to
+	  "none" which would be even larger.
 
 config DEBUG_INFO_COMPRESSED_ZSTD
 	bool "Compress debugging information with zstd"
diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
index ca07243bd5cd..33bfd00974b3 100755
--- a/scripts/package/debian/rules
+++ b/scripts/package/debian/rules
@@ -41,6 +41,10 @@ package = $($(@:binary-%=%-package))
 # which package is being processed in the build log.
 DH_OPTIONS = -p$(package)
 
+# Note: future removal of KDEB_COMPRESS
+# dpkg-deb >= 1.21.10 supports the DPKG_DEB_COMPRESSOR_TYPE environment
+# variable, which provides the same functionality as KDEB_COMPRESS. The
+# KDEB_COMPRESS variable will be removed in the future.
 define binary
 	$(Q)dh_testdir $(DH_OPTIONS)
 	$(Q)dh_testroot $(DH_OPTIONS)
-- 
2.43.0


