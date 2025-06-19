Return-Path: <linux-kbuild+bounces-7566-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38273AE0551
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 14:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8280C7AA7E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 12:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE96F22B585;
	Thu, 19 Jun 2025 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt23KkSV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F292192F4;
	Thu, 19 Jun 2025 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335453; cv=none; b=RvOLz2lQCXYCkSIVraKbHfrZF3xp/xxXbhN3eZLwvAfoK8SpG2Hw6Qvn+waavBjFkurKqWs08VaCwCRsBD1CbfTad6RpatMap8J9YCQ7XxqrPBhplI09Bo3ImDGTIHblZFpEqZp49SMFFqwD7nI16UPmRi2PcQ8vS6BKSOCECuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335453; c=relaxed/simple;
	bh=/EhQ8omFBROqKVC50GMU4FURNn1d6ko5wL+1nqnYQ/M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BCh6dmHdkgqSzhoaxyRF9FncE+bGTEaXf/w8zFfx1WQtINyX1IW8OnIEKpoaVI93FZbPhD4/E9Y4I8wruoh4ei8jfMfI1ZtfyJSn0xWpQsYjg8fghIFz4zb3R86hSMGnn/H4t4m7oOG+HT+hnY6X1VoxRLutsqCEMlQ/ufp/93k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dt23KkSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3BFC4CEEA;
	Thu, 19 Jun 2025 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750335453;
	bh=/EhQ8omFBROqKVC50GMU4FURNn1d6ko5wL+1nqnYQ/M=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Dt23KkSV/9nHUWBbZqwwyVHWh5vfzY2McoksD6/jvAFf8HOocPocB7/dfzUrQVgel
	 ZemKsW50cEAZstXzAavFEDMstS6soxv1e8fkkJMRzul607c2EBu08d4txfOx0O0EB/
	 AooFWNZ12H3I/vK52mAGdfwwKkqLydGSWDa6RWrda1XiKWc7B1DSc9pPVu8wbQMoJP
	 Vwr6UH3X3C4EvD6rCrCOVazVGrwwNETMEy/98VgQ/ITDLHzmjAS354iqM0i3mOyD76
	 EDRaofER9LmRZ/fxUHhT3MfrkTijxbPM5BeXoYiKEDBfQ2BADT0H1cXD7ZsARCIk13
	 zU1axqgl5vR/g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 14:17:26 +0200
Message-Id: <DAQI4RPK2Y7T.3TQ1G3IMZCNK4@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>, "Trevor
 Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye" <ark.email@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Fiona Behrens" <me@kloenk.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 1/6] rust: str: add radix prefixed integer parsing
 functions
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-1-bc219cd1a3f8@kernel.org>
 <bbRxeBHCiFQl9UTC1hFQYdzkdAIV5HcRTuFf9ucPUEZZ-uJmaHAZXfd8Tk-k9vzROgFsCyNhGBBCn5J_HnbUSA==@protonmail.internalid> <DAPY5HF9HGXC.FCEKAMLPFY1H@kernel.org> <871prg7zoh.fsf@kernel.org>
In-Reply-To: <871prg7zoh.fsf@kernel.org>

On Thu Jun 19, 2025 at 1:12 PM CEST, Andreas Hindborg wrote:
> I'm having a difficult time parsing. Are you suggesting that we guard
> against implementations of `TryInto<u64>` that misbehave?

Let me try a different explanation:

The safety requirement for implementing the `FromStrRadix`:

    /// The member functions of this trait must be implemented according to
    /// their documentation.

Together with the functions of the trait:

    /// Parse `src` to [`Self`] using radix `radix`.
    fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error:=
:Error>;
   =20
    /// Return the absolute value of [`Self::MIN`].
    fn abs_min() -> u64;
   =20
    /// Perform bitwise 2's complement on `self`.
    ///
    /// Note: This function does not make sense for unsigned integers.
    fn complement(self) -> Self;

Doesn't make sense. What does it mean to return the "absolute value of
[`Self::MIN`]"? We don't have "absolute value" defined for an arbitrary
type. Similarly for `complement` and `from_str_radix`, what does "Parse
`src` to [`Self`] using radex `radix`" mean? It's not well-defined.

You use this safety requirement in the parsing branch for negative
numbers (the `unsafe` call at the bottom):

    [b'-', rest @ ..] =3D> {
        let (radix, digits) =3D strip_radix(rest.as_ref());
        // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
        // So if we want to parse negative numbers as positive and
        // later multiply by -1, we have to parse into a larger
        // integer. We choose `u64` as sufficiently large.
        //
        // NOTE: 128 bit integers are not available on all
        // platforms, hence the choice of 64 bits.
        let val =3D
            u64::from_str_radix(core::str::from_utf8(digits).map_err(|_| EI=
NVAL)?, radix)
                .map_err(|_| EINVAL)?;
   =20
        if val > Self::abs_min() {
            return Err(EINVAL);
        }
   =20
        if val =3D=3D Self::abs_min() {
            return Ok(Self::MIN);
        }
   =20
        // SAFETY: We checked that `val` will fit in `Self` above.
        let val: Self =3D unsafe { val.try_into().unwrap_unchecked() };
   =20
        Ok(val.complement())
    }

But you don't mention that the check is valid due to the safety
requirements of implementing `FromStrRadix`. But even if you did, that
wouldn't mean anything as I explained above.

So let's instead move all of this negation & u64 conversion logic into
the `FromStrRadix` trait. Then it can be safe & the `ParseInt::from_str`
function doesn't use `unsafe` (there still will be `unsafe` in the
macro, but that is fine, as it's more local and knows the concrete
types).

---
Cheers,
Benno

Here is what I have in mind:

diff --git a/rust/kernel/str/parse_int.rs b/rust/kernel/str/parse_int.rs
index 0754490aec4b..9d6e146c5ea7 100644
--- a/rust/kernel/str/parse_int.rs
+++ b/rust/kernel/str/parse_int.rs
@@ -13,32 +13,16 @@
 // `ParseInt`, that is, prevents downstream users from implementing the
 // trait.
 mod private {
+    use crate::prelude::*;
     use crate::str::BStr;
=20
     /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
-    ///
-    /// # Safety
-    ///
-    /// The member functions of this trait must be implemented according t=
o
-    /// their documentation.
-    ///
-    /// [`&BStr`]: kernel::str::BStr
-    // This is required because the `from_str_radix` function on the primi=
tive
-    // integer types is not part of any trait.
-    pub unsafe trait FromStrRadix: Sized {
-        /// The minimum value this integer type can assume.
-        const MIN: Self;
-
+    pub trait FromStrRadix: Sized {
         /// Parse `src` to [`Self`] using radix `radix`.
-        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::e=
rror::Error>;
-
-        /// Return the absolute value of [`Self::MIN`].
-        fn abs_min() -> u64;
+        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self>;
=20
-        /// Perform bitwise 2's complement on `self`.
-        ///
-        /// Note: This function does not make sense for unsigned integers.
-        fn complement(self) -> Self;
+        /// Tries to convert `value` into [`Self`] and negates the resulti=
ng value.
+        fn from_u64_negated(value: u64) -> Result<Self>;
     }
 }
=20
@@ -108,19 +92,7 @@ fn from_str(src: &BStr) -> Result<Self> {
                 let val =3D
                     u64::from_str_radix(core::str::from_utf8(digits).map_e=
rr(|_| EINVAL)?, radix)
                         .map_err(|_| EINVAL)?;
-
-                if val > Self::abs_min() {
-                    return Err(EINVAL);
-                }
-
-                if val =3D=3D Self::abs_min() {
-                    return Ok(Self::MIN);
-                }
-
-                // SAFETY: We checked that `val` will fit in `Self` above.
-                let val: Self =3D unsafe { val.try_into().unwrap_unchecked=
() };
-
-                Ok(val.complement())
+                Self::from_u64_negated(val)
             }
             _ =3D> {
                 let (radix, digits) =3D strip_radix(src);
@@ -131,41 +103,49 @@ fn from_str(src: &BStr) -> Result<Self> {
 }
=20
 macro_rules! impl_parse_int {
-    ($ty:ty) =3D> {
-        // SAFETY: We implement the trait according to the documentation.
-        unsafe impl private::FromStrRadix for $ty {
-            const MIN: Self =3D <$ty>::MIN;
-
-            fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crat=
e::error::Error> {
-                <$ty>::from_str_radix(core::str::from_utf8(src).map_err(|_=
| EINVAL)?, radix)
-                    .map_err(|_| EINVAL)
-            }
-
-            fn abs_min() -> u64 {
-                #[allow(unused_comparisons)]
-                if Self::MIN < 0 {
-                    1u64 << (Self::BITS - 1)
-                } else {
-                    0
+    ($($ty:ty),*) =3D> {
+        $(
+            impl private::FromStrRadix for $ty {
+                fn from_str_radix(src: &BStr, radix: u32) -> Result<Self> =
{
+                    <$ty>::from_str_radix(core::str::from_utf8(src).map_er=
r(|_| EINVAL)?, radix)
+                        .map_err(|_| EINVAL)
                 }
-            }
=20
-            fn complement(self) -> Self {
-                (!self).wrapping_add((1 as $ty))
+                fn from_u64_negated(value: u64) -> Result<Self> {
+                    const ABS_MIN: u64 =3D {
+                        #[allow(unused_comparisons)]
+                        if <$ty>::MIN < 0 {
+                            1u64 << (Self::BITS - 1)
+                        } else {
+                            0
+                        }
+                    };
+
+                    fn complement(self) -> Self {
+                        (!self).wrapping_add((1 as $ty))
+                    }
+                    if val > ABS_MIN {
+                        return Err(EINVAL);
+                    }
+
+                    if val =3D=3D ABS_MIN {
+                        return Ok(<$ty>::MIN);
+                    }
+
+                    // SAFETY: The above checks guarantee that `val` fits =
into `Self`:
+                    // - if `Self` is unsigned, then `ABS_MIN =3D=3D 0` an=
d thus we have returned above
+                    //   (either `EINVAL` or `MIN`).
+                    // - if `Self` is signed, then we have that `0 <=3D va=
l < ABS_MIN`. And since
+                    //   `ABS_MIN - 1` fits into `Self` by construction, `=
val` also does.
+                    let val: Self =3D unsafe { val.try_into().unwrap_unche=
cked() };
+
+                    Ok((!val).wrapping_add(1))
+                }
             }
-        }
=20
-        impl ParseInt for $ty {}
+            impl ParseInt for $ty {}
+        )*
     };
 }
=20
-impl_parse_int!(i8);
-impl_parse_int!(u8);
-impl_parse_int!(i16);
-impl_parse_int!(u16);
-impl_parse_int!(i32);
-impl_parse_int!(u32);
-impl_parse_int!(i64);
-impl_parse_int!(u64);
-impl_parse_int!(isize);
-impl_parse_int!(usize);
+impl_parse_int![i8, u8, i16, u16, i32, u32, i64, u64, isize, usize];

