Return-Path: <linux-kbuild+bounces-12459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BLKIFhezGmDSgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12459-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 01:52:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC827372EE4
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 01:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44BFD3024968
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE79311958;
	Tue, 31 Mar 2026 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I2vywGjx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D00274650
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 23:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775001041; cv=none; b=GgNHKAhI4RE1NF0dNVsypLD8Um4lAVdYOxYIKOG9L7KUspqEnPRHbu1hN3kjjvIeS6VGusYR5PeFNjy1AFlbDQyolhP8u0rXI8gAV6/I9x4RRRrSsYs3xvdNZH0L+7t6bzMiH5VAWQ5a5uqheAfhtEU9EutzaITATSRGtnCSFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775001041; c=relaxed/simple;
	bh=hi1MFskNb8DMYSQRnhoouww2qda97qGJwbTEd7MQFUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJJxvt70hmGrMGMtjywJOoaWsW+Ph3skD07c/nhGEEm+Uw7p0ymqFvoXFzJykpOtgFE4gDzNqPrusT0DgXrlMYsWzPkdD/DH/kjB8Aq5XNzYxn9NfsFlSZBn9QoO7BzJQmQK7wU4ipS1CS1uvrKx3unp63/6x8Ioy6xMyPUWvI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I2vywGjx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so11827844a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 16:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1775001038; x=1775605838; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap740lhReTUh/Tx7odelrkvzzjajL/UYRtgEhV3gotU=;
        b=I2vywGjxfIXTP4hbycDV9Xrgv4kOejtZuRoDpBrLsDCpuRYycoKudnQ2Vy6Qifu/hv
         cLV25lOY4im97CYGgxW6do6IAs0TCEYV1TrtVdyp287yymy+iioTjsnvT8oeuMojwtV2
         S7S8M+oL9vPmwXmvCzfshDpaABAzMckhVdP6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775001038; x=1775605838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap740lhReTUh/Tx7odelrkvzzjajL/UYRtgEhV3gotU=;
        b=bjdmfoX9bmOXzrs1OnjrdAEHvjAn3ylOnMa1v1s634uusPkDZxi3FGePOUtLfiMxjH
         m5qgDskKeFqRyuL3rbk3rbJcxb7y0+XLdUgvouq0tNgy6ZUvTDs4UgAA/VB/ysi3y7Y4
         3KRMzJAFn82g13/p3iTyuUwGmSwfBrTCFqfgYr5GGLNhhIN2btIABXLiaYyVX/e2a8yb
         6YzMPQsDhP0bst//di0IKKXce69o5/I4f6kyeCDSW40nEQ3R1rLR2vEUncyERQbF2adN
         YIDcGPzhHCk+F/BMwqke6O5ionRzPkATVUwp32f6rnag8ItR6TVQOmIvUzLBEPwqQSJP
         bzfw==
X-Forwarded-Encrypted: i=1; AJvYcCXAtbia+6T2vuIQb1dzk5SJ6tJy1+CawNTHYvjzIIGUtjaaj/Vr67YWThHkUlny5icClWfBTv/hdVazPKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4rqH4m82b4LuYfy6wh6PCa6DPjWimv9itDulrgNzJ+buJJafA
	odEcwNJDzb6MAUULB+9ojkJGYfOV/GucezQ/fzyRplHjOderNBdM9ZIJaW9jG85/d4yd97Jnkv3
	94C+GChpoUA==
X-Gm-Gg: ATEYQzz99CZJ4LG192WYhMPRJcJM6J61iaw9NlYWjmOUv9UZYq1IvQEQi9iGgMt3nk5
	+L5brRVXIAjuOmouSIRGwiSi5NH8/mlwtZVpswPl7mOob24FeAe21PJm4Jh6Jf5kOSIUXogUmR1
	8nHKdnzVp/eurg16MwQOQj1YkRHO4WigLua80AgtbdyeZ1Izi0Hgl6abM0qwT11kdV31W5f6/2C
	taXQKB8xxa//Orw36gzg6qxkMLGjMKAiKeVF0sWI8uWMDHOQrQKITX+rKZTElMb6B2R85xBLLr2
	+wCxuLhv3uM9XagYTH/yPwsblj2RqNAOvASExrXqOOnWdbULRWQ3/8E1SEpFPkAKvJapiJLwFmq
	D0s4SZWCj2/pwK9snefnuTF/4YyU+ubspTwx9w4t9+z1KUl2En9jCzD9G5w7vB0m3x+0C+MXQpI
	x3YGYlQply3AxfMjdfiBpHX7ONyKlK9SF8ovaxzKYaBPJU1uurjUh0FAI2FVrxOTqcLir+eBvaQ
	/p9fKKnXN4=
X-Received: by 2002:a17:906:45a:b0:b97:cdcb:a296 with SMTP id a640c23a62f3a-b9c138c5632mr72398166b.19.1775001038158;
        Tue, 31 Mar 2026 16:50:38 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c1cabe8d3sm16962766b.2.2026.03.31.16.50.38
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 16:50:38 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so11827825a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 16:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUtR9WxWEvF/7fMTXC5irWdIgqo0SwClCoLSISXJPLwBFxKkC4knJ3fnOnJJLYoDGNo7/bLbqVrJ0JqwM=@vger.kernel.org
X-Received: by 2002:a05:6402:13cd:b0:66b:810f:1c4d with SMTP id
 4fb4d7f45d1cf-66db09f03d1mr893296a12.18.1775001037895; Tue, 31 Mar 2026
 16:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
 <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
In-Reply-To: <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 16:50:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4j9-=VMdVJZQjn=FEDWpE5JkHtr3CwErQdXVGFfGkXQ@mail.gmail.com>
X-Gm-Features: AQROBzCocASEQv-3sgFpeT7hRsHg1wWGTjTvooh3XWVShxy7lX1Q_VH65yuwsXg
Message-ID: <CAHk-=wj4j9-=VMdVJZQjn=FEDWpE5JkHtr3CwErQdXVGFfGkXQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12459-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DC827372EE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 14:50, Justin Stitt <justinstitt@google.com> wrote:
>
> How do we feel about type-defined labels? We can specify sane default
> handlers where we define the types:
>
>         typedef int __attribute__((overflow_behavior(trap, __handle_me)));
>
> ... and define specialized handlers later on

That sounds like an interesting interface, but I think it ends up
being kind of odd, because normally the type definition would be in
some global scope, while the 'handler' would be a local label name.

I think that in some situations - and certainly other projects - it
would make a lot of sense to have the trap handler be a global
function in that situation (ie "abort"), but with that being
explicitly *not* what the kernel would want, it seems a bit odd to
specify the name of a label that then is used in a totally different
context.

So in your example:

> int func()
> {
>         ...
>         u8 __attribute__((overflow_behavior(trap, __BOOOOM))) product = 5;
>         ...
>         product = a * b; // if store is truncated, goto __overflow
>         ...
>         return product;
>
> __BOOOOM:
>         pr_info("%u\n", product); // shows "5"
>         return -1;
> }

The above makes total sense, but imagine instead the code being
something more like this:

Some header file does this:

  typedef unsigned int __attribute__((overflow_behavior(trap,
__BOOOOM))) u32_overflow_t;

  struct some_random_struct {
        u32_overflow_t usage_count;
        ...
  };

The implementation for looking up those structs then looks something like this:

  struct some_random_struct *get_entry(int hashval)
  {
        struct some_random_struct *n;
        spin_lock(&hashlock);
        n = find_entry(hashval);
        if (n)
                n->usage_count++;
        spin_unlock(&hashlock);
        return n;

  __BOOOOM:
        WARN_ON_ONCE("Entry 'n' overflowed\n", n->name);
        spin_unlock(&hashlock);
        return NULL;
   }

does that still make sense?

Now, I'm not *opposed* to this kind of interface - we'd presumably
just use something like "overflow" for the label name anyway - and it
allows people to use whatever label names make sense for a project so
it's clearly a nice feature.

It just feels a bit odd. But maybe it makes perfect sense at a
compiler level as a "it's just declaring the token to be used for the
exception label".

                Linus

