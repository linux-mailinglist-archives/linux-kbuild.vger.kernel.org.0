Return-Path: <linux-kbuild+bounces-6990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E16AADD32
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 13:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82766980ADA
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 11:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558D921ABB2;
	Wed,  7 May 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYHE91EX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EADC4B1E6E;
	Wed,  7 May 2025 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616987; cv=none; b=TAQdjekj//7Exw5uD9s9vqqhbCV6Kb3rdHNTKXNObnUitgradapR402AZoMAAXl5SyWYQgwypslLRoHuGIlnFXxaaCQQF39Z0LX5GqrWymDSOY84w1WkpNFOhl7TbVD7S3KQeZZWAlqLHbqkQJC9/erZRnI8YHnFi44QavA/9f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616987; c=relaxed/simple;
	bh=A74vXDFWSWnKhjsMSQhZJL5xQ7wU7bDlQLBPPoCJGno=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QVR98VCn7kRocZp+q13ejUFPmiVhAYQ9Ydw86SdsMggLLJW4CNKSv/dyu9FgduGca3YFh2llJRJMQIczAtt9iRKzv8Kbm/h2A6RIjOm4NtDw4eQlz7fRwEeqqjHdoiIybS79JXl9UQXOhY6G1le80VUE1Hd8WVmIPrQgzljo7VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYHE91EX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC435C4CEE7;
	Wed,  7 May 2025 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746616986;
	bh=A74vXDFWSWnKhjsMSQhZJL5xQ7wU7bDlQLBPPoCJGno=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JYHE91EXAOzRikVYhL2Zf9hdJmFEnwwUxR6cvcWYsNW3ziZePNwI38/95H3VZrYgX
	 BqbaUxfpJc6vvNjunDXMF4BHQGaOcHEHoEY1RPHEiMaTJLSLmCKfokdmikKcyBerhp
	 OgiOQ+N++wi2VMbYk6cJeeQvnC3MVY8r2awo6kTvYqyRWDwTn7EqcDFVxyM7Qi5OFR
	 oLJ9a4QSQhMVDWELGiCF4PTn3Z1NEyXEk3cctsceIkeDKfIVv3jB8seJjLjxah201n
	 Et1XJsAZA43H9jqsBILdSLmarAFNQCNW8IhMj7PZzbbk0m5JoByN5Wn2ZMS4QgQufB
	 unJEy7JSvAQWw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:22:59 +0200
Message-Id: <D9PW1NI2S6FV.8LA53J87VCML@kernel.org>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v12 2/3] rust: add parameter support to the `module!`
 macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>
X-Mailer: aerc 0.20.1
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
 <20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org>
In-Reply-To: <20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org>

On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
> Add support for module parameters to the `module!` macro. Implement read
> only support for integer types without `sysfs` support.
>
> Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
> Tested-by: Daniel Gomez <da.gomez@samsung.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/lib.rs           |   1 +
>  rust/kernel/module_param.rs  | 204 +++++++++++++++++++++++++++++++++++++=
++++++
>  rust/macros/helpers.rs       |  25 ++++++
>  rust/macros/lib.rs           |  31 +++++++
>  rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++++-=
----
>  samples/rust/rust_minimal.rs |  10 +++

I know this is already the 12th version, but I think this patch should
be split into the module_param module introduction, proc-macro
modifications and the sample changes.

[...]

> +/// Set the module parameter from a string.
> +///
> +/// Used to set the parameter value at kernel initialization, when loadi=
ng
> +/// the module or when set through `sysfs`.
> +///
> +/// See `struct kernel_param_ops.set`.
> +///
> +/// # Safety
> +///
> +/// - If `val` is non-null then it must point to a valid null-terminated=
 string.
> +///   The `arg` field of `param` must be an instance of `T`.

This sentence is conveying the same (or at least similar) requirement as
the bullet point below.

> +/// - `param.arg` must be a pointer to valid `*mut T` as set up by the
> +///   [`module!`] macro.
> +///
> +/// # Invariants
> +///
> +/// Currently, we only support read-only parameters that are not readabl=
e
> +/// from `sysfs`. Thus, this function is only called at kernel
> +/// initialization time, or at module load time, and we have exclusive
> +/// access to the parameter for the duration of the function.

Why is this an Invariants section?

> +///
> +/// [`module!`]: macros::module
> +unsafe extern "C" fn set_param<T>(
> +    val: *const kernel::ffi::c_char,
> +    param: *const crate::bindings::kernel_param,
> +) -> core::ffi::c_int
> +where
> +    T: ModuleParam,
> +{
> +    // NOTE: If we start supporting arguments without values, val _is_ a=
llowed
> +    // to be null here.
> +    if val.is_null() {
> +        // TODO: Use pr_warn_once available.
> +        crate::pr_warn!("Null pointer passed to `module_param::set_param=
`");
> +        return EINVAL.to_errno();
> +    }
> +
> +    // SAFETY: By function safety requirement, val is non-null and
> +    // null-terminated. By C API contract, `val` is live and valid for r=
eads
> +    // for the duration of this function.

We shouldn't mention "C API contract" here and move the liveness
requirement to the safety requirements of the function. Or change the
safety requirements for this function to only be called from some
specific C API.=20

> +    let arg =3D unsafe { CStr::from_char_ptr(val) };
> +
> +    crate::error::from_result(|| {
> +        let new_value =3D T::try_from_param_arg(arg)?;
> +
> +        // SAFETY: `param` is guaranteed to be valid by C API contract
> +        // and `arg` is guaranteed to point to an instance of `T`.

Ditto.

> +        let old_value =3D unsafe { (*param).__bindgen_anon_1.arg as *mut=
 T };
> +
> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
> +        // access. `old_value` is pointing to an initialized static, and
> +        // so it is properly initialized.

Why do we have exclusive access? Should be in the safety requirements.

> +        unsafe { *old_value =3D new_value };
> +        Ok(0)
> +    })
> +}

[...]

> +#[doc(hidden)]
> +#[macro_export]
> +/// Generate a static [`kernel_param_ops`](srctree/include/linux/modulep=
aram.h) struct.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// make_param_ops!(
> +///     /// Documentation for new param ops.
> +///     PARAM_OPS_MYTYPE, // Name for the static.
> +///     MyType // A type which implements [`ModuleParam`].
> +/// );
> +/// ```
> +macro_rules! make_param_ops {
> +    ($ops:ident, $ty:ty) =3D> {
> +        ///

Spurious newline?

> +        /// Static [`kernel_param_ops`](srctree/include/linux/modulepara=
m.h)
> +        /// struct generated by `make_param_ops`

Is it useful for this fact to be in the docs? I'd remove it.

> +        #[doc =3D concat!("for [`", stringify!($ty), "`].")]
> +        pub static $ops: $crate::bindings::kernel_param_ops =3D $crate::=
bindings::kernel_param_ops {
> +            flags: 0,
> +            set: Some(set_param::<$ty>),
> +            get: None,
> +            free: None,
> +        };
> +    };
> +}
> +
> +make_param_ops!(PARAM_OPS_I8, i8);
> +make_param_ops!(PARAM_OPS_U8, u8);
> +make_param_ops!(PARAM_OPS_I16, i16);
> +make_param_ops!(PARAM_OPS_U16, u16);
> +make_param_ops!(PARAM_OPS_I32, i32);
> +make_param_ops!(PARAM_OPS_U32, u32);
> +make_param_ops!(PARAM_OPS_I64, i64);
> +make_param_ops!(PARAM_OPS_U64, u64);
> +make_param_ops!(PARAM_OPS_ISIZE, isize);
> +make_param_ops!(PARAM_OPS_USIZE, usize);
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index a3ee27e29a6f..16d300ad3d3b 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -10,6 +10,17 @@ pub(crate) fn try_ident(it: &mut token_stream::IntoIte=
r) -> Option<String> {
>      }
>  }
> =20
> +pub(crate) fn try_sign(it: &mut token_stream::IntoIter) -> Option<char> =
{
> +    let peek =3D it.clone().next();
> +    match peek {
> +        Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D '-' =3D>=
 {

Should we also allow a leading `+`?

> +            let _ =3D it.next();
> +            Some(punct.as_char())
> +        }
> +        _ =3D> None,
> +    }
> +}
> +
>  pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> Option<Str=
ing> {
>      if let Some(TokenTree::Literal(literal)) =3D it.next() {
>          Some(literal.to_string())
> @@ -86,3 +97,17 @@ pub(crate) fn function_name(input: TokenStream) -> Opt=
ion<Ident> {
>      }
>      None
>  }
> +
> +/// Parse a token stream of the form `expected_name: "value",` and retur=
n the
> +/// string in the position of "value".
> +///
> +/// # Panics
> +///
> +/// - On parse error.
> +pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, expec=
ted_name: &str) -> String {
> +    assert_eq!(expect_ident(it), expected_name);
> +    assert_eq!(expect_punct(it), ':');
> +    let string =3D expect_string(it);
> +    assert_eq!(expect_punct(it), ',');

This won't allow omitting the trailing comma.

> +    string
> +}

[...]

> @@ -186,33 +336,35 @@ pub(crate) fn module(ts: TokenStream) -> TokenStrea=
m {
>      let info =3D ModuleInfo::parse(&mut it);
> =20
>      let mut modinfo =3D ModInfoBuilder::new(info.name.as_ref());
> -    if let Some(author) =3D info.author {
> -        modinfo.emit("author", &author);
> +    if let Some(author) =3D &info.author {
> +        modinfo.emit("author", author);
>      }
> -    if let Some(authors) =3D info.authors {
> +    if let Some(authors) =3D &info.authors {
>          for author in authors {
> -            modinfo.emit("author", &author);
> +            modinfo.emit("author", author);
>          }
>      }
> -    if let Some(description) =3D info.description {
> -        modinfo.emit("description", &description);
> +    if let Some(description) =3D &info.description {
> +        modinfo.emit("description", description);
>      }
>      modinfo.emit("license", &info.license);
> -    if let Some(aliases) =3D info.alias {
> +    if let Some(aliases) =3D &info.alias {
>          for alias in aliases {
> -            modinfo.emit("alias", &alias);
> +            modinfo.emit("alias", alias);
>          }
>      }
> -    if let Some(firmware) =3D info.firmware {
> +    if let Some(firmware) =3D &info.firmware {
>          for fw in firmware {
> -            modinfo.emit("firmware", &fw);
> +            modinfo.emit("firmware", fw);

I don't like that you have to change all of these. Can't you just take a
`&[Parameter]` argument in `emit_params` instead of the whole
`ModuleInfo` struct?

---
Cheers,
Benno

>          }
>      }

