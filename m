Return-Path: <linux-kbuild+bounces-9948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B9C9CEA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 21:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A2F02348C9E
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 20:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1952F2F28E2;
	Tue,  2 Dec 2025 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sPDyXogn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63112DFF04
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Dec 2025 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707293; cv=none; b=J6KSuYacUmvfojYkuMo1ayrsq9qRKKjcZeyjiTDbXigcotteodpcmb9xMEHB0SbnhbVyVnAYClDWN45V4EWcTfeQMsTrfUvrrnKiqaLnFAIJ+o1EskseYU2dZixLqRN7g3F8Up4A6E3zt+Fc56QS7r0hespLeHXdt4C9pVxl78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707293; c=relaxed/simple;
	bh=DMU3lV0kK4kJNtnPc3Nty9uyb1cSSeng7zHph2BnL3I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LhbUSQD5n5Gza7jzJNNWzvubjRcTQAGF1HsDKfEinyF+3j8ppw9ox+q9B7K9dVZ6roP3z6i+bgxmQ6mWeY/xZkZZC9fytYjd7+cIugYoH3PS3Pza7P6BIT7GbTPhPoMP44crD3dF5Xady/N/oMuxvN8q8rQqCcNfJmdMX7jhSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sPDyXogn; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2b642287so3077102f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Dec 2025 12:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764707289; x=1765312089; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K+pnIulJNJt95g4PRiZ1OZGjLuh0/T2E5jVeAQXxxJo=;
        b=sPDyXognCFD4l51mmTsj6161ssHQTmYbeqD9bnvAWR5vk6znrEHZ5+EzVP7tYan+/p
         n+vXQNpA+VYgjQSJCOHbBXijU+URD9b5bHHeiegemmfy04TFAqlo3jxJGbodn7+Sj7Cc
         j5j7xH0A8Nn+XWW96C7a9oDiqKldJ1wc94pn3/1JSZkMig3UoNT/p7m2k1nnAPTEWN74
         hn/1RVjDVhnb1fWeb4F42EGsH7ICN80rJ1q+zQ6N1+WmUEcdlejZaQ07S+NXK0x3tJhQ
         wulsV6wJylLVDmdS5PpDMgcGC2RPFHKbGORfqHNVMS4nJfbkbUCH0Kom6RHeZqhm3oHC
         IlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764707289; x=1765312089;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+pnIulJNJt95g4PRiZ1OZGjLuh0/T2E5jVeAQXxxJo=;
        b=vp0LrqfjFw/YgMUC2+KeezSZ5r4/vKXKNSj9JkwX9R8GYRyqCNeCElAQ9XcdjE71Sf
         bh0yM924klcrGY+w4pcu3JO2xPLBmqWqwKIklynPdUPf/IimdCJz9dXMt4NzzaMfaE4g
         ntC4cPBnW3nWGK+0H1XQsMX8BWXvGjvX2qySkWwLVRaskR67zdcgsjdj5WqZbhR5mVOD
         qwEephSQvoFk8e45da0E9xwM3rnTVaJqKZzs8MnLVSGmdE5u3Xdamy7RIFFfqAf+BM2U
         tdIt/QZ5U3DlZZIV2nGvTzI80x4ql5s5m2kP3XzJslzGhyigK7/Jx6wtFNqkrVAZui/t
         bCDw==
X-Forwarded-Encrypted: i=1; AJvYcCXQpVgChcYXNhw7saBDNgJyAQ21qHIa0aw1FTwYSwTh308G5UaTjakwp6BuYyR66PH81Lmco1gwYSlMojQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKniFbcjKCLRxs3AhzMk8gN2UQ2CZ1CY3Ro0+ZnU7CdEwU5DO8
	sMwAbJXyAENI6t12O25ubU65SQd+1E1/CEj3AHw6HzCHMeWIzPR1IbIHKVe//V9U+qY+enYYFzu
	LosnfV00VJxgsoDaXEg==
X-Google-Smtp-Source: AGHT+IH3ZnwQuecxPwgzPlJuv0hxZRJepRnTk5tmXYQ4WU4tTZ8xIPGCG9Cfm/NQ+p0+9yexgPUvCiE9XPhmDG0=
X-Received: from wrps1.prod.google.com ([2002:adf:f801:0:b0:429:c967:33b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4743:b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-4792a6112d8mr8320595e9.21.1764707289252;
 Tue, 02 Dec 2025 12:28:09 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:55 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMtLL2kC/x2MQQqAIBQFrxJ/nZCRkl0lWlQ+80OYKEQg3T1pM
 zCLmUIZiZFpagol3Jz5ClVk29Du13BAsK1OfdcrWSE4nBwgPM6IlIUx2g120wpypBrFBMfPP5y X9/0AgS4xtWAAAAA=
X-Change-Id: 20251202-inline-helpers-996f4db65e18
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=DMU3lV0kK4kJNtnPc3Nty9uyb1cSSeng7zHph2BnL3I=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vTWsH3yDN/Q/6rER62qMlw7HA494CvIvA6k
 Xo+t+QaZICJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L0wAKCRAEWL7uWMY5
 RnOsEACnF8HBaipvKfp6mXpVRzCwiqlyfZ6QeeAmd7YfE8IRUASURdP9ijwkPSEZlU3oDOyN/3M
 lrK8WFFRMJKXhCD7lZZ+UYOaLAsmHQ9rcAEOG6j2bxASbgwRjLLekdscs9hAfZov7h/QfGfHpMb
 TF0B0c4D/9HpOeBUWNR0j/l8SNHRe8d7wURImtKNSeRtpQjJeVDLp8Iy9z4DLyLnaQ81I5RtKlr
 czGEYrJSkwqdI3mOLUTXpamSSPaCsz9MZq3CG5Ioy66L1wLwPUNFEg+kc93ovxc+VT3c08omqbY
 BSnTlURzwn5/siI2pqSiV4nURivCk672LWfNDdI61Cxi2IFwr4Qm5KvePO7Q85jaAlx1kwrshoD
 bhrA23CWhDy3lvUr1MyfjuOci46kj2FW3G26Qfg5s2aTKjfEUGSxszPb3YJaCqmjaKmopOT/tI9
 9xjVZadcgpE+jAG8EfsKe+wMsFd4kWQ8hnwQlmmmlxpjvHVx8AMi4VzOXFf7bqgKisYDmm4S+R2
 7xY6EZkX0JvLIVtKlTVJ/UJztESkroU7fuH+DHKGq5mIucS6zkMvZXiuq7Gl7lxfO45J+PRfKKS
 RYZBcTnOtuQVMwtxvDHnU09VlF8X515rNezV9L2RmoVVdHtiiYiX/6p0YOJ+Ier80bXNRRZ+Va6 pKekhjpZDMT87kw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Subject: [PATCH 0/4] Inline helpers into Rust without full LTO
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
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Currently the only way for Rust code to call a static inline function is
to go through a helper in rust/helpers/. This introduces performance
costs due to additional function calls and also clutters backtraces and
flame graphs with helper symbols.

To get rid of these helper symbols, provide functionality to inline
helpers into Rust using llvm-link. This option complements full LTO, by
being much cheaper and avoiding incompatibility with BTF.

I ran a microbenchmark showing the benefit of this. All the benchmark
does is call refcount_inc() in a loop. This was chosen since refcounting
is quite hot in Binder. The results are that Rust spends 6.35 ns per
call vs 5.73 ns per call in C. When enabling this option, the two
languages become equally fast, and disassembly confirms the exact same
machine code is used (in particular there is no call to
rust_helper_refcount_inc). Benchmarking Binder also results in an
improvement from this change.

This patch is complementary to:
https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (1):
      vmalloc: export vrealloc_node_align_noprof

Gary Guo (3):
      rust: helpers: #define __rust_helper
      kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
      build: rust: provide an option to inline C helpers into Rust

 Makefile                                  |  4 +++-
 init/Kconfig                              | 15 +++++++++++++++
 lib/Kconfig.debug                         | 15 +++++++++++++++
 mm/vmalloc.c                              |  1 +
 rust/Makefile                             | 26 ++++++++++++++++++++++----
 rust/exports.c                            |  5 ++++-
 rust/helpers/atomic.c                     |  5 -----
 rust/helpers/helpers.c                    | 31 +++++++++++++++++++++++++++++++
 scripts/Makefile.build                    |  5 ++++-
 scripts/atomic/gen-rust-atomic-helpers.sh |  5 -----
 10 files changed, 95 insertions(+), 17 deletions(-)
---
base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
change-id: 20251202-inline-helpers-996f4db65e18

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


