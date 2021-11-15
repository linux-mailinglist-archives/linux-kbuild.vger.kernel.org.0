Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5738144FCD8
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Nov 2021 03:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhKOCFw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Nov 2021 21:05:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:55124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229453AbhKOCFv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Nov 2021 21:05:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC25F60EE4;
        Mon, 15 Nov 2021 02:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636941776;
        bh=gamnwl3/BbdVhfTdUJRNc/R6U6SsPm6TpC/P8BwAaT8=;
        h=Date:From:To:Cc:Subject:From;
        b=igNZKwkW8QAeWY0BTmmmPenXtgZKFxjMhd1ehoHeGzfaKSsVGwzlv3/a23eqW+6Nn
         BguURcm/pqD2Ho3dVHeeGrRwMFmnK6AL/hNTJUJMK5OVNsXvHGCZkBGZ+vUs1yYGDK
         EYXiUIC4aThzNIl2omodn35S2zSlemf99cQME4LfzKm3ho1mAz8AOBbN7BmSS7XmWN
         jvbH+1I8MhOFBBANIqBq4TCfKZEOe1mStm3RsnhPpu6OoTDhLZA+bM+OlKUdM9BVOw
         4VTGDeJFbQvyqQyalLj+l+e4pLlpvVb+v9gcNDAhQ6rZMybBsQd1QUflYOVy0VGt4Z
         Dvc2ZvGzJ+ovg==
Date:   Sun, 14 Nov 2021 20:07:58 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2] kbuild: Fix -Wimplicit-fallthrough=5 error for GCC 5.x
 and 6.x
Message-ID: <20211115020758.GA45022@embeddedor>
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
Changes in v2:
 - Add Fixes tag.

 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 036b750e8d8a..85882c317235 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -887,7 +887,7 @@ config CC_HAS_INT128
 
 config CC_IMPLICIT_FALLTHROUGH
 	string
-	default "-Wimplicit-fallthrough=5" if CC_IS_GCC
+	default "-Wimplicit-fallthrough=5" if $(cc-option,-Wimplicit-fallthrough=5)
 	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
 
 #
-- 
2.27.0

