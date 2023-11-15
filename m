Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47FFB7DD6FC
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Oct 2023 21:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbjJaUSV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Oct 2023 16:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbjJaUSU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Oct 2023 16:18:20 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F037E6
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Oct 2023 13:18:18 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5b0c27d504fso1904187b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Oct 2023 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698783497; x=1699388297; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ztq39AVKtcPBQkDEgvD9lSUG5ylL2QPNBxZOTT2U9hc=;
        b=EGHI4CJywkrKHWz4oREJwLIPp6QyfyEiQeyA23EfZYk0zf+UB8FaTgGtnIX4Yz/5zq
         0wfaPxBX7kOFTa7t8SErD2Hdr9/BpS/09YMO+DydsO14aCCNLpEF5gRDbAdvSyeOlVqc
         UPdwDfxNFzQZxJxlIYSyVEJZg41aUPEyzyBuf8phKhuMelMvnPjr5Pz6KgLXeK4ZyOyT
         +hM/LYAkG4A9YLNg1vZwyyDl7cXlnZ1Ny2Pzc8JTvWpSyKt02vk6NaI7jNgmL1ZlNAAc
         3b2rz5CYEcRrjjIGqzCRVZFOm/ke01G8uUhp01YYpIQ64333Vi174EbMtHL1aCTM9ObF
         psUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698783497; x=1699388297;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztq39AVKtcPBQkDEgvD9lSUG5ylL2QPNBxZOTT2U9hc=;
        b=ajqbotEKYpKAYoK+z7tz/HxLGJfyEWqitWPVveA21VpV0MDkYZkOqmjYb2JowPWt5O
         ApAall+zx1zyMia2rvIs8SGbidi2VWD1LlCCU6FZ9ZQF5z/OO1Zio4khVSC25gsF3bUF
         1Wwcp+BRcX3/9rTa5KQO710aEgm/mHZlQH9B11w1ztIoWR2x6i+LZ+d4ArDmDs4z9z1O
         3+jzoBLkl9Aa7xkd1Z2m3NJPkzN8iM3copM0Ytil1nIxGZdtKMa/E15uwqSX1Yes62ZS
         PlpTw9K15tdAKuzVHOCMuyqp5NddJztwvv9PQsBUEhcVgVKPSQ4kWGS+vdWpRcrYmq0N
         FguQ==
X-Gm-Message-State: AOJu0YxbWP/CtLV9VGgR9kMON4uwE+8fN3fNy08xZV3k9NzjpWOWToE4
        sAmOCWvf5fV+KOFaNFLxcdU1mu26faHw
X-Google-Smtp-Source: AGHT+IE8r9R0/YNE2aMmXBt/5jdVEq82GPS8cQwktw+16arRhB9NYq/NvvqS8Dt8j29bFV2jrKzq4QjdO3vj
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a0d:d684:0:b0:58c:e8da:4d1a with SMTP id
 y126-20020a0dd684000000b0058ce8da4d1amr89719ywd.2.1698783497681; Tue, 31 Oct
 2023 13:18:17 -0700 (PDT)
Date:   Tue, 31 Oct 2023 20:10:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031201752.1189213-1-mmaurer@google.com>
Subject: [PATCH] rust: Suppress searching builtin sysroot
From:   Matthew Maurer <mmaurer@google.com>
To:     Jamie.Cunliffe@arm.com, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     will@kernel.org, Matthew Maurer <mmaurer@google.com>,
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

By default, if Rust is passed `--target=foo` rather than a target.json
file, it will infer a default sysroot if that component is installed. As
the proposed aarch64 support uses `aarch64-unknown-none` rather than a
target.json file, this is needed to prevent rustc from being confused
between the custom kernel sysroot and the pre-installed one.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---

This patch is prompted by the issue I encountered at
https://lore.kernel.org/all/CAGSQo01pOixiPXkW867h4vPUaAjtKtHGKhkV-rpifJvKxAf4Ww@mail.gmail.com/
but should be generically more hermetic even if we don't end up landing
that patch.

 rust/Makefile          | 1 +
 scripts/Makefile.build | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index a27f35f924ec..0403e88e19fd 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,6 +400,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
+		--sysroot=/dev/null \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
 
 rust-analyzer:
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 82e3fb19fdaf..6e4ee513cc3c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -275,6 +275,7 @@ rust_common_cmd = \
 	--extern alloc --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--crate-name $(basename $(notdir $@)) \
+	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
 # `--emit=obj`, `--emit=asm` and `--emit=llvm-ir` imply a single codegen unit
-- 
2.42.0.820.g83a721a137-goog

