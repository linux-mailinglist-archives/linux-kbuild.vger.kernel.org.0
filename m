Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55857E4ED8
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 03:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjKHC1F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Nov 2023 21:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjKHC1E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2023 21:27:04 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5E610F9
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Nov 2023 18:27:02 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b02ed0f886so87131957b3.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2023 18:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699410421; x=1700015221; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mmBHeVbgKNHuHOfZRuozGvDUjC65WsrZnmNf0GH1jJ8=;
        b=GQ6V2b1f0vZ2qwu4ZKrDPbsbpfkFu3wY5UWryYoSe1XehrXsn6d/bmz1KZtGi7QRzK
         w12dSgX9SgaVuGnyBcZAR5USF0f55ABRvMhzRZWPVgoJvzWnMGIXHKF3Bq8XDVWP125+
         ULmnID2a5PFmZZOfcbJpP2zwfZRG2IHyoMl4+Mf3d87xGVnO/21bipfaMvJ5epo/GDm6
         Hs+L53ndTEr8ihh37c2YU1CqoCQnRWnOQEJqcAMi0sbH27HwP7gqYf/8ZfSwsYQ6D0D8
         rAtVNmKHU0pihtI5DQwXy9ebZjZJD418tKfLQXo0YqxpWMehC2cANKMiHT809DEjjdXX
         Jb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699410421; x=1700015221;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmBHeVbgKNHuHOfZRuozGvDUjC65WsrZnmNf0GH1jJ8=;
        b=iRg2V2lJ2EQGsmnxwplKF7l6iU/ft2snkRY5xknv61VjnsQ7CifRuuXl59scAzRTtq
         OT7mt/OaliqkufdNQoFNUc3O2ANk9mv3ImsnvI+nz7clQwqeb33gcTqlCCiOJsEYTj2w
         WUzs9ZXq+qOFkr8nGcqcPMeYlWZGII2I2+ARAqztyPROLGxh/a87ekUkoRTzrpnaRnKD
         9SH1ulR3DJ7S/YqXIHz8j5Rcz1B/JDjYkumg2LNzHIZgh6zEo/69fD9Gc1HxbQdOSfBU
         bnYZHeoCmaYmgknhs2R8kSYks1zz97VZj2OOkqnkleav+iKdbU94GzyG4N2lhNdadXXD
         ZIaw==
X-Gm-Message-State: AOJu0YyJU/HXpdxJBs0bfyKVC6GQh3Lu0LWDtucWSP7mBApdj1BCZVmy
        qHo4t1H3oDyDLphxjVjNTzHr6nAdy417
X-Google-Smtp-Source: AGHT+IECz4+bSh8uY8cCPDNnMDXaxhAmpyzwgHqg6dznAyBZwRYhG/cXTmp1KeYmgM4AR3ygZTa95e/D+TiO
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a0d:db89:0:b0:5a7:ccf3:3f28 with SMTP id
 d131-20020a0ddb89000000b005a7ccf33f28mr9939ywe.0.1699410421333; Tue, 07 Nov
 2023 18:27:01 -0800 (PST)
Date:   Wed,  8 Nov 2023 02:26:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108022651.645950-2-mmaurer@google.com>
Subject: [PATCH 0/3] Support MODVERSIONS by disabling Rust modules
From:   Matthew Maurer <mmaurer@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The goal of this patch series is to allow MODVERSIONS to be turned on
alongside RUST. Gary Guo previously proposed to adjust the API to
support Rust symbols' greater length:
https://lore.kernel.org/lkml/CANiq72n4MbR+AE7eHfVQZOu26FeSttQnEEMT3Jpft+CcGwk9jw@mail.gmail.com/T/

This did not land, so I'm proposing an alternate solution - users who
want to use Rust, but who do not need Rust modules, can disable Rust
module support in order to retain modversions support. This has the
added bonus of removing exported symbols from the kernel surface if we
know they won't be used due to lack of Rust module support in the
environment.

Matthew Maurer (3):
  kconfig: Extend expr_depends_symbol to recurse
  kconfig: Add special rust_modules config option
  rust: Require RUST_MODULES for module support

 init/Kconfig               | 21 +++++++++++++++++----
 kernel/module/Kconfig      |  1 +
 rust/exports.c             |  4 ++++
 scripts/kconfig/confdata.c |  3 +++
 scripts/kconfig/expr.c     | 22 ++++++++++++++++------
 scripts/kconfig/expr.h     |  3 ++-
 scripts/kconfig/lexer.l    |  1 +
 scripts/kconfig/lkc.h      |  1 +
 scripts/kconfig/menu.c     |  9 ++++++---
 scripts/kconfig/parser.y   | 12 ++++++++++++
 scripts/kconfig/symbol.c   | 31 +++++++++++++++++++++++++++++--
 11 files changed, 92 insertions(+), 16 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog

