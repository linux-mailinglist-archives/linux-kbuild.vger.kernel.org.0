Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA90C3F55D0
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 04:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhHXC2S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Aug 2021 22:28:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:36882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233170AbhHXC2S (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Aug 2021 22:28:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8100F61373;
        Tue, 24 Aug 2021 02:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629772044;
        bh=FhBLzlnoS/C4efg4LBoQL/1xcceeOT2Nci0FeHlY0KY=;
        h=From:To:Cc:Subject:Date:From;
        b=kkx5au/F1QQInf2xhWZfLqu3vw4zyEnICeKZB/AZM6RhF4MYKRsy/1tsWA25Hs235
         wDUlQNbjpTcPfBnmEmMtYmOrz5rkfzROaQwL+XNFaPXnOh18dAXLyqX7gszOiDzeNm
         y5wVVPwlaCiNC9eandJcAAPDudr5w3BqckTatwkEeUtPzP0/k4DZ+sSbSXFURryKZH
         gB6py4/lbjNLM+VaMvNpUSoOKc8HI4oinSPij+ZalbAsEZPasrZVWBzI5+x8yP1wzr
         ZU5WlAeYcIzNK6mOiCCjv0NckXk+6XyMe1j7WQYQu6TtJLa0aBdomF8DlUyyJ9bj75
         b4Z37ZCFccKyg==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] Harden clang against unknown flag options
Date:   Mon, 23 Aug 2021 19:26:38 -0700
Message-Id: <20210824022640.2170859-1-nathan@kernel.org>
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

I hope the patches in and of themselves are reasonable and
non-controversial. This is based on Masahiro's kbuild tree as there was
a fairly large refactor around where clang's flags were added so I
figured it would be best to go there with an x86 ack since the first
patch does not depend on anything in -tip.

Cheers,
Nathan

Nathan Chancellor (2):
  x86: Do not add -falign flags unconditionally for clang
  kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS

 arch/x86/Makefile_32.cpu | 12 +++++++++---
 scripts/Makefile.clang   |  4 ++++
 2 files changed, 13 insertions(+), 3 deletions(-)


base-commit: fb3fdea450305d932d933d7e75eead0477249d8e
-- 
2.33.0

