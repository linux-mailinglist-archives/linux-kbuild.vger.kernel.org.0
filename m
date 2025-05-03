Return-Path: <linux-kbuild+bounces-6918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDC8AA81FB
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 20:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBEC3189EEE3
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 18:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561B727E7E2;
	Sat,  3 May 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX/h4kW+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64318DB26;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746297987; cv=none; b=rLcsXZIXkCLKjqyR6sdVzWpyV9w+mOJ0eHPmtUVDDR9Bdqaow5LgEPOhliXKVoKRKIXdu/G3o9KRGWf+MlhoQL4uWAG+nBhUuxf2QhUQ8eiNJsuyDl9Aw6gldGjnP+vGhlA+PXEG0/XS+RQDXUpBZ7gj1aYHrtckzNFl3j7tdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746297987; c=relaxed/simple;
	bh=cmrsue879i0SFR336+VtZOxozOZsiQ5dawHHXzQfCT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T9AhQnonm/GNlmUaroFxPOEU+gGetMB4MrXqVyKoQ607UrNUeNyQW4T5QJAiDdHxx240nFNY8xUYOlVbyw0Xf/TqBS19Qc2zFQhwiv2olwGs7FssotVytrpQUlDoRhyZ4tnfWyZhMCVWrG+8K0JCaXUb9/w/WOi4F/BvV0aWiEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX/h4kW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E05C4AF0C;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746297986;
	bh=cmrsue879i0SFR336+VtZOxozOZsiQ5dawHHXzQfCT4=;
	h=From:To:Cc:Subject:Date:From;
	b=HX/h4kW+u8OZY9JS4fM+MlUY7L/Ak8WJyQo+O4GNTudETJI8GY5bBDV6qOrAkkb+0
	 Wr4tfa64vxTlZLrGbKjCrFW0iyj9i07s/alc81j6pkgGawterXu8/CQQ4GznnafBPU
	 eZ2J200gjP/oOKTGn/kQd9QMjx8wzdMXqmU5RZc/X0at/kS/dyJGIICuRtEC1NBKPW
	 JFZ6/jeCpkj/V1m+xefEsgh/iAzgMSA0lGdKwsdYNOLaR2Uzv3NX+o8TMqLE0j6jHI
	 FMeJpetJqfdQO+/L6UD2nRDK/8g6nwdzrq449L8pKbebcS/vQQ5o90clk3Z3dHNNRl
	 iIBWfwlc8lBAw==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/3] Detect changed compiler dependencies for full rebuild
Date: Sat,  3 May 2025 11:46:17 -0700
Message-Id: <20250503184001.make.594-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=kees@kernel.org; h=from:subject:message-id; bh=cmrsue879i0SFR336+VtZOxozOZsiQ5dawHHXzQfCT4=; b=owGbwMvMwCVmps19z/KJym7G02pJDBliKex5Glf6uqY79um+fzhV7e/G6CI/q6v1Lx66z1du+ s798NWZjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgInM72L4nxz345rV9LzVEx9G C8dp7Dd573ZI0O22kPspF4NEW7NvPxkZTh+XTkr8kxx4LV9zV9vpe5JsjydbFx5Njs65wCubOOc mCwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

 v3: move to include/generated, add touch helper
 v2: https://lore.kernel.org/lkml/20250502224512.it.706-kees@kernel.org/
 v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@kernel.org/

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

The current solution is to:
- Touch a .h file in include/generated that is updated when the specific
  dependencies change.
  e.g.: randstruct_hash.h depends on randstruct.seed

- Add a conditional -D argument for each separate case
  e.g.: RANDSTRUCT_CFLAGS += -DRANDSTRUCT

- Include the .h file from compiler-version.h through an #ifdef for the define
  e.g.:
  #ifdef RANDSTUCT
  #include <generated/randstruct_hash.h>
  #endif

This means that all targets gain the dependency (via fixdep), but only
when the defines are active, which means they are trivially controlled
by the existing CFLAGS removal mechanisms that are already being used
to turn off each of the above features.

-Kees

Kees Cook (3):
  gcc-plugins: Force full rebuild when plugins change
  randstruct: Force full rebuild when seed changes
  integer-wrap: Force full rebuild when .scl file changes

 include/linux/compiler-version.h | 10 ++++++++++
 include/linux/vermagic.h         |  1 -
 scripts/Makefile.gcc-plugins     |  2 +-
 scripts/Makefile.lib             | 18 ++++++++++++++++++
 scripts/Makefile.ubsan           |  1 +
 scripts/basic/Makefile           |  5 +++++
 scripts/gcc-plugins/Makefile     |  4 ++++
 7 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.34.1


