Return-Path: <linux-kbuild+bounces-7077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B2AB26D7
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 08:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35DC41783D7
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 06:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97B919F421;
	Sun, 11 May 2025 06:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="kuk8uc2a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018193C6BA;
	Sun, 11 May 2025 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746943369; cv=none; b=HrDHqPmOx9Mk8MKrs5wp17OX+Md0+5RvcNajftiG+wW0vdIT14c3ZfEGtacANv3T4b9xgcxTzINt39gSVFNhVEQjj94mCrkzMm+WhBsWEQxsNWfZw2FOEezFH+YjhLowuB86tE+0HnvgAeKErGRwNWr0wb7sJ4AHboUiQC9rKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746943369; c=relaxed/simple;
	bh=MlbVqfUS1V/DgVbp/3vxmDMvCve29oEvoJ01SbaXDGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWSO8MG5pi0e9xCDnTDdSXDBufZtHqUAToA/AGSeGAheNPn70MNeKo2Pvql0fovBIewCGmHTBgJEnHWUQyWZg7xJh5W3devV4En+YhGm8DAtO6QbpczDBaQmSN1FoYKgKjFSbEk95Z0dJ9Rk7Aj2praHHFS2cq+lUusFcLCRhPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=kuk8uc2a; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746943360;
	bh=MlbVqfUS1V/DgVbp/3vxmDMvCve29oEvoJ01SbaXDGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kuk8uc2aihRCipAYZMqFQPw0m5pHj+HlL/AaKWG78nKSWJ9l0UI8fjUbfTS+xgR35
	 FUOD49MLYCppml78dVKA/rm3tFQEvFr0k3deajsO0efdWG9mPAInoyEJuD8miUG9le
	 o7HyjHBb4cb/oo3Y/QXmmtK+aRzxo0OtulvUQnsA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 11 May 2025 08:02:27 +0200
Subject: [PATCH 1/2] Revert "kbuild: make all file references relative to
 source root"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250511-kbuild-revert-file-prefix-map-v1-1-9ba640c8411e@weissschuh.net>
References: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
In-Reply-To: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Matthieu Baerts <matttbe@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746943359; l=3152;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=MlbVqfUS1V/DgVbp/3vxmDMvCve29oEvoJ01SbaXDGE=;
 b=ItBpoWkK4typeysucQIK/bxX9N+G0KR+f0JRfnaPBe3JkpYnFTm5uvURXyW1y76iGtqUCqciE
 ZSLG45vzT8sDJ7XnXVnI0wQJXpcfjMkIpT4bMKbFI/N6tg0WPd0VwGD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This reverts commit cacd22ce69585a91c386243cd662ada962431e63.

-ffile-prefix-map breaks the ability of debuggers to find the source
file corresponding to object files. As there is no simple or uniform
way to specify the source directory explicitly, this breaks developers
workflows.

Revert the unconditional usage of -ffile-prefix-map.

Reported-by: Matthieu Baerts <matttbe@kernel.org>
Closes: https://lore.kernel.org/lkml/edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.org/
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Closes: https://lore.kernel.org/lkml/aBEttQH4kimHFScx@intel.com/
Fixes: cacd22ce6958 ("kbuild: make all file references relative to source root")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/kbuild/reproducible-builds.rst | 17 +++++++++++++++++
 Makefile                                     |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index a7762486c93fcd3eba08b836bed622a41e829e41..f2dcc39044e66ddd165646e0b51ccb0209aca7dd 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -46,6 +46,21 @@ The kernel embeds the building user and host names in
 `KBUILD_BUILD_USER and KBUILD_BUILD_HOST`_ variables.  If you are
 building from a git commit, you could use its committer address.
 
+Absolute filenames
+------------------
+
+When the kernel is built out-of-tree, debug information may include
+absolute filenames for the source files.  This must be overridden by
+including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
+
+Depending on the compiler used, the ``__FILE__`` macro may also expand
+to an absolute filename in an out-of-tree build.  Kbuild automatically
+uses the ``-fmacro-prefix-map`` option to prevent this, if it is
+supported.
+
+The Reproducible Builds web site has more information about these
+`prefix-map options`_.
+
 Generated files in source packages
 ----------------------------------
 
@@ -116,5 +131,7 @@ See ``scripts/setlocalversion`` for details.
 
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
+.. _KCFLAGS: kbuild.html#kcflags
+.. _prefix-map options: https://reproducible-builds.org/docs/build-path/
 .. _Reproducible Builds project: https://reproducible-builds.org/
 .. _SOURCE_DATE_EPOCH: https://reproducible-builds.org/docs/source-date-epoch/
diff --git a/Makefile b/Makefile
index b29cc321ffd9c6a5a201d110bd8a88092c380f65..f3f7dbf8ca284fbbab6bf2459982447471234f5f 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,7 +1068,7 @@ KBUILD_CFLAGS += -fno-builtin-wcslen
 
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
-KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
+KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
 KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
 endif
 

-- 
2.49.0


