Return-Path: <linux-kbuild+bounces-13163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJBxC29UBmqnigIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13163-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 01:02:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB70547A2C
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 01:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0978301D690
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 23:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE94D3890E1;
	Thu, 14 May 2026 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hyh28DYq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7938D68F
	for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2026 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778799722; cv=pass; b=l07jESC/LXWiLpunrqwmSxvsv9iHwipFgN7bun5Ni86WTZZrkSkIL6zpXqf76+ihokOLflfc1LfRYtEb7bAYoFKZgpGdHyuzFc5+dOVVyrQEvpabgwiSGmen8eKRBtl+gHvA26mtXQF8LONt65yLugsrW9gokcuL38tlTM+ymqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778799722; c=relaxed/simple;
	bh=7QFhaA6pSrhwd4uOqqlwxlj6dluPgywqjbPxOzXuY54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1nqRzalHPPD7l1ht73vchY9NS0quLb+JeevXYvZMhbQw9bsd07u8skKf9euj+oJySIet8cnltlBkO2ZH+Lza691Zf08eLMcnD0eXRD827yGPHDxmOwX7WJFGORA3DmHbfmoZCyM7fKmrvVIv5av+X0SpATs4kE6iFINH4wChnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hyh28DYq; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1330d6bb78dso5394025c88.1
        for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2026 16:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778799720; cv=none;
        d=google.com; s=arc-20240605;
        b=JxeUzUAuFjXAeIrJc+z31tPnPjm5vGdwl2rf5OoV2z8LmyYBBBEoc85gu4UtR4HPtb
         AEorc6eNz9XpzhuuCtMCzAXEGrg1zGkDmM0FR0F1i7D7lDB10TBUB8Q5GXFbXEf/6ZOv
         JiKP46yBrTmmfGUaYBqc2uz0LuKcIRmjJXNwU0sdH/HARBXq08YpxngwadKfuLSP09tu
         eKIgIv8kzmNRvIuOPap3C1CMOWEhuKQSMN86dS/YiBl1VNn61iU+tp5KjTCUj6uJeuxS
         wgwwkhnqgCOwP2WYm/Y90u0NG1eNwd65x3hTqHtKpQzgfFcZ4NtRLVXmZbFCmFJdWPzc
         LCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X7wmE2rJCxinroXPaQBQ40WUqrEBuO0hmw6nHwl8iRM=;
        fh=iOD0307bQGIyDu/lBUq5/+a8VKHawySi6eZnDAHBGn4=;
        b=BjJjlFf0cpVmpqMctCN7yyUUX29aXbkT1krZO+kMXkO5l+kBGo0rOZSbwf2Tm8v4BX
         oBgfH+16R+P9UY4F20q5jbcjabXMt3Z9HY7GALBknbHbnQVy0Gc1c63asclnl6yvdhA7
         xEgqpnT9dX8j6OuGk+p7nAqy40gcnO+rTVKdGK3RCtFdRcbD/dUMcjPHyDHzZuF1+sRf
         tMAO/KYTuHKzAE7h4hqcA6XAHPC8GokNYFxTXk5CWWao917c3b6tHmtiYhkXNM4XB5xq
         lDUbXXjCR7ZCdHYVqbCLZnPBNM168700D32Edp4YuQIuZqWfoCqBSoSy578/EX63dZzj
         rN7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778799720; x=1779404520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7wmE2rJCxinroXPaQBQ40WUqrEBuO0hmw6nHwl8iRM=;
        b=Hyh28DYq5WcP77k+1pOO93KYyF96IygU9K18DTRbAJ7zKEsNwuJMJu+JlIkmDVix76
         jSKEwVf4Hm8hTfZTHR8xkZnON/GmiVjN0svxLG6ufB3+OVm77yWJ+EXnVG+hWJO9NyN1
         oVqnY7w5gf/NgQZ38FFtH9Y+Znw0/B+qCrC7GymUg44Ajst3qehThjP0pYxIkQKcFupi
         s3QGJaOcD+AuE+P9W91a3T5knD/6/OkYxA01yVgbOKP5RgtfsOpfNWw6i8L8+uSd4TxE
         svUlOaaRxKEjnHYy9hzOFpf0L14UOETJVq9hm5FLw6DQ8SMrlAFtaEMOX/RXYYEaZv4V
         HaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799720; x=1779404520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7wmE2rJCxinroXPaQBQ40WUqrEBuO0hmw6nHwl8iRM=;
        b=D/dJRIvh6wMFxakdFO8G2VaNVC1HwrtpvXyJ2Ngv9ZZYSBOqzcqIBf+JfLG+auJ8sg
         pJuUC64dDz+u84t/xfRYNUIB4bLwcBTs1W/Axh6TKTb3lB2MqqVLN7FKomdSSKeRdwMg
         4jdA6jTvqRsIkvbRNr4kCegYhm7+Tz80qjzKmeEy9LtpmNBtHwn3uybvMpsatosLNFmX
         BQi8+CgnFjCxHgjgu6KbNKS6JbKxdyFgEHKd1xAmcOBgvsFUfpBR9wcbf7T0l/84JsDO
         iH03MZJXU0dksWqsyGNLpFvT3EqlO4gTbDZ42IvC3g32L7FgUwto2pMO1IQbdJTMTLq4
         Pykg==
X-Forwarded-Encrypted: i=1; AFNElJ9sbGD15iFjRJUXcYadvZLKtFPUfOj7TTxr1gwnwuHOJepzCmYlpioviGfrLmech9AWCTK9CKqAh8BVnKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf90GEydl5eTCS8NF5FJ1wvDQWI8rzGG4Pl+WKwC2w5gJ3lHTD
	xJ4kTt6TmnqC2Y96ror1mj3qGsEpPWIpET2SHwGeCxnl585bQRWfefhgRH1Is58qYALTkHTTSwu
	B/Yd1w8Hw//xoPcwDHBtG07rk2eB7xyNWg5sCOLS5
X-Gm-Gg: Acq92OHY5itt+1edrs/Y3JTtmQMBFYXktZK/hp7Ktjm9lG9yZBnk3pOx9fCYn9HwmQM
	/mRhp83KtfD+v3aESH+5NpV4559knvOrN1gYAVretneqUxEVY+WZfCfXXlHEp0k+CslaIrakct5
	gIgNW6SYfFwQlPPCmxUcoQInc14o++t9rxdB9L7nslddQKTfrSQzN7VE3Ow6C9M3k2Hzg5GFZ1J
	dAYEHmUGRlmNnO2/bfJIRUAEAVQcklYpu5dRI1gxUNzcG8+KHNT4reoZXnq5DT0QDNKxD/Kv5uG
	In576/0DvTESLVqyG4219wIDvQYbKaYK4BOn0ooHWeofEn4WtfofmnGQ3L/E
X-Received: by 2002:a05:7022:6627:b0:128:bae0:e043 with SMTP id
 a92af1059eb24-13504943020mr671741c88.31.1778799719313; Thu, 14 May 2026
 16:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <20260511200136.3201646-2-elver@google.com>
 <20260514092246.12b7d1ee@pumpkin>
In-Reply-To: <20260514092246.12b7d1ee@pumpkin>
From: Marco Elver <elver@google.com>
Date: Fri, 15 May 2026 01:01:21 +0200
X-Gm-Features: AVHnY4L7Nz8QfeqrI3wCl3GtxJUpEhFvuQuDcZR7x-mFmRFeRPBj-Sj8PlxOnt0
Message-ID: <CANpmjNP96_pOrH1SPTL105e9ObXY2q7V8KwFM3sKqvX9ZWYH9w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
To: David Laight <david.laight.linux@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8BB70547A2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13163-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 14 May 2026 at 10:22, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Mon, 11 May 2026 22:00:49 +0200
> Marco Elver <elver@google.com> wrote:
>
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> >
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
> >
> > Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> > the address of a local label, which is considered broken by both GCC [1]
> > and Clang [2] because label addresses are only expected to be used with
> > computed gotos. While the generic version more or less works today, it
> > is known to be brittle. For example, Clang -O2 always returns 1 when
> > this function is inlined:
> >
> >         static inline unsigned long get_ip(void)
> >         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> >
> > To provide a reliable unique identifier without breaking architectures
> > relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> > to _THIS_IP_ where architectures provide a safe implementation, and
> > falls back to a zero-cost static marker where _THIS_IP_ is broken.
>
> Doesn't that mean that all the other uses of _THIS_IP_ (which seem to mostly
> be tracking lock requests) are basically broken on everything except x86-64.

It seems to mostly work, but yeah, it's probably broken in some places.

> Would it be better to actually fit that?
> It isn't as though it is hard asm, you just need to look at how gcc generates
> PIC references to static data.

Yeah, I have patches waiting to be sent - I sent one for arm64:
https://lore.kernel.org/all/20260511201711.3249121-2-elver@google.com/

The rest of my patches are to-be-sent, when I get around to testing -
which I didn't yet for most of them since setting up test environments
for all of them is a PITA. Though I can send and let arch maintainers
review them - this would be the tentative list:
https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=alloc-token

