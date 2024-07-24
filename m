Return-Path: <linux-kbuild+bounces-2639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1860A93AF89
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 12:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43DDEB225AB
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 10:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A52913B585;
	Wed, 24 Jul 2024 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+KMK//V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D41C2AD
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721815391; cv=none; b=TN5e9G4fpBJCefCq6DA5ntjgpApSpUUqPRk3MILrfodgQIKCFlYbHP253OflU1EVpOIWoPZPTJrKx8g4jdkmNsWvRnCrXRdbonIBBn/6ovRnynYts6Nn0H8D8Y/OYYZEhQViSM1h0aCWw9jGaztvLJJ+pBCVx8uyxJymlixbVVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721815391; c=relaxed/simple;
	bh=MW2fwyd6T9nPfM6aztitHVsvnzmz01HAMcnvoRK3eQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dijpKHx789H/MApv72kPd1Vjx/GGzgF1eKmwRCBF0/dlSbYXTOXwXYCh71NCK8s8FTwIEfUuWNSi92md3EEpuD6r7rXKIepS+DCli2mEtdQOV5gR3z8WQPXkoR/817Nq7o9IPUBLep/ZEi2swkjZgrT84MJOLUr6jEj0DmW5gYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+KMK//V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618F4C32782
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721815389;
	bh=MW2fwyd6T9nPfM6aztitHVsvnzmz01HAMcnvoRK3eQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e+KMK//VkinELujcFKLtc/PNaXtrF+3BLhxY/77elZXJ5WGrPym7rQTOtUXJp05I9
	 4/FsB2tYXNCYugmS+B9vJlF7B6JdQbPjr5sjTmDC2Aiq5bIv0AED378uocEN1w4lPy
	 lRnMSpnzscUaAK7+8fG3nACq+PsIJoLRbdP3ibu2njklNp5lzrUoN9sc78fTNmRe5V
	 brnIF+N4Ap135tHOuNs83BPqHmcf15/k/3rtw8gvp2BGyjanrWaQ7An5KUPjFLrMrZ
	 4aCedCCZJ4AMtniXXoY5FtMOAj755pNjuwwjo7M/aKGWvgjzwSSEb5NevrA1YTONyx
	 uzk0JlQ4ek6xA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so34233691fa.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 03:03:09 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw/r1oXsMrWTpZ25Bo3hIv+n1hD45iAXnXlmD9HBulHRZFcgvwD
	65iFex7SAk3I1fez7x9PDuvII1+8laA2Hh7CNiWHvAlLRkYLJrXobbWOWhBGbTIAyTnb5LeAMaW
	JVUBZXzWuRLXmtEbgGlxAnuai6/k=
X-Google-Smtp-Source: AGHT+IFA7O43m+IbYGdr1QI2Qiey0xFnikZ5ugQqXg2/AX5DHTUULRqACEsjnmsiHo/XhnXD7RdP5bpFC29AaIqxwR4=
X-Received: by 2002:a2e:bea1:0:b0:2ef:226e:e150 with SMTP id
 38308e7fff4ca-2f02b98cc07mr25332461fa.32.1721815388003; Wed, 24 Jul 2024
 03:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724084655.930706-1-pvorel@suse.cz>
In-Reply-To: <20240724084655.930706-1-pvorel@suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 24 Jul 2024 19:02:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASwTmrtgROXW_CVWX2Bjb9q=uMu7TxYkBQ6MBBTuJ_PVw@mail.gmail.com>
Message-ID: <CAK7LNASwTmrtgROXW_CVWX2Bjb9q=uMu7TxYkBQ6MBBTuJ_PVw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix C locale setup
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Rafael Aquini <aquini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 5:47=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote:
>
> semicolon separation in LC_ALL is wrong. Either variable needs to be
> exported before as a separate commit or set as part of the commit in the
> beginning. Used second variant.
>
> This fixes broken build on user's locale setup which makes 'date' binary
> to produce invalid characters in rpm changelog (e.g. cs_CZ.UTF-8 '=C4=8De=
c'):
>
> $ make binrpm-pkg
>   GEN     rpmbuild/SPECS/kernel.spec
> rpmbuild -bb rpmbuild/SPECS/kernel.spec --define=3D'_topdirlinux/rpmbuild=
' \
>     --target x86_64-linux --build-in-place --noprep --define=3D'_smp_mfla=
gs \
>     %{nil}' $(rpm -q rpm >/dev/null 2>&1 || echo --nodeps)
> Building target platforms: x86_64-linux
> Building for target x86_64-linux
> error: bad date in %changelog: St =C4=8Dec 24 2024 user <user@somehost>
> make[2]: *** [scripts/Makefile.package:71: binrpm-pkg] Error 1
> make[1]: *** [linux/Makefile:1546: binrpm-pkg] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
>
> Fixes: 301c10908e42 ("kbuild: rpm-pkg: introduce a simple changelog secti=
on for kernel.spec")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  scripts/package/mkspec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index ead54d67a024..4dc1466dfc81 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -50,6 +50,6 @@ fi
>  cat << EOF
>
>  %changelog
> -* $(LC_ALL=3DC; date +'%a %b %d %Y') ${name} <${email}>
> +* $(LC_ALL=3DC date +'%a %b %d %Y') ${name} <${email}>
>  - Custom built Linux kernel.
>  EOF
> --
> 2.43.0
>



Ah, right. Thanks.



I also noticed this mistake in Rafaels' initial submission, then
I suggested the correct code without the semicolon:

https://lore.kernel.org/linux-kbuild/CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=3D=
7gJpPCNK0AnHfJw@mail.gmail.com/



He tried to modify the code on his way over again,
then I missed that he had restored the semicolon.
I should have taken the code diff.
:-(





--=20
Best Regards
Masahiro Yamada

