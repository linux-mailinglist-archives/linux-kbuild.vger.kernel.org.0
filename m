Return-Path: <linux-kbuild+bounces-5113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BEF9F0B4D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A430E28350E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D82B1E1027;
	Fri, 13 Dec 2024 11:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWEZiEdu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E21E048D;
	Fri, 13 Dec 2024 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089629; cv=none; b=sz6+I8qUAXiwKCfOgLlBIEi3eO0XzzOUPTyUv+99hEADUGXAI9akn7ym4HN5EOKsZSeYpEpCh6Y6K5Xj5f7j7Kuv0m6pnuNNYYcxg4xJa6MglIxVzIVd15Z2u++TRu+DJjKyRjexLE6vI0dZitZAtclO4LMEQ4zLrK4GdQZ2daQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089629; c=relaxed/simple;
	bh=2xfkXc9JxYvg/POXeclE+sRiTUdiJ+lY/HbctFIl/tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffu++hY/nlziV5dcGh8XstRtBirDhm5QZ9BpXkvisQNiduT+EWiXsc0ZGaQ9TYsDQC1QMsUbsMgMPjBPf6ev4CHjjwN+Gs5V3WWbCjFRuWh29sg5FDjfvnURG44lXjf+fSTbUiIJagrjeY2Mm/Hm+BeUc2lTaC4VG77wXvhdr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWEZiEdu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B720C4CED0;
	Fri, 13 Dec 2024 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734089628;
	bh=2xfkXc9JxYvg/POXeclE+sRiTUdiJ+lY/HbctFIl/tI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DWEZiEdurY7hNN7EQzrIEFtjkqfVRAtHrJu2WcZmEpWS7mjW2ZoksKO+1LEf9QLc/
	 ZaexLZPa42SgSm4CbokkKlaVi+y5aeh31sE5sEHhicemfxXxIi81Q/VNEhWwSDiY7J
	 Y0MJd3OUf3nSGygxipzB3cn+KP/tNzZoY0CwJHrvWpTOVn4korNnrA1xR9WaTZtaTI
	 aRp6d5i21YKbt1TK7m5OdhKxL2GEaW9N0HVgzPPl158SXVSHAGvCPP2hbSvf4zilGt
	 IbdyW3WTwYB+JmjLMZREJ20+orBn3uXRBC8bNf1wO8H96t0NGaCRrw93EQnu9i2kXM
	 dfpN6F1dc2Tuw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 13 Dec 2024 12:30:48 +0100
Subject: [PATCH v3 3/4] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-module-params-v3-v3-3-485a015ac2cf@kernel.org>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
In-Reply-To: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5609; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=2xfkXc9JxYvg/POXeclE+sRiTUdiJ+lY/HbctFIl/tI=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnXBr4ks9NqeA8f5mQEuSCzCC6PY4bdZR32bCAb
 TRuzijQZ+KJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ1wa+AAKCRDhuBo+eShj
 d9HZD/9ibilbr3zqmM9LVDxxDzfzYAVUXADOjH5Rb42BERoRQc5JGHwavcvEYQoD1VziCE6GSYF
 2ilaVb8+XmsO459tnwAVqRehKwN5vYIQqJAi0XQc2nMytGDocV5a9m3u/qf4DBA0WuxrUYAmWwz
 MUrnfcx0QcvMprWjMnXGqR6ZfkIZIFcmD9txW7lgXKhP2ZbeQUu2Ah7pVivqCZcKl5pvgfzfNbA
 YDSFY+kSIrMtj+hSalMaEzczutQbjKp03/TMqHZuWDffHJyArzgQN4l8YQbHtL1GTn8PUo181LD
 Q9+Hj18jgEGyp8rJ7k/Xsk9KewvKqmii5bnWZqkUV+y3iymHxe6ymO7cGWXnzgYYdUL6vYbtX12
 INZhn3RJl5AP0QAt+/QBfkQfptKSQfcq7GehmvsB+ZYcxzIcm1mNeLaO04P63VRjDd0e24y9xeZ
 9oKApthTRn0eEcphrb1HXbdIDsU98WASD9dhqpcKB+FL/fdKho9UQ/GaSnYx2TOLR3nBdYtddtZ
 mZtxtFJEA8GUZ52zAXuqPRF4txi4UHpW0rNr5WEehV9D8V1FdsqFD1yN+H/ReHvYEgyMF9Q1fjD
 Hp3/pi1/CiNcEQPegqWZmm00oG9vSOfvRqMVGF0sKHKQVPKje7d5EofYA1hTP5irjOwY6y1ZDjP
 Zkmb25KN2/AFXew==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 116 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 9c446ff1ad7adba7ca09a5ae9df00fd369a32899..4da711f264397c7a1fce34edb69a71253d03911e 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -914,3 +914,119 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 macro_rules! fmt {
     ($($f:tt)*) => ( core::format_args!($($f)*) )
 }
+
+pub mod parse_int {
+    //! Integer parsing functions for parsing signed and unsigned integers
+    //! potentially prefixed with `0x`, `0o`, or `0b`.
+
+    use crate::alloc::flags;
+    use crate::prelude::*;
+    use crate::str::BStr;
+
+    /// Trait that allows parsing a `&BStr` to an integer with a radix.
+    // This is required because the `from_str_radix` function on the primitive
+    // integer types is not part of any trait.
+    pub trait FromStrRadix: Sized {
+        /// Parse `src` to `Self` using radix `radix`.
+        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
+    }
+
+    /// Extract the radix from an integer literal optionally prefixed with
+    /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
+    fn strip_radix(src: &BStr) -> (u32, &BStr) {
+        if let Some(n) = src.strip_prefix(b_str!("0x")) {
+            (16, n)
+        } else if let Some(n) = src.strip_prefix(b_str!("0X")) {
+            (16, n)
+        } else if let Some(n) = src.strip_prefix(b_str!("0o")) {
+            (8, n)
+        } else if let Some(n) = src.strip_prefix(b_str!("0O")) {
+            (8, n)
+        } else if let Some(n) = src.strip_prefix(b_str!("0b")) {
+            (2, n)
+        } else if let Some(n) = src.strip_prefix(b_str!("0B")) {
+            (2, n)
+        } else if let Some(n) = src.strip_prefix(b_str!("0")) {
+            (8, n)
+        } else {
+            (10, src)
+        }
+    }
+
+    /// Trait for parsing string representations of integers.
+    ///
+    /// Strings beginning with `0x`, `0o`, or `0b` are parsed as hex, octal, or
+    /// binary respectively. Strings beginning with `0` otherwise are parsed as
+    /// octal. Anything else is parsed as decimal. A leading `+` or `-` is also
+    /// permitted. Any string parsed by [`kstrtol()`] or [`kstrtoul()`] will be
+    /// successfully parsed.
+    ///
+    /// [`kstrtol()`]: https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtol
+    /// [`kstrtoul()`]: https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtoul
+    ///
+    /// # Example
+    /// ```
+    /// use kernel::str::parse_int::ParseInt;
+    /// use kernel::b_str;
+    ///
+    /// assert_eq!(Ok(0xa2u8), u8::from_str(b_str!("0xa2")));
+    /// assert_eq!(Ok(-0xa2i32), i32::from_str(b_str!("-0xa2")));
+    ///
+    /// assert_eq!(Ok(-0o57i8), i8::from_str(b_str!("-0o57")));
+    /// assert_eq!(Ok(0o57i8), i8::from_str(b_str!("057")));
+    ///
+    /// assert_eq!(Ok(0b1001i16), i16::from_str(b_str!("0b1001")));
+    /// assert_eq!(Ok(-0b1001i16), i16::from_str(b_str!("-0b1001")));
+    ///
+    /// assert_eq!(Ok(127), i8::from_str(b_str!("127")));
+    /// assert!(i8::from_str(b_str!("128")).is_err());
+    /// assert_eq!(Ok(-128), i8::from_str(b_str!("-128")));
+    /// assert!(i8::from_str(b_str!("-129")).is_err());
+    /// assert_eq!(Ok(255), u8::from_str(b_str!("255")));
+    /// assert!(u8::from_str(b_str!("256")).is_err());
+    /// ```
+    pub trait ParseInt: FromStrRadix {
+        /// Parse a string according to the description in [`Self`].
+        fn from_str(src: &BStr) -> Result<Self> {
+            match src.iter().next() {
+                None => Err(EINVAL),
+                Some(sign @ b'-') | Some(sign @ b'+') => {
+                    let (radix, digits) = strip_radix(BStr::from_bytes(&src[1..]));
+                    let mut n_digits: KVec<u8> =
+                        KVec::with_capacity(digits.len() + 1, flags::GFP_KERNEL)?;
+                    n_digits.push(*sign, flags::GFP_KERNEL)?;
+                    n_digits.extend_from_slice(digits, flags::GFP_KERNEL)?;
+                    Self::from_str_radix(BStr::from_bytes(&n_digits), radix).map_err(|_| EINVAL)
+                }
+                Some(_) => {
+                    let (radix, digits) = strip_radix(src);
+                    Self::from_str_radix(digits, radix).map_err(|_| EINVAL)
+                }
+            }
+        }
+    }
+
+    macro_rules! impl_parse_int {
+        ($ty:ty) => {
+            impl FromStrRadix for $ty {
+                fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error> {
+                    <$ty>::from_str_radix(core::str::from_utf8(src).map_err(|_| EINVAL)?, radix)
+                        .map_err(|_| EINVAL)
+                }
+            }
+
+            impl ParseInt for $ty {}
+        };
+    }
+
+    impl_parse_int!(i8);
+    impl_parse_int!(u8);
+    impl_parse_int!(i16);
+    impl_parse_int!(u16);
+    impl_parse_int!(i32);
+    impl_parse_int!(u32);
+    impl_parse_int!(i64);
+    impl_parse_int!(u64);
+    impl_parse_int!(isize);
+    impl_parse_int!(usize);
+}

-- 
2.47.0



