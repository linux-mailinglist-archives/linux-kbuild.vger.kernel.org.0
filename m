Return-Path: <linux-kbuild+bounces-12661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOQTC0/30mnjcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12661-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:59:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CB3A09D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B53D0300A39A
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13631385514;
	Sun,  5 Apr 2026 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaVpVUGO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192D3845CB;
	Sun,  5 Apr 2026 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433376; cv=none; b=RBSP8U2ZprePrnNZd+2v78ETDcN3BANo8CWEzczLMW/d8wCnGAiKZUVb8DCgbOeQspEOT3Ow1pNbK0hsKylMGZ5+7kdMJVkS6qK83+wgA3TnU0ic+joMX3eFZJfF0gBiJyd7ZS3u9dzNnbYTBblS2w7MjyMKH7XyV0DyNZhgmuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433376; c=relaxed/simple;
	bh=k9fgvKqzt3CcMjpByOnUKIVw60bYTXCQ8WCT/cyECdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUDMTq70p4g4mrTh870XnKUcJpW02pVW3vCEYUSWtPXNwW5s+mPteGAF2XxgyU+AOR24el5FmueqXl215VEIEpruxvBe66mQ3+PyDK2I3AvewOJ8fqbmXrVSLBPpd8is473hzOgeMf8eL5NCp/KyGrK1WtVEfPqvYpJeKuExI14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaVpVUGO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA99C116C6;
	Sun,  5 Apr 2026 23:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433375;
	bh=k9fgvKqzt3CcMjpByOnUKIVw60bYTXCQ8WCT/cyECdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaVpVUGO29xolVVSHHDaY6zc64XoWTVURD4wmowEYx41c+Wyvxg2ZvbRUDBr5NSQM
	 qnQ7znq5xPGmdnTPdcYVaZC7vnG5CdMVAK8esq+ZQUqP5fhEE9eEYKap4bE1TE6jn4
	 tBmF/lQcMvqLIbmPK7hFkihBrJN3xVu01fVsz+MN4SzEjt8l16fIDNn69GQncl9Yl+
	 Iz0ORhzjuBLkOlJxT/Q92ItzFvNRq1IEAlPAFGwQoUdailI/ja4qppsGHHJ+cazKlw
	 zeuH4jXdUNlzyLPBG4DfcSUb8nvgueaNnyXHPAthjZQRgSoxFxQLDP6Ba6EFq9edcZ
	 rD1Bo7j0WdTjg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 15/33] rust: macros: simplify code using `feature(extract_if)`
Date: Mon,  6 Apr 2026 01:52:51 +0200
Message-ID: <20260405235309.418950-16-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12661-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 995CB3A09D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

`feature(extract_if)` [1] was stabilized in Rust 1.87.0 [2], and the last
significant change happened in Rust 1.85.0 [3] when the range parameter
was added.

That is, with our new minimum version, we can start using the feature.

Thus simplify the code using the feature and remove the TODO comment.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net/
Link: https://github.com/rust-lang/rust/issues/43244 [1]
Link: https://github.com/rust-lang/rust/pull/137109 [2]
Link: https://github.com/rust-lang/rust/pull/133265 [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/macros/kunit.rs | 9 +++++----
 rust/macros/lib.rs   | 3 +++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..ae20ed6768f1 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,10 +87,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             continue;
         };
 
-        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
-        let before_len = f.attrs.len();
-        f.attrs.retain(|attr| !attr.path().is_ident("test"));
-        if f.attrs.len() == before_len {
+        if f.attrs
+            .extract_if(.., |attr| attr.path().is_ident("test"))
+            .count()
+            == 0
+        {
             processed_items.push(Item::Fn(f));
             continue;
         }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0c36194d9971..2cfd59e0f9e7 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -6,6 +6,9 @@
 // and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, which is
 // touched by Kconfig when the version string from the compiler changes.
 
+// Stable since Rust 1.87.0.
+#![feature(extract_if)]
+//
 // Stable since Rust 1.88.0 under a different name, `proc_macro_span_file`,
 // which was added in Rust 1.88.0. This is why `cfg_attr` is used here, i.e.
 // to avoid depending on the full `proc_macro_span` on Rust >= 1.88.0.
-- 
2.53.0


