Return-Path: <linux-kbuild+bounces-7052-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C1AB06B0
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 01:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 860241BA31A2
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 23:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B73230BC2;
	Thu,  8 May 2025 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sspezmIo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A53179A7;
	Thu,  8 May 2025 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747848; cv=none; b=BHKvivuLISZTyd4mxdRF2P/WvZQ1Avk3MswpWbEnuRDxE+DsI3doR86nwxDoC7Fv4Ieqcl4Kz0/gOWLXDDeRd4LJn6UFr4juc/v3vs3bXw0Njva8klOTIp+VMRlBW0Pu6+/ax6xVTBKCt09RNdzpt8oaGNbVWTTOPARuwi8qz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747848; c=relaxed/simple;
	bh=VD77Bm/Lw9PN11tTiagCuFPnT8sKVBvBCh2f/LHW71A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POgVfb7EazlXupqZnqbkNTOjgL/S1TGUnlYaDHuMdFLgU+23RKJVHQuVYzUQt9nPftGLtWCbVnlqv/A+utrxp3cUn27Bn7QcbXYOU+DhVVOp8Ncypu8xL9xvXBUz8qZN9vURyIZoRB+Hwawqj4oeQtYQworKMGcLCZk0p7nt/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sspezmIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA25C4CEF0;
	Thu,  8 May 2025 23:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747847;
	bh=VD77Bm/Lw9PN11tTiagCuFPnT8sKVBvBCh2f/LHW71A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sspezmIoQW0IStetezr9LmZ2c20o6FiGyIZWDK/AZLoKzycg30MpJ7z4U91zeO7o6
	 BCA6EbE1i6RxXaqqoxnJCRk5FMY25ysTGN6o5Ed52GA8DZ519dBcWn1LP11SNIwA9S
	 Y6bwnSKnnbTey62iceOE9MHX54fVz25/qvvV3liMlLx0DRVrxuTaNI8Eugdn+faFS0
	 Xl7eRhtRr7t5NRv/+iuqHBIdOG7XtoArtwgY18iaTR6Kn/DYgAmqZCwn0K9qJeVrYQ
	 EbSgD63uPOFzLBcSYyhacopuIcQO/SxEvzeyR1RjSIOc2BaacH2SEVbpMrPQBUCtm9
	 osMvyZRPzcx3w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e7967cf67so1934346e87.0;
        Thu, 08 May 2025 16:44:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaJ9m9IsapTOpJtgMTraM06uJLcmbI10exzRNDL70GoKcs6q6VvwyX6+fC7pQOVK83DpHjIHFYCGJM8KA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfM8y7pzglrakAuwtntcXaBcHNrfnEmilWioE9ALGOhJNErIvn
	Ngx33XwHLzjMtumA1L/fd1ESEcwmuIcmuUp6jYeLCQ1LFqNnmLLyiefJJW3QVVoKY+gr6bu5/Sf
	/ghPN2GD/E17RUsqZp6tZliwWZBA=
X-Google-Smtp-Source: AGHT+IGSLkr2J9fompKcX3UkbVBHJw3IyGmTwqs1lj0yAnIGW/lnpIbYYZKhnzxYzoAgzhJUWx+gqtg2q38ESpuszcU=
X-Received: by 2002:a05:6512:448a:b0:545:c7d:1796 with SMTP id
 2adb3069b0e04-54fc67e4c48mr386027e87.43.1746747846560; Thu, 08 May 2025
 16:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507074936.486648-1-masahiroy@kernel.org> <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
 <CAK7LNARF=ANEEeENSwcWeayympi6Svci+ScWGpWQimyWm8xUzA@mail.gmail.com> <a4558815-f400-41c9-973d-90680ceb3ede@linuxfoundation.org>
In-Reply-To: <a4558815-f400-41c9-973d-90680ceb3ede@linuxfoundation.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 May 2025 08:43:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR7Mz8HgXQsiDenxydpFHdU2-Pu=wtq6CuPt9jCwtLDLg@mail.gmail.com>
X-Gm-Features: ATxdqUGcvJFpNkKPjx4dQLg6uzB7FzVYnlTTkLaD0ydKuhGbytFkqbHZ71svEic
Message-ID: <CAK7LNAR7Mz8HgXQsiDenxydpFHdU2-Pu=wtq6CuPt9jCwtLDLg@mail.gmail.com>
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as well
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, 
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 7:14=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 5/7/25 17:49, Masahiro Yamada wrote:
> > On Thu, May 8, 2025 at 6:38=E2=80=AFAM Shuah Khan <skhan@linuxfoundatio=
n.org> wrote:
> >>
> >> On 5/7/25 01:49, Masahiro Yamada wrote:
> >>> Building the kernel with O=3D is affected by stale in-tree build arti=
facts.
> >>>
> >>> So, if the source tree is not clean, Kbuild displays the following:
> >>>
> >>>     $ make ARCH=3Dum O=3Dbuild defconfig
> >>>     make[1]: Entering directory '/.../linux/build'
> >>>     ***
> >>>     *** The source tree is not clean, please run 'make ARCH=3Dum mrpr=
oper'
> >>>     *** in /.../linux
> >>>     ***
> >>>     make[2]: *** [/.../linux/Makefile:673: outputmakefile] Error 1
> >>>     make[1]: *** [/.../linux/Makefile:248: __sub-make] Error 2
> >>>     make[1]: Leaving directory '/.../linux/build'
> >>>     make: *** [Makefile:248: __sub-make] Error 2
> >>>
> >>> Usually, running 'make mrproper' is sufficient for cleaning the sourc=
e
> >>> tree for out-of-tree builds.
> >>>
> >>> However, building UML generates build artifacts not only in arch/um/,
> >>> but also in the SUBARCH directory (i.e., arch/x86/). If in-tree stale
> >>> files remain under arch/x86/, Kbuild will reuse them instead of creat=
ing
> >>> new ones under the specified build directory.
> >>>
> >>> This commit makes 'make ARCH=3Dum clean' recurse into the SUBARCH dir=
ectory.
> >>>
> >>> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
> >>> Closes: https://lore.kernel.org/lkml/20250502172459.14175-1-skhan@lin=
uxfoundation.org/
> >>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >>
> >> It doesn't solve the problem. I still see arch/x86/realmode/rm/pasyms.=
h
> >> after running make ARCH=3Dum mrproper
> >
> >
> > Why not?
> >
> > This patch allows 'make ARCH=3Dum mrproper'
> > to clean up both arch/um and arch/x86/.
> >
> > It is really simple to test the behavior.
> >
> >
> > [Without this patch]
> >
> > masahiro@zoe:~/workspace/linux-kbuild(master)$ touch
> > arch/x86/realmode/rm/pasyms.h
> > masahiro@zoe:~/workspace/linux-kbuild(master)$ make ARCH=3Dum mrproper
> > masahiro@zoe:~/workspace/linux-kbuild(master)$ ls arch/x86/realmode/rm/=
pasyms.h
> > arch/x86/realmode/rm/pasyms.h
> >
> > [With this patch]
> >
> > masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ touch
> > arch/x86/realmode/rm/pasyms.h
> > masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ make ARCH=3Dum mrproper
> >    CLEAN   arch/x86/realmode/rm
> > masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ ls arch/x86/realmode/rm/=
pasyms.h
> > ls: cannot access 'arch/x86/realmode/rm/pasyms.h': No such file or dire=
ctory
> >
>
> I ran another controlled test starting from a totally clean repo
> and the building - looks good to me.
>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
> thanks,
> -- Shuah
>

Applied to linux-kbuild.


--=20
Best Regards
Masahiro Yamada

