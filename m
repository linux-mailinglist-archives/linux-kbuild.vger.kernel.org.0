Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82EF866694C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235894AbjALDFv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236035AbjALDFr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CF448832
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 19:05:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 94291B81DB7
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 03:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABC0C433A7;
        Thu, 12 Jan 2023 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492744;
        bh=eFtu+9yjcmeh26H2wSYHFSlbvimHHOW37ytjHh1KkQw=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=ddL6pRJDODN/NDB3M7m3HRuQAZZsMtRcZfeUtSrGgucH3Wkk66Ny89XVEiXQ6u9tI
         g0bv6jqEYqdyvhaj3rvsEJREdbgfHI6h0Ueu6An84QlX6RmVh9td/Xu1wRBb5PWhaG
         nORnKBZt4RmweJ5y6Dc2C7JilJdjdvPMYpXjpY4DTIntK+tZxNh8dNlQ2bySAEYCU4
         U8BT9Q4eIzKlHOsGcC2cTHzJsppR2HWb8QFfnbSrKWpnpjA60b3nJ3bo2YO2yyod7k
         4Yw9YA1nDUSD5KxTBKBi/1A6/DlTy41Rfb1CoEYMW6wXUtIGf8PFCxzD6fASRYfSNJ
         iVSgv+RUy/dfg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:10 -0700
Subject: [PATCH v2 13/14] kbuild: Turn a couple more of clang's unused
 option warnings into errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-13-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=nathan@kernel.org;
 h=from:subject:message-id; bh=eFtu+9yjcmeh26H2wSYHFSlbvimHHOW37ytjHh1KkQw=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K/50nc3/deHkdlEJra+HJDbySsYvc1uokONb1P3TunHa
 9kNqHaUsDGIcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiC7QZfrPZ2R+Ztntne1HtpceXTC
 5fN3gp5NJvr3J72Ul/G+NvpocZ/ieaKIXLHb4T9mX1ifTf/AGLONduSIhcfSemsVqrhlukiQcA
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
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
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

