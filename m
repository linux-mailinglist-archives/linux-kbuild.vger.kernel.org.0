Return-Path: <linux-kbuild+bounces-12744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBSxIPA32WkjnggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12744-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 19:48:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D89153DB2F5
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 19:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B03D301750A
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 17:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87003DBD5D;
	Fri, 10 Apr 2026 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gSQDBema"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59D3093C1
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843307; cv=pass; b=dzwsOAJxLsaD89Uc/TSvF5dF2+bmCkIxXCD9fTw/ayKDermlSuQoUXzHFyHtiSFXzB5OYt1ta4Csi6f8IupjebbmYytPl+qeYVk84LoCJNEUnfqzH34LawLK/oMaFRcU726JYHwD0ZWWgGEzCyo6NVqQNjWiwsUlxOSL/3TZOnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843307; c=relaxed/simple;
	bh=fP8aWal1X6Qsox11Ia6GNPWsn7HNwxIrcnSxBo1eXxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8isbOW5ZrmtzwwBaTPkAKBMxWMnh6v0iG876rZP86TzerGpVZOjnYw1e+w4vkjCt/juYin94jsHgYTrupWgBD9uFc4QQ6Nf0Wjc8fXoVGHlWQN9M5afCkCHZhPKJkIUi5k1E8WT8Dq3JU2Rs4WOFGUL28SracqmU/SGNRspQCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gSQDBema; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so668139241.1
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 10:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775843305; cv=none;
        d=google.com; s=arc-20240605;
        b=CdeKv9SLn1MH08J8L8AfrGtOpUZ5bnYnR46C9Ym0xRe3Bs4Tx5lHSR4QGKxzYeGmLj
         0tc78Rf2sA1WhCbRW6gECkR5D7C1ISMS9PJCZtm2jswvcw+WilWcybwZApwY9wZdCC+z
         Kp8fIfq+XFdi1jIzD5ZejDZdv2RASoFQVOat89sCHhsH31B+n0B1H6T6JfA6rzc9U86N
         UN5NRe88+SWdbAqofNU/vnk5e2YZml+89ufamXoosfKwdU1/pOYpsq7Rc+48soI1TC33
         uEzkXb+WBndOIyNTJVEsKsTL56JkeU9N4ir8/3+0OvP7cYOxJCXcJ7Obv4f5VxToBaqA
         jnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        fh=X7H4Q/jXkFVpRIZ6IEDxyDu9Re03jfG9qeooVpN/Go8=;
        b=c4bXL9Ackdwj5X3YSch2D11+rODP/g93NAjHuWiCzdM6m0Y3qAO5d5zxkEHHAMjYSq
         8+IlNr33LoI295Ol3gjqDmUL+IChn4rnu55hMcIM9hsQ05LikgIwlcqNmnrGWUx0sZH/
         998uxynSGaWg6mhktSXgrFH7pfqDa0y6HZ8MQce7bij2dtHH6BzhnhYLFBzmT+8ESW32
         Q5GruzizalZuNANCm5t7oXUqfuhL4/MOFpsJXLgDaCgBj2jIWi5kx1IPjjExN+5hfW6+
         FrhfNu1+fl0cBOhqWxkWVO+Y8jHAIQoP2GOy8GcNRDHkG/nVzV+evbLelYurOr2AjYBp
         UOBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775843305; x=1776448105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        b=gSQDBemaBCVuUAhLqAdtcC033WLVaTqXhhUHappsfe6OonnsPA7yp1uQmMHmVhBe2a
         2nt9DT+5/sSX7WwBAHuo9ICl0EstSMIMgeUPgX89Tk6yHm92trgWiK9dXxDj8N+818Wx
         5utmoj6/EC9kT0wzhmWOoVLGwSBQ8O+lkf9Fc1wqV7YY/LFfOBlvjfYblbiQdmkrKQeT
         br5P3wdF2Km3utxoh9CSpR7tXWe0AOEQ4yUnIy7rQafxKmIhJFFzXfgYZqYFxX44FySP
         ocQJbflhiS/n7FgV9vknSUAmp//xB1neCvPwFKx/e6t/APYZgGBLvtJ+jw6hP2nxn8h+
         Za/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775843305; x=1776448105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        b=CMTqb65XKyCjyy/gB2Xkqul22udTJ9MBEY0mZpnny8+/PbfTrpBwmJVib/MAnzfws+
         GJXIkYUF+By9S72UFpCoCJHu5BSdiu60gjpYdhRddw6VVgJHf6DcNxsHkLVbQsgX6Dek
         TywQnQh4VXIAg+aq7Jo9LSFl+OFEFuEkUa6Xc6z27WPEcYhkL4vkQoLxy6JF/RZ7H2a8
         PIxjZN+GdQu8v+kdtyxCmb8qEiEiW99stMd1qfEN5bNAhnfJdGQEFTszfiodCq1a+kYd
         yvi2nqGHEzGPZjB3ZckaLtRBpqiagkV+0DhyCaYyNvVzIIhFum6zo89X3dlNLiXrbR9f
         xrwA==
X-Forwarded-Encrypted: i=1; AJvYcCWfi9pnHQ0MdqCL8l9dbg6H5XFXiY5ESohlHIQy2dadc0JtZ9DD7s75h83K5ZTN4qKhvL6CY20QaGqLkhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNr+IwqzZWSDm3wsJjR2LmVf/4nqn8V3klORaE4DnN1RWDiNfT
	UYeATB/HvYqyEvmov9nqSALKUxZlOzVzkzz4cl7xz1DpajI43ck5bgcGpV8q6MMrEfeX3mLgw52
	LVWyvwNClMmsGEFzFH4z3OB5p1fhjJgc6obeTP+Di
X-Gm-Gg: AeBDiesoEVesehi43NAlEp4YRy9uZ5CaTORP12FDZ43zsq5JtWqK9fABu/hCj+Pov4H
	pgUl18C2lEKHWZ1PWnZrukopvxLrbwFbiBv7utHw8JxfKfaQJShAvTGuWXyELKS7s1Md7mj32os
	/IOHzaqGuD0YEUIg6xUY0I4+xQRWNxmb+NFaBEc0+xzKZjGHFM6ZWGPJAAFtRFGT/lXsSpesVVQ
	lFbSXBjqrzErzMu82iWhDIxdU5s1eMrwIyW6NJ17dn60ZFoVeOs9EVQ6pbckW2HcrDGg7LAAwfT
	FD+Oq/4ZzpJNgcTQYQ==
X-Received: by 2002:a67:e7c1:0:b0:607:7991:f02e with SMTP id
 ada2fe7eead31-60a0125a157mr1913972137.26.1775843305006; Fri, 10 Apr 2026
 10:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <20260401083137.GT3738786@noisy.programming.kicks-ass.net>
 <202604011328.D3821379@keescook> <20260402053840.GD3254421@noisy.programming.kicks-ass.net>
In-Reply-To: <20260402053840.GD3254421@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 10 Apr 2026 10:48:13 -0700
X-Gm-Features: AQROBzBa6VKBq4ACJ1_R_EdvKeRsco9AeWVrSeipdWQAbkoYS53l26rCnLm5lXU
Message-ID: <CAFhGd8q_avLPfOsFkOd52eVJ7A50eKZ0HJo8ehqhG9P-s7P4-A@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
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
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12744-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D89153DB2F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Apr 1, 2026 at 10:38=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Apr 01, 2026 at 01:52:26PM -0700, Kees Cook wrote:
>
> > (Though I would note that GCC does _not_ refuse the jump when there is =
a
> > cleanup; it only see the other two uninitialized values.)
>
> Yeah.. I know, but since we also build with clang, any such issue will
> get discovered.
>
> > So that makes it not totally broken, but it does make it a bit fragile.
>
> Right.
>
> > Another concern I have is dealing with older compilers and how to
> > "hide" the label and its code. e.g. if I remove the "goto" from above:
> >
> > ../drivers/misc/lkdtm/bugs.c:1060:1: warning: label 'weird' defined but=
 not used [-Wunused-label]
> >  1060 | weird:
> >       | ^~~~~
> >
> > Oddly, the unreachable code isn't a problem, so we could just wrap the
> > label is some macro like:
> >
> > #define force_label(x) if (0) goto x; x
> >
> > force_label(weird):
> >         pr_info("value: %lu\n", value);
> >         pr_info("outcome: %zu\n", outcome);
> >
>
> __maybe_unused also works on labels. Like:
>
> __overflow: __maybe_unused
>         dead-code-here;
>
>

Completing the loop: Here's the Clang RFC discussing obt label handler
design [1]

[1]: https://discourse.llvm.org/t/rfc-linux-kernel-discusses-overflowbehavi=
ortypes/90486

Jusin

