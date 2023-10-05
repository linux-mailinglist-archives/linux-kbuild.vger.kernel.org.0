Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8212D7BADC5
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Oct 2023 23:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjJEVlF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Oct 2023 17:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjJEVlE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2023 17:41:04 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184169E
        for <linux-kbuild@vger.kernel.org>; Thu,  5 Oct 2023 14:41:01 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59f8040b2ffso21576367b3.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Oct 2023 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696542060; x=1697146860; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g+0XZ4668oG273eR0HIMNtDUIA8UJt38oxH6S2htmGo=;
        b=Cja/+lghjgljbAErxlP3BwLDI3j+J2IQ5EaQVZLFZTzPtuK/hqe/R4s6xAmcLSSZ60
         qXaObCUB1yhjb1TOV0y3ffYAf0VlUkSAQfVARA6mAW0Vjn/M3NNPMHVQZ8w7VN2MZ+7Z
         wL+n0gn5ESfb+8iiYviiQtWuOdOXtDQlaNh9MLNJ7oYvkefrrPI6EPz1TO38SaN62RDC
         QGauHu8fIXek1KI26CWv1OlZ+yGwecMTMMD9oilwn0cEXNrWlz8esK3JAUdk/F9W/zVo
         x9mm6lwbLoR/f3OVZFNvXFRyPYO45I3tAzBs3u/W6dsH8DPBFMuqMqPLGwsIaNFuPbsT
         HkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696542060; x=1697146860;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+0XZ4668oG273eR0HIMNtDUIA8UJt38oxH6S2htmGo=;
        b=sBOHwhaM/8SHTwcs0QAh9KY7s2Qj3QudQygf3wnswyMewy0LJ5TDWCpwfkERqcRnD/
         NOoFUXf06azs9P4+yJD9J7atIRJDEr8k3l4nXJCeZ9ErJqY2HUi/Q508kQAJowYbacho
         ekyZVAuwhYgUNJdlbOZaYnTLVhkDwbwuSFrJV4V0XIITHGIJ1Z/M99leIEtL+zysNqG9
         lSJ0s2rnfDsFBus3Tsv6+cz8Fpy/XSzKXmmEvKc/+yFfLrLy+FGrK1DiOEGN+yAEKDVG
         cxQJWcnM6oIIT8wUrhL1W6hwKLV7dTmv5mdzdbIZzNOeqUXacb1NMhJkFFrPOhOBauei
         Zd8A==
X-Gm-Message-State: AOJu0Yzf/9sXMlXNjq2O1DYgYARjvvXdHq1DBK85C2N9hr409D6Ha4JO
        cOS3TDxSoo1QRAEuafinnhA3Ye3CzEhR
X-Google-Smtp-Source: AGHT+IH18mcFZBjno7qcVSdfTIMzXCbUraSNB9ezxjSbMDxqPIDOGA0bbTBdtYlQKSDXozX4E88C3YDA594E
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:bc47:0:b0:57a:118a:f31 with SMTP id
 b7-20020a81bc47000000b0057a118a0f31mr112123ywl.7.1696542060316; Thu, 05 Oct
 2023 14:41:00 -0700 (PDT)
Date:   Thu,  5 Oct 2023 21:39:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231005214057.759089-1-mmaurer@google.com>
Subject: [PATCH v4] rust: Respect HOSTCC when linking for host
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
        USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Edited to use escsq in both Makefiles, as per Masahiro Yamada's
suggestion.

 rust/Makefile         | 2 ++
 scripts/Makefile.host | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..2ddd821d9435 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
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
2.42.0.609.gbb76f46606-goog

