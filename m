Return-Path: <linux-kbuild+bounces-6845-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E0AA6441
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 21:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9C7617D544
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 19:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52D4235068;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzGLO6k6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55A231827;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128909; cv=none; b=Cu4D+U6iujYmvS41JlCvM/duU8eBzQYLtrpBSSIbOaQButOMcc47xm4ygEKgwXyBEoVtvJJhFMSrmGYVoytTNzPzPRCLt7YTxwqlAf7J3a+rWKDRdfEA3sMqdSNmpE4gbGHDyHPsXhK7ZEqej1G54tbtKw0ms5bIUIUE2JJg0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128909; c=relaxed/simple;
	bh=nDhsL2XJXp4sGdblMuXDz6J+s9arRNEgRYmTCyaexrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GVgNfLo6k+qP90pXbP0axSWdIG3gRZLS2sGq/4NWqbzKcU34y68Knk740D7/7ovbS1z1zrozMlPiY6bOeQdYb5FI3o73NhIYhmoDqLWOZiZx5BxNTVwmoEEK1jFHWCIYzYC9iKr23W53yP5Q3wI9BlXeDmMzLsCr0GWteltCI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzGLO6k6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18920C4CEE4;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746128909;
	bh=nDhsL2XJXp4sGdblMuXDz6J+s9arRNEgRYmTCyaexrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=YzGLO6k68UgR7+Nm00Bh3qiCYfJLGugqXN0nydwslcnTbRQL7jRNxuzYJwO2DL7nK
	 tHUMwOWxVi1ZKRa2ONDBvRpY102ZaOxwW9yk5t/bA8XU+tunCUjcDlk8Ppu8wFPrjl
	 Dgg8S9wTYSoCLPhnubONMUhq9GsPhbW9rywFw9abiBJSL2odSdcNE1vHRv2v7J3WYv
	 2L/b7w6RDqK74h2pUhfLslnjBiTmu20VeiBLr7gvF/QWCRGBemHxRtXP9ezSWhuHtA
	 H9K8FiJZyqPPWhr1XJufYGW/3/v3JjLJsKLseg6/XHAxH8v3giC3W5Kazz0jQ7/7Ac
	 k0RbRd9Ap4Ykg==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: [PATCH 0/3] Detect changed compiler dependencies for full rebuild
Date: Thu,  1 May 2025 12:48:15 -0700
Message-Id: <20250501193839.work.525-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=kees@kernel.org; h=from:subject:message-id; bh=nDhsL2XJXp4sGdblMuXDz6J+s9arRNEgRYmTCyaexrQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnCFxh2/PXlvaehL1H6dc75Bx/zNktbhx09/FdmltqcI 0HqoR7HO0pZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACYy4wAjw2mV5XtjyvZEd0dd O3P41KcpP2eIZ6esbruk8vGX2Bsf0ekMf4WEFA8eXy5n9yd9Q8DhFWJR9nNPKmfrP4owctS5oT/ 5IgMA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This is my attempt to introduce dependencies that track the various
compiler behaviors that may globally change the build that aren't
represented by either compiler flags nor the compiler version
(CC_VERSION_TEXT). Namely, this is to detect when the contents of a
file the compiler uses changes. We have 3 such situations currently in
the tree:

- If any of the GCC plugins change, we need to rebuild everything that
  was built with them, as they may have changed their behavior and those
  behaviors may need to be synchronized across all translation units.
  (The most obvious of these is the randstruct GCC plugin, but is true
  for most of them.)

- If the randstruct seed itself changes (whether for GCC plugins or
  Clang), the entire tree needs to be rebuilt since the randomization of
  structures may change between compilation units if not.

- If the integer-wrap-ignore.scl file for Clang's integer wrapping
  sanitizer changes, a full rebuild is needed as the coverage for wrapping
  types may have changed, once again cause behavior differences between
  compilation units.

The best way I found to deal with this is to use a -include argument
for each of the above cases, which causes fixdep to pick up the file and
naturally depend on it causing the build to notice any date stamp changes.
Each case updates its .h file when its internal dependencies change.

-Kees

Kees Cook (3):
  gcc-plugins: Force full rebuild when plugins change
  randstruct: Force full rebuild when seed changes
  integer-wrap: Force full rebuild when .scl file changes

 include/linux/vermagic.h     |  1 -
 scripts/Makefile.gcc-plugins |  2 +-
 scripts/Makefile.randstruct  |  3 ++-
 scripts/Makefile.ubsan       |  1 +
 scripts/basic/Makefile       | 20 +++++++++++++++-----
 scripts/gcc-plugins/Makefile |  8 ++++++++
 6 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.34.1


