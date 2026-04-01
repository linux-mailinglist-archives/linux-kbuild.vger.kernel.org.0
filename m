Return-Path: <linux-kbuild+bounces-12476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMJTJBoJzWm3ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12476-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:01:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065B37A09C
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09FEE316F8D6
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377BA3FA5EB;
	Wed,  1 Apr 2026 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CndxmCi7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E670324B16;
	Wed,  1 Apr 2026 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044011; cv=none; b=pH3V4ck5LdCoexCbwWTS7tExcbGukFlWvnDnxzNb62iO/ITZThFqfe6fVE4/D4RToy0q20EJu0z0M5pLMC4MFPXNvp4tT3xelLApsKGbfPhHC/u8xAjPks9+xyDcn3BYPX+ufNunTYT8USuDFEeCmc7qsLwqkXXM55v/oEffI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044011; c=relaxed/simple;
	bh=e8DhGnWyulpeNMl4zQDOtzs8M6k0lQwkocXJf8Znql4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaGanF02o4RoL328QSK54zaacB8WeKzXO5+0u8d47APx4imXYGgHSsHIdUgeDFgFfv492sEwf+wvxHqcioozgmdct+ymnw+o5x9Xu2HymfOllHjg3d+DhM07giWc8jGmXHeLnEWgmhegemcSUYwuy8p06TXuOPwIqQ5RsrDMZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CndxmCi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E848C4AF0C;
	Wed,  1 Apr 2026 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044010;
	bh=e8DhGnWyulpeNMl4zQDOtzs8M6k0lQwkocXJf8Znql4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CndxmCi7THhrnhCFzhqy6KvbAgEkGaA5pYgccV/CQjuh3yuwhgtAGKi7YOptKJvyo
	 kqULk/HwSV6RulLc0BWsv4O79mDs8iMcZCf91sdFQFz50VKP0sjsIyfBh+0qQeCTdo
	 rCvPjk9C4McT1wKkvlhKcCB4WTzc75OK8oXNtoIsN5ZrjbB14gsu4pP4ZuffkXa6E+
	 GnVppQRnM/P0zARZDYa4UbsPlNPZHeWHpRT83O3pCygzfG7boiRlqXD0Fx8HTVqGdP
	 fptMVM7dF4BLILbhiF62wWFdnCWOMxzNVvxybKbvshYWAqQq96KPt5nO0sw2WFo9Bf
	 3EKqN9cfSKgzA==
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
Subject: [PATCH 04/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
Date: Wed,  1 Apr 2026 13:45:11 +0200
Message-ID: <20260401114540.30108-5-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RSPAMD_URIBL_FAIL(0.00)[rust-lang.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	TAGGED_FROM(0.00)[bounces-12476-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-lang.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3065B37A09C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the Rust version bump in place, the `RUSTC_HAS_SLICE_AS_FLATTENED`
Kconfig (automatic) option is always true.

Thus remove the option and simplify the code.

In particular, this includes removing the `slice` module which contained
the temporary slice helpers, i.e. the `AsFlattened` extension trait and
its `impl`s.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig           |  3 ---
 rust/kernel/lib.rs     |  1 -
 rust/kernel/prelude.rs |  3 ---
 rust/kernel/slice.rs   | 49 ------------------------------------------
 4 files changed, 56 deletions(-)
 delete mode 100644 rust/kernel/slice.rs

diff --git a/init/Kconfig b/init/Kconfig
index b8a1ab0d49d4..c38f49228157 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -178,9 +178,6 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
-config RUSTC_HAS_SLICE_AS_FLATTENED
-	def_bool RUSTC_VERSION >= 108000
-
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 138d846f798d..621cae75030c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -140,7 +140,6 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
-pub mod slice;
 #[cfg(CONFIG_SOC_BUS)]
 pub mod soc;
 #[doc(hidden)]
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 6a54597fa0a2..1cf051b83394 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -53,6 +53,3 @@
 pub use super::current;
 
 pub use super::uaccess::UserPtr;
-
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-pub use super::slice::AsFlattened;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
deleted file mode 100644
index ca2cde135061..000000000000
--- a/rust/kernel/slice.rs
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! Additional (and temporary) slice helpers.
-
-/// Extension trait providing a portable version of [`as_flattened`] and
-/// [`as_flattened_mut`].
-///
-/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
-/// have been stabilized and renamed from `flatten` to `as_flattened`.
-///
-/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
-/// by different methods depending on the compiler version.
-///
-/// This extension trait solves this by abstracting `as_flatten` and calling the correct method
-/// depending on the Rust version.
-///
-/// This trait can be removed once the MSRV passes 1.80.
-///
-/// [`as_flattened`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened
-/// [`as_flattened_mut`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened_mut
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-pub trait AsFlattened<T> {
-    /// Takes a `&[[T; N]]` and flattens it to a `&[T]`.
-    ///
-    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
-    ///
-    /// [`as_flattened`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened
-    fn as_flattened(&self) -> &[T];
-
-    /// Takes a `&mut [[T; N]]` and flattens it to a `&mut [T]`.
-    ///
-    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
-    ///
-    /// [`as_flattened_mut`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened_mut
-    fn as_flattened_mut(&mut self) -> &mut [T];
-}
-
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
-    #[allow(clippy::incompatible_msrv)]
-    fn as_flattened(&self) -> &[T] {
-        self.flatten()
-    }
-
-    #[allow(clippy::incompatible_msrv)]
-    fn as_flattened_mut(&mut self) -> &mut [T] {
-        self.flatten_mut()
-    }
-}
-- 
2.53.0


