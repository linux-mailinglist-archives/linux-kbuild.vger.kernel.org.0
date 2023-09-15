Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018787A24B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Sep 2023 19:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235889AbjIOR3j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Sep 2023 13:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbjIOR3K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Sep 2023 13:29:10 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CDB2105
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Sep 2023 10:29:05 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-594e5e2e608so30155257b3.2
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Sep 2023 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694798944; x=1695403744; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ugRbSrKZTgJSxFp7tilsZX/7onhJCvgcZOqxi5h8ayg=;
        b=CCEyGmuhfPYEztnD5W2Nu2CDNu97X+FKzI8WTKQFUhrwtK8CfaGC5kgapgQpJNOSpa
         mR5p9TLH+ZXpJT9LSNhYQH88anpMZNSmxZisvSX7Hee8bJuwyo5gCZ6THUg+T1tyaq7W
         e/ll9z1VM5VlLBgb40xi7fAHfsPCIOzF2YX6K9S/7dbDU5w+boDeClGXq4noOa6NzdWN
         yoVHKPxAURerr/j8P+0XrEe+DwaOgcJzbkVRHz4wzN4NqyxgxqMqN1cM0Tt4kAGGzmId
         SoTsulKiEiSQ+3lt7uljupkkyeE/mnRhpNqu6NevQGpkrCNDnpQYEic8LJ012guITvuy
         JAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694798944; x=1695403744;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugRbSrKZTgJSxFp7tilsZX/7onhJCvgcZOqxi5h8ayg=;
        b=m3Xe3dh1SiWFz+hCSoOc63DyCUjI9gLGGzIXpvQ5s2I2H24HLdSNZWOYX0rC0HL6MW
         kJ251+XyPTJGLAsmIiuf+dW4z9oJH8rsQm2fMSolkHv0NfxCtj1gPajX83NguySFs/fk
         JSsKd3glSpBz+qzfsnqdenLgT6LCuAPBYWuO7nCw/Uo5Y5na6qZawBDjO36WXRdRX4gk
         B3lNVb4ec1TwM+J3AQFMHsZSevJdR+HURQPkGPgC+uDkbhc1sK4NK1VXh/aDTbuOogyA
         odCbOXMseeMU09+JLJmFuKolQVyMdLf7biJUY+vZb/6rGbbsu+lxQP2bVkzTX4L9FekU
         s3bA==
X-Gm-Message-State: AOJu0YybF7BRqERbePnT45zscJaVhxYHea5zeCzka2jYeOERJfzbZcTo
        rGX33iEEV/2lTUo5ooiOOURbpokwyFP9
X-Google-Smtp-Source: AGHT+IF/ismO4z/8vBmeX9a5PQcfgQTGIyLLkxJs4DngaZx/W2K0t+TvRATwzNEsoN8WtCTXhMPHHrLFM79O
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:a78a:0:b0:583:4f82:b9d9 with SMTP id
 e132-20020a81a78a000000b005834f82b9d9mr73272ywh.5.1694798944470; Fri, 15 Sep
 2023 10:29:04 -0700 (PDT)
Date:   Fri, 15 Sep 2023 17:28:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230915172900.3784163-1-mmaurer@google.com>
Subject: [PATCH] rust: Respect HOSTCC when linking for host
From:   Matthew Maurer <mmaurer@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Matthew Maurer <mmaurer@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
resulting in build failures in hermetic environments where `cc` does not
exist. This includes both hostprogs and proc-macros.

Since we are setting the linker to `HOSTCC`, we set the linker flavor to
`gcc` explicitly.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile         | 1 +
 scripts/Makefile.host | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..2a2352638f11 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,7 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		-C linker-flavor=gcc -C linker=$(HOSTCC) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 8f7f842b54f9..0aa95a3af1c4 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -91,6 +91,7 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
+		 -C linker-flavor=gcc -C linker=$(HOSTCC) \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
 
-- 
2.42.0.459.ge4e396fd5e-goog

