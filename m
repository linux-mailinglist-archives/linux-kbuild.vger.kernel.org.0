Return-Path: <linux-kbuild+bounces-7463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF0AAD6534
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 03:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79D2F7A02C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 01:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EECA149C41;
	Thu, 12 Jun 2025 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKbHMcji"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C972637;
	Thu, 12 Jun 2025 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692598; cv=none; b=kY4UB4ttph84jix2Yei2HeQuhlu0V0BhAYorMtkOBtdAls5cphSCc0I0FngTRNrAoOWZKwBOXWB7kiKYHERtOaZ6NkMPjNUPJa//6rdB4aC9DPFsMDwfpYRdXSauVU8o1HU2CST+pNpbYM5sWOLGzz628v7z+781SjGo+KRg6oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692598; c=relaxed/simple;
	bh=nJiKsD0K+LcGBz7z+sVtXHYGvLqWO6VYpKkpfuszfxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1wSdh1iWynbGm1yw38IhjfnuO/WAAmjajmZHYcroDovVxt0AujHXEN5S5+ESxIqgt3PDV7yBKYZoY62coPIU+CCcVKHTY1H2MRUKbm+5TUfmTmCwDIOHwPfZlLOPp6jvaWUmelwLIjB9zJo76snjzmpMIlZzHLuEiGgwUS7/H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKbHMcji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E914BC4CEE3;
	Thu, 12 Jun 2025 01:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749692597;
	bh=nJiKsD0K+LcGBz7z+sVtXHYGvLqWO6VYpKkpfuszfxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VKbHMcji8PSb4XKBGzmjzrl7uKltVqUOCTWS4x3IRXcVOtBa7zUfbxVPFFCmTyOun
	 9q/0Vjj7+VR5wjeb1WipUQ/mIlb3VklYTgnROTUg7jM7kzwTZr8iP+4yP74v/ZiXeO
	 sTiXjL+4qqmwjhTj0Him0vhT13DN8zYMe3xVZcclqGLlCY6VRAzUpv7aekrQUsqneX
	 gUk92b9kU/4grxbOzKhj1JQMFJcZklHOBzRO016KfyVEDOALHZ+d2tmePLxlQZ2iq5
	 ZXkgPYp1Mw3xitHqoJ3aFQcm75qAweiXHia+TRHyHi7eHTc+3KebmR/v4/9f5+6Nia
	 L47qnNFFxUxbQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55220699ba8so412162e87.2;
        Wed, 11 Jun 2025 18:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJQNS4/FO/nAKVp1yvSL8SWwwGkVb/+8S6GkUa0Kc3fFVDgfTSYRsHOrjZ4Zblxu6RJHo4dWH+I2nkRRt8@vger.kernel.org, AJvYcCWzR0QcRDFxQaeorpp8oJaYVcFya0smSPUMtT9oMh34Sbr7MtjxpM+XQL8bkXvPxqffSCnC+sqCjrvu/xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYM7Rk7e46v3hHGq1ity9Qj9cBsaHUvBeJp9BtCJVsBl8hYlqS
	I8fpZfA5h5Gf/aWxzULz17LcrCTzWfj6cirt0z89I4bMPznHekjn0SLEv+Otpl+aHrqiLGZENYt
	AInVqx+nWBw93jgdmVRwYwQAqsBISR/c=
X-Google-Smtp-Source: AGHT+IEgqdrLF81oZGoIjbzZvL62Q/2Da7sgo63LTROXXrqbMNtJYNAzAGzFyzPHo3Pwq9Lktd6RhaZiiXookJePx7g=
X-Received: by 2002:a05:6512:3f27:b0:553:2191:d334 with SMTP id
 2adb3069b0e04-553a5553ff4mr401422e87.35.1749692596574; Wed, 11 Jun 2025
 18:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com> <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
 <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com>
In-Reply-To: <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Jun 2025 10:42:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
X-Gm-Features: AX0GCFuUxoOmGTczWadDDYsfiZgY4GcgmY7mmuZAiiHi4A9JMAjLH4-8Od5AZxA
Message-ID: <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
To: Arnd Bergmann <arnd@arndb.de>
Cc: Heiko Carstens <hca@linux.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Jun 11, 2025, at 15:32, Masahiro Yamada wrote:
> > On Wed, Jun 11, 2025 at 4:55=E2=80=AFPM Heiko Carstens <hca@linux.ibm.c=
om> wrote:
> >>
> >> Don't get me wrong, I can address all of this trivial churn for s390, =
however
> >> enforcing so many extra warnings to everyone with W=3D1 builds doesn't=
 look like
> >> the right approach to me.
> >
> > This is what W=3D1 is for.
> > 0day bot detects a new W=3D1 warning, so we can avoid new warnings comi=
ng in.
> >
> > People do not know which headers should be included when.
> > So, this warning must exist at least until we can get rid of
> > #include <linux/export.h> from include/linux/module.h,
> > include/linux/linkage.h etc.
>
> I think this makes sense in general, but the output here is
> excessive if it leads to users no longer wanting to enable W=3D1.
>
> There are other warnings that I think should be enabled at the
> W=3D1 level (e.g. -Wformat-security) and eventually by default,
> but that are still too noisy at that level.
>
> My own cutoff would be at a few hundred warnings in allmodconfig
> builds if there is an effort to reduce it further, but it seems
> that this one is still at a few thousand, which does not seem ok.
>
>      Arnd

Then, what to do?  Downgrade to W=3D2?

I think nobody cares about W=3D2 builds,
and the problem of all C files including <linux/export.h>
would remain forever.






--
Best Regards
Masahiro Yamada

