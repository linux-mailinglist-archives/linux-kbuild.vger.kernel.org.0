Return-Path: <linux-kbuild+bounces-6060-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB4A5CC19
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 18:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213F73B4DB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 17:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D882620D9;
	Tue, 11 Mar 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kshzTm+Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EE725FA2F;
	Tue, 11 Mar 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714100; cv=none; b=sylJVuJIYmw9+NwA5X8i6TZdV0EtU7oOrkFAyFolzhvNm6vYqr+XiNG16JOft3gn3J+l7CHVYHKT8JIVLnKfvgmmOoa/+v4roWA8kdznVnE8jXT76oYA7QKVwhhceEwXwmcJlfQM1GUgS6VuSHenOGGO1vYT4T2gCLKoG2uge6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714100; c=relaxed/simple;
	bh=6gIiOL2s//J5HZFZpJlQmsuNanGynI2VmIKrwwAEb/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpxHsxTO2+ZGU+3ELUVQRC0Lgj6d1qjrNPpMQQxSS0hr/weaVOz8NL3i1UVvnbAw0arNWpcsTv8tfZKsBSw3lLJo1xgrUUf0kNtLYedAbdbVnSUPKDuSLq0PSsIKtJEnZhPKquS1Yqvku9eABBAJk/y6UHMBx6o+Yiv9qf+t5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kshzTm+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1094C4AF09;
	Tue, 11 Mar 2025 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741714099;
	bh=6gIiOL2s//J5HZFZpJlQmsuNanGynI2VmIKrwwAEb/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kshzTm+YqqurFCk/doXwaCaE0lmhMiHhDaVgOeiSrOsMmMYS2WqoYIEefvThNUfAJ
	 EGe01+eFzvY2niGEIhZyjVNw8SL/794K8rJMjMrtpU9bVfO7Zi8E+QfXoNqyhyLa53
	 6S5/ilUzg+1j9ykl4KCB+h+xN90YCpHImA1PmZ8edztqAcasujslGe0JIToSOEwrlt
	 IjOKLEWXI2+nVsaaJmk/0tZv3++QDNngeU5qSsiTKL5yMZbw58Jh1IFd+0+slBaqDY
	 gnTU88yrmG+C/NUx7qzPwqOR4gG32viKYn72YOKfcAPEZqW0KDzThojD8JsdoypV8f
	 +voKeGOO8wdCA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bef9b04adso50797551fa.1;
        Tue, 11 Mar 2025 10:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUICR0b8dMZx/13jqUEZjEZqbS7OFajwedtKdg3M+Mv6ccqUiLro/MH4YmMbxjDyeK7r+IMDm+hTbplcvQNLQ==@vger.kernel.org, AJvYcCW2c1lLJxSW31teWj1lUHzgK75KNxSmpBIC+ymzjV9Y3IOnbwkSi4R3IevC+v0jlDptVOx9AvgcywcXc1zONL6xFsiN@vger.kernel.org, AJvYcCWLcQHWC1m2Foc5e+VSI5JFyZf5jntPvaCbB0ciuz7RZNpze+n12OYUSKoPxxkLBtN3DHhHWKkpXIGcWk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7KwIMh9ozPBnc+dNsROH0UNTJR5UuHtSgmXFlOvkgx0ZNA98
	VZ805e8cwdbbHEw0OOX347M+hXGe+ut2F/sKdAHyVoAPeFbogF/0/XDBHJWF7u+4ImDPZvrR+RQ
	HnBatJBiIBFjpfPWqfk2GRFY9++0=
X-Google-Smtp-Source: AGHT+IHKvmUMEW+W/r9UBi/k7XmJzPQCT5aKqvdrqfhaEnjN2i7/+hVnunCdia2NSe2g3voB7hWx2eLvWmupGn053Mg=
X-Received: by 2002:a05:6512:118a:b0:549:9044:94ac with SMTP id
 2adb3069b0e04-549abacbf61mr1740899e87.23.1741714098580; Tue, 11 Mar 2025
 10:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305192808.2826336-1-kris.van.hees@oracle.com> <CAK7LNASvQJT5rCGGQT+L+JtRX32_amZz05QCn9cvT4W4+uVJuA@mail.gmail.com>
In-Reply-To: <CAK7LNASvQJT5rCGGQT+L+JtRX32_amZz05QCn9cvT4W4+uVJuA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Mar 2025 02:27:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNARgLHf2wsic-tx26SqSStLvLXMQ3L7-HUOVdcZRvzgYcA@mail.gmail.com>
X-Gm-Features: AQ5f1JrDpAolv5s-NMytmL2SPvGFGdTXQDvOsafUMKHdOXLANLnRh3cBDsZARgk
Message-ID: <CAK7LNARgLHf2wsic-tx26SqSStLvLXMQ3L7-HUOVdcZRvzgYcA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: exclude .rodata.(cst|str)* when building ranges
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Jack Vogel <jack.vogel@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 6:17=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Mar 6, 2025 at 4:28=E2=80=AFAM Kris Van Hees <kris.van.hees@oracl=
e.com> wrote:
> >
> > The .rodata.(cst|str)* sections are often resized during the final
> > linking and since these sections do not cover actual symbols there is
> > no need to include them in the modules.builtin.ranges data.
> >
> > When these sections were included in processing and resizing occurred,
> > modules were reported with ranges that extended beyond their true end,
> > causing subsequent symbols (in address order) to be associated with
> > the wrong module.
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Jack Vogel <jack.vogel@oracle.com>
> > ---
>
> Applied with the following tag:
>
> Fixes: 5f5e7344322f ("kbuild: generate offset range data for builtin modu=
les")
>
> Please let me know if this is wrong.


Ah, v2 was submitted already.
I will take that one.


--=20
Best Regards
Masahiro Yamada

