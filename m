Return-Path: <linux-kbuild+bounces-3123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C744D958EC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 21:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 249D5B22263
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 19:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C05915CD7D;
	Tue, 20 Aug 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WUnDI9z0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED9915B57B
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183359; cv=none; b=Au4FzE0sxrCGh8iQge4+Jh1kigkn1m5nBc7QpNRJPtIJPDGY+a0YKjG7ddKICd7FKRpBVQpEiJdlmn6anTXMERlyUiLyyAFw/Eie6THbRyXzm1oVZxYP2DLUSh/6uliGLFRjobRowB4kvTrSr43WR5nzyzDBMaUbH+HdeNsVS88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183359; c=relaxed/simple;
	bh=GgcZBZ3py3YLrVIfBlwdZnVS+QKge2hV/IBQXET6NX0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LNycFX/LTzGPQk4ixpGiq1x0uNy0tUPkEpInHGtEsg7REkboYAU6HvICMmyw4bldDmzCkDOzeBFxrsGk8cGRCMYRHL5/HKrxorsljVqYiQJTi9VB+dXZZF78wYM+E2ceFjsAPl1S1Wu8TxW8sKI7wWEY51t/V+6Yfqn0lmXOXww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WUnDI9z0; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6643016423fso117183787b3.3
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 12:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724183356; x=1724788156; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaH1ZLIse1MjjuwT90Rd2NUzJfAssHJQQ3PmJWNR6mE=;
        b=WUnDI9z0DCX+J3E8ux89AKMCbEfDCK8YVwJyS7jHDIWOAmRqEkhtRaV52ibqvlS5Uy
         cgHpEPQ/jDJvXH3iCmux3iRyxddJy9iICHLXwjUXjNF0oHJ3RC6Jmy6dl08ARRiGLV53
         UJJ95sr7bFpGdI9aLdStYuZbpoMX9QWm3PB83/1lMwbUdA42gS4gG7lQ2Je9Vq6BTzez
         1LRqY/SPzT+M+y1MnvWYBTF34Am5DexXkdV3sgo7cbudZjEzjKzZPBWg8um7FN64pwN7
         VAi9B3bYeoqnLqGCIZYBgbx7fSYLr88pwhWiceEqBULLX3kOUVAOKDvzu02e5LGdEzhS
         M+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183356; x=1724788156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaH1ZLIse1MjjuwT90Rd2NUzJfAssHJQQ3PmJWNR6mE=;
        b=WVI6OoNWDmOdb3ccx9bZs0np15/A1+LPsERnMMWBEUQmufmdtAf/KxFJ9iRwFcK1k4
         ZOcNSzr04q45IFo96Xi8UCmwl19suVZRIzjeD1dCkwNaO/M2JBl0Gt2Cdwa6CyRr0QRT
         00Uupr9SaHVsJoV8aqE87ChiuLGlY8Y09JB/tfl0A1uV63BtPOFghhd3OlSkgEvRl3gk
         oUKdtfn6J9q8hUit1Vg63rI+Q3AtK6JwaFjnNJWrtGFSnXFu0YWYcWTBNuqAEAfwI71k
         vflZtI0edOoWTcdi/T3c03v7shzJowQbt0YSwgkCRQU2YLWf+m3aoButdqBKGv3uzoJo
         6IhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv352455+ZJ8NgpVStz4V7JmVFEzsrg/PQSNxBRkc6U2R0E5SCWiUnq3nFiCjpAlsP1X8XmpK6T5tbU4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFxD1kAhF97xLCCndbVRamJSec8+dA7RaWwU/1yXJB9fulPJu
	uyB4tgjQjw+vSQML6SI9C89OEgtF3X/pPa6WDTzSPYyTYkw4tZo3EZBGoGXDBdHB4iQz2fyExSz
	vjguRVA==
X-Google-Smtp-Source: AGHT+IF8OgALjQtKTTwFni7Lx7ggfIQZWs8ZGeUB4Cj9Y3JpdH2/tw6PpjEDsZeBYcnnz1TYn5eZQOxDFr9J
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:4813:b0:6be:9d4a:f097 with SMTP
 id 00721157ae682-6c0a0236c74mr8387b3.7.1724183356156; Tue, 20 Aug 2024
 12:49:16 -0700 (PDT)
Date: Tue, 20 Aug 2024 19:48:56 +0000
In-Reply-To: <20240820194910.187826-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240820194910.187826-2-mmaurer@google.com>
Subject: [PATCH v4 1/4] kbuild: rust: Define probing macros for rustc
From: Matthew Maurer <mmaurer@google.com>
To: andreyknvl@gmail.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: dvyukov@google.com, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Matthew Maurer <mmaurer@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Creates flag probe macro variants for `rustc`. These are helpful
because:

1. The kernel now supports a minimum `rustc` version rather than a
   single version.
2. `rustc` links against a range of LLVM revisions, occasionally even
   ones without an official release number. Since the availability of
   some Rust flags depends on which LLVM it has been linked against,
   probing is necessary.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Kconfig.include   |  8 ++++++++
 scripts/Makefile.compiler | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3ee8ecfb8c04..bdb187af45fd 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -63,3 +63,11 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
 cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
+
+# $(rustc-option,<flag>)
+# Return y if the Rust compiler supports <flag>, n otherwise
+# Calls to this should be guarded so that they are not evaluated if
+# CONFIG_RUST_IS_AVAILABLE is not set.
+# If you are testing for unstable features, consider testing RUSTC_VERSION
+# instead, as features may have different completeness while available.
+rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 92be0c9a13ee..057305eae85c 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -72,3 +72,18 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
+
+# __rustc-option
+# Usage: MY_RUSTFLAGS += $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrument-coverage)
+__rustc-option = $(call try-run,\
+	$(1) $(2) $(3) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",$(3),$(4))
+
+# rustc-option
+# Usage: rustflags-y += $(call rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)
+rustc-option = $(call __rustc-option, $(RUSTC),\
+	$(KBUILD_RUSTFLAGS),$(1),$(2))
+
+# rustc-option-yn
+# Usage: flag := $(call rustc-option-yn,-Cinstrument-coverage)
+rustc-option-yn = $(call try-run,\
+	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",y,n)
-- 
2.46.0.184.g6999bdac58-goog


