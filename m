Return-Path: <linux-kbuild+bounces-8909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9EB872FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 23:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BAB07E408A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 21:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED362FD7A5;
	Thu, 18 Sep 2025 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JbdVj/f0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D29E2EFD81
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 21:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758232487; cv=none; b=Gf1p/StsXIaakDFcmOOGlCucJZ6qU5B8VyZ6X8OY9jZ+KeH7m/ZoT+SW1bkOMXb2HmKJi2bnu3Cz+vQKAXMDR8TZfXSMlwD8lDC7XRXsz9kTRS1dRjZTta9RK8VLYBJ+qkDinh1IOatiIFT0UIczq5hMdV/WAXoJ0NHufgMphrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758232487; c=relaxed/simple;
	bh=OBdCMGeWv7G/tkOmZiDbcUQKLH/CnWF06gVEbnVu89c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kd8XU1HAixNvMs27JB8wErr4IWMsmuCwx8MPlNpwcnF95EPxlPcxBYxe5xu9cjk/V8lwlt4H5pkRUBb3NzEk4pbBOEkkTJatDjLByysF8TEluuoQgpqTiRo303atqYQz7jp7oE9w6AtGdfZHiHOkMNmZmRN3Lm8VwsxlzBtJT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JbdVj/f0; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-34fed7add35so10243121fa.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758232483; x=1758837283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mLiszfQw8YctXWgw7Rv1CzeIAYsEhv/enJDimwborHo=;
        b=JbdVj/f0Nd5bsU5JGQiH+GXwQhtWmWfxPzEkCHeWYyDhE6al2UhJt4nVtAe9PIvRDW
         Hr188Ou+hsja7j5RMEPbIDvzUrYiLNbKgytjKLPU4HMPJwpYDs135KiEHoyzsBp2eNIA
         6Ig3YVM6eFJ231jGUMtK7ntuWX0XKfkTdypkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758232483; x=1758837283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLiszfQw8YctXWgw7Rv1CzeIAYsEhv/enJDimwborHo=;
        b=Npmz1+QjwmU1WVkqhV5luCw+tZtETC/DW8rK7zsr6rs/IjGBQwqao9CMzrX94Lih8f
         FszxYgH9+2SzKhyI4H9eDGP+WE+20ExP6zjNc1ZnSHw8d1KRfpM2d1jrNxp9plNjEkf3
         kSuQDsEjoYH8lKJze1MqIIt5BlexiBhOUBCn3dTT/KeWjMUaLt/w3b5N59k7EVu9dp6M
         B0Ls/mZUWPneXB4hnjK2uIAKzsifwy3/AY784C5r6KGQGq9aRvu1i/KfSpmT3dNMd9M2
         s5MddsK40EO6q6C6tt04SdpO2OTmVqBi1jmDtlQKzrjebNL9JB1VTJoQx/TS+rNxJj77
         uf1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9Wp3SUhBrwX9i6pn95MwFOUL41lvLkweh9deSwyPt168VxmIZpGYEDubpanrDdqv8lpGdno5EeSIXn8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdRBtouukQN+nHTqygyd3tXz9eS6LK8tGfFu8N5W2qNtgb1C35
	b4Go4047IJg2FB89ZSHm9k0odtCMujsgA22dgF9LdCyJydMrq7wArcqq/Sb1zaR+qCaWwIrkNFg
	WSVCMLpnqxw==
X-Gm-Gg: ASbGncsBz+XjtyH5xR/mLooczwi0C0/t0BSkXYcGk5+XQcwqWj0Ch/U2JZ6LmpkSL8C
	50sxVKELAad2CayciwjCQgQPS9uVTbxxf8DMa1vWTwW/hMVkWYC8oxvLZ82ZcFfSigJcbMMpr1J
	KiJ1ln+T10hSIgvhqga+5MRPfglR5qoy6g82z1jHsyi2pgKrHegmgrFFFGEZqfvpVZc/tn2a6cN
	bClm/vOebsyUUPGdBRzqSAV+kkS7gNmCE/j8sT9tmhfEZH+yUn3icPE7Kx1qSgNnkk/9YGNK6ue
	MCIT4rT6MzMhoTIX1ezmbtudLTWHaL/mniG5LxswQPTufPxR0EGtCnMJI9+Ka057FhkjrwS8RdO
	HfRn8RMZAybii0x4+EhEFDbnQRqFYCA/PXxHpKtp9IoaPcjOE8cTsOxOdp5VO4uMGWu5IPrg0Wn
	pR4l6zFHx1n9cOGuLgFqk=
X-Google-Smtp-Source: AGHT+IEhWQg7CrwRRhvwb8Pq+ctD6JMlCsgQOgrAi4ZwDWm/MKK4IZrSxpfHEFFelvLx6TlRK8DTxA==
X-Received: by 2002:a05:651c:20cb:10b0:345:fcf9:821a with SMTP id 38308e7fff4ca-3641abd2ab4mr2446691fa.29.1758232483432;
        Thu, 18 Sep 2025 14:54:43 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a27c028bsm8896411fa.20.2025.09.18.14.54.42
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 14:54:43 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3635bd94dadso7240031fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:54:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9P1hODzdllfwkLoffb3b0flLpJ9gscHp7+2jc1XtMxxSVBID4Z6PKsPfBHNm8iJv8p+b9gg0RZK3jdb0=@vger.kernel.org
X-Received: by 2002:a17:906:dc89:b0:b0f:a22a:4c30 with SMTP id
 a640c23a62f3a-b24f5685fdemr62738866b.47.1758232077501; Thu, 18 Sep 2025
 14:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com>
In-Reply-To: <aMx4-B_WAtX2aiKx@elver.google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Sep 2025 14:47:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
X-Gm-Features: AS18NWBxHuMwwtU-EoNbPFA3uJ1YRJkAKqdurj12n-PWNJgH6ecKwZ8QZrX3P28
Message-ID: <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
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

On Thu, 18 Sept 2025 at 14:26, Marco Elver <elver@google.com> wrote:
>
> Fair points. "Context Analysis" makes sense, but it makes the thing
> (e.g. lock) used to establish that context a little awkward to refer to
> -- see half-baked attempt at reworking the documentation below.

Yeah, I agree that some of that reads more than a bit oddly.

I wonder if we could talk about "context analysis", but then when
discussing what is *held* for a particular context, call that a
"context token" or something like that?

But I don't mind your "Context guard" notion either. I'm not loving
it, but it's not offensive to me either.

Then the language would be feel fairly straightforward,

Eg:

> +Context analysis is a way to specify permissibility of operations to depend on
> +contexts being held (or not held).

That "contexts being held" sounds odd, but talking about "context
markers", or "context tokens" would seem natural.

An alternative would be to not talk about markers / tokens / guards at
all, but simply about a context being *active*.

IOW, instead of wording it like this:

> +The set of contexts that are actually held by a given thread at a given point
> +in program execution is a run-time concept.

that talks about "being held", you could just state it in the sense of
the "set of contexts being active", and that immediately reads fairly
naturally, doesn't it?

Because a context is a *state* you are in, it's not something you hold on to.

The tokens - or whatever - would be only some internal implementation
detail of how the compiler keeps track of which state is active, not
the conceptual idea itself.

So you name states, and you have functions to mark those context
states as being entered or exited, but you don't really even have to
talk about "holding" anything.

No?

               Linus

