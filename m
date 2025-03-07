Return-Path: <linux-kbuild+bounces-5991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEEA55F52
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 05:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D9D53B296D
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 04:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E9A192B77;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpGqn/ZZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64750190482;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321158; cv=none; b=DsYvKDP+qOA8AaTk4VS4o77IKkQchB93R44sSx9pgZ6ERBAkZ/lpUaeBc1dGMNdeIQxLNW5uh+oqh7qgXhWGzUKTgrIep57q5zyJ5GwrNVB4XpZ5TOuf7jDUJv68yruIEIXAe3UEgV1KZ9+Aj25kEVCcUHp00Uf/SQbJwNhL0wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321158; c=relaxed/simple;
	bh=HdpOnS7Eic+UbYPCcALNkxTU2FKSqjORHtZap9XlbFA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I8ybzPFbnC58JTcrefAFUpivCKqQI0uSby2/xPa/x1rNvUKwgX4cUkiKTgAbwo2gpXu2Hlft8nAVH4JbniJOWLOlwZ7u1kSff7I7AVDBIfrZO2KTgxCnEPG9qRLhKCCZ1+gjZTiOPjTuXQNSxY+zE6vKGUUs10swhl0u+VHfets=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rpGqn/ZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA624C4CEE2;
	Fri,  7 Mar 2025 04:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741321157;
	bh=HdpOnS7Eic+UbYPCcALNkxTU2FKSqjORHtZap9XlbFA=;
	h=From:To:Cc:Subject:Date:From;
	b=rpGqn/ZZuVMd8802YF2u3CrReKTKLsliU+NXkgcbV+AGrn8xiN7OEu6SPojhjCHDT
	 NNmk1S7H8fASwn4j1JJTfp7Ui5a9QnrmQ5b8q8kMRu4iH3QGPcG029YFGHUNi7XfUa
	 tAO0jX8MF0Loo7tJGsIe+3p8jqwxjs2w+dQ/TFAAJ7ZGWDykFQ/22OBwyDHsEVlw6C
	 BHjMCZZ44yPux6+9C4h8Q2PkhFxBa38udR+Zxg55a+eQ+b12uUpU0REpzu/SvKDaNw
	 ufjU9+pXAFLjKMhCo1cH37EFESnTkXvg5YRAD2qClUtuLbaK1I0tFwD2slIidlEW28
	 OPpMFoctyEMQQ==
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Hao Luo <haoluo@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bill Wendling <morbo@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/3] ubsan/overflow: Enable pattern exclusions
Date: Thu,  6 Mar 2025 20:19:08 -0800
Message-Id: <20250307040948.work.791-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=kees@kernel.org; h=from:subject:message-id; bh=HdpOnS7Eic+UbYPCcALNkxTU2FKSqjORHtZap9XlbFA=; b=owGbwMvMwCVmps19z/KJym7G02pJDOmnivc9WDdJnPdalex1RaudYX/mSYtfr5ZaxpWtqjyt9 5P6wfmiHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABNRTWJk2Ls3+nLnp+qNm3pd i7/l+q32Xp9lKsT2w+HqrwYGvp+pKxkZznY7Kx+w8zbRv2vpHFciXPDncomFpWdCpd20INdqyTU cAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This brings Linux's integer overflow mitigation integration up to the
current set of features available in Clang for handling things sanely
(i.e. pattern exclusions). While this isn't over yet, it puts all the
infrastructure in place to continue keeping up to date with current
Clang development. The next step is to add support for the coming
canonical wrapping and non-wrapping types[1].

-Kees

[1] https://discourse.llvm.org/t/rfc-clang-canonical-wrapping-and-non-wrapping-types/84356

Kees Cook (3):
  ubsan/overflow: Rework integer overflow sanitizer option to turn on
    everything
  ubsan/overflow: Enable pattern exclusions
  ubsan/overflow: Enable ignorelist parsing and add type filter

 include/linux/compiler_types.h  |  2 +-
 kernel/configs/hardening.config |  2 +-
 lib/Kconfig.ubsan               | 25 +++++++++++++------------
 lib/test_ubsan.c                | 18 ++++++++++++++----
 lib/ubsan.c                     | 28 ++++++++++++++++++++++++++--
 lib/ubsan.h                     |  8 ++++++++
 scripts/Makefile.lib            |  4 ++--
 scripts/Makefile.ubsan          | 10 ++++++++--
 scripts/integer-wrap-ignore.scl |  3 +++
 9 files changed, 76 insertions(+), 24 deletions(-)
 create mode 100644 scripts/integer-wrap-ignore.scl

-- 
2.34.1


