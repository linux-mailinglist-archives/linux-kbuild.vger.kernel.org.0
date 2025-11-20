Return-Path: <linux-kbuild+bounces-9735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3238BC75E64
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 19:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6DBF4E01FF
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 18:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4785B2FE57B;
	Thu, 20 Nov 2025 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a2g51QKn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3202FB99A
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763662837; cv=none; b=TqhDV+1cCpj9TcO5pPN7w57azWHS5B4kGfee4WrcIDvFTZk0gAmcRT98mcudmdba1ftftFQT2njuYDLu644dRyOlWsDkAd8QblUlI1w4f9Ltm7o4RsHTfBh/auRdehhqrAz7O1xwpViqd0jL4o3nshtHxjqUjyAsQbTyyGV0+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763662837; c=relaxed/simple;
	bh=wecZEUleM2pVH/ldG6VyoxAP3Tx+t9JIJBh2fst1eeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtAC8Ct4vtkTZ72BCoJBm19q+izWvmJdQdRfWe95uOBfrYRQffAcjTQXvUM18KKBuN+s/WYpcE6KLONmhwQlNvUUPoUPkS4y8KUIXf73KqCuTRVotgUPcbsP5dPIuBihCjGUSzr/+Fpvgqq49mQZ239nZCI7iBilyEGZMzQupYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a2g51QKn; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5958931c9c7so1335237e87.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763662833; x=1764267633; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BPfdnrOHpw/8tC+sL0oorkp9gKYtrunKdRWYzTn+GA=;
        b=a2g51QKnKLwD5Y693naFzmvyxujMcAUy9SzI+1Rv9YWTFm9HrVJdyEeKKPeyulfHUf
         LTAke3RFTnhdZ5llwPY7fn1eYFUEIECv9bPt6yQQWfoRQ7Rls1pAGOC1w4Me+C0xJCWG
         eOlHqshHfmr4CFND/d3TkDtCkWc9JQvq0lLnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763662833; x=1764267633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BPfdnrOHpw/8tC+sL0oorkp9gKYtrunKdRWYzTn+GA=;
        b=B6nuH3k+yNWZx9frVggnSv0B5oHpNSHXU4YSA+bARlu+b5cTPuK+C15lgyJAchaKPi
         qm3WtzDR4N7R4UZT4QfQUnyVYAuO5Om0QvyN3gieL9Lxo0PCPO9ELbuUaLWiL8grE8NO
         l8GLrJDmy5fWfbI6S/HJJDIYzEhn9TyB9IvzU3I18ZFKyzB0eKP7CL2DGU2SsyIna2kh
         peEwwqzPOgMtmJXehVm4bJRE9/UBq+IXDcjmnn8zQfEMo8CzCZ/0fZSCHzFdq5W6JY2m
         tkWLAXlNOniWQ7mag1P+lgD9yok5l/JiMfa4UsNZkrpN3bSMs/x43ByP298mRQFV/ImS
         gVeA==
X-Forwarded-Encrypted: i=1; AJvYcCV0hbTcfGK/Ys/sEa0DCIJ6fvBsRGnu9kAay54OBOLMCYbEU9xII2+IXcIJshoKiPohqzjttrXtADjxsWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGDWWCfmWN+I232bT7Cfz/aKxvp/YxcebkA3NJpo3ICFhAH/t
	adDbo9QxL0kVsG0hw8t5a1/ICwTKLCAPFBLy9myy2aABuKx5kblP60Yo8OBoLt1DYs7nABw2I8G
	EWIDtSlamiA==
X-Gm-Gg: ASbGncvIPO6evXms9UGQrrApy+lSi7cRC9kaGy6rFC7u6RwqUniKilAjr+qiD4++QMQ
	iwez1GV0Ry4zG3QxErcNQrMN7xbXGm4dRtu5n0mN+wtxFtQOrAStR9wJJ2mYf2l4C/WFRUvh6SL
	CDhALA86fG6f9SDVhjyzRg6d2LG8WuJemK4e5niAFb1WEMLgYVlBR3rv4R91m/EoLzDGLs+Ox0c
	qd5P6iLViOzXMCkrtS2oJ/SdzKk46rAySurgqp8u44HwMSGyxMpqxn9u7rRfLxbZrTDHqFvGBD8
	gsuTxGMknFRBE6wac9Hq6PWv6OTmv+58ScDCSF9AbXVrkv+CtzqGeUbkJUPZ7iQymp3mL+ByI85
	KI9pCV7NqwV/633kW6ntBP7uDShmNqhotaseeCs9L4kmYJzw6K2XSTRjdLGuE4uTvJVpH6ENIi9
	3BTzzUmzsihfemgGlIlSkp+y29MIOTVqg9dChHu+c8BYatJMq5+NpF7ekebavM3Mpx
X-Google-Smtp-Source: AGHT+IGxsyQu459D+nw5q+60ac5TGPOtmQqvpNMazZN4mAzUjxX0mQR7m7innLCa+lsIB/QjulL4Cw==
X-Received: by 2002:a05:6512:6d3:b0:595:91dc:72a1 with SMTP id 2adb3069b0e04-5969e2ae995mr1420235e87.3.1763662832802;
        Thu, 20 Nov 2025 10:20:32 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75677sm904283e87.19.2025.11.20.10.20.31
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 10:20:32 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a875e3418so7618361fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 10:20:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFaqv6+8UKT1QeAhTERTkif8Q7yPoubkEpDW4WqVn94hzW5q47vRf4441adlRK5KfNB93Gzlay+TN7gZo=@vger.kernel.org
X-Received: by 2002:a17:907:7f0a:b0:b70:b71a:a5ae with SMTP id
 a640c23a62f3a-b7654fe9b97mr482177966b.44.1763662490181; Thu, 20 Nov 2025
 10:14:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120145835.3833031-4-elver@google.com>
In-Reply-To: <20251120145835.3833031-4-elver@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Nov 2025 10:14:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=whyKteNtcLON-gScv6tu8ssvKWdNw-k371ufDrjOv374g@mail.gmail.com>
X-Gm-Features: AWmQ_bk-my8wSL6P8yRhTUREdDraem8VrQQmjD7uS2S9oN6T2mRX46ftlS1ytQU
Message-ID: <CAHk-=whyKteNtcLON-gScv6tu8ssvKWdNw-k371ufDrjOv374g@mail.gmail.com>
Subject: Re: [PATCH v4 02/35] compiler-context-analysis: Add infrastructure
 for Context Analysis with Clang
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Nov 2025 at 07:13, Marco Elver <elver@google.com> wrote:
>
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -6,27 +6,465 @@
>  #ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>  #define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>
> +#if defined(WARN_CONTEXT_ANALYSIS)

Note the 400+ added lines to this header...

And then note how the header gets used:

> +++ b/scripts/Makefile.context-analysis
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +context-analysis-cflags := -DWARN_CONTEXT_ANALYSIS             \
> +       -fexperimental-late-parse-attributes -Wthread-safety    \
> +       -Wthread-safety-pointer -Wthread-safety-beta
> +
> +export CFLAGS_CONTEXT_ANALYSIS := $(context-analysis-cflags)

Please let's *not* do it this way, where the header contents basically
get enabled or not based on a compiler flag, but then everybody
includes this 400+ line file whether they need it or not.

Can we please just make the header file *itself* not have any
conditionals, and what happens is that the header file is included (or
not) using a pattern something like

   -include $(srctree)/include/linux/$(context-analysis-header)

instead.

IOW, we'd have three different header files entirely: the "no context
analysis", the "sparse" and the "clang context analysis" header, and
instead of having a "-DWARN_CONTEXT_ANALYSIS" define, we'd just
include the appropriate header automatically.

We already use that "-include" pattern for <linux/kconfig.h> and
<linux/compiler-version.h>. It's probably what we should have done for
<linux/compiler.h> and friends too.

The reason I react to things like this is that I've actually seen just
the parsing of header files being a surprisingly big cost in build
times. People think that optimizations are expensive, and yes, some of
them really are, but when a lot of the code we parse is never actually
*used*, but just hangs out in header files that gets included by
everybody, the parsing overhead tends to be noticeable. There's a
reason why most C compilers end up integrating the C pre-processor: it
avoids parsing and tokenizing things multiple times.

The other reason is that I often use "git grep" for looking up
definitions of things, and when there are multiple definitions of the
same thing, I actually find it much more informative when they are in
two different files than when I see two different definitions (or
declarations) in the same file and then I have to go look at what the
#ifdef condition is. In contrast, when it's something where there are
per-architecture definitions, you *see* that, because the grep results
come from different header files.

I dunno. This is not a huge deal, but I do think that it would seem to
be much simpler and more straightforward to treat this as a kind of "N
different baseline header files" than as "include this one header file
in everything, and then we'll have #ifdef's for the configuration".

Particularly when that config is not even a global config, but a per-file one.

Hmm? Maybe there's some reason why this suggestion is very
inconvenient, but please at least consider it.

              Linus

