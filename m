Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02BA27B5D0D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Oct 2023 00:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjJBWUA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Oct 2023 18:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjJBWUA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2023 18:20:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F386891
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Oct 2023 15:19:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168E0C433C7;
        Mon,  2 Oct 2023 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696285197;
        bh=kLSfbQ/G4VTKu5DsncLQOBOXQ4WFOLkQX9VZA8s2B9I=;
        h=From:Date:Subject:To:Cc:From;
        b=oCPzesfZBSA1Uf2c3rQEbGgyyEinNWoHXCtPfpGF51Nhg2ueHIfuwIG7cnc52F9mj
         oLQe9bT0bwTfydIljzEqN9wEqWmKpmGjDAYope/79r+EZlJNTWuSSoUKt3R67pVPCV
         KWz4fBqVF1R1xNQeabmoYlc8GOpw9xxW2ATgQvmKxEUnSgBtTQvo59i0uT81vpIOwp
         rOOyozi7b0sf6ATPe/XLcISGXr/u3+a61tq6BC5Soca1/j6LMgxlxUY3jk7h76RbvX
         AaA0to6tvbwS/CdQWn2DOz1kGv1on3N1ePAlbgA6eLggK2g7vUsf/rr7ryOcN5Jw52
         KXX/VMv6rJlEA==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Mon, 02 Oct 2023 15:19:46 -0700
Subject: [PATCH] kbuild: Enable
 -Wincompatible-function-pointer-types-strict in W=1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAFCG2UC/x3NQQ4CIQyF4atMurYJoE4cr2JcABZtooVAdTSTu
 bvo8lv87y3QqDI1OA4LVHpx4ywddjNAvHm5EvKlG5xxW2uMQxIf7oQzS8yP4pV/Sk+J2kssmUW
 pon4KNWxaOSrOaHHn92OYpnCIY4I+Xiolfv+PT+d1/QLUVpXeiAAAAA==
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, keescook@chromium.org,
        samitolvanen@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=nathan@kernel.org;
 h=from:subject:message-id; bh=kLSfbQ/G4VTKu5DsncLQOBOXQ4WFOLkQX9VZA8s2B9I=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKnSTjzuDu/fZ3Wl886bIHuQvT3s3mel/CSF8IeRqrwz+
 aVCA4M7SlkYxDgYZMUUWaofqx43NJxzlvHGqUkwc1iZQIYwcHEKwESePWL4K3RlwvaT7S9/RCkX
 pG6d17V9y4ystOZNQlOWnBfzvqb9ypjhf7w+l8zDbxsvnFwUOUX/TezizrqbDFXRLgJT286t2yJ
 lywkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-Wincompatible-function-pointer-types-strict aims to catch clang kernel
Control Flow Integrity (kCFI) violations at build time (rather than run
time) by validating function pointer assignments against the expected
prototype, similar to the existing -Wincompatible-function-pointer-types
that is considered a hard error in the kernel. The -strict variant
requires the types to match exactly, as opposed to just matching in
terms of ABI compatibility. This is primarily visible with int/unsigned
int in lieu of enum types or vice versa.

The tree is not completely clean, so this warning cannot currently be
enabled unconditionally. However, there are only warnings in one
subsystem ('drivers/counter'), so it is really close. In order to
benefit from CI infrastructure that tests with W=1, enable this warning
at that level, so that new instances have a chance of being caught and
fixed during development.

This should eventually be a hard error in a similar manner as
Wincompatible-function-pointer-types but some subsystems test
with W=1 + CONFIG_WERROR=n, so it would be rude to break their builds
when they do not care about warnings outside of their subsystem.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 2fe6f2828d37..9662f7fd6e39 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -108,6 +108,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wformat-overflow)
 KBUILD_CFLAGS += $(call cc-option, -Wformat-truncation)
 KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
 KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
+KBUILD_CFLAGS += $(call cc-option, -Wincompatible-function-pointer-types-strict)
 
 KBUILD_CPPFLAGS += -Wundef
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1

---
base-commit: ce9ecca0238b140b88f43859b211c9fdfd8e5b70
change-id: 20231002-enable-wincompatible-function-pointer-types-strict-w-1-4a56b99b8c6f

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

