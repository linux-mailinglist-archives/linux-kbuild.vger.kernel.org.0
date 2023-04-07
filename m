Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCE06DA936
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 09:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238839AbjDGHFd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 03:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjDGHFc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 03:05:32 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25DE2D4B
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 00:05:30 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 62F5D3F238
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 07:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1680851128;
        bh=7wCvsU3M9Fv6Z9EHNIgdooWMu4RgxKEfVO+unBDF31s=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=lC8xunuf5nDpUcF9gqRgREubdX6gixKI6Kii09wfQZ87Rjl51HCfHFepKhDN8ppPr
         i9Mj7ucYG3vKwa4geU5nnBexoiUCiQvsQe3dCtDrQYzCHM0uxPjHYo848wXFYPUwra
         TRd7LgyFWlEDdTOCIqlFbEsMtBxZ9VcKLml0XXPEMEH1dHX/uBBN+3FL1nfNuemb0k
         gcN0afSbhpsFmKPo3mpAc0lzuq5rTuOM4MiAF+3JyA445jdXU0+Do9OwixTr1o7vne
         Mh4VAmT43VGCRHhIivMkaYncmyy9mfJGKLHNmdQmS1PfUqF5oJ5XUefb0zlSl/OWY0
         wLKLQ5oe4UoUg==
Received: by mail-ej1-f69.google.com with SMTP id n1-20020a17090673c100b0093cac894483so1219283ejl.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 00:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680851126; x=1683443126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wCvsU3M9Fv6Z9EHNIgdooWMu4RgxKEfVO+unBDF31s=;
        b=MT+RKTK9U2H2jYXhWOmccI/JDp/VqB+57m315WSt9ylEPDuX9QNunb+HbKcOBAGBDk
         fIJSl9saJq59lb6/d/tVfSmP6VV9NMYrgau0UPXM2bdPfVOXKIar2KUssUdCx2MKBJK4
         rAj8pRlQcyjECOiLtHvHBTOiCIHjtmmOTYpZRHQnef1+ySM+uiJSKaW4EXNclaOXu3ol
         VQH0iQlKh7iKjE5bYjeUOTHAXK30X5yPkxu29kD0p5Mb66sJaS7YOUFSXMcjnlQungPX
         JYnw/DYVEQZNj4onDBGjCr7yPGhNdh4xD1hW8YcwN8wD/+QL8c7vabKOWCpYxxUWmOw4
         aDIg==
X-Gm-Message-State: AAQBX9fWSS/t6Waf522RFJdgvGO5/Ckok6Oox2/Ec49x/VGnzQrM8zjW
        f96heiXdjy08NcS4lM7RpLa+dDc1M1DsYifmm2T3Lhh73Lk5QzuEeebFZLibQJvboyPMwFoykMN
        rLyCWdBvo3YffS7b6TeJRe9Kab/q2xYzUxpflsRAbmQ==
X-Received: by 2002:a17:906:66c1:b0:878:711d:9310 with SMTP id k1-20020a17090666c100b00878711d9310mr1273980ejp.1.1680851126442;
        Fri, 07 Apr 2023 00:05:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzjSQgbr52e5pu0pxHM3+EK8myuLmAkwr/R04rHg5N7fdgj3sVGTxfmYaqxI5wPSe/V3+Jxg==
X-Received: by 2002:a17:906:66c1:b0:878:711d:9310 with SMTP id k1-20020a17090666c100b00878711d9310mr1273943ejp.1.1680851126066;
        Fri, 07 Apr 2023 00:05:26 -0700 (PDT)
Received: from localhost.localdomain (host-79-33-132-140.retail.telecomitalia.it. [79.33.132.140])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906a18700b00929fc8d264dsm1766736ejy.17.2023.04.07.00.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 00:05:25 -0700 (PDT)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        Eric Curtin <ecurtin@redhat.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Neal Gompa <neal@gompa.dev>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: rust: drop is_rust_module.sh
Date:   Fri,  7 Apr 2023 09:05:17 +0200
Message-Id: <20230407070517.204676-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
introduced the constraint "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE"
to enable RUST.

With this constraint we don't need is_rust_module.sh anymore, because
'pahole --lang_exclude=rust' already has the capability to exclude Rust
CUs. If pahole isn't recent enough (< 1.24) to support --lang_exclude,
then DEBUG_INFO_BTF can't be enabled with RUST and is_rust_module.sh
isn't used as well.

In any case is_rust_module.sh is obsolete and we can just drop it.

Link: https://lore.kernel.org/lkml/Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390/
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/macros/module.rs     |  2 +-
 scripts/Makefile.modfinal |  2 --
 scripts/is_rust_module.sh | 16 ----------------
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100755 scripts/is_rust_module.sh

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index a7e363c2b044..608406f33a70 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -179,7 +179,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             /// Used by the printing macros, e.g. [`info!`].
             const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
 
-            /// The \"Rust loadable module\" mark, for `scripts/is_rust_module.sh`.
+            /// The \"Rust loadable module\" mark.
             //
             // This may be best done another way later on, e.g. as a new modinfo
             // key or a new section. For the moment, keep it simple.
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 4703f652c009..e6f8fa3c9b8d 100644
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
index 28b3831a7593..000000000000
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
-${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
-- 
2.39.2

