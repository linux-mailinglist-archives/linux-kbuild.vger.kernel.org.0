Return-Path: <linux-kbuild+bounces-5544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF7A1997F
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 21:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7653E16AFE2
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 20:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CE52153CD;
	Wed, 22 Jan 2025 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjJcG2Z6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1826F1B6CE0;
	Wed, 22 Jan 2025 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737576376; cv=none; b=NzYtfFbwvJ550vkakpUQLRAlexz+PziF1KMPY/GMQlvQVt7dWzlflsKZlUupsuFduujIyIJxO9ngJAUwC6rfYw9y26rPLQcGxmkxZ5R8OT4nYX8YxCXiqhDg8m3zgOPYMk02AcOy/uBcFfLyaIbIhvCregTqtwPNI55kn9oMsds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737576376; c=relaxed/simple;
	bh=S5TTnFvAJPPSSH0AY88qF4Q33YOQ5/7GfsUezm6tuHY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JrNbO0RBBKfs73+CErdEqWcjUnBYbEVIVGEmGJ9AD+rTfV+8ckTVna1uIuhxP6OdYAJf892CKbcCJzNypp/tRvRbLwN51mEWb3MaL67Xi79iD6L3N8V8FwhPx8/SkQnZFCO5lNqHM0qUhMomwCVXCa9ouVWShhexIyP0ctr3ahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjJcG2Z6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60920C4CED2;
	Wed, 22 Jan 2025 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737576374;
	bh=S5TTnFvAJPPSSH0AY88qF4Q33YOQ5/7GfsUezm6tuHY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EjJcG2Z66JJlh9mImcdD7SeVperH0zRWeaXzqZx1y6HpMbv1EuJrfAseTFRTFDRT2
	 4dYZddDKMnsHPfAciwhrI7Dyg6Z44Nui6JWwBW2wHtIXNsM6LmStoIHbJQ9MGIULl8
	 n7h5ok6ypAzMIhbHd2PI5OhNje8S4XYwimGLiEFJt5+mbe5Q9gDhAc7t0UuaYhoOvc
	 9nROdsYl2QPbFD07pMAXXMJ9+rfL+91nTQlHTaAh7nG7ibDhsv+L5uUtdrfuNDCzu5
	 Sj9bQmSd1Lp/1D55sHm2N2NZBdrTIPU+2gjgs+QPkxZfynS4N9htgdrwu3PGRCCeBg
	 ZFqyDsmQGqgdg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Petr Pavlu" <petr.pavlu@suse.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Sami Tolvanen"
 <samitolvanen@google.com>,  "Daniel Gomez" <da.gomez@samsung.com>,
  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg KH"
 <gregkh@linuxfoundation.org>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] rust: add parameter support to the `module!` macro
In-Reply-To: <04419f26-1411-4e47-a0f0-f774064bc2f0@suse.com> (Petr Pavlu's
	message of "Wed, 22 Jan 2025 17:01:32 +0100")
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
	<20250109-module-params-v3-v4-4-c208bcfbe11f@kernel.org>
	<XHW3ISBydpd3OFamhThxUUd97oEcmOAxv3ro0WP6nAbUALocUp3qw62jNCuDv66LoSL_8shwbFH660c1GhekiA==@protonmail.internalid>
	<04419f26-1411-4e47-a0f0-f774064bc2f0@suse.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 22 Jan 2025 21:06:00 +0100
Message-ID: <874j1q1umv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Petr Pavlu" <petr.pavlu@suse.com> writes:

> On 1/9/25 11:54, Andreas Hindborg wrote:
>> This patch includes changes required for Rust kernel modules to utilize
>> module parameters. This code implements read only support for integer
>> types without `sysfs` support.
>>

[cut]

>> +
>> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
>> +        // access. `old_value` is pointing to an initialized static, an
>
> Typo: an -> and

Thanks.

[cut]

>> +
>> +    fn emit_params(&mut self, info: &ModuleInfo) {
>> +        let Some(params) = &info.params else {
>> +            return;
>> +        };
>> +
>> +        for param in params {
>> +            let ops = param_ops_path(&param.ptype);
>> +
>> +            // Note: The spelling of these fields is dictated by the user space
>> +            // tool `modinfo`.
>> +            self.emit_param("parmtype", &param.name, &param.ptype);
>> +            self.emit_param("parm", &param.name, &param.description);
>> +
>> +            write!(
>> +                self.param_buffer,
>> +                "
>> +                    pub(crate) static {param_name}:
>> +                        ::kernel::module_param::ModuleParamAccess<{param_type}> =
>> +                            ::kernel::module_param::ModuleParamAccess::new({param_default});
>> +
>> +                    #[link_section = \"__param\"]
>> +                    #[used]
>> +                    static __{module_name}_{param_name}_struct:
>> +                        ::kernel::module_param::RacyKernelParam =
>> +                        ::kernel::module_param::RacyKernelParam(::kernel::bindings::kernel_param {{
>> +                            name: if cfg!(MODULE) {{
>> +                                c\"{module_name}.{param_name}\"
>> +                            }} else {{
>> +                                c\"{param_name}\"
>> +                            }}.as_ptr(),
>
> This should be the other way around? Running
> 'insmod rust_minimal.ko test_parameter=2' reports for me that the
> parameter is unknown while specifying 'rust_minimal.test_parameter=2'
> works. The prefix should be used only if the module is built-in so the
> parameter can be distinguished on the kernel command line.

Thanks for testing! This actually gave me quite a headache when I was
using the series elsewhere. I forgot to resend the series with the fix,
sorry.


Best regards,
Andreas Hindborg




