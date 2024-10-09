Return-Path: <linux-kbuild+bounces-3994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58267996904
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87D2F283B4D
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 11:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E8B192583;
	Wed,  9 Oct 2024 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="soir9UwS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235318FC83
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Oct 2024 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728474127; cv=none; b=HoZLx8IJFQtssIAU+IHS/X6thow5lvUxmMyTXJEoza+gQ+6cEhgj2NilZ2ge5q0FbYYaMkZZsJMdeuinrJPeS+Eis1gbTGo/8WG1hJyJe/CAdtzfgFTT7PjPcBkpWbYs1U7GTv90TOZv1hTwktvP9neCKx4gSR5qhnhGYrqc2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728474127; c=relaxed/simple;
	bh=7Uieg0D9YN0oUhi2khNoBmnN7VYZC4gmWG3bo/9Mysg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DcwQ7l0WGKKnPjloQmnwETwHAtqbZVGkGRM04duCajr4McX01G5/0DZ9GcfAxfV9rC5CmarOoBMRF8MS4Bl7HowsOH5YRHpe7gUd1Og88mVAxOQGfHwqGLAD1B0kNeBiBzX+5Z/MjsftU+CZRkJKrrL60b+Lz7xhNa+MOO+Dipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=soir9UwS; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e29088a6942so98427276.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Oct 2024 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728474123; x=1729078923; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IAUuAv0vd3Anccife5Yx0gNRFmTC86lMZbLdrvvfjMc=;
        b=soir9UwSKK9f57DVN0AcUL4j7CT39G3TMV5+yKuaxpm93+v0mbMhzTa836JL2BwZtS
         u/zh2V1hygVQr+yB3svqYuUmy18wlU4DRbQgl+OpRX9atOMEcrupg9qi+C9b09TZ8qVt
         svvqj0OP16SMIm2jORFrX3cq8wTQhUdbjOZbBMy3BR9Cmn9kytpBy3nFsw/bP4Es3dgt
         ogeI4MvETB9jnbyxkn1jWjFY6mCM6gHnLrr9lhfsvBNkgaQomm5Jx6ouYmEM8G5UCMnh
         gQsg3Tx3pqQCtCi6iykXVWDtjnEGeAqOU7mfKv87bUwk10U/3uUJwTmjjvqdhEA9Ntpw
         NVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728474123; x=1729078923;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAUuAv0vd3Anccife5Yx0gNRFmTC86lMZbLdrvvfjMc=;
        b=K0t3qLoaq76aADnTiCQqBUiedDRRLewgwmD+Lb1FLU5gsmjwiATLF7cK6k134DmyaH
         bvUbwZMhdU/GAKjI1NjqyDZxQsqB+zo6I0PDIy4lL+AzvYq4ANJVV575sc7xl2GtA7tu
         ALfw723ue3A1NtqAcoi/71i/pPIU7n3zLRw0E7VtmWaFz538++7a+1IZdl9DElA25EBk
         pIaXmrPGYZ0V1cdq4W8xVgZh+B1TJgd4m5Xoa4rG8mhAYyzP9lTnCFg0DsLmoVZVQYmz
         HCBkOQC21ZXqRknIgioU2cmX+xJO1yrdmlwiSRxqzoF0NIyp7vvXxTWrXt5XLbzaOWqo
         0l6g==
X-Forwarded-Encrypted: i=1; AJvYcCUg7CtAZZgRH82K2WtFSI0yl9HkB0V7LkE2FupSJ3hzbZLxwlvXgXKHOGNwDw5D5aIKhO0ORQ1ZY0VL2Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWXpjIY3s4KMzv5hRVg9CMn06vllJTgf/4Y+/xeLRa12iri9Sy
	3pMIDklTSJ+ZQ8Rp2oBE6xxyxf9UfS7FDeC9qx32BImBIrBTN0VYbgxJsPHapUOorHu3aTcFbLG
	jl79uOGGONS2Eqg==
X-Google-Smtp-Source: AGHT+IE8cDFTbiKZLSePbNsozgBWZg48ORVxVuun56/nByjyG39usuS8gE9EIEFCP7Abz4Sa7/7aSLsIAW1lPB8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:d04c:0:b0:e05:6532:166 with SMTP id
 3f1490d57ef6-e28fe334f9fmr15138276.1.1728474123115; Wed, 09 Oct 2024 04:42:03
 -0700 (PDT)
Date: Wed, 09 Oct 2024 11:41:59 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAZsBmcC/43NwQ6CMAyA4VchOzuzDhjgyfcwHtjoYIlass1FQ
 3h3BzdPevyb9uvCAnqHgZ2KhXlMLjh65CgPBTNT/xiRuyE3k0JWIETL/TNEw2mOeZFrohii72e
 uRIO1tiVAZVg+nj1a99rhyzX35EIk/97/JNimP8kEHHiHWiipYKhscx6JxhseDd3ZZib5nyOzg wqhrnVrO1t+Oeu6fgBC19LdBQEAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4303; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7Uieg0D9YN0oUhi2khNoBmnN7VYZC4gmWG3bo/9Mysg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnBmwI9hGt3s3aP3mbnD/FZdJuKIthx/p0X1HUS
 JHguh2g8CmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwZsCAAKCRAEWL7uWMY5
 Rr9VD/9g+0YqkWNU3t4bXZNF7ZqEcm9DcGF5ItZ8HWwEjYeD9bOB9gfCiQmn25kfr/hogiJ1g06
 KXzDhkeNRLQl4H+O7/qlM4soluXqAa/+y/dtoTyHET3+mMZds9k73H5a5g7xs353tPdcTyH0RuY
 IlIce86urV74IzHda8QKtBc9xCitNMLI4wdfy3W59jlfRRvF7+TjahIkgzRv4q8EOm00Uq3q3yr
 tf3HsZ2ti6j6/NyiF3L+7tmQ4IxqxBzWnYOSI1QgtMVy3sC4qsx7e+nViJK6Li8GKJCwW6mqvBF
 7Qk2VrszyootnR0boGO/+5kZECN7T97r3eXnvG010Kor6kmFviMAnybdBqmRflpCvzGwkEZuBxm
 SsTG6RdzS9yLVfc4hRxNz/XfUbtHni8NK33e+pvd3WQDDjwOJvxpzRYZJMuEZYibwXJ70t0oz7G
 Y+8bz9nBVEh+MHn156FWxO1qkJc7Oh90azJf4yTeBWu2HM252WHrLrRAsAZft8HZGHZG4wwfWBq
 e0zZ+aeysXvR/gPhSz2dei/ztWVbnL5IDvbbJIg07b68AS4WBQseRcQqndap0zWZqpwugB4+9fR
 0OxR+VjzRdovzkpPaoNeocBsZMGd3QFj4ZfCK4rXS7cPfkKT70Wk48I0Pp6vzlhwseEX1PVtw+l U8hAmhmZZBTQY8g==
X-Mailer: b4 0.13.0
Message-ID: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
Subject: [PATCH v3] Kbuild: fix issues with rustc-option
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Fix a few different compiler errors that cause rustc-option to give
wrong results.

If KBUILD_RUSTFLAGS or the flags being tested contain any -Z flags, then
the error below is generated. The RUSTC_BOOTSTRAP environment variable
is added to fix this error.

	error: the option `Z` is only accepted on the nightly compiler
	help: consider switching to a nightly toolchain: `rustup default nightly`
	note: selecting a toolchain with `+toolchain` arguments require a rustup proxy;
	      see <https://rust-lang.github.io/rustup/concepts/index.html>
	note: for more information about Rust's stability policy, see
	      <https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-features>
	error: 1 nightly option were parsed

Note that RUSTC_BOOTSTRAP is also defined in the top-level Makefile, but
its value is unfortunately *not* inherited from the environment. That
said, this is changing as of commit 98da874c4303 ("[SV 10593] Export
variables to $(shell ...) commands"), which is part of Make 4.4.

The probe may also fail with the error message below. To fix it, the
/dev/null argument is replaced with a file containing the crate
attribute #![no_core]. The #![no_core] attribute ensures that rustc does
not look for the standard library. It's not possible to instead supply a
standard library to rustc, as we need `rustc-option` before the Rust
standard library is compiled.

	error[E0463]: can't find crate for `std`
	  |
	  = note: the `aarch64-unknown-none` target may not be installed
	  = help: consider downloading the target with `rustup target add aarch64-unknown-none`
	  = help: consider building the standard library from source with `cargo build -Zbuild-std`

The -o and --out-dir parameters are altered to fix this warning:

	warning: ignoring --out-dir flag due to -o flag

The --sysroot flag is provided as we would otherwise require it to be
present in KBUILD_RUSTFLAGS. The --emit=obj flag is used to write the
resulting rlib to /dev/null instead of writing it to a file in
$(TMPOUT).

I verified that the Kconfig version of rustc-option doesn't have the
same issues.

Fixes: c42297438aee ("kbuild: rust: Define probing macros for rustc")
Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Based on top of:
https://lore.kernel.org/r/20241009102821.2675718-1-masahiroy@kernel.org
---
Changes in v3:
- Use stdin instead of a rust/probe.rs file.
- Fix --out-dir argument.
- Move RUSTC_BOOTSTRAP to __rustc-option.
- Add --sysroot and --emit=obj flags.
- Rebase on top of [PATCH] kbuild: refactor cc-option-yn, cc-disable-warning, rust-option-yn macros
- Link to v2: https://lore.kernel.org/r/20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com

Changes in v2:
- Add `export` to RUSTC_BOOTSTRAP.
- Fix error about core being missing.
- Fix warning about -o flag.
- Link to v1: https://lore.kernel.org/r/20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com
---
 scripts/Makefile.compiler | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 73d611d383b2..e0842496d26e 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -73,8 +73,11 @@ ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 
 # __rustc-option
 # Usage: MY_RUSTFLAGS += $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrument-coverage)
+# TODO: remove RUSTC_BOOTSTRAP=1 when we raise the minimum GNU Make version to 4.4
 __rustc-option = $(call try-run,\
-	$(1) $(2) $(3) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",$(3),$(4))
+	echo '#![allow(missing_docs)]#![feature(no_core)]#![no_core]' | RUSTC_BOOTSTRAP=1\
+	$(1) --sysroot=/dev/null $(filter-out --sysroot=/dev/null,$(2)) $(3)\
+	--crate-type=rlib --out-dir=$(TMPOUT) --emit=obj=- - >/dev/null,$(3),$(4))
 
 # rustc-option
 # Usage: rustflags-y += $(call rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)

---
base-commit: 1ba227507e8459788bf0e192700347c941e3e218
change-id: 20241008-rustc-option-bootstrap-607e5bf3114c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


