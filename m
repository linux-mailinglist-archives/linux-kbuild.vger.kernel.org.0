Return-Path: <linux-kbuild+bounces-5817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032DA39CBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7C4D1893DCC
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A39F269881;
	Tue, 18 Feb 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSYrJnp2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E68C265CCE;
	Tue, 18 Feb 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883713; cv=none; b=e+PXZZUV+P8gbRrBCRUzjlXj3TpwBh4LqRRjGLVT3FBEThmKZANNsNyHbHAek0iVG8nMk1O0GLcWXjJih7v5tESlPkhzoEyV/fQTuFlYpuql78nSUaKWm80s2d5a/zMFWt1n99yeLLcA0kzduJdDLJgyTpZtCx24DebEBEqnXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883713; c=relaxed/simple;
	bh=PCV7J741XsLI5Lf1r0pbxVGAOWX7VTsXjZUySE0EkOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOPCsvu70u8Eld7kf2ACKQBqZhK54NrI1beW5tOsmiI1tCsbKofKoboDNT9TPcuuNeQen1Etrh3JhgyiI41g+d41KYpIhraeGWZaYwe6axunFV53n8DpGcgU5Xb77EaQI74xEg6ue5vSTEfzHY7M1SLBI2PmpXAnACKss0/Ac1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSYrJnp2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2713C4CEE6;
	Tue, 18 Feb 2025 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739883712;
	bh=PCV7J741XsLI5Lf1r0pbxVGAOWX7VTsXjZUySE0EkOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lSYrJnp2FzLm0CpyLB6SBQIJlbIovOxZ8UGdoYQKdbrB3tBRFCJcZ0BrXUI4W4vUQ
	 6qlM1X5UFeTgpkjXz5Uaex4HimhnBGqBwnleIMFn59xDhE9tOpsymX0EP9R2VWKIC9
	 4WCphnmrK/4OykFt7/JconnZkC+JbKrzn0sHDaqgTxd9GR69Xtnvb/8m3jGYxIkeCd
	 BUVQodJQQr+nJduQHQXe4jDmJk8Wkwa87RDD1I+zVRjlGcpv0fZSpYfkQFYGGquDNT
	 jUImWr9tKeeqT6Md40pZKysxkgN/HN4jUZ9dJzwIaM4dIgjVWaD1WJqVynERC9Abt1
	 lbzaJ8xgkrJCg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 18 Feb 2025 14:00:47 +0100
Subject: [PATCH v7 5/6] rust: str: add radix prefixed integer parsing
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
In-Reply-To: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5711; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=PCV7J741XsLI5Lf1r0pbxVGAOWX7VTsXjZUySE0EkOk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBntISHnjhpzfw5TGwhNAQrGg0Y+IeXAhe6Le9n/
 7o3cxrm2q2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ7SEhwAKCRDhuBo+eShj
 d0V2EACQd+cmGOqcfkVRFMfEJ3T9SlONnRMUUxBpd0QLiogLrMFbw6uV+eamk/lqv8rs41TwPr9
 o/KPBKzzTZkegvsdel3rElRuMXEgV1rV+RUrOiJY7828nLlPlUKrRjpHLNK1Yc08KgWtE72Gu4I
 6QzzfRRXaaxOzVGWkVmdjdCBbmCXQU03aE4orNzFP+DpUGPFGzzdGvJKFHjj4o4W1jrKxLG8ACi
 jXCLjawwbQL6nJN23aiVOtnvuPSXOTRCukE7AdA4PVsySxbmhy/cIUh1DxAGJJAY8NwhEtLazV2
 AnBQAmLyAQ33WNVANDCBm761fPCV+OkLeAAMTg9Gv46Vl+xMAoGalfIP0mE6eJ61w/QN8hZvo7r
 Md0Jfa47nSnRqt78pReIhL6s1QrOwevIJ+bgb/2qCRPlX8hIpEYnFOUHBqvvvQC0F+Sd7SoFeBu
 SSMz5EsdcP2P1FeTMRk8FElUjQPgRjwlXGoMzyf6duOgMx9b9ToegGOAvfYKuAldARKaUgWVEvi
 jlXZQteAGjBbqUsNQCP/yNIYbcdxq6pNR5eF170q6rcr5rQ06a1sBs9pqjLNefggLBSeEgGPsVx
 HCG9Lysdg3jqd/s0Fq8rYq//CTY78rmbVLrEJlo/yaBVM1qMaizOaqhIEbLoW5pq4u1/X58O//R
 7pZksyzWcCgJDtg==
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
index db272d2198fcc..8b0d814b47f52 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -945,3 +945,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
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
+    pub trait ParseInt: FromStrRadix + TryFrom<i128> {
+        /// Parse a string according to the description in [`Self`].
+        fn from_str(src: &BStr) -> Result<Self> {
+            match src.deref() {
+                [b'-', rest @ ..] => {
+                    let (radix, digits) = strip_radix(rest.as_ref());
+                    // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
+                    // So if we want to parse negative numbers as positive and
+                    // later multiply by -1, we have to parse into a larger
+                    // integer. We choose i128 as sufficiently large.
+                    let val = i128::from_str_radix(
+                        core::str::from_utf8(digits).map_err(|_| EINVAL)?,
+                        radix,
+                    )
+                    .map_err(|_| EINVAL)?;
+                    let val = -val;
+                    val.try_into().map_err(|_| EINVAL)
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



