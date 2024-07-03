Return-Path: <linux-kbuild+bounces-2336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2892644B
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 17:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A45B1C23167
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 15:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3E917625D;
	Wed,  3 Jul 2024 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TloX3NYB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224191DFEA;
	Wed,  3 Jul 2024 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019211; cv=none; b=tETA/2dmUcbRPtR84L4tseC93lB0E/bvwx3TNynlTUdd3xhGBSIPzOvS6P4tUGyjWBNHQOUECPfZZjd5KTZS7Oz/4ln61UAmP9Q1dFWBRtF+Ll2MoRN1i7U/brVRPDVM7s+DIXOFmKqwqMJdmP9UDMGoF8sSvaSW80oMCqytWhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019211; c=relaxed/simple;
	bh=lWgvOJsIZ4/bJxVBfwUE/UX/ucolbg5OmVYl569WP38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8Yzha+GfXvUKQsNSamDNZa35/r/XOUR9LIvL328UV+33h/LJlnC11Kav4fX7WCNlGya35H8r60oZrl2TynsDd3YVr9yIKM1Ncafi9GMxPE+NyAFo+NaFiJxbWNuzMPe6zQB4peIxDuKeIW7Sb9HIon+N/5rMcJVfxfdHBFzjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TloX3NYB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD88C2BD10;
	Wed,  3 Jul 2024 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720019210;
	bh=lWgvOJsIZ4/bJxVBfwUE/UX/ucolbg5OmVYl569WP38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TloX3NYBBchfWZHi9mvv8wwdsc3RK8IQvZsudlwoZR0wt3MnR0IqCCRfPvp+CskYt
	 az7g3Gyn9vrmfTtUGSpW6/N5dRmI+CeGhD7v+askbLVqvEGa3HDXDFSgAk4QgVvUNs
	 4I/26HKPN/nbSsmjnuaiZ3qXesEFRoIUSxv4SArUImn8EPWXecadr6/wQcfqh3/duR
	 bwI2dVZFLdl4Aah046slwmkc3w5sXFXMXUCGVOKr3x1mHFvMefmJaouHmmHc6L7ivl
	 fEGseLSlOtfcN+/SlRCgx6ptTKPlA+aBQk+rQG36SSHzme6UgxWg58ZqfPEwlDd04m
	 laOI1GqZfq0GQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso61551851fa.0;
        Wed, 03 Jul 2024 08:06:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YyG0d8kC6irPK9JUQ25ob6LGhw4d31Bq7YfswRlss2Rx5jRUT4Z
	oFh1t1/Oc10uxG0ePPK2A/uA3PVfLnY+VaYV9MGGbLu/nUZlPOOrJnX/VCKsOspj1/w627qBYQA
	WW1SeMbpJpCwsAyCxMx6WxkACjkA=
X-Google-Smtp-Source: AGHT+IHj8XtRItm4LQERDRV7H96c+A6CCUe7Pf0sqV8VB+4HbDimdRyvmwJD4sNqq0BrGfLDQrDJsd4+C1UIJAiHES0=
X-Received: by 2002:a05:651c:160e:b0:2ee:80b2:1ea4 with SMTP id
 38308e7fff4ca-2ee8684890cmr12491611fa.26.1720019209436; Wed, 03 Jul 2024
 08:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702180332.398978-1-masahiroy@kernel.org> <20240702180332.398978-2-masahiroy@kernel.org>
In-Reply-To: <20240702180332.398978-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 4 Jul 2024 00:06:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQvNVq_hrbZo3SXoFvke3EENVC6tfxiN11dOk4O54C6w@mail.gmail.com>
Message-ID: <CAK7LNASQvNVq_hrbZo3SXoFvke3EENVC6tfxiN11dOk4O54C6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kbuild: deb-pkg: remove support for "name <email>"
 form for DEBEMAIL
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, riku.voipio@iki.fi, Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+CC



On Wed, Jul 3, 2024 at 3:03=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Commit d5940c60e057 ("kbuild: deb-pkg improve maintainer address
> generation") supported the "name <email>" form for DEBEMAIL, with
> behavior slightly different from devscripts.
>
> In Kbuild, if DEBEMAIL has the form "name <email>", it will be used
> as-is for debian/changelog. DEBFULLNAME will be ignored.
>
> In contrast, debchange takes the name from DEBFULLNAME (or NAME) if set,
> as described in 'man debchange':
>
>   If this variable has the form "name <email>", then the maintainer name
>   will also be taken from here if neither DEBFULLNAME nor NAME is set.
>
> This commit removes support for the "name <email> form for DEBEMAIL,
> as the current behavior is already different from debchange, and the
> Debian manual suggests setting the email address and name separately in
> DEBEMAIL and DEBFULLNAME. [1]
>
> If there are any complaints about this removal, we can re-add it,
> with better alignment with the debchange implementation. [2]
>
> [1]: https://www.debian.org/doc/manuals/debmake-doc/ch03.en.html#email-se=
tup
> [2]: https://salsa.debian.org/debian/devscripts/-/blob/v2.23.7/scripts/de=
bchange.pl#L802
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>  - New patch
>
>  scripts/package/mkdebian | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 589f92b88c42..83c6636fadb8 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -125,21 +125,15 @@ gen_source ()
>  rm -rf debian
>  mkdir debian
>
> -email=3D${DEBEMAIL}
> -
> -# use email string directly if it contains <email>
> -if echo "${email}" | grep -q '<.*>'; then
> -       maintainer=3D${email}
> +user=3D${KBUILD_BUILD_USER-$(id -nu)}
> +name=3D${DEBFULLNAME-${user}}
> +if [ "${DEBEMAIL:+set}" ]; then
> +       email=3D${DEBEMAIL}
>  else
> -       # or construct the maintainer string
> -       user=3D${KBUILD_BUILD_USER-$(id -nu)}
> -       name=3D${DEBFULLNAME-${user}}
> -       if [ -z "${email}" ]; then
> -               buildhost=3D${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null=
 || hostname)}
> -               email=3D"${user}@${buildhost}"
> -       fi
> -       maintainer=3D"${name} <${email}>"
> +       buildhost=3D${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || host=
name)}
> +       email=3D"${user}@${buildhost}"
>  fi
> +maintainer=3D"${name} <${email}>"
>
>  if [ "$1" =3D --need-source ]; then
>         gen_source
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

