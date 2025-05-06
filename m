Return-Path: <linux-kbuild+bounces-6972-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B668AAAC51D
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 15:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D83741BA7BC8
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 13:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC12827FD75;
	Tue,  6 May 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHzr4pfm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695E275117;
	Tue,  6 May 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536568; cv=none; b=t2KwKV3ZCIGIIv+gBqI9e/oaVM5Y94RUpZipRSBh8TCTqHwOCix1z2Uv1D3+zdNO4b+h/iWrUIuEIqWjEj64AVPOdl5gmB+Vkt8dGossAtTW8fkttvxGBvQuU8vkVKREbaVTroAiFp6BG+/cAwCFjcIJqd1NK2NI41JC5cEUrKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536568; c=relaxed/simple;
	bh=7qMbYF0hu2Beyc3tPuUoKN5TnxPYQAC7lF5OsXQC2Go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+h7kj2AwTtDYvINru8ZcvtdI3uPcuEiuzIeEqBJRTof6RuJLbZL86Sz6ZAkYTM9qG7ZKqLy7YNKhOUW4KZxn/LJtRhSS03/go3+pfxu1cMQ7Urce4seJvA8UuHodUDrBG73aEUHoNs8TNsqaKacyEAo+PrYXtqZDrK1C80vfhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHzr4pfm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B0DC4CEE4;
	Tue,  6 May 2025 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746536568;
	bh=7qMbYF0hu2Beyc3tPuUoKN5TnxPYQAC7lF5OsXQC2Go=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DHzr4pfmUuOmKymf3jJf/Nbd7K+QhE5HIktfqsAULQF7zSZ0j02UrgXxvdawkTE0M
	 l1ZCCFmTffO/O49QxgeQqpGJOUjND2305TVvsUiFxbqinYfFITjNHOjaZvwFfd2vIV
	 ZDgBy5WHeNY8kDcHPNfduxRpVNMSk9XJ72fR883LGQ1qqIDdUmLueJznTUw2e3lnuK
	 aG+H1ldJ8nV4QMdlz/hojISLx9wXhFZXrdFj3dWEFhKyzUCy98QlNlLWuajb5js3vu
	 5dOXwrEHBc/ttuuDKD/Z90j5Df5aw+7x/mczAl82GCNOqsea3/6OOXVgmkuH4J3qxC
	 lbQ5whD/LR8FQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 06 May 2025 15:02:28 +0200
Subject: [PATCH v12 1/3] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-module-params-v3-v12-1-c04d80c8a2b1@kernel.org>
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
In-Reply-To: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7913; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=7qMbYF0hu2Beyc3tPuUoKN5TnxPYQAC7lF5OsXQC2Go=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoGghneyr/AZMOCNZq7gbv+RWUWT/iwA0G0Rawf
 jU5uFEJqTCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBoIZwAKCRDhuBo+eShj
 d+YrD/4rTN3mpjdJgpRjIWlyl5WE3VvbGi2LqbuMp3r5CmSEwtEbA/ZdqrdmydbBPy6Lf0Rfpyd
 GDJDfMbVgcTXWL2hXxDq2tO7JKmRa1U0pkmdlf+DeAZNWWplUe/gKj5ADIIxC+EOvybmWmKQgMg
 Uek1PBXVN/atLVmPKhQZDD+t66XsbNqMwsGrhT2wcQFL0IvysJOMciGG7B82tGgcXkchFKf62rj
 9/lOV7SiFNa7RuYN0pmdaMYATB0EVUcOHKI/tmkovrdlrHPg3J4w/RerjUcLhXiQAlwRyaqVpiJ
 hACG4e/+uq3TOmD73+ycAePvMqOI6fxxJ6Dqoic9u918RNFhsCcCXLma+HcFpiMYsbex7P7MzXw
 x0Ilqp1G9t4JH9tbwe4KTZ9wWOOdXsXcx78nr685tpcguuS3YaeHcWXIC9FrJlPuyc5ftOK13iS
 AuHKGRuOUCikwTSY/rsnD1C4t7pvBNUyD1R87TqStpRGeYHJG8yBaeXGw9VsAsABPw3voU1QTWx
 MAI7eoYIm5GKAbCRueRjmJ6t+FDCkAl5fMLM4SFWbIycT9ulWg0eTIfxa9kRCqWo7D/Wg9f2pKc
 bacR26IapAOdB+s2HDnJnGcOZzcTc7sW4NQc+J1bVPUWhrhkU877Zwx5YP5Tdbf3Cr8RELMa7gG
 hPVGuug8tvnJ4NA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Tested-by: Daniel Gomez <da.gomez@samsung.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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



