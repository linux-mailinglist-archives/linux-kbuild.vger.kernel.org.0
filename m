Return-Path: <linux-kbuild+bounces-5426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD04A095CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 16:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7181669C7
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 15:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28591FA15C;
	Fri, 10 Jan 2025 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqJSje11"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82019AA63
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523247; cv=none; b=Ben9oKbJdk2U1XNIzAVaf7pxksgXmEcU1ujFZd1HWQFBm6JSQhH3cbX4yps2vzr4Mf04wOKVu3hkXVrSmRtQNgCTHWo223UeNBGlDIRiVTmHFA14UOrI2MHG6vyFV/gP9+sfUFNYqIwrBp1PqoNAosYZzILoU2rppvRTci4FcVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523247; c=relaxed/simple;
	bh=C5ZD8/Stc/ntNyxm+oyaN5udfHu2iNdZcgFufPmLIBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U13gV/9pCRNTuNiAduc41X9RZgGibda2qOlGKF0hHr1UsbygFvVtJfuiHNsV5J95ymPH/qJFK0MT2ztE3L0/8l7O9NdkjUG6DVm6DB3tFFX5ZjjCI9+S2LciqefOhbuobAYX1Clr9edjxWAGo2KL7tCEULP3M4IS5jk2e0jwfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqJSje11; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3B4C4CEE1
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523247;
	bh=C5ZD8/Stc/ntNyxm+oyaN5udfHu2iNdZcgFufPmLIBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HqJSje11IMAx9TVs1WuRzTfqOmOhcekcDvyVG2GuuDQo+HiQatEVEiAXjwRQpOATo
	 OYkUzz6muvPO4pbfGRDaOJQGlFpJUkaHZFWoC0tkAdHzV3bPvQoxcQpcDzX+mB65E2
	 AXAo3zTwjwJUf/OabGq0AWx7Nk7ff2i+lWiaL28fYdV2i6grjWH5Brx6SRdgzcQUlj
	 eLOaHICnfn4kGTrhDlU3B5NpMcCl/HGt+CzdE3OWWCo1kzJRBvANkToWBAj5ZzYrUj
	 vvzpuVcz3ZVvYQkdyWyi3SUsovSzWMKBeasGp2zsH5VJBbhssM8pj+GG2QIGYzVFLF
	 Q/4kva3VMKXKQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54025432becso2081485e87.1
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 07:34:07 -0800 (PST)
X-Gm-Message-State: AOJu0YxSztwV9sRUpzKwCbD2TL5o0UkJ0pctOkhXqkrOLdS5AO3/zU/F
	LVIFb+ipt4gN/jYdEWyDRRAnifEScl/p6ptVEckInKCvemDjlXCO4Qy87D+97GDcAaOyxmmWyjG
	VO1I8mw/TREBwlS8tf9Cb/q1honU=
X-Google-Smtp-Source: AGHT+IGZUcPw9+LW9HpA/SWtXdRs96zZW0v416VHw60HRDv+DYUfX9xEemQaYln3lYVENs/PnVTf4JXiaPwfvzv6SNQ=
X-Received: by 2002:a05:6512:23a3:b0:53e:385c:e881 with SMTP id
 2adb3069b0e04-54284547e5cmr3623722e87.30.1736523246012; Fri, 10 Jan 2025
 07:34:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com>
 <4915d245-4419-43cf-abbe-b28cd27c869a@secunet.com> <CAK7LNAQi0ZbVF9BLMCkHKufim43qH7MULW5iksoLK_sxYhRjkg@mail.gmail.com>
 <be81c0ac-fac7-44bf-9062-018bf47e7bbe@secunet.com>
In-Reply-To: <be81c0ac-fac7-44bf-9062-018bf47e7bbe@secunet.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 00:33:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5ZrLNeV=_gjbbJvKWLsdPaCHM=KgOevxKe_dRFCnUEw@mail.gmail.com>
X-Gm-Features: AbW1kvaNjKcJHQFAUlI6Y_lSx4-quSA5U02nCsp2n6uQ27jMd3x9o5eXqRYObvM
Message-ID: <CAK7LNAS5ZrLNeV=_gjbbJvKWLsdPaCHM=KgOevxKe_dRFCnUEw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix signing issue for external modules
To: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 11:00=E2=80=AFPM Torsten Hilbrich
<torsten.hilbrich@secunet.com> wrote:
>
> When running the sign script the kernel is within the source directory
> of external modules. This caused issues when the kernel uses relative
> paths, like:
>
> make[5]: Entering directory '/build/client/devel/kernel/work/linux-2.6'
> make[6]: Entering directory '/build/client/devel/addmodules/vtx/work/vtx'
>    INSTALL /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+=
/extra/vtx.ko
>    SIGN    /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+=
/extra/vtx.ko
> /bin/sh: 1: scripts/sign-file: not found
>    DEPMOD  /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+
>
> Working around it by using absolute pathes here.
>
> Fixes: 13b25489b6f8 ("kbuild: change working directory to external module=
 directory with M=3D")
> Link: https://lore.kernel.org/linux-kbuild/302dedfd-af8b-43cc-99cf-3a3f7b=
34b714@secunet.com
> Issue: CLIENT-32662

Please drop this tag.

Instead, your Signed-off-by tag is mandatory.





> ---
>   scripts/Makefile.modinst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index f97c9926ed31..1628198f3e83 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -105,7 +105,7 @@ else
>   sig-key :=3D $(CONFIG_MODULE_SIG_KEY)
>   endif
>   quiet_cmd_sign =3D SIGN    $@
> -      cmd_sign =3D scripts/sign-file $(CONFIG_MODULE_SIG_HASH) "$(sig-ke=
y)" certs/signing_key.x509 $@ \
> +      cmd_sign =3D $(objtree)/scripts/sign-file $(CONFIG_MODULE_SIG_HASH=
) "$(sig-key)" $(objtree)/certs/signing_key.x509 $@ \
>                    $(if $(KBUILD_EXTMOD),|| true)
>
>   ifeq ($(sign-only),)
> --
> 2.39.5
>
>
>


--=20
Best Regards
Masahiro Yamada

