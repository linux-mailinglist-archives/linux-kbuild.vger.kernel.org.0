Return-Path: <linux-kbuild+bounces-6900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E26ECAA7C7C
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 00:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFF9B4A3597
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 22:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C48221289;
	Fri,  2 May 2025 22:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mosauOqk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44021518F;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226460; cv=none; b=fcCxi8/7eHWWdVB0graxkwE9l0+QZXRc1hoA94T+5eLYwsDWqG7QB7gtKirU9JOmNjVJPBJ7AUrCpgmUM04ouLAOqZZtmgWHp2TEtU3N35Rh9tuam+2UZRzhgQOQDT+H1Dx/HQpr5brGu56UcA1P7A6MUprAy5RyMYzSLnsAVNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226460; c=relaxed/simple;
	bh=WdmZa5l99Vhwe/hFJDeUIG6hQ5O76/7JBHbFIhtajXs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AeOD/ocp0XhwBnY3HHhhu6Qw3KSJInyrD9KXXhurt+q+1x7wwalIamaZP1UHcAhkxNA0MmPIHyW5u0kisXmBQ3UKp2QUKG3ie9WPegO8lUcjro3kmLIQETFj0Qji8bQ/cvAL0C5wd4Y8nCxDC+cBoDl7nGvZNE3oPD0dTZkO27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mosauOqk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C407DC4AF0B;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746226459;
	bh=WdmZa5l99Vhwe/hFJDeUIG6hQ5O76/7JBHbFIhtajXs=;
	h=From:To:Cc:Subject:Date:From;
	b=mosauOqkxwLCmrF6kKUM0Ys45QpPFJotZsAsfrJWceDUgkC5uIJ/Rxh6TUpH8Emrq
	 7H0gfHbVxPbigbxSx08rlCCOSJFIomzKDzsINhG1PzkXhVwh+0mDXfiZAN79x2ih2I
	 WHnfFIMnVaoE81Ivdex81HcLXf5mRDyvuVvC3chp7Bst2V4beOikMiJsy7IuDiPu7F
	 wZOQ877oEHqjOAwM0MrKFcL5exqAhEvl6ZCB3XOkTK/x8snrF4WtHYuDUnQgpY4D4G
	 QAppMMclUn/+cWRO0+OyXP/XjNfalLChyp7pPSrOYYqE5QsCXyxoHYxp5c9IGfP+7L
	 E9Mewxx5aoTsg==
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
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-um@lists.infradead.org
Subject: [PATCH v2 0/3] Detect changed compiler dependencies for full rebuild
Date: Fri,  2 May 2025 15:54:12 -0700
Message-Id: <20250502224512.it.706-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2704; i=kees@kernel.org; h=from:subject:message-id; bh=WdmZa5l99Vhwe/hFJDeUIG6hQ5O76/7JBHbFIhtajXs=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmivmLBof3JZfffi9rwZtw7k6/bbaezi+3JSpdr0XPDs s7wqC3uKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmEi1HiND56y7zgsOn5/caBvL LfxQ6GifRFBVWdwigd+l/Ac1fQtuMvx34tjpIpfatU6iObfAvlz2Uh5X7+Vuc869+hoTXMp+JLI DAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

 v2:
  - switch from -include to -I with a -D gated include compiler-version.h
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

The best way I found to deal with this is to:
- Generate a .h file that is updated when the specific dependencies change.
  e.g.: randstruct_hash.h depends on randstruct.seed

- Add a -I argument globally to be able to locate the .h file.
  e.g.: -I$(objtree)/scripts/basic

- Add a conditional -D argument for each separate case
  e.g.: RANDSTRUCT_CFLAGS += -DRANDSTRUCT

- Include the .h file from compiler-version.h through an #ifdef for the define
  e.g.:
  #ifdef RANDSTUCT
  #include "randstruct_hash.h"
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

 Makefile                         |  1 +
 arch/um/Makefile                 |  2 ++
 include/linux/compiler-version.h | 10 ++++++++++
 include/linux/vermagic.h         |  1 -
 scripts/Makefile.gcc-plugins     |  2 +-
 scripts/Makefile.ubsan           |  1 +
 scripts/basic/Makefile           | 20 +++++++++++++++-----
 scripts/gcc-plugins/Makefile     |  8 ++++++++
 8 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.34.1


