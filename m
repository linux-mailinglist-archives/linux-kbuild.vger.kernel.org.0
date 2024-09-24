Return-Path: <linux-kbuild+bounces-3696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E98983C0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 06:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB42B1C2211E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 04:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A851920309;
	Tue, 24 Sep 2024 04:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMgGYpa+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715961B85D1;
	Tue, 24 Sep 2024 04:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727151753; cv=none; b=lwTUcwE3W+jjgvhrwzp4u3w2PQ57iVdzpuLK5N3f0t9YAJr+iu4fWdcYXBxpVbhWttjB9u9RFEsCFJZQiY/JQPchIfkT4uoyZd9MU8NdzLoL1/CtfJnzI24bUVk9nuuCxPc4HrpZ3kRifbhnQeoKCC7zmRDuLYkDlCG1gmQGqgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727151753; c=relaxed/simple;
	bh=NFx60XX8NBv159teKpcUwSkTlRNFNCD1wiTHXWYg3u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WB9HR8NYM0pxlhM+AcF8EbqGoF1zMoTFkxOxGj6ew8iivYos46TMLY/5lIqRrVwRiJI6+/IjcS36ZI5EsIus9QLfST63cwiAjMkS5RCmTGiCWiXc2TJuWLKHRaExA0W9wf0e3dOUiUJ4iK/HT0RoK5rCNdGg84xWwtG8RtBdWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMgGYpa+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF958C4CEC6;
	Tue, 24 Sep 2024 04:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727151753;
	bh=NFx60XX8NBv159teKpcUwSkTlRNFNCD1wiTHXWYg3u8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fMgGYpa+C3DQMfmr6XV4NDCUJBZTDbyqwQ9dV8rvIRQuNR6UEJsSUCAvqRMRhg0qG
	 0oYzhYlmoUeaZ0UqSAt7Hq48a/tSdlS/OgPNO2eoF1NUQAUciKYT4f0QqNogcPdbJf
	 dKvdA76AO5Q9rAGU7NtLfCM2E3xUFk0kgd8n4rXlou8c4F5/gMwMB7fpag6chOMw6L
	 L3kh8o1cbGqsh3XDimCkdWTBV6Hl6x9JUjucrBn4HXciirpdKJ3xU/dJeTXUFURH89
	 W83ph+C5PoE4NFB/f0+O9+29+xy6tPRC01hnaHsI1FZ87JzaUDFMVFBHGfNw85eU+m
	 KHuCvb6g1XuAA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so52651411fa.0;
        Mon, 23 Sep 2024 21:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURGy1ERQL3im3NHY3SLRDSEr2WPggaWlhJpjfoyup4qH7Lunm5eLaDH7tBEfToSYgaLWhgDYVWOb+35V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNM3jfND5Ut1jEduRKH8PIAiIw1l5fyXekT4UThU3QcfCc9/F/
	odmuUNZ2s+oPeldaapp27hOYnngNlbY5FpdcmSMWqDaitn8kwi2LVYnDVgrg9aWl5t8HC8Q+MQR
	qyQk46SnscYxalTOlOC0sQev3FdA=
X-Google-Smtp-Source: AGHT+IEn6g4s4PqwyvshrMIsJjV/BDPEuA0y797xrRKRCwIt5g5OsvVPz9ezeocKUv2ZTVQYC5Qj3D/4+rGbNnbh4VE=
X-Received: by 2002:a2e:a985:0:b0:2f5:1ec5:f4fb with SMTP id
 38308e7fff4ca-2f7cb2eda48mr76019131fa.13.1727151751613; Mon, 23 Sep 2024
 21:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913171205.22126-1-david.hunter.linux@gmail.com> <20240913171205.22126-8-david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-8-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Sep 2024 13:21:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATf=1WD5a8azGZGJ73-irm8uvBZujvuW3CUncXbix+10w@mail.gmail.com>
Message-ID: <CAK7LNATf=1WD5a8azGZGJ73-irm8uvBZujvuW3CUncXbix+10w@mail.gmail.com>
Subject: Re: [PATCH 7/7] linux-kbuild: fix: process config options set to "y"
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 2:13=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> The goal of "make localmodconfig" is to turn off modules that are not
> necessary. Some modules are necessary because they are depended on by
> config options set with a "y."
>
> Process configs set to "y" so that the modules that are depended on
> will not be turned off later.


You need to put the explanation in the cover letter.

Without reading the cover-letter, I do not understand
why this change is needed.





> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>  scripts/kconfig/streamline_config.pl | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index 948437aac535..762bf80408c7 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -466,6 +466,11 @@ foreach my $line (@config_file) {
>
>      if (/(CONFIG_[$valid]*)=3D(m|y)/) {
>         $orig_configs{$1} =3D $2;
> +       # all configs options set to 'y' need to be processed
> +       if($2 eq "y") {
> +            $configs{$1}=3D $2;
> +        }
> +


You are breaking the indentation style.

Check how the current code is indented.
(tab and spaces).


A space is needed after 'if'
for coding style consistency.




>      }
>  }
>
> @@ -596,9 +601,11 @@ sub loop_depend {
>        forloop:
>         foreach my $config (keys %configs) {
>
> -           # If this config is not a module, we do not need to process i=
t
> -           if (defined($orig_configs{$config}) && $orig_configs{$config}=
 ne "m") {
> -               next forloop;
> +           # If this config is not set in the original config,
> +           # we do not need to process it
> +           if (defined($orig_configs{$config}) && $orig_configs{$config}=
 ne "m"
> +                       && $orig_configs{$config} ne "y")  {
> +                   next forloop;
>             }



I do not understand the condition:


defined($orig_configs{$config}) && $orig_configs{$config} ne "m"
      && $orig_configs{$config} ne "y"


Is there any case when this condition is met?











>             $config =3D~ s/^CONFIG_//;
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

