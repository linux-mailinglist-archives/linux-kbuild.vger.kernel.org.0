Return-Path: <linux-kbuild+bounces-7478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD8AD725E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38A847AA475
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D46B2472BD;
	Thu, 12 Jun 2025 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkQNwO45"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA5624678F;
	Thu, 12 Jun 2025 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735720; cv=none; b=ISewZUYEvjsaNQLHw8kUYNxeB73Erl9kQE+Vfe26g5uU2vu/3FfNiDDMZfxcffZVOlr7tyjalt1zTOYduDbXceeEuRtDJnlVXxZozUU0jA29TMBPVLHmNOopvIPsSDaqOhGctaCJ+5+/XeBGMAXpboPX1yQrKuyyyK8byhpYGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735720; c=relaxed/simple;
	bh=1Zk5g4c16Y0HV+ODTr1tmXBR2FFrktQueKOUyeJhRoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bi4E2YydGLrcIDa6WicVCDbZ9MF5gX1+QoXqNP4pHK5fH31RqeR33qNqLJCG4OpxK1owyN6dA0mJVWsfdCiJFu0DoMhE6jYbwQ82GKQQkz6zqLJHBToJxmIX00pAnSez9o723MxDLRjzkHXvphS1AhlgQwrfsZ0/cZIPOKHPsjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkQNwO45; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DF5C4CEEA;
	Thu, 12 Jun 2025 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749735720;
	bh=1Zk5g4c16Y0HV+ODTr1tmXBR2FFrktQueKOUyeJhRoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AkQNwO45AjGclUDSyhcIjBeG0N+juuS207LArNb59QRcFmmgYp1Mf8uSYvlJlow/0
	 Q0lHeB5wVMdYliuNKAAp3lCN0fNC/klogrbwXYb2YuQhRNU41g97KdIDlGGwyrrWQH
	 Ltsq2gu/1h1qyGnyQidznRAe/AxBftV6UCEYxtR+GOauKExtLcE2vGcDHCmnPtHGlk
	 uttn4QlPg8gChCLHkIi/bL0jt0Zrl6T2tx0SEwiP1EHvPKJvR2kvV+D0ACMfZRoKQ2
	 WEddRxM3+3DuEmrVmdxdWz4efQnb0qoGrtEQ837H3fM9LYZ7x0xAjwZeIDXg+ezStN
	 DBWUpFRS02IBQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Jun 2025 15:40:02 +0200
Subject: [PATCH v13 1/6] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-module-params-v3-v13-1-bc219cd1a3f8@kernel.org>
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7428; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=1Zk5g4c16Y0HV+ODTr1tmXBR2FFrktQueKOUyeJhRoE=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoSti2h5MQjr8bdVGbxH+6TaWLZpN63COs78haP
 paQ8whrZ/yJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaErYtgAKCRDhuBo+eShj
 dwWFEACxCR5MqlEOysO50ToQYRiW/Fn4Zzh2S3FkmxKp7/dxGJ8/rNB9LLtsYJH32DzIQQpGl+v
 GG3ZzD6dnPQfZ1MefbBrxZYuFUqN+SN5qKXPK5kpg9c1APfIJAJ+wc/lGXh5YMYwtQ/L8TSR8/h
 Hv7gqbKd2RHGuJNQ36uHGm8cUB1hkWFWjPoJOqX0Qfls50Xvt0yhYLf8tdc7enEmzO83W6YI2YD
 FEypOh7/jNi3QMZQEYrjgZSheeOyDHKwcFMrV/usjVBJPQRVCndfjhINknMnDZqanWTrTgZVe3D
 lHENkgB023+CkR44R7P1yxHULZurGO2jfL8oHKQxEBVj64xbcbIXiUVDApI28R29/UQtltAOADQ
 jWT38noiM6TQjf5gfXkE+wg8MjCUhAiLQTWWNUwuNvdBd5OMDSQSA/JNgLIME14cX5MwH+yaAMv
 fjr0Va1Bn/6jCIP9Ih8Zs22LtLXam5GEM0RoLIA7mT2RoVEnshyrZg+K5Y2ESd6ugmlUPVGU1SF
 jz+MedZfAozt/WZaWu6Zv2M0eCcVUnAPEyGfSpIw3/52ebWDm7SbjHpM5h38de2COZUZzn6mIZ2
 ou6SUGL+8RVB8pnmYztX8EZWrXdh94g25BOOXEXL3TWp914Ii9N7gWnSRcT0NQ8U7qzQqY6STqf
 3/Z+4888pNa2G4g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Tested-by: Daniel Gomez <da.gomez@samsung.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs           |   2 +
 rust/kernel/str/parse_int.rs | 171 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a927db8e079c..2b6c8b4a0ae4 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -8,6 +8,8 @@
 
 use crate::prelude::*;
 
+pub mod parse_int;
+
 /// Byte string without UTF-8 validity guarantee.
 #[repr(transparent)]
 pub struct BStr([u8]);
diff --git a/rust/kernel/str/parse_int.rs b/rust/kernel/str/parse_int.rs
new file mode 100644
index 000000000000..0754490aec4b
--- /dev/null
+++ b/rust/kernel/str/parse_int.rs
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Integer parsing functions.
+//!
+//! Integer parsing functions for parsing signed and unsigned integers
+//! potentially prefixed with `0x`, `0o`, or `0b`.
+
+use crate::prelude::*;
+use crate::str::BStr;
+use core::ops::Deref;
+
+// Make `FromStrRadix` a public type with a private name. This seals
+// `ParseInt`, that is, prevents downstream users from implementing the
+// trait.
+mod private {
+    use crate::str::BStr;
+
+    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
+    ///
+    /// # Safety
+    ///
+    /// The member functions of this trait must be implemented according to
+    /// their documentation.
+    ///
+    /// [`&BStr`]: kernel::str::BStr
+    // This is required because the `from_str_radix` function on the primitive
+    // integer types is not part of any trait.
+    pub unsafe trait FromStrRadix: Sized {
+        /// The minimum value this integer type can assume.
+        const MIN: Self;
+
+        /// Parse `src` to [`Self`] using radix `radix`.
+        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
+
+        /// Return the absolute value of [`Self::MIN`].
+        fn abs_min() -> u64;
+
+        /// Perform bitwise 2's complement on `self`.
+        ///
+        /// Note: This function does not make sense for unsigned integers.
+        fn complement(self) -> Self;
+    }
+}
+
+/// Extract the radix from an integer literal optionally prefixed with
+/// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
+fn strip_radix(src: &BStr) -> (u32, &BStr) {
+    match src.deref() {
+        [b'0', b'x' | b'X', rest @ ..] => (16, rest.as_ref()),
+        [b'0', b'o' | b'O', rest @ ..] => (8, rest.as_ref()),
+        [b'0', b'b' | b'B', rest @ ..] => (2, rest.as_ref()),
+        // NOTE: We are including the leading zero to be able to parse
+        // literal `0` here. If we removed it as a radix prefix, we would
+        // not be able to parse `0`.
+        [b'0', ..] => (8, src),
+        _ => (10, src),
+    }
+}
+
+/// Trait for parsing string representations of integers.
+///
+/// Strings beginning with `0x`, `0o`, or `0b` are parsed as hex, octal, or
+/// binary respectively. Strings beginning with `0` otherwise are parsed as
+/// octal. Anything else is parsed as decimal. A leading `+` or `-` is also
+/// permitted. Any string parsed by [`kstrtol()`] or [`kstrtoul()`] will be
+/// successfully parsed.
+///
+/// [`kstrtol()`]: https://docs.kernel.org/core-api/kernel-api.html#c.kstrtol
+/// [`kstrtoul()`]: https://docs.kernel.org/core-api/kernel-api.html#c.kstrtoul
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::str::parse_int::ParseInt;
+/// # use kernel::b_str;
+///
+/// assert_eq!(Ok(0u8), u8::from_str(b_str!("0")));
+///
+/// assert_eq!(Ok(0xa2u8), u8::from_str(b_str!("0xa2")));
+/// assert_eq!(Ok(-0xa2i32), i32::from_str(b_str!("-0xa2")));
+///
+/// assert_eq!(Ok(-0o57i8), i8::from_str(b_str!("-0o57")));
+/// assert_eq!(Ok(0o57i8), i8::from_str(b_str!("057")));
+///
+/// assert_eq!(Ok(0b1001i16), i16::from_str(b_str!("0b1001")));
+/// assert_eq!(Ok(-0b1001i16), i16::from_str(b_str!("-0b1001")));
+///
+/// assert_eq!(Ok(127i8), i8::from_str(b_str!("127")));
+/// assert!(i8::from_str(b_str!("128")).is_err());
+/// assert_eq!(Ok(-128i8), i8::from_str(b_str!("-128")));
+/// assert!(i8::from_str(b_str!("-129")).is_err());
+/// assert_eq!(Ok(255u8), u8::from_str(b_str!("255")));
+/// assert!(u8::from_str(b_str!("256")).is_err());
+/// ```
+pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
+    /// Parse a string according to the description in [`Self`].
+    fn from_str(src: &BStr) -> Result<Self> {
+        match src.deref() {
+            [b'-', rest @ ..] => {
+                let (radix, digits) = strip_radix(rest.as_ref());
+                // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
+                // So if we want to parse negative numbers as positive and
+                // later multiply by -1, we have to parse into a larger
+                // integer. We choose `u64` as sufficiently large.
+                //
+                // NOTE: 128 bit integers are not available on all
+                // platforms, hence the choice of 64 bits.
+                let val =
+                    u64::from_str_radix(core::str::from_utf8(digits).map_err(|_| EINVAL)?, radix)
+                        .map_err(|_| EINVAL)?;
+
+                if val > Self::abs_min() {
+                    return Err(EINVAL);
+                }
+
+                if val == Self::abs_min() {
+                    return Ok(Self::MIN);
+                }
+
+                // SAFETY: We checked that `val` will fit in `Self` above.
+                let val: Self = unsafe { val.try_into().unwrap_unchecked() };
+
+                Ok(val.complement())
+            }
+            _ => {
+                let (radix, digits) = strip_radix(src);
+                Self::from_str_radix(digits, radix).map_err(|_| EINVAL)
+            }
+        }
+    }
+}
+
+macro_rules! impl_parse_int {
+    ($ty:ty) => {
+        // SAFETY: We implement the trait according to the documentation.
+        unsafe impl private::FromStrRadix for $ty {
+            const MIN: Self = <$ty>::MIN;
+
+            fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error> {
+                <$ty>::from_str_radix(core::str::from_utf8(src).map_err(|_| EINVAL)?, radix)
+                    .map_err(|_| EINVAL)
+            }
+
+            fn abs_min() -> u64 {
+                #[allow(unused_comparisons)]
+                if Self::MIN < 0 {
+                    1u64 << (Self::BITS - 1)
+                } else {
+                    0
+                }
+            }
+
+            fn complement(self) -> Self {
+                (!self).wrapping_add((1 as $ty))
+            }
+        }
+
+        impl ParseInt for $ty {}
+    };
+}
+
+impl_parse_int!(i8);
+impl_parse_int!(u8);
+impl_parse_int!(i16);
+impl_parse_int!(u16);
+impl_parse_int!(i32);
+impl_parse_int!(u32);
+impl_parse_int!(i64);
+impl_parse_int!(u64);
+impl_parse_int!(isize);
+impl_parse_int!(usize);

-- 
2.47.2



