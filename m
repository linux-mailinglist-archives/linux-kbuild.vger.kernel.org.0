Return-Path: <linux-kbuild+bounces-6864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD3AA716C
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7091BC5B3B
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 12:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF10F253B65;
	Fri,  2 May 2025 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I33FC9Ap"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B4C22578C;
	Fri,  2 May 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188227; cv=none; b=cr3yqeBdL2VLKGfj0kmvWCucy8QN3eTGSayIGW/hC4nnjDgW+Eff13m7eiHGCod2pvPTosbPPn3r2bgUHheRA22bDhGKWBmHCMzrwVq0GRp7PVlgNI+6yY24swOX/5Qsjr+1q0K1pWA+zFDuFtEJoorEDb5BJr0bGH3jjXFOcN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188227; c=relaxed/simple;
	bh=xmkC5yboy8V6hybYNJP0XRo+r+NdpvZOdQgeP3uXNTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sNlVM70lyDbRrwDs+8QF4DHVfMcceWdXKVDjh7Z1kWqxvngWeKFOurBQINEalumRX2pUcBHDK7Iahm7JjBs0UTh9SULa7C/7N0fF9/tlgGx+JGYUlMc4xW9D/GNdyXhYAta7jP3qOpDLV3gFlnm5sildzpNgWaGlQINLUqFtZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I33FC9Ap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD6FC4CEE4;
	Fri,  2 May 2025 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746188226;
	bh=xmkC5yboy8V6hybYNJP0XRo+r+NdpvZOdQgeP3uXNTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I33FC9ApnXt2VyuCC5AY47gbistpMn7RLA7Wz1Fh805umBjmyBc2BzFczRTjNRJct
	 i6INWBmiw9JXqFsDOLuecxV52fFA8E/z/fCziOgJpObZDttLhQofO/ScyqK2ScrgU2
	 TOVfLYJVeLi2z8xVX0D9sIpNe7OFmQSFKrc4OwEmPavQAD4tvR++PepvODdceB0+Nd
	 K/BF9R+GsOg9TWGhfGfCvNm3ajgQvHldc+7XbzefPVrTrNvPv0H5dJo7BoDvkpPAg4
	 XG6Ff+GQ5IvNjAJaKph03hLWzYUgiT6wKflN1A4CUoSdf+O3LCHYGKGEMhbrr8Q7n6
	 Eyy3ivPaXs47A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 02 May 2025 14:16:34 +0200
Subject: [PATCH v11 1/3] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-module-params-v3-v11-1-6096875a2b78@kernel.org>
References: <20250502-module-params-v3-v11-0-6096875a2b78@kernel.org>
In-Reply-To: <20250502-module-params-v3-v11-0-6096875a2b78@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7921; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=xmkC5yboy8V6hybYNJP0XRo+r+NdpvZOdQgeP3uXNTE=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoFLepZpqhyRt+UWLH9Aa2NSn2n24QGBOXm8ibJ
 ikLkrxsXPCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBS3qQAKCRDhuBo+eShj
 d9qOEAC5dMCPmKrwLMDbzRHTwXKY+zuP0TtmjMMzBWM+uNOfFZBxbRNI+yNl7T8dPeM6Qrux3rT
 hefFl5A+OUZGqsYCLM+/huYzlqLPyMAYho6Z4n/fTe3vjivQf8N7LuvVyjg5zIpOfi45gw4zXf+
 WUC8IYcb5Mt2NfwCt5IDmLs2Wmet/H0LT9CPkFoctxruj0teHKDil2GyzDgS51RVmqpDb/gEXND
 49RTrTlOetHMK78e3OTfBHcyJFA+XzAy5AxvWRJTENpzQ6p7i31dJz7zTDh3mX9KpYStUDrZznO
 bkCr3MQUg59dRnQBW+p5nlE7/TZwSOfxQ6vh8DYAZcjNJ3KbExpddFcItS10q+oteuMq5mTMuS8
 4jvmaEQPnmATlrz6WkmniYNjVhYT5ooGlCc1Y8vM5PK9A+0sC9cgO7l1E/fnQbXlda2UiXYvSio
 ZrSX2gsjO2mp+gkm3M2CY4Q7CGlzBT07ue+8K8SLOMd0nNjtPcIPFyIRuOUA3kjEkRFl377SGjq
 ICpJ+unAKdwf9ltaqIJJ4DNKh34u+uKusVnLS8+gLkARHEnzoDQcHTNVWPq22OGv4bLZVf6TqeC
 mdFygHruGISaCQ2ZiUHusg8bshOZRNehB0dasExFZFcG4TEW2CSwDBzoccY0SmGqLK+rKz1wtIx
 ZcqEtF9OG9TKoug==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 878111cb77bc..174e70397305 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -573,7 +573,6 @@ macro_rules! c_str {
 }
 
 #[cfg(test)]
-#[expect(clippy::items_after_test_module)]
 mod tests {
     use super::*;
 
@@ -946,3 +945,174 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 macro_rules! fmt {
     ($($f:tt)*) => ( core::format_args!($($f)*) )
 }
+
+/// Integer parsing functions for parsing signed and unsigned integers
+/// potentially prefixed with `0x`, `0o`, or `0b`.
+pub mod parse_int {
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
+            /// Parse `src` to [`Self`] using radix `radix`.
+            fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
+
+            /// Return the absolute value of [`Self::MIN`].
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
+            // literal `0` here. If we removed it as a radix prefix, we would
+            // not be able to parse `0`.
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
+    /// [`kstrtol()`]: https://docs.kernel.org/core-api/kernel-api.html#c.kstrtol
+    /// [`kstrtoul()`]: https://docs.kernel.org/core-api/kernel-api.html#c.kstrtoul
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::str::parse_int::ParseInt;
+    /// # use kernel::b_str;
+    ///
+    /// assert_eq!(Ok(0u8), u8::from_str(b_str!("0")));
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
+    /// assert_eq!(Ok(127i8), i8::from_str(b_str!("127")));
+    /// assert!(i8::from_str(b_str!("128")).is_err());
+    /// assert_eq!(Ok(-128i8), i8::from_str(b_str!("-128")));
+    /// assert!(i8::from_str(b_str!("-129")).is_err());
+    /// assert_eq!(Ok(255u8), u8::from_str(b_str!("255")));
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
+                    // integer. We choose `u64` as sufficiently large.
+                    //
+                    // NOTE: 128 bit integers are not available on all
+                    // platforms, hence the choice of 64 bits.
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
2.47.2



