Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F02744FD2D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Nov 2021 03:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhKOCqm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Nov 2021 21:46:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:60354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229588AbhKOCqg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Nov 2021 21:46:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2405E61106;
        Mon, 15 Nov 2021 02:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636944221;
        bh=cNcC+xaVwuBsu4s+TjO1ZeRzoEwUCmGWi+n1A222XYo=;
        h=Date:From:To:Cc:Subject:From;
        b=kDNVN7SVyrTX3ImVNFu87j10RlMdvDumEOJaEmuqZ0U56QQWKQP3P5m0DwK5hBX+l
         3t3Ly2tK3ZKxd/uSwj4n4fApKakhQiUn2KfU+t6MAG/iVg2NFAD7h8Id4lsnK4nYL0
         m5zPRHVfRHRREUq1F/M83pS2wWIxu/Tfq2J72eeu28OgmN+yvAgNWnHMzHsVsiaycI
         SKKsoQoffgrVN1aPQex2skPC0KFFM1/xuwSQFgtYHuQBWmysTUBy++J2NvRD/hR6CZ
         q/qp+bXgBXxdUURKn+XVEa/j92GFDKO0t53qbpoSbGAbYoDsmptSaYZpHiNsry7pMH
         N9/k4QX1n9CuQ==
Date:   Sun, 14 Nov 2021 20:48:44 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v3] kbuild: Fix -Wimplicit-fallthrough=5 error for GCC 5.x
 and 6.x
Message-ID: <20211115024844.GA68591@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-Wimplicit-fallthrough=5 was under cc-option because it was only
available in GCC 7.x and newer so the build is now broken for GCC 5.x
and 6.x:

gcc: error: unrecognized command line option '-Wimplicit-fallthrough=5';
did you mean '-Wno-fallthrough'?

Fix this by moving -Wimplicit-fallthrough=5 under cc-option.

Fixes: dee2b702bcf0 ("kconfig: Add support for -Wimplicit-fallthrough")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Co-developed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v3:
 - Keep the original CC_IS_GCC part of the test[1].
   Link: https://lore.kernel.org/linux-hardening/CAHk-=whaJCEwqKbekSNjziY4RMTKzkRkkrOM4MEZQEo0j3HT=Q@mail.gmail.com/ [1]

Changes in v2:
 - Add Fixes tag.

 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 036b750e8d8a..4b7bac10c72d 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -887,7 +887,7 @@ config CC_HAS_INT128
 
 config CC_IMPLICIT_FALLTHROUGH
 	string
-	default "-Wimplicit-fallthrough=5" if CC_IS_GCC
+	default "-Wimplicit-fallthrough=5" if CC_IS_GCC && $(cc-option,-Wimplicit-fallthrough=5)
 	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
 
 #
-- 
2.27.0

