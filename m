Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9646118DCCA
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2020 01:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgCUAuF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Mar 2020 20:50:05 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:35097 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgCUAuF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Mar 2020 20:50:05 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbecbc3c;
        Sat, 21 Mar 2020 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=Z3HxzC8DAqUUz58mImbWRdz/i
        nI=; b=rCTi7k5dgKJNTWBgynQrbbJZbtn2ELkfReb0IbecEEtRHplNSyqjkML3S
        5DCrxR3ff1jWsZoKT7UbAjBEuwMnL3V3whlwmhHQbJmvQCwBgWz6HTrBOjcT/Y99
        YpdyCzCJNIIH292vd+0Knd7MuOgLqbH2dffuYmCpX125iho4Om53xi3pllRh78lW
        AmMbHcBKEdNQmsG4ki319LK/CPm+/YweiffUzSdbJRsd5JaphHFMytvXv/VGa2lS
        JUm1PDEcS4H+KDj6wa4ccTQSnKOBUODiN6jRmkGCQVTHztsdCqpaEh8hkHtgaK/f
        /hLxKpq5G/ld3quDAcS/G3bL7BKGw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c7db75ea (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Sat, 21 Mar 2020 00:43:23 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        x86@kernel.org, linux-crypto@vger.kernel.org
Subject: [PATCH RFC 0/3] x86: probe for assembler capabilities in Kconfig
Date:   Fri, 20 Mar 2020 18:49:42 -0600
Message-Id: <20200321004945.451497-1-Jason@zx2c4.com>
In-Reply-To: <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
References: <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Doing this probing inside of the Makefiles means we have a maze of
ifdefs inside the source code and child Makefiles that need to make
proper decisions on this too. Instead, we do it at Kconfig time, like
many other compiler and assembler options, which allows us to set up the
dependencies normally for full compilation units.

This patchset might have weird implications, as things have relied on
the old behavior for a long time. For example, it now means that
environment changes need for Kconfig's defaults to be triggered again. I
recently saw some patch on LKML that was doing a substring comparison on
KBUILD_CFLAGS looking for -DCONFIG_AS_SOMETHING; things like that will
have to change too.

This RFC isn't super heavily tested, and I expect problems. Let me know
what you think.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: x86@kernel.org
Cc: linux-crypto@vger.kernel.org

Jason A. Donenfeld (3):
  x86: probe assembler instead of kconfig instead of makefile
  crypto: x86 - rework configuration based on Kconfig
  crypto: curve25519 - do not pollute dispatcher based on assembler

 arch/x86/Kconfig              |   2 +
 arch/x86/Kconfig.assembler    |  36 ++++++++
 arch/x86/Makefile             |  22 -----
 arch/x86/crypto/Makefile      | 162 ++++++++++++++--------------------
 crypto/Kconfig                |  28 +++---
 drivers/gpu/drm/i915/Makefile |   3 -
 include/crypto/curve25519.h   |   6 +-
 lib/raid6/test/Makefile       |   9 --
 8 files changed, 120 insertions(+), 148 deletions(-)
 create mode 100644 arch/x86/Kconfig.assembler

-- 
2.25.1

