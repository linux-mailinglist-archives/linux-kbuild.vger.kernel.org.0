Return-Path: <linux-kbuild+bounces-5424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8FA0922D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 14:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31F21165187
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 13:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B416920D4FB;
	Fri, 10 Jan 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwiK3hyx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C03B1A4
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516195; cv=none; b=U27koKB3g8NC0OxvSoattCUxwQse15rRM3Wp9dnndLy3X4Hd7SOnIiNN1R1kfrkvNmZ46kRHMM9yc8g4Vn90/GTxqVy4v/AW6BR8HJagteQx+aK21IU537gdQip8g67nIpCVWJXETVGmZwFYYfBQJqwnbO8y3++hTV1wkcCAIg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516195; c=relaxed/simple;
	bh=jw/b+/vL53dnu7PBBWqcm3242olQotsUaChNLj/3oEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asjLtLl/A6nSSYYI/h8Xpf0W+59tJp9xw317MKQmpHQ01wIAzUS99S6QEzh+w9H+4csl0url2UaM1reotj4eWTujnFLvtSnpKu08O2XSQ0hjWHYRXXBbCtulFSWIeAxridU8JabMPKM6vpY+2ZDTA2mcvedUKb4hgnfIL29zDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwiK3hyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B6DC4CED6
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736516195;
	bh=jw/b+/vL53dnu7PBBWqcm3242olQotsUaChNLj/3oEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nwiK3hyxa20omp55ekryQzUZLBHH4Z/YfzXNXyCPDqYBnOlE8s2KOmjJKR22UypGt
	 sa2Rcc08pDXJTvyKJBUcIaKufp7OeEcyNTLATjuCnMcr/AEMUXHSdmfepCFDe+pahx
	 1Seazixg4Pmn8T9xEYPc0/xK/mxNSa05mVdcHCzuvY8p7MXeH5NR4ufmd0lF0VIeQg
	 9H92036ZTevtKNw/RSEsjtTMksOq+ujXW8E04YjzlC0fABJ1Z6UHF0iEOSz7paH12t
	 8wNsQdYfWVVmm/h/iyPM96d+YG5yBxI1Jzqvy4Hc46pWvP44GWUKcARgrCz8nETQni
	 Ld5KMQd+rS09A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-303548a9361so13810721fa.0
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 05:36:35 -0800 (PST)
X-Gm-Message-State: AOJu0YybDAuvCwhjocilknUQfRsUPuyRkKMXcjyGlbL7d384cUgDCBK5
	yShhOxNfUU+XVkI5iLJ83veaYLJ98+0vN/hfEYqVKoFXP+4W12nLO/4y5oZ+OSVGAjDQo5d+YkP
	0W+/7R0MiKqqZJRFa8l0Gp3k8aPo=
X-Google-Smtp-Source: AGHT+IFL8EOTKz91+q7KgQgp7O0ASG1Zg8aE7hU6ITYBt0yPFZf6PD4wJIDGizkDxcvXzLsJXS9iOftztaTQCUh2o3A=
X-Received: by 2002:a05:6512:3e22:b0:540:2da2:f282 with SMTP id
 2adb3069b0e04-54284810c88mr2944148e87.42.1736516193541; Fri, 10 Jan 2025
 05:36:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com> <4915d245-4419-43cf-abbe-b28cd27c869a@secunet.com>
In-Reply-To: <4915d245-4419-43cf-abbe-b28cd27c869a@secunet.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jan 2025 22:35:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQi0ZbVF9BLMCkHKufim43qH7MULW5iksoLK_sxYhRjkg@mail.gmail.com>
X-Gm-Features: AbW1kvavlnWzfHMYG4lhZhO5i-vD6M-QecprjjESgLe3H4ZZbBuwGf5op5I_-BY
Message-ID: <CAK7LNAQi0ZbVF9BLMCkHKufim43qH7MULW5iksoLK_sxYhRjkg@mail.gmail.com>
Subject: Re: v6.13-rc1: Module signing stopped working for external modules
To: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:44=E2=80=AFPM Torsten Hilbrich
<torsten.hilbrich@secunet.com> wrote:
>
> On 09.01.25 07:35, Torsten Hilbrich wrote:
> > Hello,
> >
> > after testing v6.13-rc1 after successfully using v6.12 I noticed that
> > our external modules are no longer building correctly.
> >
> > - Module source: /build/client/devel/addmodules/vtx/work/vtx
> > - Kernel source: /build/client/devel/kernel/work/linux-2.6
> >    Symlinked by build-source
> >
> > We run the module_install step:
> >
> > ----------------
> > make -C build-source M=3D/build/client/devel/addmodules/vtx/work/vtx
> > modules_install INSTALL_MOD_PATH=3D/build/client/devel/addmodules/vtx/_
> > INSTALL_MOD_DIR=3Dextra
> > make[5]: Entering directory '/build/client/devel/kernel/work/linux-2.6'
> > make[6]: Entering directory '/build/client/devel/addmodules/vtx/work/vt=
x'
> >    INSTALL
> > /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vt=
x.ko
> >    SIGN
> > /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vt=
x.ko
> > /bin/sh: 1: scripts/sign-file: not found
> >    DEPMOD  /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-deve=
l+
> > make[6]: Leaving directory '/build/client/devel/addmodules/vtx/work/vtx=
'
> > make[5]: Leaving directory '/build/client/devel/kernel/work/linux-2.6'
> > ---------------->
> > The problem here is that before calling cmd_sign (scripts/sign-file) th=
e
> > build system now changes to the module source.
>
> As workaround I used the following modification:
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 6fa9af4a25b4..67f081a68364 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -105,7 +105,7 @@ else
>   sig-key :=3D $(CONFIG_MODULE_SIG_KEY)
>   endif
>   quiet_cmd_sign =3D SIGN    $@
> -      cmd_sign =3D scripts/sign-file $(CONFIG_MODULE_SIG_HASH) "$(sig-ke=
y)" certs/signing_key.x509 $@ \
> +      cmd_sign =3D $(srctree)/scripts/sign-file $(CONFIG_MODULE_SIG_HASH=
) "$(sig-key)" $(srctree)/certs/signing_key.x509 $@ \
>                    $(if $(KBUILD_EXTMOD),|| true)
>

Please add $(objtree)/ instead of $(srctree)/
in case the kernel was O=3D option.



Please submit a patch with this tag.

Fixes: 13b25489b6f8 ("kbuild: change working directory to external
module directory with M=3D")


Then, I will pick it up.
Thanks.


--=20
Best Regards
Masahiro Yamada

