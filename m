Return-Path: <linux-kbuild+bounces-7569-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532FAAE05EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 14:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096413ABA96
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 12:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1568023D282;
	Thu, 19 Jun 2025 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgxU7pzz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97A22F767;
	Thu, 19 Jun 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336288; cv=none; b=fezbrr0y5lnbCfY4WVjy8Nd38SihRHP3ZacDQGLYlSVEYL9BCb6+69JJR6EOSNMt8yt9uiLpwVGq2vR/Op/V5Gs6lNHd7TSMSqsq2pg5IDvSAkoY8OwBVLN1x99CNXy7/20RNKYIJJ4LrjPOYCWLgzKpn1ULmfkk99JimsPOiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336288; c=relaxed/simple;
	bh=eOI3Qqo9VLysUZBeVHSaVKRloh7GQ7rxLZNcn2x5424=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n4ssy4dlav8oqd2EAg+HTvRIrBWKPz0hMVR72lMBp28lEqBKv8Ghb8lXG8bOpCcQOKSHIeTUTG4sju9s9Qs3FSEmSVvf2iB6FFb53QC8DEC5A1g1Vd14T3lp+xazDCJU0htAXlewO0FkHk7mQi37UqPYOgB9EzlZcO2RMvjKakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgxU7pzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4CCC4CEEA;
	Thu, 19 Jun 2025 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336287;
	bh=eOI3Qqo9VLysUZBeVHSaVKRloh7GQ7rxLZNcn2x5424=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dgxU7pzzZ3WWd0ISj22p+9vX0cooSQh0p2gcP5ZLQ7bl5+CEOLjP8q12fSM0l2/ZZ
	 xqJpwq2AaGlFMbadNxz6M4mU7G9e4crwZTYrAfGH0dN8n+YDV4AQrCgzKzxMKPSja6
	 Qh7Sh3iKfufuI96p3Vk6w7AyshlVlEQwXls8OnJNHDqU4iWHwZdHgHroFHjrRmUVtH
	 ZpixivlEs5sbITlxH9u1a+fywE9qbNshNkpMgTBYS3Dy59pK/bhcrBfzw+odtI29mk
	 5O4d3E6SgPE339/OrXYejpfZ572gEcuqLaxfDbNvAp3M/sHW08PKZz3Pc82c44MkcH
	 Po5jktPMoja6Q==
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
Subject: Re: [PATCH v13 4/6] rust: module: update the module macro with
 module parameter support
In-Reply-To: <DAPYS2D9HNBT.1ZTN1VHCPN4XA@kernel.org> (Benno Lossin's message
	of "Wed, 18 Jun 2025 23:07:30 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-4-bc219cd1a3f8@kernel.org>
	<Dd6pq4fT11XQSyiDefuQSbzZC8iHduHjixmyRC0ipfDvg8FWCH8mGVE5kxwTv_AHUROX45Lo3OUR7FCm4gwjpg==@protonmail.internalid>
	<DAPYS2D9HNBT.1ZTN1VHCPN4XA@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 14:31:15 +0200
Message-ID: <87plez7w18.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
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
>
> I just read this part again and I want to voice my dissatisfaction with
> these key names. (not that you can do anything about that :)
>
>> +
>> +            write!(
>> +                self.param_buffer,
>> +                "
>> +                    pub(crate) static {param_name}:
>
> Does this need to be accessed by anything else except the static below?
> If no, then can we move it inside of that static? So
>
>     #[link_section = \"__param\"]
>     #[used]
>     static __{module_name}_{param_name}_struct: ::kernel::module_param::RacyKernelParam = {
>         static {param_name}:
>             ::kernel::module_param::ModuleParamAccess<{param_type}> =
>                 ::kernel::module_param::ModuleParamAccess::new({param_default});
>         // ...
>     };

It is used to access the value of the parameter from the module. If you
reduce visibility you will get an error when trying to read the
parameter value:

    RUSTC     samples/rust/rust_minimal.o
  error[E0425]: cannot find value `test_parameter` in module `module_parameters`
    --> /home/aeh/src/linux-rust/module-params/samples/rust/rust_minimal.rs:31:33
    |
  31 |             *module_parameters::test_parameter.get()
    |                                 ^^^^^^^^^^^^^^ not found in `module_parameters`

  error: aborting due to 1 previous error


Best regards,
Andreas Hindborg



