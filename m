Return-Path: <linux-kbuild+bounces-2741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE3940DFC
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 11:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887751F20938
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 09:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B731974FA;
	Tue, 30 Jul 2024 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HdOmP+yf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531A196C67
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722332451; cv=none; b=Ip5dtBHFGDi+Qw1nRDa4EVF0m2673mCIKdwtnUQu9OjqD3GYB3roSuyXSyGRzVebUFf08P11pLsTYJBQJHks8v+t2q2d0ijPYwDgHoBkK00Dq7oogRIvfvx+Rvea/MAGU46xplAz2KGftmFwUGKkGLIdzwU2PlV3VlYyu9lPM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722332451; c=relaxed/simple;
	bh=A3cI2hguaSwLAyhYk7iI/X7OgJ8mJQf9Y4OLgMs18Bo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ThXHVMZ0Z9DR77bkeg3upyyk9VJMDrAYJxs7E1E2HI3H+kZw37lgKkD3lJrcU1KvzzrkpjrR1WGPcmj4BVKl4NLtIFGiKEtzshuXMLYIJBI3g+pQyIeju3Kj14BoCfDJG/NCTkd64xRnl1QlWa35cp8uGyVewwH40CHiHt6U/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HdOmP+yf; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0b5296507eso6553899276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722332449; x=1722937249; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cR2nWa9me3V0/h/7Q2Ujr3xpKLLpeeNuky2sgUKvC5o=;
        b=HdOmP+yfqfitS7OdOCZV3070JFdTq5pVdVUn7UkuTPPjg73TZQCyBZ1jtIvv2OgoML
         +rn99NhCm74nKtkudcOGLe1dM4lemZmDsMvsFV7Ng7x1p6tqGqnnG5rE+g5jqImK3Wqu
         a+NVSI8/gALEqGcariUl+yog33tgP8MNkrhTRIlIa1eEwO3roUf3nZqhAnxv1CXJae6e
         ZTh2fJ/Slv8mtaGksDixqiC4vdxv7dc2okVly5337Cx+SG93s3Rm55EzOF6gyosETeq8
         3kbzp6XkOBVlObjjiGeRrMmTYRhrj66YrY8T9Gp/xYdmCUYbINg9RQh62HOmGx7/aZR0
         950Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722332449; x=1722937249;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cR2nWa9me3V0/h/7Q2Ujr3xpKLLpeeNuky2sgUKvC5o=;
        b=H3z1a5z2GjY7/QtZcy1AW6bG7sLH/6UHktVA6h+HYLGRN1w5AhCIfYyx9cZTHm6Xqc
         lQwd2YF6mHglWvZ5g19ZAVB0BAd27Zo/ZrChk9x01LtzSAsEsDnT8vlIJXs1QkMwWxIY
         oYMDwyeqFZHVBs1nwcpti4g16zUcLlEz1aJxcDZK4aKC6itx+6LOjVMoFVoKaW2tbtny
         fOAy07cuajTZlAQwG2srjN7PFoBabHPYC6ZarAWlJpprMIdkHqDlx91D76WOyKWLfswj
         9n+SgBwFkYrZJnfwzJaFkA5vyV4sPt2BDfcAy4RcZtR72ODEPo98xJ4V+bWdAACY0qVX
         e2ew==
X-Forwarded-Encrypted: i=1; AJvYcCXo86auaqjAzo6P2bryGcR0u/cSehAw9fvBjDt4uwB6P0hPBSPg+lWIp+EXk4mgBIbnZ8Dd7JoV9OjzQtJuiV11OKDjxL6EESfYqtUU
X-Gm-Message-State: AOJu0YyW5XhS0ZNyBxnww7jiS1lrkTSg/D4fxxyxpMh6u8lJmq8g+2oF
	8r7qmnYN9JH7X4qi/7zG+51tHMoItlu69EJdFrUch6bjSMdwGSnhZ5CSBzPHxauSplj9IjHMP9M
	RaELVlnQD+egyzw==
X-Google-Smtp-Source: AGHT+IGI7oVDCNSCug5ABVUu6D5JmFYKEyApaYx+gbtysI515vov73l2r/3QnNveGXBT2X3/mxQztTIkdfFeZuk=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:2b0d:b0:e02:c619:73d with SMTP
 id 3f1490d57ef6-e0b544198d2mr488622276.5.1722332448753; Tue, 30 Jul 2024
 02:40:48 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:40:12 +0000
In-Reply-To: <20240730-kcfi-v1-0-bbb948752a30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2976; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Bc7tzTvGYJ0xMlfOL8vhUAcW9moWXAVuJHeorWuuWBQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmqLUXYjbAv7YfVwWFfN92SDQxOLtAy/WaCzGdd
 hE3ksXdCgCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqi1FwAKCRAEWL7uWMY5
 Rq6OD/0UFJQagVrWBkZmg9RytX2H/vdG56Ma4tK8XwOW462Eer56UP5HHvagJRX9+bjtWzZPYdz
 OFJ6kq3ibCrI54fimZmInN8PyPKDgatDNcHYiByHaR108MtKowSHEEN0WKcASZnhaS6FYYEpF/s
 enjWzWCa7F8g1u0UHF2W0NwT/L7aScWsKV/KZPiGAoUYPqsBRhGK5sIddtQvxYz9/ISRkV/iaYb
 EbKc1Mc9px00VEievHbkW/MuRa4feYen+cFMlCD4zYYUESSmLB2KWyrAjXX8MM4YTQpkiMwsCg1
 BCckrulk+aZhCFIy7CAb1IXVwiu22pDT9WXLS/txqGAPg6cJDbsiH6yA6GzhSq3hMRW5PKNwhgL
 s8cOHKep2YJ4GdNMkcQHhYb52+gGlqgj1o/55iQveUUnqFWQ2eq0K52JdvOquntSeV+VdIkA/fm
 PtRMxikbou6Wu9yTWByVCBfZ7gdBoptCaXhMNfYE+FisR0xXqVCvObBnJinyVclFwh4rPkvb6Q4
 39w68LHSf6+i3k55l3vYF94f1sZ7f0locb0PmOj4o2EtDzl1WdRMjcW6kQea9R5OGTbC5JCg8Pq
 M9aYtbk4wWAoRH0WfLBLTkX9atvhrU7JmLOFQqa9VVJQxAibXiUD2JIffbjElTMTPKF/84b5E88 qp48V0MSVXuh1gQ==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240730-kcfi-v1-2-bbb948752a30@google.com>
Subject: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

From: Matthew Maurer <mmaurer@google.com>

Make it possible to use the Control Flow Integrity (CFI) sanitizer when
Rust is enabled. Enabling CFI with Rust requires that CFI is configured
to normalize integer types so that all integer types of the same size
and signedness are compatible under CFI.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile                        | 7 +++++++
 init/Kconfig                    | 2 +-
 rust/Makefile                   | 2 +-
 scripts/generate_rust_target.rs | 1 +
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 484c6900337e..8d7d52f57c63 100644
--- a/Makefile
+++ b/Makefile
@@ -955,6 +955,13 @@ CC_FLAGS_CFI	:= -fsanitize=kcfi
 ifdef CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
 	CC_FLAGS_CFI	+= -fsanitize-cfi-icall-experimental-normalize-integers
 endif
+ifdef CONFIG_RUST
+	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST depends
+	# on CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
+	RS_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers
+	KBUILD_RUSTFLAGS += $(RS_FLAGS_CFI)
+	export RS_FLAGS_CFI
+endif
 KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
diff --git a/init/Kconfig b/init/Kconfig
index b0238c4b6e79..d0d3442d1756 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1905,11 +1905,11 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !CFI_CLANG
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
+	depends on !CFI_CLANG || RUSTC_VERSION >= 107900 && CFI_ICALL_NORMALIZE_INTEGERS
 	help
 	  Enables Rust support in the kernel.
 
diff --git a/rust/Makefile b/rust/Makefile
index f6b9bb946609..a2c9a3e03a23 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -305,7 +305,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
 	$(NM) -p --defined-only $< \
-		| awk '/ (T|R|D) / {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+		| awk '$$2~/(T|R|D)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index c31657380bf9..9b184099278a 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -192,6 +192,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
+        ts.push("supported-sanitizers", ["kcfi"]);
         ts.push("target-pointer-width", "64");
     } else if cfg.has("X86_32") {
         // This only works on UML, as i386 otherwise needs regparm support in rustc

-- 
2.46.0.rc1.232.g9752f9e123-goog


