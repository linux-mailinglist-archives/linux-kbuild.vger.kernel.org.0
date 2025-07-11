Return-Path: <linux-kbuild+bounces-7979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1216B013B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 08:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B6FFB409FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 06:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641DE1E47A8;
	Fri, 11 Jul 2025 06:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNEt0ai7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0941E3775;
	Fri, 11 Jul 2025 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215798; cv=none; b=AXW5m6dSvsInH4aRF1xX49gWQWSATFnyDvnn7f/8Vkjxh3hfetOJtztXjWrqGpnzF1utxQp1DEzooUdnkG1yExRkd38Qxx3MwNt95jKwj4VH1IA/20O8oRsWHY4T06UlI1lJJyxkQ0Npg/zJhXh3qQve1xB+qcmdIbFYxmeMX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215798; c=relaxed/simple;
	bh=2/ANc9BU+Hx5oFEmj6yR/AmSIMnSY5f2zxLXAZPt+BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/TFOu7qF0YeXCW/P9AvUwgyQrNbTsNVEwhVcRL/cu4Z8lQL2tODcr7+8NNDLp2g7/Jbltu6cZireyQcdicua/NqZV9pE1hAcUnTPo6nQp2+/E0rGijzSk3UimKF0H1muUa88ragoI5+zWxKux2iPPq1Fjua41ElJxC2VhrM1LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNEt0ai7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D6CC4CEF5;
	Fri, 11 Jul 2025 06:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752215797;
	bh=2/ANc9BU+Hx5oFEmj6yR/AmSIMnSY5f2zxLXAZPt+BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UNEt0ai7CWl7vt0UUvy/R3VzFjs6ATOg1lBXf6pmiR3aphSoqAXDu30KQ476+HlmB
	 sWrqs9PIKI81BKD28hS520KceamlJ/p8bM1LZn4nBuZMPMr/20Ubu0WRqxmWOej6yW
	 vFnJJFD2xEWhLSvIW9wA3unz3FHsAKQRqX8SjMuEdWPL+uHnWSVaDzCP44vSbEJn2d
	 IWRUrqQTCGy3fRDWYZfYlGPE7D4MNYmJyrKyHjUxvrwwFi6Ln9SSUf6fB7l0GIas8L
	 63qIAs8HVSHF+onlNzFuX0iG7AA7tYHadvFOfOsOonnDNlC2oOm/Tx3v8Nirj4tb6/
	 bVsmLYu+NrlSQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 11 Jul 2025 08:35:44 +0200
Subject: [PATCH v17 2/7] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-module-params-v3-v17-2-cf9b10d4923d@kernel.org>
References: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
In-Reply-To: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7200; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=2/ANc9BU+Hx5oFEmj6yR/AmSIMnSY5f2zxLXAZPt+BQ=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBocLDWgTexbizkQ2nNpFHAnQzlSmxojyUwa/JRR
 xGpkj/3g96JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaHCw1gAKCRDhuBo+eShj
 d5ikEACkP8Msj/GRC9QKEh4TKK/rtos/5incDVse1LS6qgPJFg1qptEWYdL9ULNjySTBq4fLYnm
 W3XhBrx9fjQlnF5yuQBO6pTf1FJJ8Lz/9+A9YPvu4Sw3nQCaSVG2Wx0Wxw/DSzSvl/KwWd7N1Rd
 jVNuf+4mLlIEePGhwh/FxKhPrrPyuuOs+P2c1oK4Qd13K/1qtvzh2Adp+Hw08WLif+9lsJTtsOg
 S65UdJc973ZMv9BThWhoL5gnUnhJvQ2LhWk0PztmOn8s5rf0QIO3VSllNe8dJTdhIwICJfN1o0w
 kWQ0RpP+TCdeU7uTImILdEOI1J2avK3HZKO8iLYxoWfB/U/WDJVv5WTh6CqB/ts1rc3R99DW5bD
 HxbGqWvzTlshT+7hTgv5jn4cTduFoFq+/m3MwV6+mYeohOft8FLYqeYqwE7FtQU9GvPkjCCMS6S
 pka75090y0NLw+fOZyHZmWBoF/wbw1Yh/+LTqC81BewYP8NBNn6aG9p0rukyfbotJID371a0Pe2
 s54VRUyC92kw6B5Mx3L7y8gW7imY5TUHerSCWsDAZrol0lv806Bgt0joCoPWc0iLLLaruRnBCes
 wWUQlmUtQS042T4lFuxpmLjvM7BbCxR/HcMrG51p38zmaQqb1O9FJaVu8KbJZel5JPXCUq2wa6N
 ZnnYlv5sr/HTP1g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Tested-by: Daniel Gomez <da.gomez@samsung.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
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



