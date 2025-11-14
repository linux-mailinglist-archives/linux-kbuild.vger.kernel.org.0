Return-Path: <linux-kbuild+bounces-9625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A88DFC5D5A8
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 345434E7B60
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 13:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16947314D0B;
	Fri, 14 Nov 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E7ddOafH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0D3064B2
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126562; cv=none; b=liDkWFH6NlanD1QJZ6NMNSH0We4pWeWO9OvEQJ7D0uwfRlAUam0En7Y/OulNRohxB8LtH6KIU/ecL9Pp9xTj7PkMP9GVV3iWAUTP16hhNrB5GeY/G3g8mc2tfHRag1Ix5oJbN1c4HTSwSmIFjHA0lvk9YRZn92hdwIGGVQs4d6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126562; c=relaxed/simple;
	bh=FuZEuvQ3jmbwZpx7rFiCevGNtHp2p1kTZ05rKerm0EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0z6wTf/5wii4PfgISt0CT/ofIuBhJKqiB2UASZBqElJma4d7mqv+AgwB6Y6ORa12ERPk+IrtUZdy9v9BrsnsKc5/GVGfuvPT5anadRrfu4TIjKpdh9zo0ZECGGvZfJ7wF0vRo9KLG2Bs3/b71Q87Ozm2Gb0SuRgXVnrjI+np2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E7ddOafH; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso1760695a91.1
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 05:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763126558; x=1763731358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FuZEuvQ3jmbwZpx7rFiCevGNtHp2p1kTZ05rKerm0EM=;
        b=E7ddOafHhPb5QWq24mSAuEe9DZvtfFj7qtODwlLawtQJlmpFk8W7Y8n3jwAVPsBt5c
         1oTez8GmZCPnOyL6Yisc8QnrkRygZTvGDY/WskDu5UqsRZZsPP6Yo8VP0/Y+xHHWpL8o
         BoA+QIE42S66eKhoUszplz+w92NtwTHBXHodQzFTDFRPYAFjBlk60RgryU3cbP0H8KfN
         +alh7Q0ojcALPBF8As9eN6Z4mc142KmZp/gBOPYw0B7T3QfvQIouSaoFc5fcZ2oPhWGI
         qj0xfhASDSe2CXxZuP4SRE+GUMzHdPF3utwvbNQ2J4nmYXzzoA2sWraJlPVeHJhOotB4
         jXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126558; x=1763731358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuZEuvQ3jmbwZpx7rFiCevGNtHp2p1kTZ05rKerm0EM=;
        b=pOAxPESziGdpcYKOZ6Yy+oTFMvXHoO7XpTsyh/DWldBA9brVV/rRiYrjlflhKsvNLg
         jHyVg73Zo4BxAFFFNdpRRrxskww9hbrB0wBe/qUJJNrGLE4OSJWvO2QNGc2hQmcqenZA
         FBcKpd+uVjarqOrJYu8O86fzSEkksKM08NSQIT/pGYbFUSHdxB4hPwNGI0XOzL13AHAj
         TMw8H5uv5FowYkEqxjiNmsVjscnOBaUxFo1XISlf+MWw7cc0BhOjzY7176V6StXPthea
         augJe9zkfB7R+6z21IpM7vxGo4yOaJaQS7HQUHrkxOxj2P+oHWoGHVYctW7Cho1Vl2xg
         EuRA==
X-Forwarded-Encrypted: i=1; AJvYcCVX2U7HtziWM36/sCZt4BXiBGslHXCKEQOBwu0ExMQayU9afG+zydxYDPp2tR++L1kU+NlhR/GCdniPWKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJFqDKCS7SvXOAFkzdVe419+VllxQF2hRREEjaeMwmYVscHxtq
	gjbPEAYoH3ywLh4q+3mRWOuwFyVdkKLTJBtPhdf+5txskFqhqVxxavzDuXfISjs0tCWHGmf8gp3
	mKM3u/RropYyOetLjZ5S3Zbz4lspnFp+RnratVifB
X-Gm-Gg: ASbGncsuUZCNEGcptF+JPScADWBqpE5xDja2I3CMtKAvW6UUS3J3/In5bMAxkhbdybx
	O9Q+bq1MoJHr22z0TmWCTo8IRSStj/3bDSTi4Gym6gCsm0dOWzQapQ87C68JgNm0yAV4CnR4dDP
	Kb6/WCd0Pxn7bI2nMqc/IxbB91t75/i6/+bXTvMN4I/9G3xvQz3a02f6L0S5iFRt7DM9+O4g4wL
	42P6QRaFVoEhyjDX6rMmXOGq7/l3KkPkSDuq8EQVXBW01Cj6TrxEuU3fOHTwa0cKBc4X14xpRiL
	qhBWOGxY7oXMNeBQ18n9oS0BOsQ3oOUxwMRO
X-Google-Smtp-Source: AGHT+IHRKhpP3vzCADgRzmvW5BbtF22FP7gG7Gcfgimn7ZOifR3jME27ZrJCzM+Xqri+6sVXI0f8t3/Rxc2hYDVrt54=
X-Received: by 2002:a05:7022:6288:b0:119:e56c:189d with SMTP id
 a92af1059eb24-11b40f9ed09mr1186107c88.5.1763126557688; Fri, 14 Nov 2025
 05:22:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com> <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
 <aM0eAk12fWsr9ZnV@elver.google.com> <CANpmjNNoKiFEW2VfGM7rdak7O8__U3S+Esub9yM=9Tq=02d_ag@mail.gmail.com>
 <20251114043812.GC2566209@ax162>
In-Reply-To: <20251114043812.GC2566209@ax162>
From: Marco Elver <elver@google.com>
Date: Fri, 14 Nov 2025 14:22:01 +0100
X-Gm-Features: AWmQ_blyYEkItbzeXoq8SnAQp2jhwPLGdi6tZz7V3PtwgmJC3W4HiUeTEvac_zI
Message-ID: <CANpmjNPniOK9K6q2sx7KRrxckeAdCyVnTi4qwLqoFoYzYb7L2Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 05:38, Nathan Chancellor <nathan@kernel.org> wrote:
> On Thu, Nov 13, 2025 at 03:30:08PM +0100, Marco Elver wrote:
> > On Fri, 19 Sept 2025 at 11:10, Marco Elver <elver@google.com> wrote:
> > [..]
> > > I went with "context guard" to refer to the objects themselves, as that
> > > doesn't look too odd. It does match the concept of "guard" in
> > > <linux/cleanup.h>.
> > >
> > > See second attempt below.
> > [..]
> >
> > I finally got around baking this into a renamed series, that now calls
> > it "Context Analysis" - here's a preview:
> > https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=ctx-analysis/dev
> >
> > As for when we should give this v4 another try: I'm 50/50 on sending
> > this now vs. waiting for final Clang 22 to be released (~March 2026).
> >
> > Preferences?
>
> For the record, I can continue to upload clang snapshots for testing and
> validating this plus the sooner this hits a tree that goes into -next,
> the sooner the ClangBuiltLinux infrastructure can start testing it. I
> assume there will not need to be many compiler side fixes but if

I hope so ... Famous last words. ;-)

> __counted_by has shown us anything, it is that getting this stuff
> deployed and into the hands of people who want to use it is the only
> real way to find corner cases to address. No strong objection from me if
> you want to wait for clang-22 to actually be released though for more
> access.

Thanks, Nathan - having ClangBuiltLinux infra help test would be very helpful.
Unless I hear otherwise, I can send v4 next week for review - in case
of a v5 I will wait until ~March (as that coincides with Clang 22
release, and for lack of time on my end between Jan and March).
Could also skip the subsystem-enablement patches for now; only the
patches until the MAINTAINERS patch are the bare minimum, the rest can
be taken later by individual maintainers.

Thanks,
-- Marco

