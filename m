Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2DA65DD43
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240243AbjADTzm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240246AbjADTzI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:55:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4723E0CA
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:55:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B8E40B818D0
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183F9C433EF;
        Wed,  4 Jan 2023 19:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862104;
        bh=GMQ0SwduuY/Xwbg4h7JUpehtJUeZBg5u+e9loL7IqS4=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=u4/HrF5zesCj0gRuJ6LTJgZSEGYyRMykXJCjma89eOrGX2QRpscWFUKODyyvXarvk
         GNO8DJ2X8UYYgmWXuQ1XHVjxeEIanl8qGAlASo3d3rP9SyO9fwt+56Ymtnh/BUsSHx
         C3xEbT90v5dcWz/zRuJNCNAwZRq5UQ6auM49S80yT9zUzkAtlwS/C6+uC2vZ4V+IBV
         g2GB3O+hTiGmRvQWXgPpUeMHMuOB2UxtuuZJE79hDEmH9g7LiXZjLsETsjdYJioPRu
         q/9Q1DfJsh8k6F4GN2hVD66ppRbmtJuInHlCRLNKYWilc/UggC5LQCI7/F5UPpuWUf
         NPl61x9kS23Xg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:30 -0700
Subject: [PATCH 13/14] kbuild: Turn a couple more of clang's unused option
 warnings into errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-13-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=nathan@kernel.org;
 h=from:subject:message-id; bh=GMQ0SwduuY/Xwbg4h7JUpehtJUeZBg5u+e9loL7IqS4=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3bftyiueSL/VJ+bSfLg6YDJa3P82Kbp35+i/j/t0Jb0
 +6ted5SyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJOC9l+J975Hbq8j+H7ti/WJW8/H
 bH880RlyyY+x+mcEW69RqlMy9gZLj5c0/yWt8MobrXam3RhWFW25kY1dlqWZ3FhVXyFblP8wIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, these warnings are hidden with -Qunused-arguments in
KBUILD_CPPFLAGS. Once that option is removed, these warnings should be
turned into hard errors to make unconditionally added but unsupported
flags for the current compilation mode or target obvious due to a failed
build; otherwise, the warnings might just be ignored if the build log is
not checked.

Link: https://github.com/ClangBuiltLinux/linux/issues/1587
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.clang | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 87285b76adb2..70b354fa1cb4 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -36,6 +36,8 @@ endif
 # so they can be implemented or wrapped in cc-option.
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 CLANG_FLAGS	+= -Werror=ignored-optimization-argument
+CLANG_FLAGS	+= -Werror=option-ignored
+CLANG_FLAGS	+= -Werror=unused-command-line-argument
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS

-- 
2.39.0
