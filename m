Return-Path: <linux-kbuild+bounces-5718-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B00A31078
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E91F7163F57
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 15:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB01253F33;
	Tue, 11 Feb 2025 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3sGaztk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1BC253F2C;
	Tue, 11 Feb 2025 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289541; cv=none; b=ayEKaS4x58b0f7zbuIpsk9hDZjM+MvtkANGoQ2al7GtZBc3YwdH3+pNY0+Kbj0+lalVdb1+MzoLRqbQ5op60Vuz7yXFMxXWZuG65IeSCeavO4eE+lL5li3PcxhiMDnxC/IKOq7GLdCY/Cy5GzIuOEFVhlincNkVG2kiOrkwlVbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289541; c=relaxed/simple;
	bh=V1sVaUZMSeiGO+++YI7QwQ+UtECeBzIOktHPUUQ9T30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvKlurn2tbSeS/1c7UYcQ0qzhcpHTA/4oQ4sIKphpGipNrSdPZRchUi32mFQ81k+kW+cgnANwuo/vgqxrW9r5ouD2CFPkEjmshIcYWn1KqsRm10AYIAk96H7YcHMBG2UeofLBJpPV9x9Ed9QDvxd2VgtButyWhYNRWfwJBjrTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3sGaztk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EC8C4CEE5;
	Tue, 11 Feb 2025 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289540;
	bh=V1sVaUZMSeiGO+++YI7QwQ+UtECeBzIOktHPUUQ9T30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y3sGaztkYbYVCC72v5hWyBWRAJtfSIw0tG/ctncIAYK6bGgaMWxKF0Uq8vB/hqGyq
	 3zkI2EELd8c21TYVhBYoxLg16XrzBbbfxY1IN42BJrgPW8bKzG0c5oVkWxi9bhPn3n
	 mooKyD3Z+QbWUKvKBy+lz5zf0JisXxcRkcpiQoJVmTiTdJ0Y+QfVKYFbFG2keq9hEZ
	 3r9eJvLselkEMhzkHNltFhAOUYN7lAf4K2RE1dJyTwENhu64bfJBSgvAlCHtOqE4gJ
	 gHghj5jNYFOUy58HzcR+DOHcm3jGCr2xhOhTDqRLqlXkINfxNi+Dango4SfLE6srsW
	 T66vTGz6qlffw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 11 Feb 2025 16:57:39 +0100
Subject: [PATCH v6 5/6] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-module-params-v3-v6-5-24b297ddc43d@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
In-Reply-To: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5317; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=V1sVaUZMSeiGO+++YI7QwQ+UtECeBzIOktHPUUQ9T30=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnq3N11RczktN9XFM3kVE507y9nMG3Yv9MuRh2t
 RY8MUg/abSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6tzdQAKCRDhuBo+eShj
 dwxQEADCZzFtUnaBh8SZ3StKq2ZzbGlv7Cci2zq7ASgNHFngvfmhhTPnv0OgWf2HIsre8kXHplB
 yRuPiAc0n23xH/y2ZRE6bYG/C/i+/w8gOJJ4JTPG8Jhl1fIxNxBRrVcnOVE/Emo0GOdnVFwQ8cD
 LpyMgdxtgLWXnripAy88e88V5kvlErn93YpTkbJr3x023l5uNjS5BVOMmFUtU7H1w3srC3vir3e
 isqPLJHUhKyJUrotlHalbkv3+5Umgat3oPNwWWuZH0hFtRqPIo+mRgPeCKJtfCtvm6m/txc4SR3
 5rNJcxsouT8TNsGq215zXtvSXNCnrMmlusKDh17Zujqlxyf0mDAlsLcsYSUT4eMnHY3JAqZT6pl
 HBXxyRwaYeKOtFvFFrTHEMkmdAZsyxPq3DrdK3CkjF9fBrooVQABdbXOMrxC0yr4+VW0DbvQ1r/
 2IfR4WeemR8p5UcV6bHcsUHMsTSlKx9lMGAWn1xT6LMmVDNr7Xwwv7OO39v+W9/aVfXTtlToVTG
 +RMzHWGMBUFkhnqGVCkdPuz4DE9AwQ2BZmDkz9JQnVubiwoycyozZhuT1v5PeF+XhyDs0fUi4HL
 3aJqXN4LhbcKDXYWr3dCYY93EbAQCdi3U3aWfjsJtGMFZSVfhfDw5hM6AJKZb3nNqUyEgivJBNN
 I0qvgVF67SNkWkA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ParseInt` for parsing string representations of integers
where the string representations are optionally prefixed by a radix
specifier. Implement the trait for the primitive integer types.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index c102adac32757..192cd0ff5974f 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -945,3 +945,114 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
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



