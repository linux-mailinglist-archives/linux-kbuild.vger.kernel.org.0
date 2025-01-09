Return-Path: <linux-kbuild+bounces-5406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7BA073D7
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 11:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FAED3A3645
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 10:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35680215F6A;
	Thu,  9 Jan 2025 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5UYGQG8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D50215F40;
	Thu,  9 Jan 2025 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420167; cv=none; b=LQK7j1sy/XqK/ex1z92fOlQlRAuMk4anVbM6DUUr3s0XMqzeyya8T02XB94fAEPAp/XqjA+GnaDXijNO2ZehO1+661XFuYOTv8inFGTHs5aUNW3A8E0W98GqsbGAyQRBIvImzaFPt+Rcw8PvbY6BgEtcCx7cQK7ES7jFZO9qK9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420167; c=relaxed/simple;
	bh=9Jvtzmz9CGw5UkzzEbTj5597T6hycLzFVKCBbyGKOEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RrVsyoH72P/wVrrMJyby3yacKjUgxS+OgzzFNgBAMiAGSZ5Pla1HslfzLDegJbTZSsW9t7Tk2o8Gewg8oe/q8jc+cDsLkBL0jd6On6/a1x7Z+eUdRisiseYawwSY0VFboWkxaWBTIVulaeXpvd4MOKgYs20mUQT7QykNPZQs8RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5UYGQG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56E4C4CED2;
	Thu,  9 Jan 2025 10:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736420165;
	bh=9Jvtzmz9CGw5UkzzEbTj5597T6hycLzFVKCBbyGKOEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r5UYGQG8di552obmkiy9rdYVHTf29MxWBw3eLLOghWPCMW8uxWneIZh6zCCN1831N
	 pVUHI3tDFQDMK7jtC9klQNMhwlf9gftjqu8oVq5u/oO4sXB/JH4QC7z5gpJyFiKNYV
	 u2tQq6XzYmnHcDbC3V0IRjk9xCQzLXmNMudtZ8BI1Yd0/wXs8WzCeRQfAVxJr27rQ7
	 zHDN4JrgRTnChtdhnrNHY0BNtRDrEUlnKT9PsPKUN6o6aaQHbV/qUaF8F4+3ZT/T7+
	 OW968HTu7lhrjPFWnzMWA07+YwMVKrKfOUrqIVOScDI1XbFnSu6yFGlLM42M6ekHKh
	 AKuqncLG70gdw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 09 Jan 2025 11:54:58 +0100
Subject: [PATCH v4 3/4] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-module-params-v3-v4-3-c208bcfbe11f@kernel.org>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
In-Reply-To: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=9Jvtzmz9CGw5UkzzEbTj5597T6hycLzFVKCBbyGKOEk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnf6sdQD7nrP2TPEcZDOjSuKs9q9tpFSF+rDJEs
 SUl+cPb7a6JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ3+rHQAKCRDhuBo+eShj
 d6LaD/4iARaBgUcCEuuwbzwPSloqofsU0Z6q1uy83BH9OyuYBDhDySvGDLGoOPH3GsVVdbmEdYP
 j4C99RDa9AeDEAsHK70RvjY/uk6qps4CQlv7p2Jo8dUtDBzPDphbLc4vNJcz+6ZCMsmDVq4cDSo
 1DE/CG/r+a4s34YnRXYmATVYwlk8ahBUekKa9us3SJGfJAc+iLlG94QaTQ+kP+/ZVR3gZet2Y0L
 NAcpdJa3/xZ847LvMneLeXxQ1netBRneRpvQax0leTyF9/fdN/Efqv048ArGuGV+fu2feQiy/hz
 zRBhoLnx5xI0N2UfqxIech7NMhFG9QWhWij9o/2gjvPYSYiWCPt/LxdsrKSxjQLXSbKIgiM0Ebq
 1BAWYmsuagDin2+u7xkk0D3HHIL9vIsRhPlaqhwVKSUdtbY4Xz6NqOQEihrc6I4qFsmG5HZVJoU
 0IcSISd8ejr+Ap3MSMckkhjLJjP8WERT4casru0ccdkWCm6jTVu+XABxolo2+ZodTIsVRHrsikN
 5ucNew0/sEuJ4A6aDTq35tMulQ3uCzbX22HsvsJZP8M78AsiLvhnh5bjox6FII4dBJ1doKxBOL5
 zFRKRjItkB1qqSFsNmkMurwfFcxeQRRZs2mPfaCrJgDyPZLSXFfFtRaObkElhGlhlOutA8meNe3
 PHljkXwhjst3JDg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 9c446ff1ad7adba7ca09a5ae9df00fd369a32899..14da40213f9eafa07a104eba3129efe07c8343f3 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -914,3 +914,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
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
+    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
+    ///
+    /// [`&BStr`]: kernel::str::BStr
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



