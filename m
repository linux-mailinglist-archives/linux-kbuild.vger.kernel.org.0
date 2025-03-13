Return-Path: <linux-kbuild+bounces-6126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7747BA5FA91
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 16:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7A516E43A
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 15:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3A6269810;
	Thu, 13 Mar 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="svQ0+72L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497012690C8;
	Thu, 13 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881567; cv=none; b=qbSls9rcrAO3JHUHtrte/y+t6/g/OYIrF+UXY3z7vpsRrp5T5V+BIOsnct11oS/Dw9Of0h5mPmR5y0/8MtdUQT6HT+XMLCjlaJjse0hX5ELO1zviQTueABBrmTu1U8OTFub6dypLfjm+UdwYVzNjJ30lrp/wX4NJdclEIrZKUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881567; c=relaxed/simple;
	bh=hcDIWJu90D0wxDo/8UZRdUjnWMXcTHK9RvNlL3UfpcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbaBDcDauUJtmWyOvLbUoW20k2UsOnZFcqLoFwNMe0F03r3BuDUUtxyLHrZjsdflDLJoxEF9CyWI8UKjMj9M01tYQ75WBiEkH1Rp+5i9/5OMgvb1p4djBD/8PDprEi7hSaIr36p7VS47wnflmG1vT/4+e/Sz3J6gIv4TLP6qA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=svQ0+72L; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741881564;
	bh=hcDIWJu90D0wxDo/8UZRdUjnWMXcTHK9RvNlL3UfpcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=svQ0+72LsD7nqoY33Gm2rOOcsAqDQ+8buJHfB+aEVF3IlHdBT1AhUSfqE6lUCiTSz
	 5o6mSQiCdeoyeJFsLizeunyuMO6klEggctCNGfF0Tk9eHPuxpBP2T7X4tbwp76lf+r
	 7o6ZuM4f8KXXKcnm9WjpiDegpbEPV98ql5Uq1u7M=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Mar 2025 16:59:10 +0100
Subject: [PATCH 2/4] kbuild: doc: reproducible-builds: drop section
 "Absolute filenames"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-kbuild-prefix-map-v1-2-38cea8448c5f@weissschuh.net>
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
In-Reply-To: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741881563; l=2032;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hcDIWJu90D0wxDo/8UZRdUjnWMXcTHK9RvNlL3UfpcQ=;
 b=oGBjvGj5brRztPelNDPQprGY3qhRZoSVO4st+/vJuNf1RzUAgwbZQQHifHGAJOhQAbnCqCVZb
 CQCNOtnXp9xDItpj8cFDRjMlCJLWblkNdMYWzAqKLJXfQZYZlZn5Jul
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The top-level Makefile now uses the generic -ffile-prefix-map which also
affects debug information, making the manual override superfluous.

Drop the now unnecessary section.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/kbuild/reproducible-builds.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index f2dcc39044e66ddd165646e0b51ccb0209aca7dd..c815f486926253ffe5daa5e9a9ab3dbcb142c6fc 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -46,21 +46,6 @@ The kernel embeds the building user and host names in
 `KBUILD_BUILD_USER and KBUILD_BUILD_HOST`_ variables.  If you are
 building from a git commit, you could use its committer address.
 
-Absolute filenames
-------------------
-
-When the kernel is built out-of-tree, debug information may include
-absolute filenames for the source files.  This must be overridden by
-including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
-
-Depending on the compiler used, the ``__FILE__`` macro may also expand
-to an absolute filename in an out-of-tree build.  Kbuild automatically
-uses the ``-fmacro-prefix-map`` option to prevent this, if it is
-supported.
-
-The Reproducible Builds web site has more information about these
-`prefix-map options`_.
-
 Generated files in source packages
 ----------------------------------
 
@@ -132,6 +117,5 @@ See ``scripts/setlocalversion`` for details.
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
 .. _KCFLAGS: kbuild.html#kcflags
-.. _prefix-map options: https://reproducible-builds.org/docs/build-path/
 .. _Reproducible Builds project: https://reproducible-builds.org/
 .. _SOURCE_DATE_EPOCH: https://reproducible-builds.org/docs/source-date-epoch/

-- 
2.48.1


