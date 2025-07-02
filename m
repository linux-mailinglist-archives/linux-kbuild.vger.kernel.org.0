Return-Path: <linux-kbuild+bounces-7838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F682AF5897
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791B81889294
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088C7285053;
	Wed,  2 Jul 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBBwjg9Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE502877DF;
	Wed,  2 Jul 2025 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462386; cv=none; b=BHaj3a6AhHdEEK8VKDbWutRjZGCDprKgq55PJ7QCSfKv6LBCkugP2IFjbY/KMmFO+Uz+2qSbtfWOp/dQgv7/68nacrNSJUpCxL1A+71I33ADeXvzg8RI9x61vVNXJzsHkjjrch3DQtasDVRSx6LB1Zb/LHWBdxsV3G8GouGhxRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462386; c=relaxed/simple;
	bh=aO+G2LBOUth+c97kiCVNHXHQOAnd4TaRXt0Dw/VnL7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSvrVEvf2LKpSeGUYruju+236SHh1aIXQh2jHLzzOh0Tjo4fLFkeV9ObXs5tvwbPfPYJRL/MXfv6xkwUXkrFqvHaPjmQ+dcxQyPoJupdThwu7UE1uyudTqgOnwjTTMw7jwsUGIfw3ZG1cp4GI6rPrzJe86Y+jThVWHS7thzpDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBBwjg9Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B0EC4CEED;
	Wed,  2 Jul 2025 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462386;
	bh=aO+G2LBOUth+c97kiCVNHXHQOAnd4TaRXt0Dw/VnL7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gBBwjg9Y24fXcgDP1qQZsVeITJKRdng7K0amoWMngzr3h5EdtT/8d8jdqwaLPXdRj
	 xVIAjH5gU0+HS3NKSga711FW6FmHmEZhZiUJJ5LSAQmAt5QyoS2UIsIrstMkMwIWPk
	 Hl0/BcPpjV/IkwGlrGQGsLj9GeMN5HjOJ8+CnK8meE9OJo5HOez2dXzmcGJSUrjQV+
	 hALDcU0q/ZSKqKnddVb0TwHTe4oSaOBWJRZ2ll5vtWo7wSyFa5mIydMDQg+9vqzmT8
	 j38bpA8g36snCx3hcOrg9meQITDhkWvo1H0+ne+VevrgLBONpOGdivcXYZC1j67cz6
	 wJCzw5jqmXsuQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 02 Jul 2025 15:18:34 +0200
Subject: [PATCH v14 2/7] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-module-params-v3-v14-2-5b1cc32311af@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7153; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=aO+G2LBOUth+c97kiCVNHXHQOAnd4TaRXt0Dw/VnL7U=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoZTGzZw5aqY3V0bF0bZEjwP/QabmpTL/nU1aU+
 HhcjC9gvAuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGUxswAKCRDhuBo+eShj
 d4yRD/kBUhvi3BOLZNdcXMPl5fQKqHnSsOKNxTeYALdlB0RuW4N019o42seCGIbG6sln5/il7AV
 MpNroZQ6Qf5+PjoVcbn5ALrkDSqDABQRWduiXU9XMuhw9I0lQLOa5VZnGS5Bs356cgtMZqEqrOg
 ACPhxXfE4SFn8JTuQyPfvVDH9p1jitHHCmsOwJUbM4Oob1Ug/3BRqJMv0HXQ0hg5vcsFoMCKKw9
 xjGJNBAq0eJdncrP63RWTQ34mhk1LZ7xLfsCB8Wp8XC/B2OXXBcC1wBo4p6NGzYezFGMKH2o9yr
 nk719wNv2XuO3byTbRJcKMG8ZLYh8rSUKQlocQU+gyoohwGr3GQzn742A016FTcbaPjGje4sui1
 vYfQmUa/4vLTUZhYWGJh+vx0z9eFKRsjl1FJ7GLrx5uIfzbkPJj7DHeiGvjGwDDn271yad7Led3
 N+J3wNqD6z/ojJwx4kx7uJLkHTva3ULok4XZ9zpwkTFeWSWuFYMqJtfcYB6RDydHWwb5fHDy+r3
 Mx42onGB7r8Kgb2i9C48hWnaCEdn41sQKaAfz9kUQybOOA+GOSZ8geSjEZFPQ7CDUwxaoFyFiGf
 gJ9rLckj936RtXhlcpteUCMQl7hsY5nlvtMlQO2BOiinBHdC8GWlJrip9UH9BUqSQ87E0Is6ghl
 O+DkJeWYiXu2JzQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Tested-by: Daniel Gomez <da.gomez@samsung.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs           |   2 +
 rust/kernel/str/parse_int.rs | 148 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

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
index 000000000000..48eb4c202984
--- /dev/null
+++ b/rust/kernel/str/parse_int.rs
@@ -0,0 +1,148 @@
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
+    use crate::prelude::*;
+    use crate::str::BStr;
+
+    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
+    pub trait FromStrRadix: Sized {
+        /// Parse `src` to [`Self`] using radix `radix`.
+        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self>;
+
+        /// Tries to convert `value` into [`Self`] and negates the resulting value.
+        fn from_u64_negated(value: u64) -> Result<Self>;
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
+                Self::from_u64_negated(val)
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
+    ($($ty:ty),*) => {
+        $(
+            impl private::FromStrRadix for $ty {
+                fn from_str_radix(src: &BStr, radix: u32) -> Result<Self> {
+                    <$ty>::from_str_radix(core::str::from_utf8(src).map_err(|_| EINVAL)?, radix)
+                        .map_err(|_| EINVAL)
+                }
+
+                fn from_u64_negated(value: u64) -> Result<Self> {
+                    const ABS_MIN: u64 = {
+                        #[allow(unused_comparisons)]
+                        if <$ty>::MIN < 0 {
+                            1u64 << (<$ty>::BITS - 1)
+                        } else {
+                            0
+                        }
+                    };
+
+                    if value > ABS_MIN {
+                        return Err(EINVAL);
+                    }
+
+                    if value == ABS_MIN {
+                        return Ok(<$ty>::MIN);
+                    }
+
+                    // SAFETY: The above checks guarantee that `value` fits into `Self`:
+                    // - if `Self` is unsigned, then `ABS_MIN == 0` and thus we have returned above
+                    //   (either `EINVAL` or `MIN`).
+                    // - if `Self` is signed, then we have that `0 <= value < ABS_MIN`. And since
+                    //   `ABS_MIN - 1` fits into `Self` by construction, `value` also does.
+                    let value: Self = unsafe { value.try_into().unwrap_unchecked() };
+
+                    Ok((!value).wrapping_add(1))
+                }
+            }
+
+            impl ParseInt for $ty {}
+        )*
+    };
+}
+
+impl_parse_int![i8, u8, i16, u16, i32, u32, i64, u64, isize, usize];

-- 
2.47.2



