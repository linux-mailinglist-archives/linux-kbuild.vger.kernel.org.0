Return-Path: <linux-kbuild+bounces-7452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F346AD5567
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 14:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4E717F840
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 12:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E953627CCEA;
	Wed, 11 Jun 2025 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmsX30+y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FDC22CBD0;
	Wed, 11 Jun 2025 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644661; cv=none; b=XIZAbHKo2io0F3B02lCZNZW8lrvavhvwwBOwSvGLNrVCLZAJfqNHCQTThRv+NfgL5QQ2DdsnX9pO8c0UhhwViAr3+pc3RNXstFH4WlIIB7Pd9fHF4AIEMDruNQbUoWtFFYnEB1oPXHgY3ZPtcVVgi9+sBm3aRhd6Dc1JLBoXeoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644661; c=relaxed/simple;
	bh=HktI37/DNEasblw5pBFr+wXSlVnkb1VCmOLWOfwxbbA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QC46fGTi+8UOZ8jrmLgh5xvlII4DeO1D+VOk8cLnNRMZbS91g8vQPYVIy1YZLxcT5D9yhHyEZnbAs1VQagOwr76HyaT+6lWFCYmrEWDhc3Mv/17dxZa3fLlHnH3V2C0bDYNtlz3fY9D4l94zF/dy7jLBa2AF7XJXtDQDSp7wsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmsX30+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E54BC4CEEE;
	Wed, 11 Jun 2025 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749644661;
	bh=HktI37/DNEasblw5pBFr+wXSlVnkb1VCmOLWOfwxbbA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kmsX30+yJAmTEQ2T/Do0NBj6OcyuV/J5ThkBUVxFbXbyMhDedCdOYm2Hl3boEzK5o
	 Xm2TZ+lYAz75r9KrCv3pFQA4JTVuVFEocMlJr3Uie/iV9w7rbdQUDpjF8k8H4C3HMJ
	 2x92Okb/RS27hjk/2S8YcjJpvJsbXE/nRc1Dn7i3y6CqEAIVvQgeluwNM/qnNwzF7F
	 2FNvfi7+ccW6l2MQw8EpKI6kg9RJmFZI92KiE7QrLy28gJ/kzYrWrS/rypq4wiLFtV
	 Qkq9rhD8WEm9GsTC4+8NBv04Qyrr41lY4dgmIANio6wznnCn8ylekt1Cz7wK6PNo/Z
	 RJnXEJ1KKGVeg==
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
In-Reply-To: <87plfazi13.fsf@kernel.org> (Andreas Hindborg's message of "Wed,
	11 Jun 2025 12:31:20 +0200")
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
	<20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org>
	<D9PW1NI2S6FV.8LA53J87VCML@kernel.org> <87plfazi13.fsf@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 11 Jun 2025 14:24:08 +0200
Message-ID: <87wm9ixy8n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Benno Lossin" <lossin@kernel.org> writes:
>
>> On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
>>> Add support for module parameters to the `module!` macro. Implement read
>>> only support for integer types without `sysfs` support.
>>>
>>> Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
>>> Tested-by: Daniel Gomez <da.gomez@samsung.com>
>>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/lib.rs           |   1 +
>>>  rust/kernel/module_param.rs  | 204 +++++++++++++++++++++++++++++++++++++++++++
>>>  rust/macros/helpers.rs       |  25 ++++++
>>>  rust/macros/lib.rs           |  31 +++++++
>>>  rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++++-----
>>>  samples/rust/rust_minimal.rs |  10 +++
>>
>> I know this is already the 12th version, but I think this patch should
>> be split into the module_param module introduction, proc-macro
>> modifications and the sample changes.
>>
>
> OK.
>
>> [...]
>>
>>> +/// Set the module parameter from a string.
>>> +///
>>> +/// Used to set the parameter value at kernel initialization, when loading
>>> +/// the module or when set through `sysfs`.
>>> +///
>>> +/// See `struct kernel_param_ops.set`.
>>> +///
>>> +/// # Safety
>>> +///
>>> +/// - If `val` is non-null then it must point to a valid null-terminated string.
>>> +///   The `arg` field of `param` must be an instance of `T`.
>>
>> This sentence is conveying the same (or at least similar) requirement as
>> the bullet point below.
>
> Yes, you are right. At any rate the wording is wrong, a pointer cannot
> "be an instance", it can point to one.
>
>>
>>> +/// - `param.arg` must be a pointer to valid `*mut T` as set up by the
>>> +///   [`module!`] macro.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// Currently, we only support read-only parameters that are not readable
>>> +/// from `sysfs`. Thus, this function is only called at kernel
>>> +/// initialization time, or at module load time, and we have exclusive
>>> +/// access to the parameter for the duration of the function.
>>
>> Why is this an Invariants section?
>
> Looks like a mistake, I'll change it to "# Note".
>
>>
>>> +///
>>> +/// [`module!`]: macros::module
>>> +unsafe extern "C" fn set_param<T>(
>>> +    val: *const kernel::ffi::c_char,
>>> +    param: *const crate::bindings::kernel_param,
>>> +) -> core::ffi::c_int
>>> +where
>>> +    T: ModuleParam,
>>> +{
>>> +    // NOTE: If we start supporting arguments without values, val _is_ allowed
>>> +    // to be null here.
>>> +    if val.is_null() {
>>> +        // TODO: Use pr_warn_once available.
>>> +        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
>>> +        return EINVAL.to_errno();
>>> +    }
>>> +
>>> +    // SAFETY: By function safety requirement, val is non-null and
>>> +    // null-terminated. By C API contract, `val` is live and valid for reads
>>> +    // for the duration of this function.
>>
>> We shouldn't mention "C API contract" here and move the liveness
>> requirement to the safety requirements of the function. Or change the
>> safety requirements for this function to only be called from some
>> specific C API.
>
> OK.
>
>>
>>> +    let arg = unsafe { CStr::from_char_ptr(val) };
>>> +
>>> +    crate::error::from_result(|| {
>>> +        let new_value = T::try_from_param_arg(arg)?;
>>> +
>>> +        // SAFETY: `param` is guaranteed to be valid by C API contract
>>> +        // and `arg` is guaranteed to point to an instance of `T`.
>>
>> Ditto.
>
> OK.
>
>>
>>> +        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
>>> +
>>> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
>>> +        // access. `old_value` is pointing to an initialized static, and
>>> +        // so it is properly initialized.
>>
>> Why do we have exclusive access? Should be in the safety requirements.
>
> Will add this.
>
>>
>>> +        unsafe { *old_value = new_value };
>>> +        Ok(0)
>>> +    })
>>> +}
>>
>> [...]
>>
>>> +#[doc(hidden)]
>>> +#[macro_export]
>>> +/// Generate a static [`kernel_param_ops`](srctree/include/linux/moduleparam.h) struct.
>>> +///
>>> +/// # Examples
>>> +///
>>> +/// ```ignore
>>> +/// make_param_ops!(
>>> +///     /// Documentation for new param ops.
>>> +///     PARAM_OPS_MYTYPE, // Name for the static.
>>> +///     MyType // A type which implements [`ModuleParam`].
>>> +/// );
>>> +/// ```
>>> +macro_rules! make_param_ops {
>>> +    ($ops:ident, $ty:ty) => {
>>> +        ///
>>
>> Spurious newline?
>
> Will remove.
>
>>
>>> +        /// Static [`kernel_param_ops`](srctree/include/linux/moduleparam.h)
>>> +        /// struct generated by `make_param_ops`
>>
>> Is it useful for this fact to be in the docs? I'd remove it.
>
> OK.
>

Clippy thinks it is useful:

    error: missing documentation for a static
      --> /home/aeh/src/linux-rust/module-params/rust/kernel/module_param.rs:182:9
        |
    182 |         pub static $ops: $crate::bindings::kernel_param_ops = $crate::bindings::kernel_param_ops {
        |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ...
    191 | make_param_ops!(PARAM_OPS_I8, i8);
        | --------------------------------- in this macro invocation
        |

So either we need to `#[allow(missing_docs)]` or just add the line back. What do you prefer?


Best regards,
Andreas Hindborg



