Return-Path: <linux-kbuild+bounces-6276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00509A6B722
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 10:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 853951892E0F
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 09:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02EB1F151A;
	Fri, 21 Mar 2025 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvshrXsL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A0F1F03F4;
	Fri, 21 Mar 2025 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742548716; cv=none; b=Y6Fx0kfjezFtdL1NM8tKIFHB9EbI/D//VX6JKrItb7DCJENHU3ZHdVX+c7mEMB/odjIgDre2KlsybQDSVuIY7WedkJdOuimV8a2OPn6k1aC9esvk9bwOp1f31gzYUGXV8B7PanYogxtOKNen2FmDT7mldTAFbmeAXK8COkmy6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742548716; c=relaxed/simple;
	bh=sCW19nzrlwKLY8toSkWFitagnE2dtqdJ0NHcRxGxCRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwNCENlMfltzzgoCGvNbzK6bTRerO3xasKhhuMTv8CgljUeZHqtLquXyqgycENPuufStdvAogC6Kmn2kiufz0LFcKHayV/MulTHz1v3aZvY4hbOvf6G4AMOyHwzZL+HHbv5MOWD4n+WH7LWUj9Po7gWOSzedYJpg1jcTDQ4RK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvshrXsL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C2EC4CEE3;
	Fri, 21 Mar 2025 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742548716;
	bh=sCW19nzrlwKLY8toSkWFitagnE2dtqdJ0NHcRxGxCRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MvshrXsL5J8yEJ6pLRK7lWXDlQpuRiiBUfEKw4ftMP12zVD5aP5yTHdij+MAWeWP1
	 SQ0N4F4eCYkX8E8JlyVe/XERcI4k7Nw692OHblCm3ua3tXQluCBY8eIbeSrBuRjTiU
	 cdrX+8bSpELqMTCXrKg5fYoK77dnko4LpMvE1BKhe2Ad2FljnBJY/ezHA3KzGUs1ZO
	 blcZwsJYfoPKcnbiS2Rd9H+zjOKD5z0uevhP0VimV5+GHcwf8sboFzWaHY1qRL5Nrp
	 w2lGWomBA1aBSoUSl85GcuTzgi4inPAUw798dLjobgj8E/VABmdT9/+HMjbybPNI5E
	 p38DMWXPVmxmw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 21 Mar 2025 10:17:34 +0100
Subject: [PATCH v9 1/3] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-module-params-v3-v9-1-28b905f2e345@kernel.org>
References: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
In-Reply-To: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7742; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=sCW19nzrlwKLY8toSkWFitagnE2dtqdJ0NHcRxGxCRI=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBn3S7DDzfCvCVd1geFru40zNvER27+CDGh87Rid
 8ZQ8d4kCZeJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ90uwwAKCRDhuBo+eShj
 dzx5EAC4aQCfDTDnt/kSlqXQSLzCwxWqffOGemTbhdAQ8ny5H/SLSl5olD7LU4utIz19/0aQolP
 yBcT7cZj4rmxPddHlSH8DCxJus8SmEvlLRelVEzqlYhk64ZZYzSRc1a6Msov0juWXiOxinuq00O
 26MkNAqdHwqWi6uZ7Q7stqkTakvEe83oxnsJesTvA0BWhm5oRoabdCI4LSwX26hDYRSeXQJq88A
 3WoDVLE1mLBX/TaRmWi/FqQKIDMIDg08j36OpkUYQkj8ryZuGL5A9I2qThmfd3F1FynN1eVsIBN
 dg+Mz0HkrqJppgNjEFu2irsfCPDqdu5O/NeQQgVc/6bAf19tAo3oT/8FSIhRnzusht1XX+EpVJM
 9z/HVyoArLZB2J9fgwN/eM6AO/HDeMrUHz220HpOJ9E9gniHJP8VFmbAv9V2DqJPX2QqSFPbZ+p
 zY88MW1MHl92XKGWa9tN5NquDBHjn99e9jGjpJR2sZXAK9CveVewsAQY1tBiuQAkWhXD5DT3kLe
 l15DKHBpmbEoU1X888SsMP4r770aYODREUyJmm3+5T1BE1Yr3MB7PLllfFWAvzK8CnwMx6A09+C
 NUhD+/V7q4xFfpok6L4KmIJSmeV48xFcqBKC9easniXE2nmH7E1XADg8WfL2mEPHAoF1RgTdLFW
 BQTS6Xw7Eo/sEOg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 170 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 878111cb77bc..0bfa2c1cf942 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -946,3 +946,173 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 macro_rules! fmt {
     ($($f:tt)*) => ( core::format_args!($($f)*) )
 }
+
+pub mod parse_int {
+    //! Integer parsing functions for parsing signed and unsigned integers
+    //! potentially prefixed with `0x`, `0o`, or `0b`.
+
+    use crate::prelude::*;
+    use crate::str::BStr;
+    use core::ops::Deref;
+
+    // Make `FromStrRadix` a public type with a private name. This seals
+    // `ParseInt`, that is, prevents downstream users from implementing the
+    // trait.
+    mod private {
+        use crate::str::BStr;
+
+        /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
+        ///
+        /// # Safety
+        ///
+        /// The member functions of this trait must be implemented according to
+        /// their documentation.
+        ///
+        /// [`&BStr`]: kernel::str::BStr
+        // This is required because the `from_str_radix` function on the primitive
+        // integer types is not part of any trait.
+        pub unsafe trait FromStrRadix: Sized {
+            /// The minimum value this integer type can assume.
+            const MIN: Self;
+
+            /// Parse `src` to `Self` using radix `radix`.
+            fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
+
+            /// Return the absolute value of Self::MIN.
+            fn abs_min() -> u64;
+
+            /// Perform bitwise 2's complement on `self`.
+            ///
+            /// Note: This function does not make sense for unsigned integers.
+            fn complement(self) -> Self;
+        }
+    }
+
+    /// Extract the radix from an integer literal optionally prefixed with
+    /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
+    fn strip_radix(src: &BStr) -> (u32, &BStr) {
+        match src.deref() {
+            [b'0', b'x' | b'X', rest @ ..] => (16, rest.as_ref()),
+            [b'0', b'o' | b'O', rest @ ..] => (8, rest.as_ref()),
+            [b'0', b'b' | b'B', rest @ ..] => (2, rest.as_ref()),
+            // NOTE: We are including the leading zero to be able to parse
+            // literal 0 here. If we removed it as a radix prefix, we would not
+            // be able to parse `0`.
+            [b'0', ..] => (8, src),
+            _ => (10, src),
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
+    /// assert_eq!(Ok(0), u8::from_str(b_str!("0")));
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
+    pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
+        /// Parse a string according to the description in [`Self`].
+        fn from_str(src: &BStr) -> Result<Self> {
+            match src.deref() {
+                [b'-', rest @ ..] => {
+                    let (radix, digits) = strip_radix(rest.as_ref());
+                    // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
+                    // So if we want to parse negative numbers as positive and
+                    // later multiply by -1, we have to parse into a larger
+                    // integer. We choose u64 as sufficiently large. NOTE: 128
+                    // bit integers are not available on all platforms, hence
+                    // the choice of 64 bit.
+                    let val = u64::from_str_radix(
+                        core::str::from_utf8(digits).map_err(|_| EINVAL)?,
+                        radix,
+                    )
+                    .map_err(|_| EINVAL)?;
+
+                    if val > Self::abs_min() {
+                        return Err(EINVAL);
+                    }
+
+                    if val == Self::abs_min() {
+                        return Ok(Self::MIN);
+                    }
+
+                    // SAFETY: We checked that `val` will fit in `Self` above.
+                    let val: Self = unsafe { val.try_into().unwrap_unchecked() };
+
+                    Ok(val.complement())
+                }
+                _ => {
+                    let (radix, digits) = strip_radix(src);
+                    Self::from_str_radix(digits, radix).map_err(|_| EINVAL)
+                }
+            }
+        }
+    }
+
+    macro_rules! impl_parse_int {
+        ($ty:ty) => {
+            // SAFETY: We implement the trait according to the documentation.
+            unsafe impl private::FromStrRadix for $ty {
+                const MIN: Self = <$ty>::MIN;
+
+                fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error> {
+                    <$ty>::from_str_radix(core::str::from_utf8(src).map_err(|_| EINVAL)?, radix)
+                        .map_err(|_| EINVAL)
+                }
+
+                fn abs_min() -> u64 {
+                    #[allow(unused_comparisons)]
+                    if Self::MIN < 0 {
+                        1u64 << (Self::BITS - 1)
+                    } else {
+                        0
+                    }
+                }
+
+                fn complement(self) -> Self {
+                    (!self).wrapping_add((1 as $ty))
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



