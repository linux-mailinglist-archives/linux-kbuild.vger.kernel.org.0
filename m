Return-Path: <linux-kbuild+bounces-1859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C128C5FAA
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 06:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDC22B21C53
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 04:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AA73839D;
	Wed, 15 May 2024 04:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCpVdjcC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8A138398;
	Wed, 15 May 2024 04:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715746662; cv=none; b=TbcUGYRZ75282c3B9O3l9FNmqnLc8hMRJQfOjElQU0piewmWekP2TCCJ6GV1SIq0uSpHVsokQYZTwJNz/fz/nm0x6z16VcxSoVqB/q6KRuR5DuW95qYlOmTsAV9QB2RW3w7HojHSi07lvi22G+tjlThJDMoL5YVnaPofAM0IkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715746662; c=relaxed/simple;
	bh=o8xlyoTwasKN6ToM9uc7PDvEdUddA5cXnljoZKZ9vpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/rjX8ArwRV0m6TE2mnB27BTS22cD8YtxesYDST6MqW3R1ARPy9lUfGLIUsyuKKifi+9EQiyQYgWbMt5q/s7QbtsTRF99fpwj2fAIUQvkEr3YmVaLk3/ojkVKHoqQcWA/rbh6awI069e0A4IsWiPa8nnaqZ9mjECEw5aXuLldHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCpVdjcC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC093C116B1;
	Wed, 15 May 2024 04:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715746660;
	bh=o8xlyoTwasKN6ToM9uc7PDvEdUddA5cXnljoZKZ9vpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FCpVdjcCp0OtgEk1rkJFNu/BgQyghY0NhS0lKg4hirLKKqFoppfPfx8mkb5r2n06C
	 fP3Phd9ctUKlhW7YQyFh6/KA63uqji35E+B+JECEgXti88NP9mXhS1ceXPmt+njJyh
	 DkBrKoixQLQq8FdYnuzKK6bbIBeBkGif2Cum31MYqNja2DwHsgL+WYtvyKjqqyVQtB
	 1+e1wbzIwZYpVu/7WM+WynHJSTqXhIEeXQpliLa78wc0VWMx+f0rFLnr7sxemncTt6
	 r808xMb7vty05r/JWDea0BMkzvnIlZJ+4iGZJwFi9EZKhDvEAJRwVd+ybjP55Bj+ka
	 Cs/GS/FS1g5PQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5238b7d0494so718852e87.3;
        Tue, 14 May 2024 21:17:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqev3i7jAEwGl+n9pLwotFvKWd+Ta9BAfXg4rfDDQl8B5MbHzkucrbFzW1QXGVsghQkztwITKH0hZbJhvpVSdwLSv3ri/2x+PnK8I4t/D2TfXC8FBqH6XkzAGXWoC+7BGJzqYJ+i4x9WLE
X-Gm-Message-State: AOJu0YxxNnhiZAHoVRNXmAPKu56sNHoJUoG/cZVrkm/y6ppYsBW1EZYd
	7vTq7Z1/U9gdRuflBntdTIPaJlQOkQZb2dRk5HixSHlRQVOhNKjWUDHM49QUzXbS9OGHMfUlwGY
	VXv/I9UynSa0NpbOFLauGFHhySvA=
X-Google-Smtp-Source: AGHT+IESSLsGjW88xIqliogNGDxgxvKWhuWkxYP31Rdm3gmKprqZhOCCqwQtAdIyH4BUsw/KkwPyyrxbqlAYjIgGGM8=
X-Received: by 2002:a05:6512:3d1a:b0:51e:f0e8:d70d with SMTP id
 2adb3069b0e04-5220fc7d1camr19011140e87.21.1715746659584; Tue, 14 May 2024
 21:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b948b14b-1543-4314-9e9e-58a54cf2b734@gmail.com>
In-Reply-To: <b948b14b-1543-4314-9e9e-58a54cf2b734@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 15 May 2024 13:17:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTaxPDH4_wozMc9G6NE+HwFXgLiUAM5Ki9mc-Gwf4vmA@mail.gmail.com>
Message-ID: <CAK7LNASTaxPDH4_wozMc9G6NE+HwFXgLiUAM5Ki9mc-Gwf4vmA@mail.gmail.com>
Subject: Re: [PROBLEM linux-next] Error in "make olddefconfig" and "make menuconfig"
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 3:37=E2=80=AFAM Mirsad Todorovac <mtodorovac69@gmai=
l.com> wrote:
>
> Hi, Mr. Bagas,
>
> While bisecting a problem in linux-next tree, I came across the problem:


I checked out v6.7-rc5-2761-gefc11f34e25f
but 'make olddefconfig' worked fine with me.


If this issue occurs only during 'git bisect',
I need full steps to reproduce it because I do not
know what you did before v6.7-rc5-2761-gefc11f34e25f.


  $ git checkout <some commit>
  $ [ do something ]
  $ git v6.7-rc5-2761-gefc11f34e25f
  $ make olddefconfig


If I am able to reproduce the issue that way,
maybe I can have more insight.







>
> marvin@defiant:~/linux/kernel/linux-next$ git describe
> v6.7-rc5-2761-gefc11f34e25f
> marvin@defiant:~/linux/kernel/linux-next$ make olddefconfig
> make[2]: *** No targets.  Stop.
> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_=
basic] Error 2
> make: *** [Makefile:234: __sub-make] Error 2
> marvin@defiant:~/linux/kernel/linux-next$ make menuconfig
> make[2]: *** No targets.  Stop.
> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_=
basic] Error 2
> make: *** [Makefile:234: __sub-make] Error 2
> marvin@defiant:~/linux/kernel/linux-next$
>
> Now, this occurred for the first time, and I don't know how to bail out.
>
> I recall in past couple of years you have some insightful advice.
>
> Thank you very much.
>
> Best regards,
> Mirsad Todorovac
>


--=20
Best Regards
Masahiro Yamada

