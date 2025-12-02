Return-Path: <linux-kbuild+bounces-9950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F339C9CEA9
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 21:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67DEF4E3FDB
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 20:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC82F1FCA;
	Tue,  2 Dec 2025 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHaC/jli"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF22F2616
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Dec 2025 20:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707298; cv=none; b=Zbw3xgc3T6wGPUibEfkDi4vN8zKYqlpCMPpBcs5W3VSXPUMuvYgtFbhPvJK1AM1RCv3Gs5nlxJCCrNK/kXA4dBIn6Yh3gOVL8j5j37DbJpwvEwRDsfSu6NYh58DDkDvrq6Wxwlz97RykrX4GKLffUvuEbeTN/Q30CbdxbIUrRBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707298; c=relaxed/simple;
	bh=yeBX0eL+YEEo9zWpSpzNVC/hIVvpLSYTUpSpVAG9gsI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MuHbEIhz9vkg0AzH2RCxRxolqq0m3W7DhQv1EF7Pw9u0nznxnw8krXcvxU8X4M7vlNUnJPrIwaUlK1eLBT0UggdoMPg7mrg7ORpvarQhz7J6xb7h0ecBlat2sYOy+aFcPanSKse4f4VaTJ7Np2F40oeGVhcnejoc2xkWYav9ZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHaC/jli; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64097bef0e2so8012419a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Dec 2025 12:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764707292; x=1765312092; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6p+COANrRJg4iyKTRaWVzi/wMI4z3c+bFvZRqbOPrm4=;
        b=kHaC/jliomvb9Ib1C68yoUQ+HOhllmssGoXgSbmm+P+h/FUkApnWoB7J/Q8eAvnYps
         l++0yClw9aw+80DGeEiDeNAMHR/rhPdVlojmEayNEOsiV7r/gfzxThVKuDld5eCX3aoT
         J9oA+dJGN7cGRIRLj05FO6SzfjvUZ7E6rUVVDjHQ1ie24NoTEct2iWQ4PmaBkcIFPIh5
         rZJ9N/b++4KMgPxP9y9Hrwf6V44dtKE0qBADv9A0hS9CtOJJnC36qHSyPn25BL9MwUDN
         2//wqblOmNilS5XFyF7v7Xr9EEfwD4q8Aw2skCRb1XvprtYKkSHu0h7658nE8fMj4gmg
         WlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764707292; x=1765312092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6p+COANrRJg4iyKTRaWVzi/wMI4z3c+bFvZRqbOPrm4=;
        b=HuyTFmAyDWpQDZ30lk/WEjyIDmmwxc5UwMlV/pGi5oyPZQ+Ux9umF5TVKlR1R/q8FH
         Rya7hGrwuCUv0LhqkW4IJ+rny2PFBv/WpIszr0By5RslPzfwILuD31YswE7/R+zK1DFU
         p2gughf97r421aBxUPB9pNU8iff5GZrKO4ZooZeKqGCJXvX6BrvYqECUBv9UH+5nURNa
         GHzJuPntJw5u3hCrk4zywblxrYGezAztmDMlX3VyoipMwndCQnlxQkUiWjWiqObHtPFE
         ZZ1/TwIM/CGcetAVIToOyePXmxxWmMNfcw9h3dk2KLBUkeTonnVQFI7F4X3+62kqrNf8
         XRDA==
X-Forwarded-Encrypted: i=1; AJvYcCUaBQl7PUBwXm/+3aP80ujzA4XAB9YDfbofx5sHqiq+Urkat7J1XUns+PE0nAaSxgyEWbV2rZIYOV8BH+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpsrWJ03uaWMFGlMxvWiAcQNv3a/8lE4FPFvXDErSKbteNW5oo
	5DnOLroCBK4HoVYMgK0CsDEP0gTO4UhrlUGLTFSjkOLh9FKIh63m6i8aoWyGwdI9Er+Gjk6QuKA
	ILGsHe8/KBLyA3Pkkdg==
X-Google-Smtp-Source: AGHT+IHlno9/sG7/bayEdrUxcRJ+XAK+NEe9iVymOZCA9KTFp8CJ1IAcUSelacyyX3nFi5Yad+XDFFP4AwI+IlQ=
X-Received: from edaa21.prod.google.com ([2002:a05:6402:24d5:b0:640:92f5:e6fc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3584:b0:640:74f5:d9f6 with SMTP id 4fb4d7f45d1cf-64794f74e19mr816955a12.25.1764707292013;
 Tue, 02 Dec 2025 12:28:12 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:57 +0000
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4811; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ILovg7w2jH5gFOEQybF86Y3dXSsF4YeG9sZZSLyxF8g=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vXWcW4aVlMjlcTWMGU9dXcoeSC3ebU+h+yW
 gJ6gVmPh1OJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L1wAKCRAEWL7uWMY5
 RngFEACMVsbQT0Zwv8K0Ot/Yv1D0f0w7dRnqAHbcNhDHMtJMF0eKhiccoIyiC0h/BYKvRp8B5Pu
 KSeabwFIVcOwoJsWy+5R1rqIx2eJqi4leqQWKrIzXrso29P9gXpzBWdBOHwwr0PRYGZZs9eqSEp
 Ni8/A1g20ZtVifJDwYSoZtF/5PminXSIGBdm5krya3CD3v+xoirkqH8c7cd2uifxi5KrJD6qek3
 5UiQj/e4qgQTTynWcQS9YiJt+sMktrku/XQEmJXyVaDIHrxSMZoWHIYLpdeIwuiWJpPkFPmM8Ni
 UzcSlSLe2Bxh/onkCZs/OKqLm0ynAVl4fGqZIA6f3VhqaSBHVnokKZ+zij8Jdz14c35nUQN/dlr
 fvOd1oiCesg5Ish6+R3Bi9z1VNW+dWygGww6u5+rCxA0+GEIXwc1qoQir54sFgOIf+hunXFo4Ps
 uLzgkzsB6nmOXPv2xxyib9QijAdpCBZ86gSnclbCWDhA/RolFCvtuAfNdVfh8WJ1Iy0/4U/1DaE
 rITItP7ShM8YN+VXCGtruti4f6K9bW3e4z5o9gr5h2C2ODxhxNafTH018EFzRJ9GMSoZZiqSNG+
 wV0PayaQaYSr4TIzmDNriukMQuoKo6fI+++0wRf8nzwUNjnaAZu/qQppZTmL/cbdyjVfrZ8J0ZC bpyEsLN+f3zJ2gA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-2-879dae33a66a@google.com>
Subject: [PATCH 2/4] rust: helpers: #define __rust_helper
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Gary Guo <gary@garyguo.net>

Because of LLVM inling checks, it's generally not possible to inline a C
helper into Rust code, even with LTO:

* LLVM doesn't want to inline functions compiled with
  `-fno-delete-null-pointer-checks` with code compiled without. The C
  CGUs all have this enabled and Rust CGUs don't. Inlining is okay since
  this is one of the hardening features that does not change the ABI,
  and we shouldn't have null pointer dereferences in these helpers.

* LLVM doesn't want to inline functions with different list of builtins. C
  side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so
  they should be compatible, but LLVM does not perform inlining due to
  attributes mismatch.

* clang and Rust doesn't have the exact target string. Clang generates
  `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
  complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64
  always enable these features, so they are in fact the same target
  string, but LLVM doesn't understand this and so inlining is inhibited.
  This can be bypassed with `--ignore-tti-inline-compatible`, but this
  is a hidden option.

To fix this, we can add __always_inline on every helper, which skips
these LLVM inlining checks. For this purpose, introduce a new
__rust_helper macro that needs to be added to every helper.

The actual additions of __rust_helper can happen in separate patches. A
"flag day" change is not required since missing annotations do not lead
to anything worse than missing inlining.

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/atomic.c                     |  5 -----
 rust/helpers/helpers.c                    | 31 +++++++++++++++++++++++++++++++
 scripts/atomic/gen-rust-atomic-helpers.sh |  5 -----
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
index cf06b7ef9a1c559e8d7bdfc2bcd2aeb8951c29d1..a48605628ed73ac32aae2e6280481407a670e88f 100644
--- a/rust/helpers/atomic.c
+++ b/rust/helpers/atomic.c
@@ -11,11 +11,6 @@
 
 #include <linux/atomic.h>
 
-// TODO: Remove this after INLINE_HELPERS support is added.
-#ifndef __rust_helper
-#define __rust_helper
-#endif
-
 __rust_helper int
 rust_helper_atomic_read(const atomic_t *v)
 {
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 551da6c9b5064c324d6f62bafcec672c6c6f5bee..d0e2f1f9b449b2248cfbddcee1e8bf9becc8a2f9 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,37 @@
  * Sorted alphabetically.
  */
 
+#include <linux/compiler_types.h>
+
+#ifdef __BINDGEN__
+// Omit `inline` for bindgen as it ignores inline functions.
+#define __rust_helper
+#else
+// The helper functions are all inline functions.
+//
+// We use `__always_inline` here to bypass LLVM inlining checks, in case the
+// helpers are inlined directly into Rust CGUs.
+//
+// The LLVM inlining checks are false positives:
+// * LLVM doesn't want to inline functions compiled with
+//   `-fno-delete-null-pointer-checks` with code compiled without.
+//   The C CGUs all have this enabled and Rust CGUs don't. Inlining is okay
+//   since this is one of the hardening features that does not change the ABI,
+//   and we shouldn't have null pointer dereferences in these helpers.
+// * LLVM doesn't want to inline functions with different list of builtins. C
+//   side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so they
+//   should be compatible, but LLVM does not perform inlining due to attributes
+//   mismatch.
+// * clang and Rust doesn't have the exact target string. Clang generates
+//   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
+//   complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64 always
+//   enable these features, so they are in fact the same target string, but
+//   LLVM doesn't understand this and so inlining is inhibited. This can be
+//   bypassed with `--ignore-tti-inline-compatible`, but this is a hidden
+//   option.
+#define __rust_helper __always_inline
+#endif
+
 #include "atomic.c"
 #include "auxiliary.c"
 #include "barrier.c"
diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic/gen-rust-atomic-helpers.sh
index 45b1e100ed7c63108ee6cb07e48a17668f860d47..a3732153af29f415e397e17cab6e75cb5d7efafc 100755
--- a/scripts/atomic/gen-rust-atomic-helpers.sh
+++ b/scripts/atomic/gen-rust-atomic-helpers.sh
@@ -47,11 +47,6 @@ cat << EOF
 
 #include <linux/atomic.h>
 
-// TODO: Remove this after INLINE_HELPERS support is added.
-#ifndef __rust_helper
-#define __rust_helper
-#endif
-
 EOF
 
 grep '^[a-z]' "$1" | while read name meta args; do

-- 
2.52.0.158.g65b55ccf14-goog


