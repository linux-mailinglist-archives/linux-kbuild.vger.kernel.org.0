Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E127B2619
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Sep 2023 21:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjI1TsN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Sep 2023 15:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjI1TsM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Sep 2023 15:48:12 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B611A2
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Sep 2023 12:48:10 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a22eb73cb3so15635767b3.3
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Sep 2023 12:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695930489; x=1696535289; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8iFw0tvjrP+bKthnM1Ar6RitIykCJfydYWlbU6QKJSo=;
        b=d/ucrjuXJ2acKPT9XyrckOG9VoH40jdz8VyKFE7DQXm2BED4MRhVmA2So4637mpIeb
         xkrOHP2k0Cl1rBg8EO6FsWtuNo8jp/D0f8/dUuvdQACV7IRF2yCgsslE3aAmjPnVwqnC
         5F5RhgoQT3hBr4pPQpPudmqNfnY3xCgUYPo2f7zK6tvfLKxQaDcqYwtQh/CUmq+vke4F
         V4KY7H5Xh7kCf2LpE3ANnCpTDdEAEQBHsrKlE+L8X4NXYt4kOr2iGy54wxX9oEwftqtt
         s8RqlnxQqt4lHkirnVXAtmo+iok4JQqf84L4UITpyK3RJukCQZd7GDIYdJHmCHMibs6I
         rlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695930489; x=1696535289;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iFw0tvjrP+bKthnM1Ar6RitIykCJfydYWlbU6QKJSo=;
        b=XYo3U9YS9o4YsFclwaVnDyPkTu686ZsHBoyLp36Cab4shxivoRXc6+te+IVJiiaqHG
         Y86LiETunvzuXJH3kvtR8pab8rll95k0aASWaOHAt81Gd4bLRUJwyReVYQfOIDCgWZNu
         NiA+tzHFen9YOHueWvwsTyil5LAmwGZPTfAR94psbkDbmLe1VOq2nEAHXHdlo4+j57TJ
         8V1CCN2RlWHNbMrZljaA68mSOZmISdlags2qEkC6LDmdx22g3+UKbgBbx8DQjzDSB5vn
         qr4XHaami1uHTK9wnIuSWT1BvrUuZbum+eqCD3EJVunQhas1pm1k2GF/KAvu7nkdxDrF
         zcnQ==
X-Gm-Message-State: AOJu0YzOcPonuFoDM8yYBFH2ETlJugC8qWcVR0a268qXlmf/hdxCmeeP
        mMHbZ4UNHKwYYziZ49DYBZTihYw7Fc7P
X-Google-Smtp-Source: AGHT+IHmbhxmxw0u7t9poI7VDoNjrSv2+5OQoPENUEo3sqSzgMufa0dh2YWPxi+AEsKixH41b4COj6rIWJJN
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:440d:0:b0:59b:ebe0:9fd3 with SMTP id
 r13-20020a81440d000000b0059bebe09fd3mr29132ywa.7.1695930489339; Thu, 28 Sep
 2023 12:48:09 -0700 (PDT)
Date:   Thu, 28 Sep 2023 19:48:01 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928194801.2278999-1-mmaurer@google.com>
Subject: [PATCH v3] rust: Respect HOSTCC when linking for host
From:   Matthew Maurer <mmaurer@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Matthew Maurer <mmaurer@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
resulting in build failures in hermetic environments where `cc` does not
exist. This includes both hostprogs and proc-macros.

Since we are setting the linker to `HOSTCC`, we set the linker flavor to
`gcc` explicitly. The linker-flavor selects both which linker to search
for if the linker is unset, and which kind of linker flags to pass.
Without this flag, `rustc` would attempt to determine which flags to
pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
name of the linker-flavor used by `rustc` for all C compilers, including
both `gcc` and `clang`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile         | 2 ++
 scripts/Makefile.host | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..da664d7aed51 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clink-args='$(subst ','\'',$(KBUILD_HOSTLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 8f7f842b54f9..08d83d9db31a 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -91,6 +91,8 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
+		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
 
-- 
2.42.0.582.g8ccd20d70d-goog

