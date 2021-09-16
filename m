Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B0040EA18
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Sep 2021 20:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348676AbhIPSnS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Sep 2021 14:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:44496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348572AbhIPSnP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Sep 2021 14:43:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E1616103B;
        Thu, 16 Sep 2021 18:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631817714;
        bh=ulH418QMyTT2TWux7NsxncGiqxQYNH9YKErMukAqgrY=;
        h=From:To:Cc:Subject:Date:From;
        b=rULuUj0Cw0g5HwsjNQYePQw0z/0inRYajo6N7aFmixqexRwKn+otJiOrczm6+ieD2
         UohJYs+rk0xmvnI5MWsucNBLrlAndRfBrpW/sWj1QL7ihamHFsdM31Wfv/K7veGuWw
         C17A/aU0S0nKhIxXjYJqszDb+Tye9nqCossveREXI7CSrVGxqd9YLdinzLe9XzN1A1
         X0oPjLu6ZnC8aQd+xnVTPQ+OP0WsR8qYB4V1It6AskNUunlx3HqEH0i1bGHYiKz69D
         eOcSvtjhlHtoWMgjhylPyOjanLQJ47JjixMHHzIFFdWijzV5C7JoLigscNcyKj8b0G
         RS3NUPSTzvU8Q==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 0/2] Harden clang against unknown flag options
Date:   Thu, 16 Sep 2021 11:40:15 -0700
Message-Id: <20210916184017.1881473-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all,

This series cleans up an issue that was noticed by the kernel test robot
where flags that clang does not implement support for are
unconditionally added to the command line, which causes all subsequent
calls to cc-{disable-warning,option} to fail, meaning developers are
flooded with unnecessary and pointless warnings.

The first patch handles the problematic flags with cc-option for clang
and the second patch ensures we catch new additions of unknown flags so
that they can be handled properly.

I intend for this to be merged via the kbuild tree but it can go via
-tip if there is any objection to that.

Cheers,
Nathan

v1 -> v2: https://lore.kernel.org/r/20210824022640.2170859-1-nathan@kernel.org/

* Patch 1: Change prefix to "x86/build" (Borislav).

* Patch 1: Add link to v1 thread for more context (Borislav).

* Patch 1: Add Borislav's ack.

* Patch 2: Expand comment in source to make it clear that clang only
  warns on certain unimplemented optimization flags.

* Series: Add Nick's review.

Nathan Chancellor (2):
  x86/build: Do not add -falign flags unconditionally for clang
  kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS

 arch/x86/Makefile_32.cpu | 12 +++++++++---
 scripts/Makefile.clang   |  5 +++++
 2 files changed, 14 insertions(+), 3 deletions(-)


base-commit: a9086b878b7fd65894eb8cb1fa395dd469970566
-- 
2.33.0

