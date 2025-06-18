Return-Path: <linux-kbuild+bounces-7557-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E83ADF85F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 23:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D29FD4A3CCE
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 21:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4737B25F7A6;
	Wed, 18 Jun 2025 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skniixjL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156F1221F13;
	Wed, 18 Jun 2025 21:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280857; cv=none; b=kPzREyPSpcipxrTthWq29skhKaDBOCUcRekZhMLOsXOrIGyi0zSBq/wlOWSleafBDA/naFLbO+hx38vPnwPEK4h4FeZy+dvBSx2U5GazvjjI2xvdq0+SUHDXwMEL4I6XDnuPAgsOIKALxxgNBWZTRZEMwJhligVTU0RWnS+XZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280857; c=relaxed/simple;
	bh=2Fa+CiaEKDG/45664bJOrW49zdOHbkEpkERvvIlutq0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=gyE5FU2ckIz3C75LMFpamV4xrLW0bu74asUiC9pzjCBRUM83Lf0sw3vuR7gK1iVwkzWFSkl6VbqeVlIg+KLn9XUUshn6p0Q6Y10/KZ4J7FUw4z4SMUR2+jwPh+7Dbc2Jl/y9ThiBNbB/FrjgdB+F1cZZpWB2vGSqPhVMdWSNIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skniixjL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4782DC4CEE7;
	Wed, 18 Jun 2025 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280856;
	bh=2Fa+CiaEKDG/45664bJOrW49zdOHbkEpkERvvIlutq0=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=skniixjLc6Xk7NhihFRDAoeHa5UgkQsF7Z6/21kBw+4kyjEN8dtQS5OXz1p12yGeH
	 OpzL+ucZQU/eywKTHzoBJ8qW3760+VcpII5vACym3HP6v0qRGKaiyUZP41XCd1wPQR
	 U6djoCblprKp58Td6qROaMhD784yWsAfBeOg02XiU1acA9GmdYwNU+v3kgkQleHGe9
	 OWKpE3pWuSUEvFl3/wIM9RootP39i6udLWiRqkjSXY15+/NvszXn8P/XCb2UzrLEx9
	 0CMKkHxsMKVkHMFVk3TQDl0WhVYKpnTpYtsQ52+K3j8TS7BkhxM8yRSKRO657iA9Tx
	 iexYksS+fQjog==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 23:07:30 +0200
Message-Id: <DAPYS2D9HNBT.1ZTN1VHCPN4XA@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 4/6] rust: module: update the module macro with
 module parameter support
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-4-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-4-bc219cd1a3f8@kernel.org>

On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
> +
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

I just read this part again and I want to voice my dissatisfaction with
these key names. (not that you can do anything about that :)

> +
> +            write!(
> +                self.param_buffer,
> +                "
> +                    pub(crate) static {param_name}:

Does this need to be accessed by anything else except the static below?
If no, then can we move it inside of that static? So

    #[link_section =3D \"__param\"]
    #[used]
    static __{module_name}_{param_name}_struct: ::kernel::module_param::Rac=
yKernelParam =3D {
        static {param_name}:
            ::kernel::module_param::ModuleParamAccess<{param_type}> =3D
                ::kernel::module_param::ModuleParamAccess::new({param_defau=
lt});
        // ...
    };

---
Cheers,
Benno

> +                        ::kernel::module_param::ModuleParamAccess<{param=
_type}> =3D
> +                            ::kernel::module_param::ModuleParamAccess::n=
ew({param_default});
> +
> +                    #[link_section =3D \"__param\"]
> +                    #[used]
> +                    static __{module_name}_{param_name}_struct:
> +                        ::kernel::module_param::RacyKernelParam =3D
> +                        ::kernel::module_param::RacyKernelParam(::kernel=
::bindings::kernel_param {{
> +                            name: if cfg!(MODULE) {{
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
> +                            #[cfg(not(MODULE))]
> +                            mod_: ::core::ptr::null_mut(),
> +                            ops: &{ops} as *const ::kernel::bindings::ke=
rnel_param_ops,
> +                            perm: 0, // Will not appear in sysfs
> +                            level: -1,
> +                            flags: 0,
> +                            __bindgen_anon_1:
> +                                ::kernel::bindings::kernel_param__bindge=
n_ty_1 {{
> +                                    arg: {param_name}.as_mut_ptr().cast(=
)
> +                                }},
> +                        }});
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

