Return-Path: <linux-kbuild+bounces-5922-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1876A481C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E14AC7A87AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CF9237705;
	Thu, 27 Feb 2025 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHC7U99n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10D2376EC;
	Thu, 27 Feb 2025 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667156; cv=none; b=StAGfNOK4ovixSwnGO6rT4WKrf+4r/4vyecyC6U9ADRjE/YK8TrLKKh9aGSxBk3/DWDDt392e4sXxNPPMAMD5HfmgkPttF5uYCHOBGOamCsXwaFqi8wHyJVL9aJ1pDKCGlyESWcfKRUUj3p41mUsHK6FiyyBE6Ir1s4baX/oLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667156; c=relaxed/simple;
	bh=OySWTm574DZzpwLkR2PCYrng2IQgljsEmaIYlLs8Xyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxlNmmFJgqI/UWziCnUY+TZGnBCWVi12v4HFuGgVIPd6u0hhKhX+cvS1OJnvqnmpJ6b7KaPnqTPrktMCu6L8rR4wtmoWU/G3EL95/RGcUzUzIeKwcrx7tVLNCG2BL3fkNDXuiC8lY9SVHywF9fkYkNG+6JeyEZCTpkRfr+mxWl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHC7U99n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B32C4CEDD;
	Thu, 27 Feb 2025 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667156;
	bh=OySWTm574DZzpwLkR2PCYrng2IQgljsEmaIYlLs8Xyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kHC7U99nsxRozj7g/9YoNg8IYWqzNASaEgfu4ZBow02Hel2KROPLrHuv13oImerrP
	 qzQHU1TvlW9A4FC5x+GNRa2KUD+AwlthxxFmB+Q32fGPyauk5gJXewy4TG6DHxpZqL
	 +KoX/+lbdh6hz9JsEJ/oZbyurme2bHY0rvzLKWQkX7S3z5sLlImQA12SuXpBH1cb4l
	 hVJkDKI9F+5gmDFVp21rkl9TTQLJMgL0pQrK5w89gzqRx9GQCMgb3vwFjFdvxk/BeP
	 0WRFyGciE2aR3HsCjwTgmRgxUBdepeLcjwhj0JfE2Y97gZM2M6u3FzBGFgutc5eF1o
	 tJB9AWXVfzl2g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 27 Feb 2025 15:38:11 +0100
Subject: [PATCH v8 5/7] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-module-params-v3-v8-5-ceeee85d9347@kernel.org>
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
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
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7204; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=OySWTm574DZzpwLkR2PCYrng2IQgljsEmaIYlLs8Xyo=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjUkFkn16gv6H6LSf5baz2a8g4LO8GjvKcTZ
 RpaXPyAxDSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B41AAKCRDhuBo+eShj
 d+71EACdd9f5nUxDwGR7GWeaetwlMaQ93Fwv/l6kSFTxk16CXgrqRfha3ndVq/GZUQTEe/ebE0D
 nSa6PxAUmrwZzUa9nmqmplONPZ4rDcS+VIVWWCF73g+qIBH5f2VsLPVseSrAb/eMkTcdTQBkRDA
 6ah/H0aHBKmkNWe+8Ofa/VAKUyOxi/H9YwJ+2WQYkirirOzoFbfoeJgNgRqjt1rtvvquAkv53fy
 w4jImwfbzGoKEsT0ZN38BxLf9A1eBGyvxgBV50SCGmHn1IVEaMWa4+VZIIAV51LF4ssHWfbSoiA
 9WkqfSf6h7UPHaaq+vTtb05wnokNW2K42hAZQAfMApd/rgLTwG//KZdUHy4lppCPip1corEbG/O
 aCFtC3+XRBfMSH3pYNokfx3gdV/TSz3wuIMpscHlrtaihoUIP0UWtcDL46gcTZat8zpgsF1L6sx
 Ba63Al9f99Vo58m/ygh8NY2cs+W5uYHoBWl2o9x/NH/xuhgZzqAqt7pPNezK2oiC4K1p1Anv3nl
 IS1DhVUIr3cwRBggDds3B6keDarqLW+TsTpT6He2/+kmaBNO7B310KkOX8f6H7kS7UCSSsvmRPH
 0AC8/wC2p7B4DFYpbciuLGAAUjqTuXb0MIT2xOJ77KPPJc7lmdjOMLKYiPuMA5vWt7gRdtOLGRv
 g1tVJEtzNA/Pcdg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 155 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index db272d2198fc..a708cf219348 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -945,3 +945,158 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
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
+        /// [`&BStr`]: kernel::str::BStr
+        // This is required because the `from_str_radix` function on the primitive
+        // integer types is not part of any trait.
+        pub trait FromStrRadix: Sized {
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
+            impl private::FromStrRadix for $ty {
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



