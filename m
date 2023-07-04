Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6607F7468D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jul 2023 07:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjGDFVr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jul 2023 01:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjGDFVq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jul 2023 01:21:46 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E46E49
        for <linux-kbuild@vger.kernel.org>; Mon,  3 Jul 2023 22:21:41 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 408043F738
        for <linux-kbuild@vger.kernel.org>; Tue,  4 Jul 2023 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1688448100;
        bh=1v+am1Z8ymQUGghyM5chvEt9+BuF/dKqLqYQx56m9zI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=HH5d6PAm+DXC8UAN2s9KGOGqSwwXINBKbxFBMC/C6bc9YGa4MaUmB2PcJroRqMaOr
         bgF2m/rteXeN0MAIVNfiB7TWXMUmTQXndgWvoE4sUWAMykeGBZBjOK8y7TW1NflUt0
         WCbHfYC1ElaNAJ8gbaWJVtwUWa/FvBtXpjjxTYlX1FZ7/hDUEHlC0wubKX8IODxw07
         25HdL5dOWRktySYFMSCgjaxsNMlvaJbfH9rR7wweVKkHVzK1d9LY0s20zL3AAzSvm8
         C6ZrOuGu70zrfsu+GSIGGDx+tTtekD2nQUIyse5cEQbHhW8/EAIVC+iM0qpImT3aNi
         921i68wMW5tJw==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-98df34aa83aso570249866b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Jul 2023 22:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688448098; x=1691040098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1v+am1Z8ymQUGghyM5chvEt9+BuF/dKqLqYQx56m9zI=;
        b=Nh8rCAKMY7WcUzNiRTaCbn1sguK2H/RNzUuYVphMmYvNxnGl3TnpEdoFBDRH+wpE2A
         axN0vH0NywDKeNdgCCXsnrQeRVEwYWH96j6T9dv6t6wEA4+Ai/IjF6wIsupygelCm3Qw
         SHbnSMJmK+VUvsCsbwHF31Ldy3kAO+W937ZhojW/vDbWrYFpYA1kY6+aZXsEi7BIYzbU
         UR1VRPSSrSXEsy+seQeabEqxK6Yugjut+3sIYmRI51CQ1I1PtUksiXzdmHyQl77IZbgY
         UbDZL6vltS2pXVRX2dG7ImP69weKRwo05NBYca779q0lRZpRnN2UqIxVaM2QYJL7SBg7
         hk9g==
X-Gm-Message-State: AC+VfDwfTgFboCfsqAo2SIldCx53AHIPFyqdIb8a67urWq3cxjiSVNo1
        JWVC0aXzOF7a2111+3Xb1Y2PMTUIlN8zH4hbwKKADOuD8Cg9ifXoNykbldbk2IEbDoceyn36PL7
        1p5u3J9w3Zn+WZtfpY5FuvHSbu2tw09xu0wDOW420sA==
X-Received: by 2002:a17:907:6e1b:b0:98e:1c4b:10e2 with SMTP id sd27-20020a1709076e1b00b0098e1c4b10e2mr13287220ejc.20.1688448098175;
        Mon, 03 Jul 2023 22:21:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6KaBtBsknIGzT43R9yW1TZOTc6kL/88ouJOfFvTX2qde5kXfxpEFdhmAwOmJNRYKLkFyB6Sg==
X-Received: by 2002:a17:907:6e1b:b0:98e:1c4b:10e2 with SMTP id sd27-20020a1709076e1b00b0098e1c4b10e2mr13287209ejc.20.1688448097892;
        Mon, 03 Jul 2023 22:21:37 -0700 (PDT)
Received: from righiandr-XPS-13-7390.homenet.telecomitalia.it (host-95-234-206-203.retail.telecomitalia.it. [95.234.206.203])
        by smtp.gmail.com with ESMTPSA id a10-20020a17090640ca00b0098e025cda3bsm12706377ejk.141.2023.07.03.22.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 22:21:37 -0700 (PDT)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] btf, scripts: rust: drop is_rust_module.sh
Date:   Tue,  4 Jul 2023 07:21:36 +0200
Message-Id: <20230704052136.155445-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
we are now able to use pahole directly to identify Rust compilation
units (CUs) and exclude them from generating BTF debugging information
(when DEBUG_INFO_BTF is enabled).

And if pahole doesn't support the --lang-exclude flag, we can't enable
both RUST and DEBUG_INFO_BTF at the same time.

So, in any case, the script is_rust_module.sh is just redundant and we
can drop it.

NOTE: we may also be able to drop the "Rust loadable module" mark
inside Rust modules, but it seems safer to keep it for now to make sure
we are not breaking any external tool that may potentially rely on it.

Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/macros/module.rs     |  2 +-
 scripts/Makefile.modfinal |  2 --
 scripts/is_rust_module.sh | 16 ----------------
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100755 scripts/is_rust_module.sh

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index fb1244f8c2e6..d62d8710d77a 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -199,7 +199,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             /// Used by the printing macros, e.g. [`info!`].
             const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
 
-            /// The \"Rust loadable module\" mark, for `scripts/is_rust_module.sh`.
+            /// The \"Rust loadable module\" mark.
             //
             // This may be best done another way later on, e.g. as a new modinfo
             // key or a new section. For the moment, keep it simple.
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index fc19f67039bd..b3a6aa8fbe8c 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -41,8 +41,6 @@ quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
 	if [ ! -f vmlinux ]; then					\
 		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
-	elif [ -n "$(CONFIG_RUST)" ] && $(srctree)/scripts/is_rust_module.sh $@; then 		\
-		printf "Skipping BTF generation for %s because it's a Rust module\n" $@ 1>&2; \
 	else								\
 		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
 		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
deleted file mode 100755
index 464761a7cf7f..000000000000
--- a/scripts/is_rust_module.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# is_rust_module.sh module.ko
-#
-# Returns `0` if `module.ko` is a Rust module, `1` otherwise.
-
-set -e
-
-# Using the `16_` prefix ensures other symbols with the same substring
-# are not picked up (even if it would be unlikely). The last part is
-# used just in case LLVM decides to use the `.` suffix.
-#
-# In the future, checking for the `.comment` section may be another
-# option, see https://github.com/rust-lang/rust/pull/97550.
-${NM} "$*" | grep -qE '^[0-9a-fA-F]+ [Rr] _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
-- 
2.40.1

