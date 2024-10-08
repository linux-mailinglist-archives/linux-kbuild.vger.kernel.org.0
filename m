Return-Path: <linux-kbuild+bounces-3947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C699955AD
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 19:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4161F212F3
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 17:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138C820605F;
	Tue,  8 Oct 2024 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mmSRVWTe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF5613BC2F
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408775; cv=none; b=r6hZbus54XDyfpguK0ZY3TyfGZtN44gh9W4PqLDOW/PVO2URLgMkWHRrT+9L5Ru1RsvKJKpXAckdwFfGuG3A86SVQiNhaHpSkt3WHX6PdEce4fguxLeuIyX25RM3UrfLPo430JTZk0EfX2cb0q0qjexcMdCqy23S8iPgqR6DYnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408775; c=relaxed/simple;
	bh=z7EQ2ig9cjE6D99U3+xtPYCE3cc+3J+C5Qs8yl9IAXc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C3ih0YrWAKEeSDlMqz4ngLumDSm4QyyloxNGtmhIoMdeD1FCqeY3Etjc2XX42yXx3hMcFeZq4qhFDO2v51CrN/Zeqm3XqydinOF3HRPin6NJOmmgNJVB4c1GszH1mrT8kyYbtWLSX1Ds4OcpL8Fyrsdo9BavkmoJgJAFxxaFACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mmSRVWTe; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so1329048276.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 10:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728408772; x=1729013572; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K9V3+KdjHbhSzCFcQ9VsqfbZ9dT/SRjHShMTAr1Mnns=;
        b=mmSRVWTePN0ioJEksU5DfA/zdID/HbSRMJa8jW7Au/oUsBw8xOV0wHjHaPLXmPSNdo
         TJzckne79mCuOXFuV+PBIvx6Dn8X49eehpZaiBCbsUImSJC0WXg1DS+ixkuLtOli4K1x
         Uv97wyhHhDYmjTn7tp4eWzgPICGAzAFYe5eIwu4/pcb5+qDUi7A0cMV7TsD8nUuLqiKy
         l+pGYOu3UOIYp9oT1xtiPiscKjAFwvi+p01uQ9srtOx+NeCWH8D/7844RIcpg0Hzv99R
         IAgyw0aBvChFCnws+mKsynGd87dR4EKwNDXKRYUXnIJhI8zShKYdBvMhXtMsHrkBAA8D
         AXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728408772; x=1729013572;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9V3+KdjHbhSzCFcQ9VsqfbZ9dT/SRjHShMTAr1Mnns=;
        b=hsOJdpov2FbrLsRy9dOlcEAVOCz+0C8cdUtlGsKyDVxqugFgCvwPzcO/dYRdXo5RzD
         Vc0WVeRp6FMlYJhyahTrfSLLHPnDUbVdXcVmUpO5gaY/+SchIrjXZW9CHh0L5iXJVLC+
         Osxf9IVMbj+JR9AHuDzttN3ifj7diC8pUeD+2kFa1Z5AKSsMBJ1G237gGclEEcXv5+LI
         YzB4M7XGkWf0dIVHjK8LXIzuzx5xqUMUAXDFBobdp7jyyOqc2IZh/HmW8llGXHGlwWfH
         gsvY+Gf8K+DRSOC+7yziVnl/cKXgD7G1e9a3EwaHhbhz+TE5+DmwSpgMPmPZ4Di0ftr4
         1/cg==
X-Forwarded-Encrypted: i=1; AJvYcCWO1c1ya4L9qgcGwNxtVZ86KpeJas3NS6zV/TePcmLbid3MkChi/f464vxmgSlyREmYhDv2GCvl2TkzwLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSyrZ2JzfwQfDcGRg/CMKcgaG8/oOq1vJOxmXwyRsZxqpXPAtL
	2Ax2tO+lDbu6VLZnivZz5Ss0Ad4+n5RRHPo8Dpi63pQvIOHSxVYmF15wv8ICxQadZBJauk3uBo2
	uvp9QtYd2D6jkAw==
X-Google-Smtp-Source: AGHT+IFbafOWdlfZ9N2QUOG3z6snGs4EAIlosLdm8iUthl9i/lxwZzLY1Ty4ETXaz8NvjfdITcEa/v6JPfUVS1o=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:dcc7:0:b0:e28:f19c:fd4 with SMTP id
 3f1490d57ef6-e28f19c1259mr1592276.11.1728408772240; Tue, 08 Oct 2024 10:32:52
 -0700 (PDT)
Date: Tue, 08 Oct 2024 17:32:33 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALBsBWcC/4WNQQ6CMBBFr0Jm7ZhORVBW3sOwoGUKTZQhbSUaw
 t2tXMDl+/n//RUiB88RmmKFwIuPXqYM+lCAHbtpYPR9ZtBKl6TUBcMrJosyp1xEI5JiCt2Mlar
 5bNyJqLSQx3Ng59+7+N5mHn1MEj77z0K/9K9yISS8slGVrqgvXX0bRIYHH608od227QuYMio0v QAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3950; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=z7EQ2ig9cjE6D99U3+xtPYCE3cc+3J+C5Qs8yl9IAXc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnBWy7jrn2VYOgx95pcs0nykyBeqFL0iliRor7J
 CboJ0lOYAKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwVsuwAKCRAEWL7uWMY5
 Rg8ED/9IPvLoJkBpTeX1lQPOD9mPWHoqPar9tLDvdYbO6zNfpcL815e4RfblxSHw9KEmb53yAVF
 zTGz/NQTjq0DizAFP6NFqFzOpwXrRLCnmxDykeRsGn2Qoreby0/JQMkTRzEdVkj3NCa5UkEr4nR
 fLlqnqSKfSRSehHwEsvD1tF/O0ZcuKtTG+i0TKv0Soi7kPHk5QZLPzQsGfUAEsMcFqj8R1/mopC
 GJQxb/BhbjJ55lLppSMUg4qXyj9ZcB6kk+aKhDb2bc8nGv3BTyvoCIcjE+/zTIm8yVD5l3Ra69/
 mT04VbHmh4a/1CUUFmjykGVCeKydZ21rkWReoRKYEMmKj5NQR0f77NaRJ096JW894sYAqcNOz3j
 U9HAPb6YSzIgvYlGuVVFhHA5C+hJJvRBHmLZf8zgCYZUZcAN4Xxqsjdq+opYqFi9zFbCvdaLYmw
 sLhcA5bEIrtYY+rKBH0vkBa0SE41azadeqC2mCSk53ahIXOpL1LzLziVvn4aoepUG0q/oS3uake
 OgSmMzNfPvzhmDZT7yxUUNxOykb9O9tLEpLdB3W1UFWdDMiWxxruLWWy6YbN+JhbtofHbPRqwhE
 pgUovIZIFkfB2J2omtWQ3pOurwA5PbooL9pfozenCajyy/8pC0yTLZv8OxwvWT5eER3sj/Cqu+Y ck3hQNAKND7Hiyg==
X-Mailer: b4 0.13.0
Message-ID: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
Subject: [PATCH v2] Kbuild: fix issues with rustc-option
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

The probe may also fail incorrectly with the below error message. To fix
it, the /dev/null argument is replaced with a new rust/probe.rs file
that doesn't need even the core part of the standard library.

error[E0463]: can't find crate for `std`
  |
  = note: the `aarch64-unknown-none` target may not be installed
  = help: consider downloading the target with `rustup target add aarch64-unknown-none`
  = help: consider building the standard library from source with `cargo build -Zbuild-std`

The -o and --out-dir parameters are altered to fix this warning:

	warning: ignoring --out-dir flag due to -o flag

I verified that the Kconfig version of rustc-option doesn't have the
same issues.

Fixes: c42297438aee ("kbuild: rust: Define probing macros for rustc")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Add `export` to RUSTC_BOOTSTRAP.
- Fix error about core being missing.
- Fix warning about -o flag.
- Link to v1: https://lore.kernel.org/r/20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com
---
 rust/probe.rs             | 7 +++++++
 scripts/Makefile.compiler | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/rust/probe.rs b/rust/probe.rs
new file mode 100644
index 000000000000..bf024e394408
--- /dev/null
+++ b/rust/probe.rs
@@ -0,0 +1,7 @@
+//! Nearly empty file passed to rustc-option by Make.
+//!
+//! The no_core attribute is needed because rustc-option otherwise fails due to
+//! not being able to find the core part of the standard library.
+
+#![feature(no_core)]
+#![no_core]
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 057305eae85c..08d5b7177ea8 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -21,6 +21,7 @@ TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
 # automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP=$(TMPOUT)/tmp;		\
+	export RUSTC_BOOTSTRAP=1;	\
 	trap "rm -rf $(TMPOUT)" EXIT;	\
 	mkdir -p $(TMPOUT);		\
 	if ($(1)) >/dev/null 2>&1;	\
@@ -76,7 +77,7 @@ ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 # __rustc-option
 # Usage: MY_RUSTFLAGS += $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrument-coverage)
 __rustc-option = $(call try-run,\
-	$(1) $(2) $(3) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",$(3),$(4))
+	$(1) $(2) $(3) --crate-type=rlib $(srctree)/rust/probe.rs --out-dir=$$TMP,$(3),$(4))
 
 # rustc-option
 # Usage: rustflags-y += $(call rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)
@@ -86,4 +87,4 @@ rustc-option = $(call __rustc-option, $(RUSTC),\
 # rustc-option-yn
 # Usage: flag := $(call rustc-option-yn,-Cinstrument-coverage)
 rustc-option-yn = $(call try-run,\
-	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",y,n)
+	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib $(srctree)/rust/probe.rs --out-dir=$$TMP,y,n)

---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241008-rustc-option-bootstrap-607e5bf3114c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


