Return-Path: <linux-kbuild+bounces-9804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1DC81497
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38EA83A78ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5D8313E3F;
	Mon, 24 Nov 2025 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APY0OstT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10A31355A;
	Mon, 24 Nov 2025 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997549; cv=none; b=dEyOprfmCQhDoA65IDHlI8RuXlo2UzMg03PoLoqvKuqqX8ACpS7TFslklvDf+0Oo1M3EBrbYoNNbTnyAwj7dYT5kU6tz3a4CG5/S5vEXycqW8rUkovYaFsn/SyewCG8BqMAmZkpaLMyOGsw6vkqtKqy56u6fLwySXkJbA+4E/fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997549; c=relaxed/simple;
	bh=ftNkFtBoYt7uNDdSMESD1jcmUrVtwSeg8Bd6lydF1ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1z23rRLN3KnM20h+Fl+RKsOTpaupaUSePDKHdKnll/QHSHw+7qu7jyhGaz6TCKgQIA8tIB1NLTW6lnhdIq43Ap5o8tan19lKvUy9XK66bU4MompAgCGMevwDnxzsF72Fv5SgPP8zcJI+M7bZaLHB8xyv/nhU8Zek7hveEMBwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APY0OstT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7330C4CEF1;
	Mon, 24 Nov 2025 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997548;
	bh=ftNkFtBoYt7uNDdSMESD1jcmUrVtwSeg8Bd6lydF1ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=APY0OstTrkQon/azznA2KlNMW/ctRvIvIf1vJmirfS44ypiwyPGKH653mBMkLi1td
	 YS84hnR6zdShcUxZXRuCu7vFwrwc7pIYx8Cs/r/QCWV9sA2u5s9oTSua/R5bi1Z8hD
	 itLt5GUaturVVE8plBxWFSETC+Uikr7M20YUXb0OyMKS5Q2NgelsT33AMnwXmGCiEV
	 dDNM697RuQ/MBjCny/OsBE8I4w+nEAhBh/B5nxel3W3UnCUircaa8FkkqOZBuq4jlX
	 ftkdVfERhIQttHsLf0XHNkbpSduQCIv/jH5dEV3L2bJHvCIk6gXtWkzEZY5jfgn2v9
	 QoWaf5kwW7YLQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 02/20] rust: kbuild: simplify `--cfg` handling
Date: Mon, 24 Nov 2025 16:18:14 +0100
Message-ID: <20251124151837.2184382-3-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to handle `cfg`s in both `rustc` and `rust-analyzer`, and in
future commits some of those contain double quotes, which complicates
things further.

Thus, instead of removing the `--cfg ` part in the rust-analyzer
generation script, have the `*-cfgs` variables contain just the actual
`cfg`, and use that to generate the actual flags in `*-flags`.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile                     | 6 ++++--
 scripts/generate_rust_analyzer.py | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index ce1853a09d3d..9967f3457d44 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -60,8 +60,10 @@ rustdoc_test_quiet=--test-args -q
 rustdoc_test_kernel_quiet=>/dev/null
 endif
 
+cfgs-to-flags = $(patsubst %,--cfg='%',$1)
+
 core-cfgs := \
-    --cfg no_fp_fmt_parse
+    no_fp_fmt_parse
 
 core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
@@ -72,7 +74,7 @@ core-skip_flags := \
 
 core-flags := \
     --edition=$(core-edition) \
-    $(core-cfgs)
+    $(call cfgs-to-flags,$(core-cfgs))
 
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index fc27f0cca752..dedca470adc1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -15,7 +15,7 @@ def args_crates_cfgs(cfgs):
     crates_cfgs = {}
     for cfg in cfgs:
         crate, vals = cfg.split("=", 1)
-        crates_cfgs[crate] = vals.replace("--cfg", "").split()
+        crates_cfgs[crate] = vals.split()
 
     return crates_cfgs
 
-- 
2.52.0


