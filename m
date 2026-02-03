Return-Path: <linux-kbuild+bounces-10994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k3YnOmHdgWnwLQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10994-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 12:34:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E480D86F1
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 12:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03771300BC90
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 11:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1887633A9CB;
	Tue,  3 Feb 2026 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SJwkGlHJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E33370ED
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118469; cv=none; b=dkekzsjJJqEnxRQY9EwtJCQmcY88Z3GXWxPtYUgh92LytRf7DdIvuHOP8mQbBwk7IwcvOSKGVSoNxoGK4TwqBHBjadbnbEoWed2fvVq+5wLhD89jmj9ggzs6dzV+9CiBCZtxqBNzKCGxWe89kCWnejH4zyLpLXYPvpQwnMXpWt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118469; c=relaxed/simple;
	bh=ArCa741Tr0ZegW0iFyhR+FgMhtwZFXdT5kD1PX345c8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hzUte9uc3vxYjmw/nMa1uBHDr280ZdY+YfSYGuxm4h+MDMdaOmNiLPYar6XC7sp8JUqGZ8lNCvzCH4goPPyEuRKRejLnK4oheD/A8aogOhxXz2nroEvrvteHViYbup+kqllW0wdkdtACoFh6jD91r8u0WHmjEcklqUC2Y4e5QXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SJwkGlHJ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4801e3aab32so29629155e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 03:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770118465; x=1770723265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=44BM+t61qGHb8bSQxUBenNw4K81sfYTOIHgLXsB72RY=;
        b=SJwkGlHJR7WuQTdqa23A0LFh3/dpTZGUcmsI2fctEataXU0USY4amki1iUupkLZ4sx
         Q5UeVmYjqLS5WaNiGfnbaeTqn2ZVnwW+6iTHynLChFs5WX/g+yd20b3HMCJh+/aeNrFJ
         hiQ7dWhjqMpr312fNIPr701WpxvNb3bmuQcdMAU4+Edj3PkVgehzFrX+MES0jmi00CNE
         t5lu0e+IzumtGHnq8imINbfG5gbU86bG2fr/VOJP3iHHEgdHHfIb5QgRifN8DbNkWF6u
         yGZTsJXIxOsmZXataB4MOR6Lr7+ba0m0EHyOmTRCKQk1wETpR7LXHirA4euZITehMpS+
         Fd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118465; x=1770723265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44BM+t61qGHb8bSQxUBenNw4K81sfYTOIHgLXsB72RY=;
        b=ZFnqK+A7W5qG/aMminRTWzxJNdpLGgHC0HrupL4neW2w0imExKxM9KSDgK5wwmkKkh
         P9AotHqW5mpqPHp8AyQP//uZHm608wrH8lnj8FmCytBaC6lfu8X+0sgNSORXv7dCgg4w
         EByVnygRQ7lruCSMzQrBvmEDrEIyGiC3NWIJMebdwDQPgtzSZNL5veQ6KlaM1lYVqZ5r
         PMAgLC5rzOAL7OMtsEEs7OFjn10WoszfgMKpn4CFHxOXktsmziReWtLZd9oU31CaKywv
         1h0eg3Wth6on7loWgMznYnxYvKMoKdiYPbo4CtGiMdOxehMB4qhtAAUtZcR/vIvwGWF9
         nJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtw27KQta0Hki8VOaXnwy6/I2y2/gCMXTmDP13eEv3FQ+P1CKBdahsGH2LszMfzmyBZpRqDz+qviM1+pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0gPBPG16VJK5kdAAo8NCTAs2pJ3/hxPrFiW/PPn9YhLu/GcD
	rFC5HPxDwZm1AknDEo7MGfA8JIijiP1vK8BLX7iM99EV/MlBEmlPvWM9hiSpnVLW2i4EE5KtAb7
	3CZTw1qBvZ4ga7qWK7A==
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:480:6bd0:3fcd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8115:b0:47e:e2b0:15b8 with SMTP id 5b1f17b1804b1-482db447c40mr231437485e9.4.1770118465517;
 Tue, 03 Feb 2026 03:34:25 -0800 (PST)
Date: Tue, 03 Feb 2026 11:34:09 +0000
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=c8KaIUkKoLbnzKPHztCk8a85+2NFtPPqK1S79zJ3Ew4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpgd09MDQTJ/taK3Lf49afHdmnGD/aHx2441aqI
 WiSFym9hA2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaYHdPQAKCRAEWL7uWMY5
 Rmo1EACd7QneqQSnMGd/PSyupu+WC8Qo0Dt5lLlYv+YuBAghZSMC40dNomgCxRecczFi73AtCF1
 xQWsJUbfpi0qSHg5D7b2yhKZgm2z8o97sciV2yYOLmzty/siHbIAK4DzUqZrht3LqWAF1oUQHZh
 DZQWpVnLt372AzmSfnAlngaFeryk+5Kgkrgj8VkmOsZb0f/xK52bAKdefYYqtY0NyMo+C0RtjGU
 R0X1L2Xne/PyIsIUPVchOAKrL8I3Bmwfq81tUDW2u84eHRkQXBYRNFsWIfaOqq+5mddEBNm7Wkm
 6kacZLAWeLreMRtqKFla1B9Y31g119GAB3R9NU8CDupVLiipPz+1zSJ/nYpoZ1T+G5fgYIbmfme
 isbeGXOU8NQF0ehV9rIBnZLk6SuqqYCFi0JuBAcTohsSvO2R7yEZK8mrzo8lyYW8f/WkZyokuXL
 AmxVqO2vl+gLIVAcRgScCC7Ty3xbpRkArdS/tDt+UfL5G36cKcwWR+AloosJ2L0C0AdHIGi+wwe
 T47u6O6NNstj2VJOHi1udvRWBa+KzCZjguMjfUkDTni9AoNss0l8UpkxyJVL6z02jTc8lMszCBx
 1tnhbxOr9prmPAO93SH8qQaU/DGebUpg9wIhTl0mErECRp1F0zHk5b9nINJPIm52x/kIJotfQZa GXngUhbk/tn3KQA==
X-Mailer: b4 0.14.2
Message-ID: <20260203-inline-helpers-v2-2-beb8547a03c9@google.com>
Subject: [PATCH v2 2/3] rust: helpers: #define __rust_helper
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
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10994-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E480D86F1
X-Rspamd-Action: no action

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

Most helpers already have __rust_helper specified, but there are a few
missing. The only consequence of this is that those specific helpers do
not get inlined.

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a0990bea81ebce6e99bb397ce7533..e05c6e7e4abb7e6a4c4a3a417e35022dac1d9c58 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,7 +7,36 @@
  * Sorted alphabetically.
  */
 
+#include <linux/compiler_types.h>
+
+#ifdef __BINDGEN__
+// Omit `inline` for bindgen as it ignores inline functions.
 #define __rust_helper
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
 
 #include "atomic.c"
 #include "atomic_ext.c"

-- 
2.53.0.rc1.225.gd81095ad13-goog


