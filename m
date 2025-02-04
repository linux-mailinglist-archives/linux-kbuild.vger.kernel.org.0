Return-Path: <linux-kbuild+bounces-5622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A92A2710D
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 13:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E0A518867A9
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 12:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92360212D82;
	Tue,  4 Feb 2025 12:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQWujDS0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F80E20E028;
	Tue,  4 Feb 2025 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670706; cv=none; b=D/X+vAikPC938SkDCm/ES+J/KQyzJCzWPUsGdEBw5nACL5SRQK8gBKBqkDUSFQraffRTTVk+MqTW7yl3kI5DH9ijOvVacWVNGz31VKaMQXg4Q98hQXzhA3pzSq+FJLzeO6mp6Zq8ihl606o8lay5/f1ax7+KgipsoknlyjCBbLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670706; c=relaxed/simple;
	bh=Zb8g8SVhfu2MakmGaygCG3YC6SDGoQDfOIhOECkKc5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7PisnurzU3AMsN74H1r+J/+J0O9bfSQsrRzlOetNKTo7VWETpLjuXduxX9n2/uxDu7UHBMNB40M3Szmm3+EqcdgsiCPLSv14CG3GrsZbztiqiewhN7NGo3d30hdhYevzHlwjPfOkSw5vgxqyDqnFZcjCcboPSMul+N8o6PGnHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQWujDS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F42C4CEDF;
	Tue,  4 Feb 2025 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670705;
	bh=Zb8g8SVhfu2MakmGaygCG3YC6SDGoQDfOIhOECkKc5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mQWujDS0lw8jpHXt2EQYkX2wCGflEP2Tf9oPHligcnAi6NoCEjmviNnmr+U48nc5J
	 huoO4NUodBgL4kTfG72BEmWs4h2Hbd7IZpr4aByPcKMlTa/4ErDlrKlE9vjx9p8lAI
	 GtyqVtdsyS0mKicz5Pmvuu+78axoQL5ajdrV68QQC9fyQ1nWgKAfYzX6FeBF/CzLYD
	 XDe1G6zGbQujIyBBcaZWeGzdYFeXWfpEWzSIPnyjK6Q0giZv7j6z0PZpt7SkBegDMT
	 nn9XthAsPbPOEcvGyB5Y/k9rlENShXhkQLz9vEdbpdaLkHTEL0XUh4Z4xkYSU7K/BM
	 iBztwAdyd4RzA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 04 Feb 2025 13:02:11 +0100
Subject: [PATCH v5 4/5] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-module-params-v3-v5-4-bf5ec2041625@kernel.org>
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
In-Reply-To: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5311; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Zb8g8SVhfu2MakmGaygCG3YC6SDGoQDfOIhOECkKc5M=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnogHZwZkdxzH5Cbj9qLALj8ggqyU1SXjBYSRL1
 RUztwMeMUaJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6IB2QAKCRDhuBo+eShj
 dyrED/4+lfdHqYjbCd7TNc3NFKod1KMMXUFyXzK9Q/cI3Erh3fqMmxMT2KOCFUoh4g1mzD+eE4J
 UpZsfH960VpagPkGBrbqeSu4t+Q6nyHHXNQCDOiJ2Vwq+hMbob+5zHsUFvKd/vXl4vGKdSbxv38
 KiHwSa5LIueAgpL9AA+8+lAX/LHgIgIJAxJCFDxoSoK7K57qFYXa3n8FU3iRMRQvUN+F/tLzXNw
 dJx2tICSQPT7GHyA9OlygbO0KWOKWmSj0gPPcjAHcBqJPxUv8JkUVwYLHWciorNoQdhLxRwZ+uP
 7+1MfXeO+ZsJO1NGmWsDvcup5S/Pl60CzSqlTbpZvAYX2YGzi/llHF5Cd0odv30nRYIu4GJa7Va
 cwpZ0uvG87W1Go/mIF5tYyEH9+eVGqpyxkYmS9laRjI5YXwe99J3uXe2jSJyIaONc/2ootkkCsa
 UP/FP7vNgG3HactDAEg5HY42FKgfbOzgIMDKmEjSyuNAotZrpnu58jlz6jpyT7RHOaaT/zkRY/F
 oHFqXea5iwBJPlmiSjj+CaHOzpyX0N1KazYPowqhP+jD7PqiLqj+m+R3zfbNZPhaLPSSPE9T2Im
 hwwdbwZSyMehGu10k6w5nr7oHGgWD0BxyQc/uer7n6Y+agzFQvXyiy5cI2VJ7jwGm646C7KNHL9
 ENReirt06ONqFxQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 109 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 80601206961e5b2d682af5f7028434bba1604272..63f91635da187555b9096a63d6ee2c6df4fca071 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -933,3 +933,112 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
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
+    use core::ops::Deref;
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
+        match src.deref() {
+            [b'0', b'x' | b'X', ..] => (16, &src[2..]),
+            [b'0', b'o' | b'O', ..] => (8, &src[2..]),
+            [b'0', b'b' | b'B', ..] => (2, &src[2..]),
+            [b'0', ..] => (8, &src[1..]),
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



