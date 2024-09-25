Return-Path: <linux-kbuild+bounces-3728-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD50198552D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 10:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C532816E4
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 08:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8F0159596;
	Wed, 25 Sep 2024 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OdEfavn7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5280F1598E9
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251830; cv=none; b=g9Qguks2QmDz4B/opsgWxBmPRQTK6AUpKYDebMQRG9NLygg0qappHgf2JsEY7ALm/LxMPSTQ/Hz0CO14sJ67lgtFkzJeZpkGXPoz2a/8jrtCVz+EgGSsqDRd+3ZHG2Vys77IaAzPF4V2/pWzGc9XkO6XMXOkJx38BX9yZHocEZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251830; c=relaxed/simple;
	bh=B/1993ysDmQNNhtX5Rg233PtOJBfcm30ryXVXcMGEhQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iPw+GupKLpWiyud8dFGQkTcSvV3hfnp9S1bnnzHdkLVBPGtXCq5VB2zIQCzP1w0vQtO4J+JwqIpJ0q6KkPdNNFiyV+bSeWgS4JaC0Q0f9ktapP0335TwKUye5SMw1gWKUWlOL8HjJF2gB9AwgshzrmMTSZu7GfsUTgL2OTiEBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OdEfavn7; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e163641feb9so1661000276.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 01:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727251827; x=1727856627; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=53by2NxAwupjORg26RSnLD5EFIBSE3pYXAK2QJq5NTI=;
        b=OdEfavn7qP66+Ml0VxeeWndGPDkD95DnKCJofO45APScf6Itq7UeXGwKdzun663rmf
         0sYsLBOPyZVbTJ5vGpVYxVkXB0d/08582u3p82dqi+LdqqPiS92WiTRBMQ0XThS14NAZ
         UbTbqvX/GZY+QVhUs+ncsOVuroLSwIKweAedtA1Fg9eFn8Sd43BzfkY0SS/Bt6W4C/Pk
         1qTM0sD6qA9s77f3s0eiUXFJ+yTV4Sh5YY0zQ5fywXVze7Cf87jKc2thKPP1RekRnrzj
         ZCjQWV9ha8lTPSF2FKIHGya5aSa720dOnkumEhe1bXmLK7G/O2/KMsom8YhloA0rYdOX
         faKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251827; x=1727856627;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53by2NxAwupjORg26RSnLD5EFIBSE3pYXAK2QJq5NTI=;
        b=E8dXbdOuesBR/YNOHZGIX1EjcTAx8b9stfAoTWnKhekxjznGR76vY4IimIxPx3B3JV
         hk0koaMQPmYMfX2t84D4V0Btf9BcP6V/OsH6xC3lR7DnR8rS5ZvBkDJngSOHTBa7pQip
         16vDz6ji2c0sfZd/OSQRo/+gp7aiGlcovAQj9z72L6p1OIg9cH9N0wXqncUGoB1MOIsy
         8Hsa+qlCNAoEPoqbvUbf7GqfvJTlGMAzhK7fUCWk3xjmuSI2FuO+5TwPrH+sNMBCQ/Jj
         FaoBZzyjrd51elNrJOAfDbgjA0QvaVidt1+D80+9z7ibQ+Iv17l8nD9AhoYHk3Jl4pTW
         fzkw==
X-Forwarded-Encrypted: i=1; AJvYcCWtjszGQN9NCR+QSRbFAHv/gVXOUWM4Gg4Smer8SbUKQeb+VxbNmSEbZ8MWc08HPRsI1LzJD1Wk5hA6ISU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVA4DavxFFcWiv6lSF8RYF8rZJPJj5cXpU0PZ59zZS7BBAHzBQ
	VNpT/QiCL7B9P3jll9JAKHpXxawNx2MG7BDzLvBIhNkBe8ObNPkRl11Y6DTm7SLKZ5LrW1tBbz0
	VnSc/u1Fp3LGLsg==
X-Google-Smtp-Source: AGHT+IErno4QjSVCiQY/x0ZBglpUga9kOX+6kScCRNzmqDrrXSIcdnKg0oap5Mj+eQuF2zzkR4EoutcYWEdcYs0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:289:b0:e0b:f6aa:8088 with SMTP
 id 3f1490d57ef6-e24d38351f5mr25592276.1.1727251827170; Wed, 25 Sep 2024
 01:10:27 -0700 (PDT)
Date: Wed, 25 Sep 2024 08:10:18 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGrF82YC/x2MSQqAMAwAvyI5G9DWBf2KeCgxahCjtCBC6d8tH
 mdgJkJgLxxgLCJ4fiTIpRnqsgDanW6MsmQGU5mmGkyDtArq5U88XHCKq7zY19aarmuJWoIc3p6 z/qfTnNIHIwhoo2QAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5295; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=B/1993ysDmQNNhtX5Rg233PtOJBfcm30ryXVXcMGEhQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm88VwwmmqXYAgGo6vgR40GfyvFkQv9Bs303oAW
 dAD4xxOeiWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvPFcAAKCRAEWL7uWMY5
 RpT+EACvRQ4HKQFC6qHo4YsLWe4b5aa/UKfaTZ0hGTRTO3sS3r6oeo+lZRLSlwgs8RO855+KnEx
 xcFsy0ymQsNPqeBgAjFlqtkyYesXotcvPCD5XmEO50Yz3h/7Tz8boEIbCgJ9M9L4Azqpkh11blM
 eirE1mgv9mJNQKnLzeOpyvHflwLdJJn/ZBjyL/X/uFmDGPpjGC1PjXSLq4fPztMqs5A739msSmS
 18hUwHhOarZS6DSLs56dNPg2TJzB5plj9jN5jEz4g3SeAhqDEOblikPD6HC/tvKEBQDwnwG2wQY
 fNry9DlrVMjGwrkgAyOYm/c/bOK78gBgje/2UvIsO184WwRvrczlJLE901hkE14NGquuimcpkKy
 7GgYINbJT8339LsY8QYSmcZTu2rKTJ4Av47Jkfp2q0ZbkK7Ya+eUN10p6zZegUp1xWGSlYa8hEu
 hpfCGjCsr8oGPksxKCdVatrC9Hzwa8Xyc1dCT8k9E63zCSu7DeSnUEd3LuI1zHBxaX4Z7O8npTL
 A3Ib4qc5rRp9/Gs602H8GUObybb3ZRn6716AO736fgb1rIb0K3OLncE+/8hT4E9pdLdWJ0rDJkx
 CXzwQwi0BcMfUQNuiaqKaIgBioeH3Q4rvMlLBON7OnmlhnatFzYkv8w1NHr+ueAsSDQcSUiCN61 be3BViL6By+rXxg==
X-Mailer: b4 0.13.0
Message-ID: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>
Subject: [PATCH] cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There is a bug in the LLVM implementation of KASAN and GCOV that makes
these options incompatible with the CFI_ICALL_NORMALIZE_INTEGERS option.

The bug has already been fixed in llvm/clang [1] and rustc [2]. However,
Kconfig currently has no way to gate features on the LLVM version inside
rustc, so we cannot write down a precise `depends on` clause in this
case. Instead, a `def_bool` option is defined for whether
CFI_ICALL_NORMALIZE_INTEGERS is available, and its default value is set
to false when GCOV or KASAN are turned on. End users using a patched
clang/rustc can turn on the HAVE_CFI_ICALL_NORMALIZE_INTEGERS option
directly to override this.

An alternative solution is to inspect a binary created by clang or rustc
to see whether the faulty CFI tags are in the binary. This would be a
precise check, but it would involve hard-coding the *hashed* version of
the CFI tag. This is because there's no way to get clang or rustc to
output the unhased version of the CFI tag. Relying on the precise
hashing algorithm using by CFI seems too fragile, so I have not pursued
this option. Besides, this kind of hack is exactly what lead to the LLVM
bug in the first place.

If the CFI_ICALL_NORMALIZE_INTEGERS option is used without CONFIG_RUST,
then we actually can perform a precise check today: just compare the
clang version number. This works since clang and llvm are always updated
in lockstep. However, encoding this in Kconfig would give the
HAVE_CFI_ICALL_NORMALIZE_INTEGERS option a dependency on CONFIG_RUST,
which is not possible as the reverse dependency already exists.

HAVE_CFI_ICALL_NORMALIZE_INTEGERS is defined to be a `def_bool` instead
of `bool` to avoid asking end users whether they want to turn on the
option. Turning it on explicitly is something only experts should do, so
making it hard to do so is not an issue.

I added a `depends on CFI_CLANG` clause to the new Kconfig option. I'm
not sure whether that makes sense or not, but it doesn't seem to make a
big difference.

In a future kernel release, I would like to add a Kconfig option similar
to CLANG_VERSION/RUSTC_VERSION for inspecting the version of the LLVM
inside rustc. Once that feature lands, this logic will be replaced with
a precise version check. This check is not being introduced here to
avoid introducing a new _VERSION constant in a fix.

Link: https://github.com/llvm/llvm-project/pull/104826 [1]
Link: https://github.com/rust-lang/rust/pull/129373 [2]
Fixes: ce4a2620985c ("cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202409231044.4f064459-oliver.sang@intel.com
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/Kconfig | 18 +++++++++++++++++-
 init/Kconfig |  2 +-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index ee58df8b1080..b8066bf43153 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -829,7 +829,7 @@ config CFI_CLANG
 config CFI_ICALL_NORMALIZE_INTEGERS
 	bool "Normalize CFI tags for integers"
 	depends on CFI_CLANG
-	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
+	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 	help
 	  This option normalizes the CFI tags for integer types so that all
 	  integer types of the same size and signedness receive the same CFI
@@ -842,6 +842,22 @@ config CFI_ICALL_NORMALIZE_INTEGERS
 
 	  This option is necessary for using CFI with Rust. If unsure, say N.
 
+config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
+	def_bool !GCOV_KERNEL && !KASAN
+	depends on CFI_CLANG
+	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
+	help
+	  Is CFI_ICALL_NORMALIZE_INTEGERS supported with the set of compilers
+	  currently in use?
+
+	  This option defaults to false if GCOV or KASAN is enabled, as there is
+	  an LLVM bug that makes normalized integers tags incompatible with
+	  KASAN and GCOV. Kconfig currently does not have the infrastructure to
+	  detect whether your rustc compiler contains the fix for this bug, so
+	  it is assumed that it doesn't. If your compiler has the fix, you can
+	  explicitly enable this option in your config file. The Kconfig logic
+	  needed to detect this will be added in a future kernel release.
+
 config CFI_PERMISSIVE
 	bool "Use CFI in permissive mode"
 	depends on CFI_CLANG
diff --git a/init/Kconfig b/init/Kconfig
index 4ea2a161d362..6f3f36d631f6 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1909,7 +1909,7 @@ config RUST
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
-	depends on !CFI_CLANG || RUSTC_VERSION >= 107900 && $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
+	depends on !CFI_CLANG || RUSTC_VERSION >= 107900 && HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI_CLANG
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108000
 	depends on !KASAN_SW_TAGS

---
base-commit: a2f11547052001bd448ccec81dd1e68409078fbb
change-id: 20240924-cfi-norm-kasan-fix-71332665cc5c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


