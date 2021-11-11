Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71FB44D50A
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 11:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhKKKgR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Nov 2021 05:36:17 -0500
Received: from mout.gmx.net ([212.227.15.19]:37269 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232318AbhKKKgQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Nov 2021 05:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636626768;
        bh=uMU1373AJ5b0uKpR/RatT/DkoeOsKokoX2iJcNWel8U=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=R6tRD/0BVuDwwwdLGMrLggr5YULeD4oqnyRIH5CNFpi7zf0fPlL8KdTd3DubtpxnF
         TCwvVXpzfm2wa4sNntEzGf5Ae2LdEy2TBUjwjRohKn0yaY/wU4L2pSvAIIE7YIHfzw
         IcKO+1MHeHt3cuvhrv0WSMsYPannhyTsciJc0Z1k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b2d-1mmUIP1zLR-0083Gp; Thu, 11
 Nov 2021 11:32:48 +0100
Message-ID: <26fd47db11763a9c79662a66eed2dbdbcbedaa8a.camel@gmx.de>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
From:   Mike Galbraith <efault@gmx.de>
To:     Marco Elver <elver@google.com>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 11 Nov 2021 11:32:40 +0100
In-Reply-To: <CANpmjNPeRwupeg=S8yGGUracoehSUbS-Fkfb8juv5mYN36uiqg@mail.gmail.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
         <20211110202448.4054153-3-valentin.schneider@arm.com>
         <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
         <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
         <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
         <CANpmjNPeRwupeg=S8yGGUracoehSUbS-Fkfb8juv5mYN36uiqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uuwX788BL/oP1FC37c/JIA2AX9+HNeNHkFeDgDrreyZCxwfBg0P
 B+LG2N6R4OuzGdOAYShamBgnrdfwteiTsZbAt3bWKAG4xA8ILr8IE8V8eRKdYmsI+QT4ieO
 hSGLZCIAvzMybM5e4d039bw+2e9jg0wvFDF+Hvd9V0aPc42JqL2Hq55llwqtmw1QBPduxu9
 rFSdKtZIpm4OcQmGqQUXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tJHMHumK5Ow=:WzGr7EVNBA75U29zZgCq9T
 SH5u6IUYmUgYVPKQC6dyltXmdR8eq//e3pTu2OzThSYmBIu9/NaxZ2/IA2sKuJiyK+yFTzrz5
 I/HO/mwgHzqLmwD/0DWQMgoQhcJpYCfbUYZYKy2TLdqLRVhNV1A2Cjk2BZZuEU4Do2CUwT/eM
 wIpShikX11920Uxw/YETz5drZBAPyyvz9zJqk/yQ+rc1KXFv2e0FBOJfDN6wEd+Gvq5+cjGLR
 dyGZUYeYODZMUpuAR85mw6IR2cGW64i+9ROqZnuoDJdUJwBRt+1vI6UopW20ZAPB/6XSgIzoh
 6Qs6/0y24T0Er4XHnZTI2cxFbzvUnZKvsR4fvInhTvyNC83jalZoD1Bj1iMtAIY+QIVXLv36B
 EXoxruXp/NcOvv19ewBKC9sC3iOmUxILYXSVj8UevLj7pjHUJ3Uu5EXqdLz7yT23WIbN3WDig
 CeBx418hv8rdQKUQbvsxRGQUbuKhDkKh3z5e8gLXQqFumqYJGhKfmjmdMWSfA6zHwzaA59KS3
 LPz6U15vXGZ6c/2oKKQqPRWTF8pS9TwACFE/m96KICA5cmF1WA6aV3ryOGXmsyVWSFunp1Xnj
 xZzIm3kkyWYtZ0Fn92uNtY2TecsMSPaxL8sNQjbv8mkMzJwFpskie7EeHrKwBKM6jqtyHqD5B
 8kyqZ6IMr+cytx1g56gpncODPICpz4oRGhGVvF7pwteqmz4jEZ9JWbf/4vegn1Ak3iF3gPZMy
 vSQ6BrmBGzZc7t2mMtOXTWPCVApr4Q+uOifNKAEMe241zzCFDUvW+pOFXeUVLEaDU43IwDudY
 6MCeRNbQctVEBAKnkUQS0Il/dZw5JazqlnaS+aeeYHa8AwzmoqazLXcfq6OuwXJ8SEE1xj9M/
 BkhTYFoSE4jk6klAhutpMoNIKHo1L6ZYEQkj4ZQVR1vsW4SJax+xiSDDvdlUzRIU4LLOgYA/V
 aHo+bkLFBdQ+afhD7Hf65ElPd7tZCgK4bAQL3A2Yjp/2g4iJo39sib4bpoEylT0GjY2v0SLhz
 KqXTT4atTgR1C/Gw4S5+sH+Xz7Kwu/yZKR3BWH3smtCZrUkBNdhxpFKI6IXxJdOHsdn7oGbho
 RB/Uuzm8D7VlZw=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2021-11-11 at 10:36 +0100, Marco Elver wrote:
> On Thu, 11 Nov 2021 at 04:47, Mike Galbraith <efault@gmx.de> wrote:
> >
> > On Thu, 2021-11-11 at 04:35 +0100, Mike Galbraith wrote:
> > > On Thu, 2021-11-11 at 04:16 +0100, Mike Galbraith wrote:
> > > > On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
> > > > >
> > > > > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > > > > index 5f8db54226af..0640d5622496 100644
> > > > > --- a/include/linux/sched.h
> > > > > +++ b/include/linux/sched.h
> > > > > @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> > > > > =C2=A0#endif
> > > > > =C2=A0}
> > > > >
> > > > > +#ifdef CONFIG_PREEMPT_DYNAMIC
> > > > > +
> > > > > +extern bool is_preempt_none(void);
> > > > > +extern bool is_preempt_voluntary(void);
> > > > > +extern bool is_preempt_full(void);
> > > > > +
> > > > > +#else
> > > > > +
> > > > > +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> > > > > +#define is_preempt_voluntary()
> > > > > IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> > > > > +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
> > > >
> > > > I think that should be IS_ENABLED(CONFIG_PREEMPTION), see
> > > > c1a280b68d4e.
> > > >
> > > > Noticed while applying the series to an RT tree, where tglx
> > > > has done that replacement to the powerpc spot your next patch
> > > > diddles.
> > >
> > > Damn, then comes patch 5 properly differentiating PREEMPT/PREEMPT_RT=
.
> >
> > So I suppose the powerpc spot should remain CONFIG_PREEMPT and become
> > CONFIG_PREEMPTION when the RT change gets merged, because that spot is
> > about full preemptibility, not a distinct preemption model.
> >
> > That's rather annoying :-/
>
> I guess the question is if is_preempt_full() should be true also if
> is_preempt_rt() is true?

That's what CONFIG_PREEMPTION is.  More could follow, but it was added
to allow multiple models to say "preemptible".

> Not sure all cases are happy with that, e.g. the kernel/trace/trace.c
> case, which wants to print the precise preemption level.

Yeah, that's the "annoying" bit, needing one oddball model accessor
that isn't about a particular model.

> To avoid confusion, I'd introduce another helper that says true if the
> preemption level is "at least full", currently that'd be "full or rt".
> Something like is_preempt_full_or_rt() (but might as well write
> "is_preempt_full() || is_preempt_rt()"), or is_preemption() (to match
> that Kconfig variable, although it's slightly confusing). The
> implementation of that helper can just be a static inline function
> returning "is_preempt_full() || is_preempt_rt()".
>
> Would that help?

Yeah, as it sits two accessors are needed, one that says PREEMPT the
other PREEMPTION, spelling optional.

	-Mike
