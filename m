Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664A36DB5DA
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 23:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjDGVnT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 17:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjDGVnS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 17:43:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461D19741;
        Fri,  7 Apr 2023 14:43:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CCCB8654DB;
        Fri,  7 Apr 2023 21:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BCAC433EF;
        Fri,  7 Apr 2023 21:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680903796;
        bh=6njH95OlaX2vmS6xziCvXrBXY5+XsyA/skz5Cmhigj4=;
        h=From:Date:Subject:To:Cc:From;
        b=j+P0P1MC7lb0nTQkjhyRq44+OxwPMCOGfqR9Lbuu7gL0wUtvxAyFuUOFQ8NmKNuMS
         g1IhTOPE4gjGrGrXz7Y5WfkprSvc802qK/cQZ4amdEzT5uSfXOXQfG2uY7cqVCJckO
         0OtYDJ9WELHjLIyz9WwnMg4ffBzoXaQ1j7NE9NF5M3nWDhaor2sCcP8x1piHdxu8N1
         jsGN/R7hiYyrOryrnkEePfMnrmoUPKDbWwfnRqj/QAMulBl//B+ZNZ7OViFtHqi+uB
         jPoSq0WFw4BzUd3EaMwiGuV9SQFOVqqCUOmBTr3ZXWl/9U7UE9cq87LNH8tWvp4w4t
         Z18wtpPnOL6/A==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Fri, 07 Apr 2023 14:42:48 -0700
Subject: [PATCH v2] Documentation/llvm: Add a note about prebuilt
 kernel.org toolchains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230405-korg-llvm-tc-docs-v2-1-98d2e4a96c41@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFeOMGQC/32NTQ7CIBBGr2JYOwaQJujKe5gugI4taQtmpiGap
 neX9gAu3/eTtwpGisjifloFYYkcc6qgzycRBpd6hNhVFlrqqzSygTFTD9NUZlgCdDkwWFMbtFb
 50Ij6844RPLkUhv05O16Q9uJN+IqfQ/ZsKw+Rl0zfw13Unv7TFAUKjJbW3LxGqZvHiJRwutSla
 Ldt+wF3VNrAzAAAAA==
To:     masahiroy@kernel.org, corbet@lwn.net
Cc:     arnd@arndb.de, keescook@chromium.org, ndesaulniers@google.com,
        trix@redhat.com, nicolas@fjasle.eu, llvm@lists.linux.dev,
        patches@lists.linux.dev, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, Bill Wendling <morbo@google.com>,
        Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6njH95OlaX2vmS6xziCvXrBXY5+XsyA/skz5Cmhigj4=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCkGfcUeszz/ZJgKNBxq2Wr7L3ji/YUJi/7bvqp25Cx68
 XUXz9wVHaUsDGIcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiy/QZGbZc2z2N5fmEqzdX
 yqgYfDyVpRbfWiCxzbxd68KEVZt7gs8z/Pc8qvfD7q9G4S/p4rxZRosi5z/K+ZnQltbem5npGsY
 ayw4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I recently started uploading prebuilt stable versions of LLVM to
kernel.org, which should make building the kernel with LLVM more
accessible to maintainers and developers. Link them in the LLVM
documentation to make this more visible.

Link: https://lore.kernel.org/20230319235619.GA18547@dev-arch.thelio-3990X/
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Bill Wendling <morbo@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Fix typo ('procurring' -> 'procuring') [Bill]
- Link to v1: https://lore.kernel.org/r/20230405-korg-llvm-tc-docs-v1-1-420849b2e025@kernel.org
---
 Documentation/kbuild/llvm.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index bfb51685073c..c3851fe1900d 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -171,6 +171,10 @@ Getting Help
 Getting LLVM
 -------------
 
+We provide prebuilt stable versions of LLVM on `kernel.org <https://kernel.org/pub/tools/llvm/>`_.
+Below are links that may be useful for building LLVM from source or procuring
+it through a distribution's package manager.
+
 - https://releases.llvm.org/download.html
 - https://github.com/llvm/llvm-project
 - https://llvm.org/docs/GettingStarted.html

---
base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
change-id: 20230405-korg-llvm-tc-docs-84304e881bc5

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

