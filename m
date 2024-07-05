Return-Path: <linux-kbuild+bounces-2397-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB95E928C07
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 18:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DF1D283775
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDCE14F102;
	Fri,  5 Jul 2024 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PR1CYE+0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709216B399;
	Fri,  5 Jul 2024 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720195209; cv=none; b=BYyA1uQ0rh9PmOcJz1mpL/1MXhgcsHMb9/kGZM7wrEjnznJ5B1lOBCZ5i9xizdA+29gTIHKjDc0FsCbdJB1JmRz9LJ+nWuUOH9HtI/yyqi0/oc+/j23H7ySM3iqIigHgEAdbRuWnuY0JdN38lPgqBrZ2tszBrPISx7b3FHoGIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720195209; c=relaxed/simple;
	bh=zRMFc06JqnsUH0rvj+tjrAcuUW7C/dq82RLtokdkPDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVOKlBaIZhJPOlbP1WN6krs4GmoIM0gyBVkSwW0H3xSzj9WwXxNmFHHHYl6oayJm8+sZCY8k0KlGxYNbEU2IblIt2/DqYtlv2SwVDULkHlvThe4ny70Nff1ykG2mEibulSMyow8dUm8M9X4GddWvccsvYZNgIiVPi+R2mcSR2Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PR1CYE+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E11C116B1;
	Fri,  5 Jul 2024 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720195209;
	bh=zRMFc06JqnsUH0rvj+tjrAcuUW7C/dq82RLtokdkPDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PR1CYE+0lZ15urLcwQA28waF/LqIMt0+hCQzMIEyOquNtjepLIFpJQw04EsVTUTgY
	 iRXBdUpQFAjW0qL93a8csADQ/QVzo6Yau//24oUU3dRI6wQtkg1L+Zsuy9bb3gLPv7
	 xQYNCpZXQ1lkqrEOAMm1zAalKn13RQXtEbQtz7SA+dt5n2noEgewPvMt9qrWAYJOv9
	 pNDZWo/g35FQ1bFPdgRDy0rQ0KD1O6ppny600BznXsb56/VCZDaL4UY3wv1ikP3T/s
	 hEviXZ7gAeRCWQbJFwziVTlreOrNCb9MTePC3FFHMP9qiXHQx4jrvCVKCFpblDzuSD
	 Zkwh/m1ZI4Jvw==
Date: Fri, 5 Jul 2024 09:00:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Update ld-version.sh for change in LLD version
 output
Message-ID: <20240705160007.GA875035@thelio-3990X>
References: <20240704-update-ld-version-for-new-lld-ver-str-v1-1-91bccc020a93@kernel.org>
 <CAFP8O3JUgH-tBJtqO-QS0HmO4mrFBE6Dz+tnrBcse=gw_Q_4vQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3JUgH-tBJtqO-QS0HmO4mrFBE6Dz+tnrBcse=gw_Q_4vQ@mail.gmail.com>

On Thu, Jul 04, 2024 at 02:23:46PM -0700, Fangrui Song wrote:
> On Thu, Jul 4, 2024 at 9:19 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > After [1] in upstream LLVM, ld.lld's version output is slightly
> > different when the cmake configuration option LLVM_APPEND_VC_REV is
> > disabled.
> >
> > Before:
> >
> >   Debian LLD 19.0.0 (compatible with GNU linkers)
> >
> > After:
> >
> >   Debian LLD 19.0.0, compatible with GNU linkers
> >
> > This results in ld-version.sh failing with
> >
> >   scripts/ld-version.sh: 19: arithmetic expression: expecting EOF: "10000 * 19 + 100 * 0 + 0,"
> >
> > because the trailing comma is included in the patch level part of the
> > expression. Remove the trailing comma when assigning the version
> > variable in the LLD block to resolve the error, resulting in the proper
> > output:
> >
> >   LLD 190000
> >
> > With LLVM_APPEND_VC_REV enabled, there is no issue with the new output
> > because it is treated the same as the prior LLVM_APPEND_VC_REV=OFF
> > version string was.
> >
> >   ClangBuiltLinux LLD 19.0.0 (https://github.com/llvm/llvm-project a3c5c83273358a85a4e02f5f76379b1a276e7714), compatible with GNU linkers
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 02aff8592204 ("kbuild: check the minimum linker version in Kconfig")
> > Link: https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2ebef622c9716f8dbb [1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  scripts/ld-version.sh | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> > index a78b804b680c..f2f425322524 100755
> > --- a/scripts/ld-version.sh
> > +++ b/scripts/ld-version.sh
> > @@ -47,7 +47,9 @@ else
> >         done
> >
> >         if [ "$1" = LLD ]; then
> > -               version=$2
> > +               # LLD after https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2ebef622c9716f8dbb
> > +               # may have a trailing comma on the patch version with LLVM_APPEND_VC_REV=off.
> > +               version=${2%,}
> >                 min_version=$($min_tool_version llvm)
> >                 name=LLD
> >                 disp_name=LLD
> >
> > ---
> > base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
> > change-id: 20240704-update-ld-version-for-new-lld-ver-str-b7a4afbbd5f1
> >
> > Best regards,
> > --
> > Nathan Chancellor <nathan@kernel.org>
> >
> 
> Thanks for catching the issue.
> If we want to minimize the number of special cases, perhaps we can
> adjust `version=${version%-*}` below to
> 
> version=${version%%[^0-9.]*}

Thanks for the suggestion! I think this wants to be

  version=${version%%[!0-9.]*}

because of "If an open bracket introduces a bracket expression as in XBD
RE Bracket Expression, except that the <exclamation-mark> character
('!') shall replace the <circumflex> character ('^') in its role in a
non-matching list in the regular expression notation, it shall introduce
a pattern bracket expression." from the link that you have below.

That does work for me with all the different linker versions that I can
easily access (Arch, Debian, Fedora) along with my own self built
toolchains, so it seems like it should be pretty robust.

Masahiro, would you be okay with me sending a v2 with that change or do
you foresee any issues where it would not be sufficient? I would
probably change the comment to:

  # There may be something after the version, such as a distribution's
  # package release number (2.34-4.fc32) or a comma (like LLD adds
  # before the "compatible with GNU linkers" string), so remove anything
  # that is not a number or a period.

> (POSIX shell doc:
> https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#:~:text=Remove%20Largest)
> 
> ${version%%[^0-9.]*} is a simpler form than what glibc uses:
> 
>   "LLD"*)
>   # Accept LLD 13.0.0 or higher
>     AC_CHECK_PROG_VER(LD, $LD, --version,
>                     [LLD.* \([0-9][0-9]*\.[0-9.]*\)],
>                     [1[3-9].*|[2-9][0-9].*],

Cheers,
Nathan

