Return-Path: <linux-kbuild+bounces-2054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35877902BAF
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 00:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB7FF1F21A33
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 22:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7109914F9CA;
	Mon, 10 Jun 2024 22:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9+cjZaw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450DF7406E;
	Mon, 10 Jun 2024 22:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058597; cv=none; b=mUI3q5hma0MBGgjBu4DJodafioiJFRPqf7xFGUEk74unYQC8CYEF6tDGtlvMZ4wPlxFagYxJt1NEStIpV05tcKNa6+7Rt91Quy/1Uzc2Yd3N0+Kd1yTDGjInuE7SFSoG+LFIgfUw2FdAoBIn6ZVIOEEygR3ApVN4sQvXIWuNVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058597; c=relaxed/simple;
	bh=OfL4shvyjDxr6q00nXk31km0GYhu7LxXoyNSvufWfr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBEiueVZynjCqGnXjNBVYlHuscQm8R+PrhO89D1C0K1nUknB/1bz23LXE/1U0YodxYf3pU+8mCssl2HVDEmTAcCiHCX1dyF/9dcOYaaSkCe1wM5eCI4iqLvN/t614YdnUl8Kvt7HDxkkifgEo6W9dPtbp+XyGJPzfNByk/Q7b0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9+cjZaw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0AFC2BBFC;
	Mon, 10 Jun 2024 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718058596;
	bh=OfL4shvyjDxr6q00nXk31km0GYhu7LxXoyNSvufWfr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J9+cjZaw8MA4cplVt1xVpXDDtrT8R9L4mCKjqFPsFS6JiljGQv5uKiFdgJ1EVNSR3
	 LuwMmpTDiIMYhHTG21IHqu/XGh8Ceglfvq5D7KjrLml10b/0GtN37ZGJErlQxw2FdH
	 ZRJ5pWf4rrk/TkJ2MFt+NT95+pDNGfCw2HimHK6maNsCScN37mx5GwmsTKzzCJ6qYm
	 cdMmKtUB5S71KkRyxD3bO7dPWrDILeF3UEzjoqSpdyaKqXUc3N8QK74xauXbRir1Nb
	 Xj5OFnAok30DGYZWUdxqLpLWkyxZAcGB/ZYwO2JCKmFq3160lUKqIjHgFl4f01ILRI
	 +2YGEKzbD+IeA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c84a21b8cso1670780e87.1;
        Mon, 10 Jun 2024 15:29:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5ZVD/GzelbTMjblEBpT4pmKbbqEXElDzCE4mJjOVvW8HeMn/+i2k0Gb1pcZpVtRG9Ej8wBDlOC/N6XghVOXVw3TANUaL5nt7rQGrhLzF3tO36EQ1lsRQ2rVGuqBkdPkAhidZx
X-Gm-Message-State: AOJu0YzY0AK4LPrPNBG0s9rd7mHjP1EJAgKknnTKoi8tZM6dTlAKgMXh
	PgBCxKeuI5lMs3YNe50LGIDaROohUpTYFx1tDuI5Md3qGL2e5a95REIrYpnzWIHnBj1Za41PODs
	ZVhknc1okAWgRBelEzarjtLxfiTs=
X-Google-Smtp-Source: AGHT+IFViXsyJYRJU3DKtPBHM2sk74ChkyNCxuCVGigEa/OFqqxA8lC0bm0DOMbIaWqVrK6bx+Ihw0o+Owy/2VLnBJc=
X-Received: by 2002:a05:6512:3144:b0:52c:81ba:aeba with SMTP id
 2adb3069b0e04-52c92248f73mr212413e87.14.1718058595589; Mon, 10 Jun 2024
 15:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e1fd1b659711f59c61ec48dc43912dddccbb4d92.1717996742.git.dsimic@manjaro.org>
In-Reply-To: <e1fd1b659711f59c61ec48dc43912dddccbb4d92.1717996742.git.dsimic@manjaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Jun 2024 07:29:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7cKbuU9uv67DT4CQagvXdJCWXBP9LjkC_Hvd5QWnYRQ@mail.gmail.com>
Message-ID: <CAK7LNAQ7cKbuU9uv67DT4CQagvXdJCWXBP9LjkC_Hvd5QWnYRQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Install dtb files as 0644 in Makefile.dtbinst
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	Diederik de Haas <didi.debian@cknow.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 2:21=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> The compiled dtb files aren't executable, so install them with 0644 as th=
eir
> permission mode, instead of defaulting to 0755 for the permission mode an=
d
> installing them with the executable bits set.
>
> Some Linux distributions, including Debian, [1][2][3] already include fix=
es
> in their kernel package build recipes to change the dtb file permissions =
to
> 0644 in their kernel packages.  These changes, when additionally propagat=
ed
> into the long-term kernel versions, will allow such distributions to remo=
ve
> their downstream fixes.
>
> [1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/642
> [2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/749
> [3] https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/rules=
.real?ref_type=3Dheads#L193


The 'master' is a moving target.

The line 193 in the future may not point to the correct position




I changed it to this.

[3] https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.8.12-1/debia=
n/rules.real#L193


This references the line 193 from the 'debian/6.8.12-1' tag.




Applied to linux-kbuild.
Thanks!




> Cc: Diederik de Haas <didi.debian@cknow.org>
> Cc: stable@vger.kernel.org
> Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>
> Notes:
>     Changes in v2:
>       - Improved the patch description, to include additional details and
>         to address the patch submission issues pointed out by Greg K-H [4=
]
>       - No changes were made to the patch itself
>
>     Link to v1: https://lore.kernel.org/linux-kbuild/ae087ef1715142f606ba=
6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org/T/#u
>
>     [4] https://lore.kernel.org/linux-kbuild/2024061006-ladylike-paving-a=
36b@gregkh/
>
>  scripts/Makefile.dtbinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
> index 67956f6496a5..9d920419a62c 100644
> --- a/scripts/Makefile.dtbinst
> +++ b/scripts/Makefile.dtbinst
> @@ -17,7 +17,7 @@ include $(srctree)/scripts/Kbuild.include
>  dst :=3D $(INSTALL_DTBS_PATH)
>
>  quiet_cmd_dtb_install =3D INSTALL $@
> -      cmd_dtb_install =3D install -D $< $@
> +      cmd_dtb_install =3D install -D -m 0644 $< $@
>
>  $(dst)/%: $(obj)/%
>         $(call cmd,dtb_install)



--=20
Best Regards
Masahiro Yamada

