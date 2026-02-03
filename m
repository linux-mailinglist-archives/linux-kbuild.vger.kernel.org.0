Return-Path: <linux-kbuild+bounces-10992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAP+F5HegWmDLQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10992-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 12:40:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E3D8814
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 12:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF87F30A59E3
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 11:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48B633555B;
	Tue,  3 Feb 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XarltsKC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617802F5321
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118466; cv=none; b=q+j2LcAHXB0ie+GRLENswhIRl32mA08Yx7Y1jbmiIJgySnOtRoFXK/aJFKC8j8IDaaY+tVQL9VTl2VTTcHqr4O7+reh4r+TjfGs+MBjeNspk7vXrcVAkI8HA0mt9nl8mUXHnZRnluDSd9LtWSeFHogizVNzRc8y7/I4gybaCxRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118466; c=relaxed/simple;
	bh=r/0+9qJswzrRb/+EdDwKidCVLUWK29vWT4K+wcArP6I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=coWZg4uZATP1DopLBLJmrbENJ0XfT0NOjkSRWeWjdonGo/elpJt0TLCmL3Aie05UbUBiE90QE85Yxg1kMBJ/RJ1EPYeqvOjeDMfCZ8XQcqK3VJb9hm2GNlD79MXd9XH7MWrpXusFvZy/1cjsxjFs+w+6qwFnhpK64k2KNKuc6t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XarltsKC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4803b4e3b9eso45220465e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 03:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770118463; x=1770723263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wt6rr7j8WqJzmDBy6ebcZd6xKb6YF9nq3jIKBZXTuLo=;
        b=XarltsKCxxiWeolwhhVlgoTUX1iASSNywr4fNTII7cpN1CnHzmwcvzNFAX4TFyLGx4
         A5pM/Sl7n7MjtjrsTZ28plhi1jEppU/4PX5yPw2bh2mzHldXvspC0/9Ue3ClN4Wve2oE
         4wuMX87cS58gq0gjytq8W2zSvtM/qMX5OdlwHi56LC7mazEUGuRCXpDSiC7f05/lYuM8
         /sWRLxYEdAbZSilV6s3Zx4o1rg37B9lIlQIfVRQToo7vNJQvBKK0s2ygOmgwOqc/GiSQ
         6NFGsv/b3PdwwZDzsBsrFG8O7TaosxuwcCm7cLKcWow1zY+52ib9oXaHbDnMV0i177sW
         gdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118463; x=1770723263;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wt6rr7j8WqJzmDBy6ebcZd6xKb6YF9nq3jIKBZXTuLo=;
        b=JBdYio8Vlhy+gh1Hpv1paXG151DjudxvPVdvRJEmlOOSw4G1EqjkEhyOUjY3hZEmOS
         wwfZbK2Y5lgfilgKUYNXo3yhgCzwXusXb04VKkH3VFCSAPv3xChtFRNQjKJMe7AuH524
         MNPSD+2lx9imzTfYKZEoHwKmenOQ5oQmD8yhsTroRzgYAuHNqZDugwd2rI+mKGjCzGKh
         psfybyp668d1mPW8z9YhqUKpa2jOG0jQUR/bDskHacqsAzKKHtATuGHXZjOjZEqG3Pl9
         140RwnsYyOdBsHHfFBF98U3oj3HxEkqaLd9B1xSafw51IYo7zCibu9tWKFjhEeLXSHK+
         yngg==
X-Forwarded-Encrypted: i=1; AJvYcCXGoMBmCdq9DbLNVWTymZ/nh1XaCPUp2h9SpwoHbPxjLEKjfL/EDGSgPKA+LCcRqV0Eu1hF0bPb+N7ErLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaJSJo0qt6sdxSE8t6eZGj0fAEsV6daBs17yfQ+0/omh/y4zpF
	yInHByxOR2FPXO/9c5BEq0SaEuQY4BemXg3eCGrTwz9NrOpDSOsorWjaVtiZumrqpg5WvljJvc7
	K4BT1uKuBv8RxpUgaow==
X-Received: from wmjq2.prod.google.com ([2002:a7b:ce82:0:b0:480:3842:3532])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c20:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-482db4d84d1mr202173045e9.24.1770118462768;
 Tue, 03 Feb 2026 03:34:22 -0800 (PST)
Date: Tue, 03 Feb 2026 11:34:07 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC/dgWkC/3WMwQ7CIBAFf6XZs5hCLbY9+R+mByxb2AShAUM0D
 f8u9u7lJfOSmR0SRsIEU7NDxEyJgq8gTg0sVnmDjHRlEK3oeR1G3pFHZtFtGBMbR7le9EP2yAe o0hZxpfcRvM+VLaVXiJ+jn/nv/ZvKnLVsuI5aYdcpKdXNhGAcnpfwhLmU8gWYaqQZrQAAAA==
X-Change-Id: 20251202-inline-helpers-996f4db65e18
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=r/0+9qJswzrRb/+EdDwKidCVLUWK29vWT4K+wcArP6I=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpgd04KSDTy59pIFCvPyqmf0oiuMXWez7Ej7S0v
 Efk/14aHv6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaYHdOAAKCRAEWL7uWMY5
 RoepD/4hC0AzibWqTqtig41zWC+uqMM3eR2aWMM0i25I9KhiHYzJwp+gXTjm/sdMUtX+fmLdomD
 JOOtqTqJRgJb2M6ppRVbT6Zr16NDh2thgm6DmrBDyUDidDREkq6Ka3U57sAP8dr1LUsA4a4wOl1
 IGU4hI3u6+dqf4OaEBSnjjfLEErseNEYr090nMDDZ/uALAI68FtDhxcFDbUTcuzM5qUvAgQkEhb
 s1CRiaOYLsF5YUi+oVfF56c4X/ek8JBXcVe+oBqQQyBTdeE/twj8UzBksin0Kq5fvtOdgBXaJzi
 8mI9ffxQo2D4BrnbbBVi28EOVU0WJ31j8MKrthJHjeJKtuf7nLSMMOMcUD8wOqeB/kNXsMEHbR3
 jrhfVfvFXEqmLCU86/tLNr8sU9I4BYtjIwrjCEBwGQ9rdGzWcSE+BfVvQ8ECDNXhYSBNBramDs5
 GABnreeSJ/GWaIZajEcbzUy8pVe/IONoUyl5bwYcOTd+0Q7o13gGfv//GGGx5GzFqvu7E7WTwkd
 rJvBNgGJd8jgAI6H9e+h4K9C7POeRap4wWVkfVmisaVarpIVsNkkcvIb46ihFwBsHYSKbvEuPA3
 l6Br7+K+wySDSLflrojd8uUlpgesx82SSP1oAJb6ZVTP8iJuKc9sWSRchCqBGagigA03+NGfmuq VDWmoDGJBU6oFcg==
X-Mailer: b4 0.14.2
Message-ID: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Subject: [PATCH v2 0/3] Inline helpers into Rust without full LTO
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
	Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10992-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B89E3D8814
X-Rspamd-Action: no action

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
Changes in v2:
- Dropped merged patches.
- Generate two copies of helpers.bc, one for built-in and one for modules.
- Remove unused llvm-as tool.
- Add $(cmd_ld_single) to avoid breaking CONFIG_LTO builds (note that
  LTO does not happen over the language boundary, except for helpers).
- Improve Kconfig help message.
- Link to v1: https://lore.kernel.org/r/20251202-inline-helpers-v1-0-879dae33a66a@google.com

---
Gary Guo (3):
      kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
      rust: helpers: #define __rust_helper
      build: rust: provide an option to inline C helpers into Rust

 Makefile               |  3 ++-
 init/Kconfig           | 15 +++++++++++++++
 lib/Kconfig.debug      | 15 +++++++++++++++
 rust/Makefile          | 29 +++++++++++++++++++++++++----
 rust/exports.c         |  5 ++++-
 rust/helpers/helpers.c | 29 +++++++++++++++++++++++++++++
 scripts/Makefile.build |  7 ++++++-
 7 files changed, 96 insertions(+), 7 deletions(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20251202-inline-helpers-996f4db65e18

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


