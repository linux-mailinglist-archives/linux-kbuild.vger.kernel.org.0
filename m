Return-Path: <linux-kbuild+bounces-7878-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58FAF928E
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 14:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7D1D7B10E4
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 12:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492A32D77F6;
	Fri,  4 Jul 2025 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs61oTuP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906814A4CC;
	Fri,  4 Jul 2025 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632208; cv=none; b=FHXJ2Vt+hsAICprR9vWWOPQkvMAWGMUp4LxkfQ+8aTM4dQxXYIYx1EskEzzU65dhKXcqkgRjQczwfviNyqwZQgMIoSEkTh5nPMxZRx9RmP3cPqf18QTY9l9UkFnhjRAEqmtQjlGQ9OC71/Z1OnngWzdwDHPUld8xTBiNFCRIJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632208; c=relaxed/simple;
	bh=zW7noFryrnYZPc0SGx8AEUXZ+kRRxTufCit12o2wRrc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=awAP4Zft5wcvgYltcDwKvPv7OxucbsQnwVtGVlEAcvCU4ICVBtQGiLt7P9ZXRUxBNxRmxaw1zXQxAyY1qts2VFzYQlX+qRDkpqhWmaRuZV1nbs7YQD3/PFX2a8tCsarrolOSUmYwq4fM0tNi94VTio0x9qmRSegdThy/LDa6eQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs61oTuP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99B5C4CEE3;
	Fri,  4 Jul 2025 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751632207;
	bh=zW7noFryrnYZPc0SGx8AEUXZ+kRRxTufCit12o2wRrc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qs61oTuPjVkJsgP5wobUD0zmdh+m8uHFHLXVwQDQcMrjLgpXDdbIPNPeZp9uEKKm3
	 keWBVG5nQMPgJfTSsmvvVN0rqvfZt/ZXfTK7qRLAHrMLGwQdKzmOCArjtLwkTOCmSU
	 Dd1B7oqroTXqPn77EJ3ymyf9zamLo4YZ3L/6kmZioxUtol160LeyqShT97Xf8IpJBP
	 xlhEiRi4aXsfaQvwb0/NVHOUnXTUN+h3SIrPbnrLSwVna5fFh9bLmBV77oq1fgcQEd
	 3l7RZSDBtAQKfITPprttuaccFSz7/tvKRJKhQX0iBh26790jGP0uxM6JoViUqetkuX
	 dUNqs6cFl1DHA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 5/7] rust: module: update the module macro with
 module parameter support
In-Reply-To: <DB1OK2PQZ790.S317HUWYJR3J@kernel.org> (Benno Lossin's message of
	"Wed, 02 Jul 2025 17:38:52 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-5-5b1cc32311af@kernel.org>
	<5fYjUlNFhuBwWOP46ph07KX4CMe0ORT5pZ_pD-l719E0ChkPTI2pV1tYJcN3oxKKcMI8_HGU1InaWBj52Kbbag==@protonmail.internalid>
	<DB1OK2PQZ790.S317HUWYJR3J@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 14:29:57 +0200
Message-ID: <875xg8rvei.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Benno Lossin" <lossin@kernel.org> writes:

> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>> Allow module parameters to be declared in the rust `module!` macro.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> A few nits below, with those fixed
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
>> ---
>>  rust/macros/helpers.rs |  25 +++++++
>>  rust/macros/lib.rs     |  31 +++++++++
>>  rust/macros/module.rs  | 177 ++++++++++++++++++++++++++++++++++++++++++=
++++---
>>  3 files changed, 223 insertions(+), 10 deletions(-)
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
>> +
>> +                    #[link_section =3D \"__param\"]
>> +                    #[used]
>> +                    static __{module_name}_{param_name}_struct:
>
> Does it make sense to move this static to a `const _: () =3D {};` block?

Yes, that makes sense.

>
>> +                        ::kernel::module_param::RacyKernelParam =3D
>> +                        ::kernel::module_param::RacyKernelParam::new(
>> +                          ::kernel::bindings::kernel_param {{
>> +                            name: if cfg!(MODULE) {{
>
> s/cfg/::core::cfg/

OK.

>
> :)
>
> Also there seems to only be a 2-space indentation here.

Fixed.

>
>> +                                ::kernel::c_str!(\"{param_name}\").as_b=
ytes_with_nul()
>> +                            }} else {{
>> +                                ::kernel::c_str!(\"{module_name}.{param=
_name}\").as_bytes_with_nul()
>> +                            }}.as_ptr(),
>> +                            // SAFETY: `__this_module` is constructed b=
y the kernel at load time
>> +                            // and will not be freed until the module i=
s unloaded.
>> +                            #[cfg(MODULE)]
>> +                            mod_: unsafe {{
>> +                                (&::kernel::bindings::__this_module
>> +                                    as *const ::kernel::bindings::modul=
e)
>> +                                    .cast_mut()
>> +                            }},
>
> It doesn't stop with the improvements...
>
>     https://github.com/Rust-for-Linux/linux/issues/1176
>
> Maybe we should also have one to use it here, but eh we can do that
> later (and it's not as bad to forget about :)

Applying `from_ref`.

>
>> +                            #[cfg(not(MODULE))]
>> +                            mod_: ::core::ptr::null_mut(),
>> +                            ops: &{ops} as *const ::kernel::bindings::k=
ernel_param_ops,
>
>     ::core::ptr::from_ref(&{ops})

=F0=9F=91=8D

>
>> +                            perm: 0, // Will not appear in sysfs
>> +                            level: -1,
>> +                            flags: 0,
>> +                            __bindgen_anon_1:
>> +                                ::kernel::bindings::kernel_param__bindg=
en_ty_1 {{
>> +                                    arg: {param_name}.as_void_ptr()
>> +                                }},
>
> Formatting?
>
> +                            __bindgen_anon_1: ::kernel::bindings::kernel=
_param__bindgen_ty_1 {{
> +                                arg: {param_name}.as_void_ptr()
> +                            }},


That makes the line more than 100 characters after changing other
formatting things. Perhaps I should just left shift all this?


Best regards,
Andreas Hindborg




