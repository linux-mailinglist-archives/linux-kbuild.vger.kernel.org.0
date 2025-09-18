Return-Path: <linux-kbuild+bounces-8896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C0EB85CA5
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 17:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4043C563F18
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 15:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC14A313D55;
	Thu, 18 Sep 2025 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MFxU2itf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72F3101B8
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210610; cv=none; b=XG1ov+Ds+ifD9XJpzqGghFB43THrn4J12nfsZjdxKcsqxRqjkCi2akx7wlAAkcCsTNDso+GoE2gRTp1McNa0av6SHTEboXX9BLRFZ9FBOgvAMCbQONVJqaPBBn44b5O7mtbGvpm6SSqz6spkX2rYLpa1o0BxFYywIs7p1tqmT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210610; c=relaxed/simple;
	bh=XhR1h2E8azi9+Iqslf03I/SakVc5s2CaBmw/N8HkwwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAarjinWOh2yIM8G40nOa3lyc6RQLorDfTkXakS3I8YL4XYivDAUKZa8TPFccuS+E5t876LGdQThQsuTjHjWnhot5f3nT3w3oqPwVos+KBiAcqE6IqPwdRjIGA5iJEaClgVeiBG5c3KCGXvxNrp0EmFLZhaxmc+luyBefuQK2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MFxU2itf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62f1eb1abb9so1845296a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758210606; x=1758815406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpKO6CsQCuex3g+QZ22KGPC+ZgcKRmVKS1THDCqCkXc=;
        b=MFxU2itfDb9JgjaOZoPi8B3FhYptVXnUjKahXZuRY5m3GSlSsDgbgEmMpf8UUV4pKn
         p7MG+U5a6fZJLoVR1bI+BlBGg5GqtowP4Ht1FEmUS851Xo6Qe7x/5j18dIbbNXXY3wJ0
         HehDDQETJ+rsldjKcAiuBDq5HHjU6dmKzMpz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210606; x=1758815406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpKO6CsQCuex3g+QZ22KGPC+ZgcKRmVKS1THDCqCkXc=;
        b=cwQjLPonZ0lsfh0+kZwIFj/2qjaHmmwpncbeT0VDsTOof5wD9YsZ8xVFmJwUqe+Y/Y
         GnwSyyqcw+boMeHYGVfagE8aTB6VnOIorrE8gvBeA0wBswfGjB1e/Bgs4Mw9Z31iZhco
         wbCfudUYkCo8W7MQQdFTjUfwv4YMf0UVxkqvINqtIAyhJkQH576xSrdU+fWtPrdkGZJB
         Kis1TIlB0scmkafyLerBTUeIud8irbwr51DvCTaVZEIJAYNayDlK/Mh/peqE3WbJrMTo
         3oAuX44UG/6mNWNr07qr9PuW/GTNSyo4To7OpnCsWYvY/Le03euLOYfyadqH4CJcCahp
         2ZpA==
X-Forwarded-Encrypted: i=1; AJvYcCUgyCb9co9lL6Ji76NoI7x3H/v13kXDHCI2Py2M16en55LALKreaUCUKz25z/gaaraOjxpdFiXF0CxB/hY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/9O/Df/VyNdTfWZeqBPnYq01I8Ls/VwJH8J+q6bCCDyx9l+e2
	OR2Mc9f2sQvl5Gf3kq1bR1VeaeHDt4UN1hcczubQ1pjwhPHR/EVRmv1R7rFTTGsDBfrO/le9xQJ
	KFjOV
X-Gm-Gg: ASbGnct+lQuxACIvfqAAFSdvMA+9RA2s+/HfRw9nBePEY45p0cxYpPgYHO4Pe8g8Uek
	DnPW+ruAK893VGGO0gNUbwlCTCHkflBITOJPEbhH45MwdNfvtg1lH3obViFRtTrsb7l1gFxnwRK
	cu5QJ0a/72e1SDxjsSKMtkRaCgmXLM1mUKOdt5sgD7ZE8AasU82iX7A+TtfS6cII94qQ5GXPO40
	nDCLEQeD5GxiUQBYUxpEiIM+Pr+a6GYU+VSCDjfstMC4eOaSbpdFWelXW5mb6qqoSIvStbTkk8s
	kAsim+iINo7Mjh2iBJJWkHniMvcnZ5+gKdSger0mOjKGN06BgrCbXdY2dchox37BodZGsIXEA1y
	Yqlt2KI0VGMDiCzR2fvqHJx42VqoumH3CLyJyVxim7zmD02ztft92b5t+0HAUBIoTWsi8O7ttVF
	D1LUOampy8RVhi3zg=
X-Google-Smtp-Source: AGHT+IFII9h6Goj1+IQmbC6ew1UTw1xOC4ycr6EiqmkVtxOJncQOjr/lzt5eIGxLnKdGjhBTAhFqww==
X-Received: by 2002:a05:6402:20cc:10b0:62f:4d23:2e2b with SMTP id 4fb4d7f45d1cf-62fa2155c74mr3090507a12.6.1758210606262;
        Thu, 18 Sep 2025 08:50:06 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d0f397sm1644938a12.12.2025.09.18.08.50.02
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:50:03 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b07e3a77b72so319421766b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 08:50:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUOfkREPwJ9JCy0cNmX8oS5n5Jg/fyvjJ9YRhu1xRs3iGSYCEefI2cABLbU8jRq9AFXzSURzKKlSGryzg=@vger.kernel.org
X-Received: by 2002:a17:907:9612:b0:b10:ecc6:5d8d with SMTP id
 a640c23a62f3a-b1fac9c9b84mr417765966b.26.1758210601571; Thu, 18 Sep 2025
 08:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Sep 2025 08:49:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
X-Gm-Features: AS18NWBk4u9ObN57KesSGhJyt-aPlWZgKdxYhvzpAyoaxlNUF53WHe4dSKjzUBg
Message-ID: <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
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
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 07:05, Marco Elver <elver@google.com> wrote:
>
> Capability analysis is a C language extension, which enables statically
> checking that user-definable "capabilities" are acquired and released where
> required. An obvious application is lock-safety checking for the kernel's
> various synchronization primitives (each of which represents a "capability"),
> and checking that locking rules are not violated.
>
> Clang originally called the feature "Thread Safety Analysis" [1],

So this looks really interesting, but I absolutely *hate* the new
"capability" name.

We have existing and traditional - and very very different - meaning
of "capabilities" in the kernel, and having this thing called
"capability" is just wrong. Particularly as it then talks about
"acquiring capabilities" - which is *EXACTLY* what our lon-existing
capabilities are all about, but are something entirely and totally
different.

So please - call it something else. Even if clang then calls it
'capability analysis", within the context of a kernel, please ignore
that, and call it something that makes more sense (I don't think
"capabilities" make sense even in the context of clang, but hey,
that's _their_ choice - but we should not then take that bad choice
and run with it).

Sparse called it "context analysis", and while the "analysis" part is
debatable - sparse never did much anything clever enough to merit
calling it analysis - at least the "context" part of the name is I
think somewhat sane.

Because it's about making decisions based on the context the code runs in.

But I'm certainly not married to the "context" name either. I'd still
claim it makes more sense than "capability", but the real problem with
"capability" isn't that it doesn't make sense, it's that we already
*HAVE* that as a concept, and old and traditional use is important.

But we do use the word "context" in this context quite widely even
outside of the sparse usage, ie that's what we say when we talk about
things like locking and RCU (ie we talk about running in "process
context", or about "interrupt context" etc). That's obviously where
the sparse naming comes from - it's not like sparse made that up.

So I'm really happy to see compilers start exposing these kinds of
interfaces, and the patches look sane apart from the absolutely
horrible and unacceptable name. Really - there is no way in hell we
can call this "capability" in a kernel context.

I'd suggest just doing a search-and-replace of 's/capability/context/'
and it would already make things a ton better. But maybe there are
better names for this still?

I mean, even apart from the fact that we have an existing meaning for
"capability", just look at the documentation patch, and read the first
sentence:

  Capability analysis is a C language extension, which enables statically
  checking that user-definable "capabilities" are acquired and released where
  required.

and just from a plain English language standpoint, the word
"capability" makes zero sense. I think you even realized that, in that
you put that word in quotes, because it's _so_ nonsensical.

And if not "context", maybe some other word? But really, absolutely
*not* "capability". Because that's just crazy talk.

Please? Because other than this naming issue, I think this really is a
good idea.

           Linus

