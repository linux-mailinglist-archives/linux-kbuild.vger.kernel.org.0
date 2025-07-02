Return-Path: <linux-kbuild+bounces-7836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C348EAF589F
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 059424E19AE
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3193E2874E3;
	Wed,  2 Jul 2025 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3eM0DKw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F8028726B;
	Wed,  2 Jul 2025 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462376; cv=none; b=UssaUzVGDp+eFt5cMH1y8kEzF/d6zIFlh/RsANOGYFAOffL2ymown9VzEslA8o+bzEBCCH4ffLDwZp7y8C1MYLGeejj89wWDvYgV7UBNO7fMQdSAqlJ08rrsOIYMJ4duG/NE5oOS4TquijvPHyvHqnFqCqF8DL+1I/vHbsF7IMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462376; c=relaxed/simple;
	bh=L9AZcSPjf/9WKfgudNM7sFHRKU96doSlEH7lJ7L7ndQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cL5wmrHXPWMQzeKTdwf8kjUi8XdhS4d4OxLnKCUEdKRZyNsog0w4HllzitPLKi7/y4bk5h0ZiLtK7XRhVDx/QO/101ZFZjIamhrN6r0XsombqNpYgohyRXxTlnSXt/yjbc+XLlxOqYm90crAGVZedmX0eJozcxf30qhIyANjvoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3eM0DKw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43823C4CEEF;
	Wed,  2 Jul 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462375;
	bh=L9AZcSPjf/9WKfgudNM7sFHRKU96doSlEH7lJ7L7ndQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M3eM0DKwReMND1peJD0QYy5eWyAsc1j6g28SFhEUYPh9S80G34ZLC5F592mS+Q9P9
	 /TGuMMCHNJBv9mV++Eji6g+LjpONNWomUdwBUkU/Sfz2/dx2avYKnRUNvhherxMleI
	 a5TCyB2+5/oKWji/O9TIIs2TF/CHxY0WqaPnxrdFYHmzNNVMKkAT03Rad6NSMfAott
	 nALP/oYCsATeUus80bAUZ242FDzhTEi+lwtUF3jGusWlvmClHXlcVSDFggzR58jKig
	 Eb/mLkSn/ZWqLsEi8G+PeNVZ1JU1dqu8BsZEBlQf3gsvK2K5t8P6H4p23eqtcD3xk7
	 LBCCVrgVDbYRQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 02 Jul 2025 15:18:38 +0200
Subject: [PATCH v14 6/7] rust: samples: add a module parameter to the
 rust_minimal sample
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-module-params-v3-v14-6-5b1cc32311af@kernel.org>
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=L9AZcSPjf/9WKfgudNM7sFHRKU96doSlEH7lJ7L7ndQ=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoZTG3tzq3Zf/Qc1bFX4sK+CqJSzeKu+qFoLGRJ
 fSppSY5ZDuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGUxtwAKCRDhuBo+eShj
 d/EmD/4owlmnQxt/hHK/xZytuUMQikRv2PLNJ3zq5fePmu5FkXxxJ64LNEZLwLq0VyGnxwzUMq8
 6tNsEv4+QnbwCEGzuu5eC4XNpKwOj8P4LUf8ddag/CImDyEfiLb2eZa0/t7pPP3Dn2ISf8peGJy
 ePkWX/6Tv93odd39uxy8bFPKU+dIfJgCZGYwdBq5ZIdteidovptrSnfUm6Y/WQa1Y6+k/evhbcT
 7bxg4Y4Q/Awm+JIZ3xFCxoBnH7lfj/CeG+Ob5RtxvEJw4gv6zTuvH9JmCIc0cfGe9hMaSum2REK
 AvVmZVS1FIEoFthN10Jy2ZgnCRJgMObI6l1wBF+o46EW1AcuplP0KFFBTb7GRyu3NsXYmvFDIoC
 3QiGAlwRmHt+MI01eT2uqDOK5PJjFEQVtPo8Igyd8QLERXhlvVGeXgM6BrgeCCxvJV8hewo4lyY
 zJv3IMXJ09W+1lw/MDP6Rye1+XgpQBaGWslq0DJJaPBG/tBAjLuVMqQ2Dl5Ly5QWRHUvNxcxobq
 OAWtFDA+GfSbEaJVhpCxI62uNPtefNVoiS1D3jOyht20rT/8RRw8pXxStSUY1R4iczh9a11yhSF
 qGJDeAHTK/9VU9c+SFrZr/SUzLEjp0Re0dJ0NcIy5A0aC9KgvVdYGqa4BJ3jhjf0y2SHrIc0jO9
 HAhTUHT2iaKB+jA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Showcase the rust module parameter support by adding a module parameter to
the `rust_minimal` sample.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 samples/rust/rust_minimal.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 1fc7a1be6b6d..c04cc07b3249 100644
--- a/samples/rust/rust_minimal.rs
+++ b/samples/rust/rust_minimal.rs
@@ -10,6 +10,12 @@
     authors: ["Rust for Linux Contributors"],
     description: "Rust minimal sample",
     license: "GPL",
+    params: {
+        test_parameter: i64 {
+            default: 1,
+            description: "This parameter has a default of 1",
+        },
+    },
 }
 
 struct RustMinimal {
@@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Rust minimal sample (init)\n");
         pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
+        pr_info!(
+            "test_parameter: {}\n",
+            *module_parameters::test_parameter.get()
+        );
 
         let mut numbers = KVec::new();
         numbers.push(72, GFP_KERNEL)?;

-- 
2.47.2



