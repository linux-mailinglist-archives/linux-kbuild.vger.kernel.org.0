Return-Path: <linux-kbuild+bounces-7450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5851AD51F1
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 12:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DC113AAE11
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 10:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3120D272E6D;
	Wed, 11 Jun 2025 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCw2pkf3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0E26A086;
	Wed, 11 Jun 2025 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637892; cv=none; b=l8gfnNHCZ3M2wDokDImH/uKQ0OPAcIG0F3W4XFeYMMy6644/Ev9wD4yEW6w3BjRZ6FsWRdmWyD5fokb3S2aMEGy+Qhblb9XYU+/Ojug/nJeFi+qw/NjGn1igHMolI04KbGs7y0axV6cu5SxNvB0wDlBwX+F2JyXGVCZcgz4djBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637892; c=relaxed/simple;
	bh=zbXkrw2g7Nk5/IHZdZjS24dGIX1MM5/JBbhwXwwb97k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHDjdesoFqnOR/OAFtaLEcxt5mfVsBcbcvBDepqH4Dac37UFOMASNMy44el5XjIemWF6B05lTziDVfIx2DeTVwWwizw4mZamtS7WL9K1DFL5UDtLqt0QvhnOOCd+JU5pK1qn3WHgFJNasRUn/EHvgdifjGQlYVn4vtrkLnk5dpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCw2pkf3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AC4C4CEEE;
	Wed, 11 Jun 2025 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749637891;
	bh=zbXkrw2g7Nk5/IHZdZjS24dGIX1MM5/JBbhwXwwb97k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PCw2pkf3UvV3UkKAi5ZmRqEUgDEotnXLJz2JfowK9DwitrpGnCZyq/QqcZqiHnE6v
	 xkhSMOeHxwFLOJ6oyhb8eAON1M0FADfXxGCvUWNlTWmOZr7QWGOPUNsXPLzZKQuaPO
	 CT1vxjuAvxjL585lb7hwaAlrkM3YKtza1xgyXhuGHXTg0d515bxLmjNJGzTO/tKCXz
	 V3SjR4FCKKPRLN/slRJ8z1cl+X1ngQoSAn0mzVeNDUIGBTCLnwhiTvWMULLnsWDNlV
	 Y0cfzv59ltbpRzPzyp3qdetOkMOTsYzSx99Taq4SI+nZSwDT82nyZ0DNdFPVvvXFgC
	 4MOXnRuueo/nQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Luis Chamberlain" <mcgrof@kernel.org>,  "Danilo
 Krummrich" <dakr@kernel.org>,  "Nicolas Schier"
 <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v12 2/3] rust: add parameter support to the `module!` macro
In-Reply-To: <D9PW1NI2S6FV.8LA53J87VCML@kernel.org> (Benno Lossin's message of
	"Wed, 07 May 2025 13:22:59 +0200")
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
	<20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org>
	<D9PW1NI2S6FV.8LA53J87VCML@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 11 Jun 2025 12:31:20 +0200
Message-ID: <87plfazi13.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
>> Add support for module parameters to the `module!` macro. Implement read
>> only support for integer types without `sysfs` support.
>>
>> Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
>> Tested-by: Daniel Gomez <da.gomez@samsung.com>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/lib.rs           |   1 +
>>  rust/kernel/module_param.rs  | 204 +++++++++++++++++++++++++++++++++++++++++++
>>  rust/macros/helpers.rs       |  25 ++++++
>>  rust/macros/lib.rs           |  31 +++++++
>>  rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++++-----
>>  samples/rust/rust_minimal.rs |  10 +++
>
> I know this is already the 12th version, but I think this patch should
> be split into the module_param module introduction, proc-macro
> modifications and the sample changes.
>

OK.

> [...]
>
>> +/// Set the module parameter from a string.
>> +///
>> +/// Used to set the parameter value at kernel initialization, when loading
>> +/// the module or when set through `sysfs`.
>> +///
>> +/// See `struct kernel_param_ops.set`.
>> +///
>> +/// # Safety
>> +///
>> +/// - If `val` is non-null then it must point to a valid null-terminated string.
>> +///   The `arg` field of `param` must be an instance of `T`.
>
> This sentence is conveying the same (or at least similar) requirement as
> the bullet point below.

Yes, you are right. At any rate the wording is wrong, a pointer cannot
"be an instance", it can point to one.

>
>> +/// - `param.arg` must be a pointer to valid `*mut T` as set up by the
>> +///   [`module!`] macro.
>> +///
>> +/// # Invariants
>> +///
>> +/// Currently, we only support read-only parameters that are not readable
>> +/// from `sysfs`. Thus, this function is only called at kernel
>> +/// initialization time, or at module load time, and we have exclusive
>> +/// access to the parameter for the duration of the function.
>
> Why is this an Invariants section?

Looks like a mistake, I'll change it to "# Note".

>
>> +///
>> +/// [`module!`]: macros::module
>> +unsafe extern "C" fn set_param<T>(
>> +    val: *const kernel::ffi::c_char,
>> +    param: *const crate::bindings::kernel_param,
>> +) -> core::ffi::c_int
>> +where
>> +    T: ModuleParam,
>> +{
>> +    // NOTE: If we start supporting arguments without values, val _is_ allowed
>> +    // to be null here.
>> +    if val.is_null() {
>> +        // TODO: Use pr_warn_once available.
>> +        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
>> +        return EINVAL.to_errno();
>> +    }
>> +
>> +    // SAFETY: By function safety requirement, val is non-null and
>> +    // null-terminated. By C API contract, `val` is live and valid for reads
>> +    // for the duration of this function.
>
> We shouldn't mention "C API contract" here and move the liveness
> requirement to the safety requirements of the function. Or change the
> safety requirements for this function to only be called from some
> specific C API.

OK.

>
>> +    let arg = unsafe { CStr::from_char_ptr(val) };
>> +
>> +    crate::error::from_result(|| {
>> +        let new_value = T::try_from_param_arg(arg)?;
>> +
>> +        // SAFETY: `param` is guaranteed to be valid by C API contract
>> +        // and `arg` is guaranteed to point to an instance of `T`.
>
> Ditto.

OK.

>
>> +        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
>> +
>> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
>> +        // access. `old_value` is pointing to an initialized static, and
>> +        // so it is properly initialized.
>
> Why do we have exclusive access? Should be in the safety requirements.

Will add this.

>
>> +        unsafe { *old_value = new_value };
>> +        Ok(0)
>> +    })
>> +}
>
> [...]
>
>> +#[doc(hidden)]
>> +#[macro_export]
>> +/// Generate a static [`kernel_param_ops`](srctree/include/linux/moduleparam.h) struct.
>> +///
>> +/// # Examples
>> +///
>> +/// ```ignore
>> +/// make_param_ops!(
>> +///     /// Documentation for new param ops.
>> +///     PARAM_OPS_MYTYPE, // Name for the static.
>> +///     MyType // A type which implements [`ModuleParam`].
>> +/// );
>> +/// ```
>> +macro_rules! make_param_ops {
>> +    ($ops:ident, $ty:ty) => {
>> +        ///
>
> Spurious newline?

Will remove.

>
>> +        /// Static [`kernel_param_ops`](srctree/include/linux/moduleparam.h)
>> +        /// struct generated by `make_param_ops`
>
> Is it useful for this fact to be in the docs? I'd remove it.

OK.

>
>> +        #[doc = concat!("for [`", stringify!($ty), "`].")]
>> +        pub static $ops: $crate::bindings::kernel_param_ops = $crate::bindings::kernel_param_ops {
>> +            flags: 0,
>> +            set: Some(set_param::<$ty>),
>> +            get: None,
>> +            free: None,
>> +        };
>> +    };
>> +}
>> +
>> +make_param_ops!(PARAM_OPS_I8, i8);
>> +make_param_ops!(PARAM_OPS_U8, u8);
>> +make_param_ops!(PARAM_OPS_I16, i16);
>> +make_param_ops!(PARAM_OPS_U16, u16);
>> +make_param_ops!(PARAM_OPS_I32, i32);
>> +make_param_ops!(PARAM_OPS_U32, u32);
>> +make_param_ops!(PARAM_OPS_I64, i64);
>> +make_param_ops!(PARAM_OPS_U64, u64);
>> +make_param_ops!(PARAM_OPS_ISIZE, isize);
>> +make_param_ops!(PARAM_OPS_USIZE, usize);
>> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
>> index a3ee27e29a6f..16d300ad3d3b 100644
>> --- a/rust/macros/helpers.rs
>> +++ b/rust/macros/helpers.rs
>> @@ -10,6 +10,17 @@ pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<String> {
>>      }
>>  }
>>  
>> +pub(crate) fn try_sign(it: &mut token_stream::IntoIter) -> Option<char> {
>> +    let peek = it.clone().next();
>> +    match peek {
>> +        Some(TokenTree::Punct(punct)) if punct.as_char() == '-' => {
>
> Should we also allow a leading `+`?

I would argue no, because rust literals cannot start with `+`.

>
>> +            let _ = it.next();
>> +            Some(punct.as_char())
>> +        }
>> +        _ => None,
>> +    }
>> +}
>> +
>>  pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> Option<String> {
>>      if let Some(TokenTree::Literal(literal)) = it.next() {
>>          Some(literal.to_string())
>> @@ -86,3 +97,17 @@ pub(crate) fn function_name(input: TokenStream) -> Option<Ident> {
>>      }
>>      None
>>  }
>> +
>> +/// Parse a token stream of the form `expected_name: "value",` and return the
>> +/// string in the position of "value".
>> +///
>> +/// # Panics
>> +///
>> +/// - On parse error.
>> +pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, expected_name: &str) -> String {
>> +    assert_eq!(expect_ident(it), expected_name);
>> +    assert_eq!(expect_punct(it), ':');
>> +    let string = expect_string(it);
>> +    assert_eq!(expect_punct(it), ',');
>
> This won't allow omitting the trailing comma.

This is in line with the rest of the module macro.

>
>> +    string
>> +}
>
> [...]
>
>> @@ -186,33 +336,35 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
>>      let info = ModuleInfo::parse(&mut it);
>>  
>>      let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
>> -    if let Some(author) = info.author {
>> -        modinfo.emit("author", &author);
>> +    if let Some(author) = &info.author {
>> +        modinfo.emit("author", author);
>>      }
>> -    if let Some(authors) = info.authors {
>> +    if let Some(authors) = &info.authors {
>>          for author in authors {
>> -            modinfo.emit("author", &author);
>> +            modinfo.emit("author", author);
>>          }
>>      }
>> -    if let Some(description) = info.description {
>> -        modinfo.emit("description", &description);
>> +    if let Some(description) = &info.description {
>> +        modinfo.emit("description", description);
>>      }
>>      modinfo.emit("license", &info.license);
>> -    if let Some(aliases) = info.alias {
>> +    if let Some(aliases) = &info.alias {
>>          for alias in aliases {
>> -            modinfo.emit("alias", &alias);
>> +            modinfo.emit("alias", alias);
>>          }
>>      }
>> -    if let Some(firmware) = info.firmware {
>> +    if let Some(firmware) = &info.firmware {
>>          for fw in firmware {
>> -            modinfo.emit("firmware", &fw);
>> +            modinfo.emit("firmware", fw);
>
> I don't like that you have to change all of these.

Why not? If I was to write this code in the first place, I would have
used a reference rather than pass by value.

> Can't you just take a
> `&[Parameter]` argument in `emit_params` instead of the whole
> `ModuleInfo` struct?

I don't think that is a nice solution. I would have to pass the name
field as well, increasing the number of parameters to the function.


Best regards,
Andreas Hindborg



