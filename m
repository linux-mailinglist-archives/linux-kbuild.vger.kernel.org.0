Return-Path: <linux-kbuild+bounces-6931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D0AA9058
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 11:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4301898380
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A914B1F790F;
	Mon,  5 May 2025 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIG6OFKK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E11DE3AF;
	Mon,  5 May 2025 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438945; cv=none; b=E5IBC+opG1V12WxDcg5dmoojFHR8SNncUXGhf7mAVEWHF+oR4CKzj1VatAjyPJKASusFnMuUeZnkl2mGLF4RQic97eOIkWCIaQVUcnK1rv4BZwjbh4o0EkXCDeB1iZlunSOrrCHuUECriRubB0RaakjxoeuCBA0pUlbVuHdl9lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438945; c=relaxed/simple;
	bh=C+qofN41T9ZGZV/Yauz2+1+PKYZmi9DihY6aLigOKSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kvN5/jnEA0Q2i+sOqYyTd8iwS8bIBErs4UAIlIrZbkPjG3P5SR3ZnWglPaoRDVEKnStHpcXQVtXdnRvgRuSU3NdArTcZP/Nlt4sI9iny/qyHGz8L6tmb4KrwyWbAENvXTRUi3MEAvJdcVPqsyk4B2LzujebhexYKEhhNn2Qy+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIG6OFKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC56C4CEE4;
	Mon,  5 May 2025 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746438945;
	bh=C+qofN41T9ZGZV/Yauz2+1+PKYZmi9DihY6aLigOKSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lIG6OFKKuZoF45Xa5t+XOx2zCpIrNGnvG4tQ+MSOPD8cmpNfuqXBeXEQJCQvzV+Tr
	 TVb9iR3kx5r/nLo6Ivm3btPA3XlQ1WlJcKlQqOVMIlcMTrRvwmjmMdJuvInwuiCPPZ
	 j8/qiNiZSyf80yMW3JYb2+5Jlr3gxr2/Mfow6l+49fECTvMk6Q2I0ypz0+JQrlAxho
	 m1CyDA2fbsGuf3vuEmN7m4xX165tSxjwDG616sOdZ1kPN3eRCQ1k9Z188xhX/3gZw9
	 MdcMGURjj6qG05hThenfkuXn/UuLCyj0UebROnk9llUV1GLIsasAYQwNUqb9Agw06X
	 q3+FbTdn7wyzw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Nicolas Schier" <nicolas.schier@linux.dev>,  "Trevor Gross"
 <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v11 2/3] rust: add parameter support to the `module!` macro
In-Reply-To: <aBTMMHWNXS7wK7zS@google.com> (Alice Ryhl's message of "Fri, 02
	May 2025 13:44:16 +0000")
References: <20250502-module-params-v3-v11-0-6096875a2b78@kernel.org>
	<20250502-module-params-v3-v11-2-6096875a2b78@kernel.org>
	<WroEJHY8a-y8vbSQkUvGJJs7yTQGKMsHJqmWFYGkz5bZ_PsiE8GAozjSaNpWjWina1XanjVNpV0Av3woiaUtJg==@protonmail.internalid>
	<aBTMMHWNXS7wK7zS@google.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 05 May 2025 11:55:33 +0200
Message-ID: <878qnbxtyi.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Fri, May 02, 2025 at 02:16:35PM +0200, Andreas Hindborg wrote:
>> Add support for module parameters to the `module!` macro. Implement read
>> only support for integer types without `sysfs` support.
>>
>> Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
>> Tested-by: Daniel Gomez <da.gomez@samsung.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
>> +unsafe extern "C" fn set_param<T>(
>> +    val: *const kernel::ffi::c_char,
>> +    param: *const crate::bindings::kernel_param,
>> +) -> core::ffi::c_int
>> +where
>> +    T: ModuleParam,
>> +{
>> +    // NOTE: If we start supporting arguments without values, val _is_ =
allowed
>> +    // to be null here.
>> +    if val.is_null() {
>> +        // TODO: Use pr_warn_once available.
>> +        crate::pr_warn!("Null pointer passed to `module_param::set_para=
m`");
>> +        return EINVAL.to_errno();
>> +    }
>> +
>> +    // SAFETY: By function safety requirement, val is non-null and
>> +    // null-terminated. By C API contract, `val` is live and valid for =
reads
>> +    // for the duration of this function.
>> +    let arg =3D unsafe { CStr::from_char_ptr(val) };
>> +
>> +    crate::error::from_result(|| {
>> +        let new_value =3D T::try_from_param_arg(arg)?;
>> +
>> +        // SAFETY: `param` is guaranteed to be valid by C API contract
>> +        // and `arg` is guaranteed to point to an instance of `T`.
>> +        let old_value =3D unsafe { (*param).__bindgen_anon_1.arg as *mu=
t T };
>> +
>> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
>> +        // access. `old_value` is pointing to an initialized static, and
>> +        // so it is properly initialized.
>> +        unsafe { core::ptr::replace(old_value, new_value) };
>
> You don't use the return value of this, so this is equivalent to
> unsafe { *old_value =3D new_value };

Thanks.

>
>> +macro_rules! make_param_ops {
>> +    ($ops:ident, $ty:ty) =3D> {
>> +        ///
>> +        /// Static [`kernel_param_ops`](srctree/include/linux/modulepar=
am.h)
>> +        /// struct generated by `make_param_ops`
>> +        #[doc =3D concat!("for [`", stringify!($ty), "`].")]
>> +        pub static $ops: $crate::bindings::kernel_param_ops =3D $crate:=
:bindings::kernel_param_ops {
>> +            flags: 0,
>> +            set: Some(set_param::<$ty>),
>> +            get: None,
>> +            free: Some(free::<$ty>),
>
> You could potentially only include `free` if
> `core::mem::needs_drop::<T>()` as an optimization.

Right, nice =F0=9F=91=8D

>
>> +    fn emit_params(&mut self, info: &ModuleInfo) {
>> +        let Some(params) =3D &info.params else {
>> +            return;
>> +        };
>> +
>> +        for param in params {
>> +            let ops =3D param_ops_path(&param.ptype);
>> +
>> +            // Note: The spelling of these fields is dictated by the us=
er space
>> +            // tool `modinfo`.
>> +            self.emit_param("parmtype", &param.name, &param.ptype);
>> +            self.emit_param("parm", &param.name, &param.description);
>> +
>> +            write!(
>> +                self.param_buffer,
>> +                "
>> +                    pub(crate) static {param_name}:
>> +                        ::kernel::module_param::ModuleParamAccess<{para=
m_type}> =3D
>> +                            ::kernel::module_param::ModuleParamAccess::=
new({param_default});
>
> Is this global accessible to the user?

Yes.

> It would be a use-after-free to
> access it during module teardown. For example, what if I access this
> static during its own destructor? Or during the destructor of another
> module parameter?

Yes, that is a problem.

We can get around it for now by just not calling `free` for now. We only
support simple types that do not need drop. I think we would have to
seal the `ModuleParam` trait for this.

For a proper solution, we could
 - Require a token to read the parameter.
 - Synchronize on a module private field and return an option from the
   parameter getter. This would require module exit to run before param
   free. I think this is the case, but I did not check.
 - Use a `Revocable` and revoke the parameter in `free`.

Any other ideas or comments on the outlined solutions?


Best regards,
Andreas Hindborg



