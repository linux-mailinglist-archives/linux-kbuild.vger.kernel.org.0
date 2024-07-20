Return-Path: <linux-kbuild+bounces-2606-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E519A9381AB
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 16:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 809B1281B22
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 14:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A98212C559;
	Sat, 20 Jul 2024 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3GY37St"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B81803D;
	Sat, 20 Jul 2024 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721485371; cv=none; b=bOsOTRG23WqrlrmBHoR6ipAQdqBLWi5X2dBw0v9WYQJY3bjJg18JABKfh15a6Nt2Jk/okHZg6kocTs+D2ed0RkEzDQzH3rwBJ5cHo6Kfwudjfy0kIapve0iiQZzdb3QFjcmdW7UKKfTVhmZALWi+/xpV7Gw9sXcMm688OVWP7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721485371; c=relaxed/simple;
	bh=BFFdj8rml5KMT9lI7+PpLPgk2mOydB0xDmtRUFZdFvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tB25YieDM+qm1zpvur6Wy0BCQGbY3g7d211+AmQz3TbjBDDp0PUTEn3xNn6ONJNHYWNZRlbp0g8pLwCtu8bw2JURL3xLmFPjTS+LLwqn94dHfBjZnmGbq0NuU+rKxWvK8fzI4f17rhDWaMmqiFvLRrfB2Y3Vfxa/48rxhyYIqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3GY37St; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB3CC4AF0D;
	Sat, 20 Jul 2024 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721485371;
	bh=BFFdj8rml5KMT9lI7+PpLPgk2mOydB0xDmtRUFZdFvY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b3GY37Stifxp41cyDk7J+6XPzXLHx6axVSEzFgfmRkhiIDsnBxL5XS5w3FEh64cvN
	 oDqKX7X1IhqW5fdG0lRzeNuoEebNSTrLU3LLjkFIsSt/6yOXZFnHMTcgcxPeseB1pl
	 rXO4OLmcB6gJZogpFhk2GkQLrHsAQX40c0rSpa0+lfW2EGAxT/Ij21rqWRk4LdNa7m
	 mqz47vR3L/3Lk3FYY4xE4vaELwlaJANkuRz+eH1Rk7uvYno/VUN0CCkRqJNLyIUU54
	 3/IIX3WetZp6hPn/xxGI+l75st3hzUJnPpAPMgK2c/BVfjxRxKdAEgoW9mEzNre2Al
	 lgYsFO+4cI4iA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e98087e32so2827482e87.2;
        Sat, 20 Jul 2024 07:22:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVezBTlUn5I4zFHz+x9m21i3Hr0eIw6DNr8StK+nrO4T+aR195Kh5VL1zi/VSBkiDE2tFYS8Y3liIH/GGVDk1f7Gdtyjya8mLCD4EPp
X-Gm-Message-State: AOJu0YwhBNBGQ/lNyG1O1cb92Z/jm3EwETHhVclSuxngViexsT/669D8
	ZUcbX/vBcOYN3Y9v6HB4GI1kZUNAY4uEHYUjejOO2WXDRSsBmsbXr9VlYMSuSo7mwTnjnzLPkJu
	XNjDz70wS2YnubfCEX6j2KwvbR00=
X-Google-Smtp-Source: AGHT+IFX1L8e02GeGVW4uAFzmZyKN3UH/7/oceJxrgszVutP0SJ2ukqjO/ZQfk1adnnIlV83PbubkHG1mGh2LyX9rDw=
X-Received: by 2002:a05:6512:39c7:b0:52e:9df2:7de0 with SMTP id
 2adb3069b0e04-52ee54272c4mr8503003e87.40.1721485370059; Sat, 20 Jul 2024
 07:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717182828.1527504-1-masahiroy@kernel.org> <20240719225532.mpm36wh6xa3acl7r@treble>
In-Reply-To: <20240719225532.mpm36wh6xa3acl7r@treble>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 20 Jul 2024 23:22:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkW74PP73oGLUaPhYvOcku39qNRr-0U6kwEUr6b9b5UQ@mail.gmail.com>
Message-ID: <CAK7LNARkW74PP73oGLUaPhYvOcku39qNRr-0U6kwEUr6b9b5UQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: add comment to discourage tools/* addition
 for kernel builds
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jiri Olsa <jolsa@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Brian Norris <briannorris@chromium.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2024 at 7:55=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Thu, Jul 18, 2024 at 03:28:19AM +0900, Masahiro Yamada wrote:
> > Kbuild provides scripts/Makefile.host to build host programs used for
> > building the kernel. Unfortunately, there are two exceptions that opt
> > out of Kbuild. The build system under tools/ is a cheesy replica, and
> > cause issues. I was recently poked about a problem in the tools build
> > system, which I do not maintain (and nobody maintains). [1]
> >
> > Without a comment, people might believe this is the right location
> > because that is where objtool lives, even if a more robust Kbuild
> > syntax satisfies their needs. [2]
>
> I think the original idea (from Ingo?) was to make objtool portable so
> it could be easily copied and built separately without getting too
> intertwined with the kernel source.
>
> I think that's still a useful goal.  To my knowledge it's been used in
> at least one other code base and could be used elsewhere going forward
> as much of its functionality might be transferable to other code bases.
>
> Also being in tools helps it shares library code (libsubcmd) and
> synced headers with perf (and others).
>
> If there's some other way to make it portable and allow it to share code
> with other tools that then I wouldn't object to moving it to scripts.
>
> Or, if the main problem is that there are two custom build systems (one
> of them being a cheap knockoff), could kbuild be made portable enough to
> be used in tools?


I checked Debian and Fedora, but I did not find such a package that provide=
s
objtool as a standalone tool.

In reality, objtool is tightly bound to the kernel source.
If people had thought it useful outside the kernel tree,
such a disto package would have been widely available.

I do not think there is a good reason to complicate Kbuild
based on the hypothetical statement.


--=20
Best Regards
Masahiro Yamada

