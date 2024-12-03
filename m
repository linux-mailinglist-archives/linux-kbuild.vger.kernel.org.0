Return-Path: <linux-kbuild+bounces-4969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B309E1ED9
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 15:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 674E8280F3B
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 14:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BF01F12F2;
	Tue,  3 Dec 2024 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJEQ4TkA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171A31EE005;
	Tue,  3 Dec 2024 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235431; cv=none; b=PHjYgHK/Peuz07UndoWBiC7fo4JACNiHSnsgxdYzkYT5YDKluEnxLWNIImfCi5A9WG92rymdZ09cbMdUxJ9ejj88W1ohUK8Yv0g4C68BF8/kHhDgSd5fEg6YNld+OoswWfIfaXu3MOkeRAcbNe7c6enU/ipOjOH22gcds1+0na0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235431; c=relaxed/simple;
	bh=uZFTmyNwI1zb45ELJusReZie9+aVxmcl+z6J+NMQh2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blF6WOlt1qA/Qt1XO4lt4HaPUaNb2v9aUWcVdbBNXOC1dYabWSXnpCmptDj6FfDFfRGkrPvLVpDYTh7S1Bb8iMwRePE69r2a8lnH9Jnad2bSOrrNBVvMoSUmnGEj2scU6XyURSb/AVuqKbfg2tHeL20s4RR459brGcSCfRISn54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJEQ4TkA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65537C4CEDA;
	Tue,  3 Dec 2024 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733235429;
	bh=uZFTmyNwI1zb45ELJusReZie9+aVxmcl+z6J+NMQh2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LJEQ4TkAlhM3/iZqK9Pv/hbwJi9FKDKrI0FL/PfBogUR+lc316l8LSmUIieM7xtsM
	 WuVANnEih4rOHZcCT0SDK8zep+29YNoMwhU19EmSALxxjOucbFN6i7RgH34V1GdzE0
	 VGLkNtMrtkZ1SBG8ASf+BAoWEqQUL8mublV4emVzapS2/hC9tq2WE6OznWnThIPYJi
	 tqXaJVvG1501mKLuunBid9FCCmZ6xlgRisJdC24bBZVb1hJvy7MNGSHEjS7W72MuGW
	 OCU+cBDhAXwDq3jAxNBXApmjuzHr7KWtR10FylcaClx+T3W1GOZgXi5X9awMyxeQDb
	 Bd2trUOtEYbsA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so5579767e87.3;
        Tue, 03 Dec 2024 06:17:09 -0800 (PST)
X-Gm-Message-State: AOJu0YwkyQ2CepsZm+d/84I8FC6a0hEsS5AR4nsZ2iC3DSANaaKImIbG
	DJ8rMycIVgvcHOGfkcw0e8hrYni9Dc0fF4L5kW3qhGmfUjxePRE5BGw7Od0cHNDxb6kJ6NrydVq
	e/BuL1PHUk/iEYpUirmklBHuCYwk=
X-Google-Smtp-Source: AGHT+IExTTfwXYCxccBtB4kr6vV1+V29sWun6gVECQ33KNrHq6VjdgXDOxZsh8iignv15eDvAymcO8EP1vlE5BHPN9g=
X-Received: by 2002:a05:6512:118d:b0:53e:1364:f98a with SMTP id
 2adb3069b0e04-53e1364faaamr1525494e87.31.1733235427901; Tue, 03 Dec 2024
 06:17:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203140108.3401773-1-masahiroy@kernel.org>
In-Reply-To: <20241203140108.3401773-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Dec 2024 23:16:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARU=M282fAOOgzPOBPtDNFPjH8To9eK2vYstWxkEDEEPA@mail.gmail.com>
Message-ID: <CAK7LNARU=M282fAOOgzPOBPtDNFPjH8To9eK2vYstWxkEDEEPA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: do not include empty hook directories
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:01=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The linux-image package currently includes empty hook directories
> (/etc/kernel/{pre,post}{inst,rm}.d/ by default).
>
> These directories were perhaps intended as a fail-safe in case no
> hook scripts exist there.
>
> However, they are unnecessary because the run-parts command is already
> guarded by the following check:
>
>     test -d ${debhookdir}/${script}.d && run-parts ...
>
> The only difference is that the run-parts command either runs for empty
> directories (resulting in a no-op) or is skipped entirely.
>
> The maintainer scripts will succeed without these dummy directories.


The linux-image packages from the Debian kernel do not contain
the /etc/kernel/*.d/ directories either.

(Please correct me if I'm wrong, Ben)



> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/package/builddeb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index fb686fd3266f..e823742e17c4 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -70,8 +70,6 @@ install_linux_image () {
>         # so do we; recent versions of dracut and initramfs-tools will ob=
ey this.
>         debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel}
>         for script in postinst postrm preinst prerm; do
> -               mkdir -p "${pdir}${debhookdir}/${script}.d"
> -
>                 mkdir -p "${pdir}/DEBIAN"
>                 cat <<-EOF > "${pdir}/DEBIAN/${script}"
>                 #!/bin/sh
> --
> 2.43.0
>
>


--
Best Regards

Masahiro Yamada

