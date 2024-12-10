Return-Path: <linux-kbuild+bounces-5060-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A5D9EAE75
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D26188928D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 10:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2852080D6;
	Tue, 10 Dec 2024 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5bEFc1G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488E223335
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Dec 2024 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827582; cv=none; b=Wwr4hgr0woCGltjlkUVhZKiL5oK4uXr4/FlUQ30XXYa+M7K96tf1O6PpJtLdKVCkjQ3qV0Ue9JatrgIV5QvkCzj4koiN6wpNqCNCjOA5d09fmKKldyRsbUCFzV/3Rhxf499vnrptv2lDIEax6z/5nVxG/Jd7rWKJHs6TC8J4KRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827582; c=relaxed/simple;
	bh=PY12OjrPFqfTBxGlPHGn6y9CIB00b7WanCLwGAags/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URkGgJ9qTHrXSLFnKtqpq+9yNv8n51mswDLXxSAbYYAYNeb9LdXjDq083W1DrHMmsdOr/bJ+YG7rdd5E9G3JKlEQ4Oa4P+2J3bZIdPqKo1WyniHDCQcYw1vN1PBC6qe1HugMREvGmLMQ7SgafS2mjEvD47ZCobN5SekI3O5PD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5bEFc1G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FAEC4CEDE
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Dec 2024 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733827581;
	bh=PY12OjrPFqfTBxGlPHGn6y9CIB00b7WanCLwGAags/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W5bEFc1GbBhNpSZwFSK7W+367u1O09VCt3asdM8EI8aAJKEUDtfng68iXvNPtiMP4
	 9spokfG4C2JYw5/OT/FXdhSwNCYCYk7aGxw4ngXzb0PNLGv6qkCLsS5uub/VvGXeyH
	 E7h2KCUC/peQwdw/SrcOc2xkQo4VmsrtrQWNglgo8w+AYENZPlvUNwPepbNRPz9e+0
	 7rScHIAnCZDd0bJn+IUfVLLUZSYaXe7jfJkpMejUyux1mxZ8MKKwjKc6Pmixl+yxDc
	 AB/GYAwaoYn7CSNKXdl6473TIoNx1zOA1KGQH+euXqRn6vrP4IAMW5DRG41O0FnZAo
	 l2hp7PBzUpRaw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so1695101e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Dec 2024 02:46:21 -0800 (PST)
X-Gm-Message-State: AOJu0YyGjHud57uoaKDgG5WGfBQ3J8fcCEIlJ94tH1BakLVbS9LfSEJJ
	vOu6W1udgMQG4BpyRFuRGUlxUQIg5NteYYVEQmh8Crx2Dp60zk0PrmfetIjEFEOf5BkdaVqHkyZ
	ZfE+an63PHZb7GhW5tv9K6b5VnTg=
X-Google-Smtp-Source: AGHT+IFVwgru3TWAcoSyCRXAMki0YDjcEd/mKe99JB0T+tMWFjXnE+AZ/xGWm+0h4X+KLUmHpHiTEzCPbSIeKp6ASQk=
X-Received: by 2002:a05:6512:3e0b:b0:540:2122:faea with SMTP id
 2adb3069b0e04-540251e8bbfmr945244e87.14.1733827580471; Tue, 10 Dec 2024
 02:46:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b7bb8d16-2d05-43b5-95fc-7d303b925f44@limbasan.ro>
In-Reply-To: <b7bb8d16-2d05-43b5-95fc-7d303b925f44@limbasan.ro>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Dec 2024 19:45:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARHWcHiXPWxRD804vO6hF5H06kgBho-EXSa1f8eiPj5rQ@mail.gmail.com>
Message-ID: <CAK7LNARHWcHiXPWxRD804vO6hF5H06kgBho-EXSa1f8eiPj5rQ@mail.gmail.com>
Subject: Re: [Bug] 6.12+ DKMS modsign breakage due to missing .config in
 Debian headers package
To: =?UTF-8?B?TWloYWkgTGltYsSDyJlhbg==?= <mihai@limbasan.ro>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 5:31=E2=80=AFPM Mihai Limb=C4=83=C8=99an <mihai@limb=
asan.ro> wrote:
>
> Hi!
>
> Would like to report a DKMS build system impacting bug with kernel 6.12+
> introduced in commit aaed5c7739be81ebdd6008aedc8befd98c88e67a . Hope I'm
> addressing this following proper protocol by mailing linux-kbuild, tried
> mailing the maintainer directly on 2024-11-20 but received no feedback;
> my apologies otherwise, it's my first kernel bug report.

Sorry, I missed that.

Before you, another guy asked me the same question off-list.
Multiple people contacted me off-list for the same question.

Presumably, asking this in the ML is better because
other people may find the answer and avoid duplicated questions.

>
> Specifically, the commit changes scripts/package/install-extmod-build to
> remove the shipped copy of the kernel configuration as .config in the
> generated package. Unfortunately, this breaks DKMS when secure boot is
> being used and any locally compiled the modules need to be signed. DKMS
> needs it to extract various characteristics of the built kernel, among
> which CONFIG_MODULE_SIG_HASH so that it can sign the .ko files it
> creates. It's likely that it also uses various other symbols from the
> kernel config, e.g. clang-related stuff, but I didn't test that.
>
> The removal of the other formerly shipped files doesn't appear to cause
> any problems, at least not in this scenario.

I do not think removal of the .config is a problem because
another copy, include/config/auto.conf exists in the package.

DKMS can parse "${kernel_source_dir}/include/config/auto.conf
for CONFIG options.

Masahiro



> In detail:
>
> DKMS sets its path to the kernel config into the kernel_config var in
> this function:
> https://github.com/dell/dkms/blob/93bf2bd79704c0a8a39b240a52b001610cdc419=
b/dkms.in#L274
> DKMS then uses it to extract CONFIG_MODULE_SIG_HASH in this function:
> https://github.com/dell/dkms/blob/93bf2bd79704c0a8a39b240a52b001610cdc419=
b/dkms.in#L1021
> If kernel_config isn't set, the build process issues "Kernel config
> ${kernel_config} not found, modules won't be signed" and skips signing
> the built .ko files, subsequently resulting in a runtime failure to load
> the corresponding module with "Loading of unsigned module is rejected"
> when secure boot is being used.
>
> While it's possible to supply the path to the kernel config manually
> when invoking DKMS, it would need manual intervention after every kernel
> header package installation. This would be rather clumsy and
> inconvenient compared to the current set-and-forget approach where a
> kernel headers package install hook auto-builds and installs modules.
> Unfortunately there's no viable workaround via a config snippet or any
> sort of build hook, DKMS would need to be patched to somehow figure out
> the relationships between the installed packages and the various kernel
> config file placement conventions across distros.
>
> Is there any chance for .config to be shipped again when generating the
> headers package? This would be a simple two-line change, restoring the
> shipped copy of the kernel config. I.e. something like the below. Have
> tested that patch and can confirm it restores proper modsign functionalit=
y.
>
> Thank you very much!
> Mihai Limbasan
>
> diff -Naur linux.orig/scripts/package/install-extmod-build
> linux/scripts/package/install-extmod-build
> --- linux.orig/scripts/package/install-extmod-build    2024-12-09
> 10:28:03.000000000 +0200
> +++ linux/scripts/package/install-extmod-build    2024-12-09
> 10:30:28.871498366 +0200
> @@ -76,4 +76,6 @@
>       rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
>   fi
>
> +# copy .config manually to be where it's expected to be
> +cp "${KCONFIG_CONFIG}" "${destdir}/.config"
>   find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
>
>


--=20
Best Regards
Masahiro Yamada

