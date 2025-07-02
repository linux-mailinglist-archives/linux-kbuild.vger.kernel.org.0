Return-Path: <linux-kbuild+bounces-7847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F4AF5D5C
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 17:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 863F64E6D27
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA072F3C1D;
	Wed,  2 Jul 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNNpFoMT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA73196B7;
	Wed,  2 Jul 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470739; cv=none; b=np8b/sW5DJbEghF4od5g8YvHbPTROu6duTZaWhiocK3z97qUc4DYZcmf+9oCav+kGKy0/a1/m5fA6aXaF1WePepJB+sa3PBtBNtqAhs9x7phNRGautxOLmR2e13B3CQJmoGeThuL17+XXMm26M7kSD64dw76Uk3zTQiLbT/EX3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470739; c=relaxed/simple;
	bh=xVqRwiHfOnhpPw+h31gDQIfiWzPQzkTPHDKsQJTenlk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Pv1nzqsmuzR3jVEanbzj+2J1YZ8O/m7ucJjfHTEflB+Vd8aw83kZ0ilNxCghBG7YdhxQ7KLShhpi2UeM1jCliEQSzFtoQ8/d3maN8Hkj0DawcANIXe9zt2i04ab9TdwlCiXQgy5TnxFkHVE1GJQL6ljfuAd1YJ39Hzud3/svLbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNNpFoMT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B457C4CEE7;
	Wed,  2 Jul 2025 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751470738;
	bh=xVqRwiHfOnhpPw+h31gDQIfiWzPQzkTPHDKsQJTenlk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UNNpFoMT8YR6I+KL0brkWV3r48Qq6aJijXKWMfhJl5dLyiaTFKr30H5pyd6lXmdPM
	 17jhcdm+JMWvHinfRMczrJ7+rHiHLCjTs2xw0dt/MN2jttSNcox/7xGxqlMePQYXNo
	 CJOgqpKkcc2TAstcvS0ZtwFbrBuJWPqDiyPcHPE2Hx2l5ml4+YMsgAm6gKQTBxKDIX
	 9CNO5ZxEdlPlkd5Jg/Qt8h1n64ikrKluqqs2RXql4H7QfOVE67N8KQH3LnUG6QuxT4
	 NdhUUkRKnPUa7hE8XpQ/5qAEzvEMagqd95jRpO1sBfktuXWI+F0X0lSzG3sRj658DS
	 O3q2ED3uXfyYw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 17:38:52 +0200
Message-Id: <DB1OK2PQZ790.S317HUWYJR3J@kernel.org>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 5/7] rust: module: update the module macro with
 module parameter support
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
X-Mailer: aerc 0.20.1
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-5-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-5-5b1cc32311af@kernel.org>

On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
> Allow module parameters to be declared in the rust `module!` macro.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

A few nits below, with those fixed

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/macros/helpers.rs |  25 +++++++
>  rust/macros/lib.rs     |  31 +++++++++
>  rust/macros/module.rs  | 177 +++++++++++++++++++++++++++++++++++++++++++=
+++---
>  3 files changed, 223 insertions(+), 10 deletions(-)

> +    fn emit_params(&mut self, info: &ModuleInfo) {
> +        let Some(params) =3D &info.params else {
> +            return;
> +        };
> +
> +        for param in params {
> +            let ops =3D param_ops_path(&param.ptype);
> +
> +            // Note: The spelling of these fields is dictated by the use=
r space
> +            // tool `modinfo`.
> +            self.emit_param("parmtype", &param.name, &param.ptype);
> +            self.emit_param("parm", &param.name, &param.description);
> +
> +            write!(
> +                self.param_buffer,
> +                "
> +                    pub(crate) static {param_name}:
> +                        ::kernel::module_param::ModuleParamAccess<{param=
_type}> =3D
> +                            ::kernel::module_param::ModuleParamAccess::n=
ew({param_default});
> +
> +                    #[link_section =3D \"__param\"]
> +                    #[used]
> +                    static __{module_name}_{param_name}_struct:

Does it make sense to move this static to a `const _: () =3D {};` block?

> +                        ::kernel::module_param::RacyKernelParam =3D
> +                        ::kernel::module_param::RacyKernelParam::new(
> +                          ::kernel::bindings::kernel_param {{
> +                            name: if cfg!(MODULE) {{

s/cfg/::core::cfg/

:)

Also there seems to only be a 2-space indentation here.

> +                                ::kernel::c_str!(\"{param_name}\").as_by=
tes_with_nul()
> +                            }} else {{
> +                                ::kernel::c_str!(\"{module_name}.{param_=
name}\").as_bytes_with_nul()
> +                            }}.as_ptr(),
> +                            // SAFETY: `__this_module` is constructed by=
 the kernel at load time
> +                            // and will not be freed until the module is=
 unloaded.
> +                            #[cfg(MODULE)]
> +                            mod_: unsafe {{
> +                                (&::kernel::bindings::__this_module
> +                                    as *const ::kernel::bindings::module=
)
> +                                    .cast_mut()
> +                            }},

It doesn't stop with the improvements...

    https://github.com/Rust-for-Linux/linux/issues/1176

Maybe we should also have one to use it here, but eh we can do that
later (and it's not as bad to forget about :)

> +                            #[cfg(not(MODULE))]
> +                            mod_: ::core::ptr::null_mut(),
> +                            ops: &{ops} as *const ::kernel::bindings::ke=
rnel_param_ops,

    ::core::ptr::from_ref(&{ops})

> +                            perm: 0, // Will not appear in sysfs
> +                            level: -1,
> +                            flags: 0,
> +                            __bindgen_anon_1:
> +                                ::kernel::bindings::kernel_param__bindge=
n_ty_1 {{
> +                                    arg: {param_name}.as_void_ptr()
> +                                }},

Formatting?

+                            __bindgen_anon_1: ::kernel::bindings::kernel_p=
aram__bindgen_ty_1 {{
+                                arg: {param_name}.as_void_ptr()
+                            }},

---
Cheers,
Benno

> +                          }}
> +                        );
> +                ",
> +                module_name =3D info.name,
> +                param_type =3D param.ptype,
> +                param_default =3D param.default,
> +                param_name =3D param.name,
> +                ops =3D ops,
> +            )
> +            .unwrap();
> +        }
> +    }
> +}

