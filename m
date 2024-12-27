Return-Path: <linux-kbuild+bounces-5254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D337D9FCFD6
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 04:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 455BB188252C
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 03:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1010833998;
	Fri, 27 Dec 2024 03:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DsE7YAwc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A723595D
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Dec 2024 03:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735270541; cv=none; b=jm3lDk59jzHMdntHrC3Rb92se+jEaRqXjgVtCON9ma1NAxnux8piu20y4wROd7SbFwTgmEGrPXpyTdI/uMb6rmS6IgXpdTK0cGb9p6wwii6aqWiATRp5ZwR3cTRq7wQM/LvCyvEre0hhfM6KYKWw2QJDvF3HJe4TGXAg2gE6sXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735270541; c=relaxed/simple;
	bh=AGXTRv0LmVHEZMilybwu6oh4mQ5OUxVnd/fQq8fjrEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2RL9ikAm/Xo4TbyF5TC6uTuYf6nVKWSPuR9nnpSas+yYZKE5ZZXHLJ8KTaAq3xwfVK4hlvhrs46Zm1MxsZyVO/QNroMlSuaScm8Wqjo2tgS6DfQcHm+FS4Gta+O27iIvw4TN2ak1H45VJCIIqV9VgP6se4w02WUK9fybk+i1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DsE7YAwc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaee0b309adso528286466b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 19:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735270537; x=1735875337; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zv2Kquny1rwoCYildgERHjuaVV6RvgaxGbRxpY4LP4I=;
        b=DsE7YAwc7cUYm+W+PyLHXAweb+R2+uplnXYkLlyjHy0bZXCnANkWklJnsYcq8PLAKM
         Q3OBo30FJjP9l6r65N9LVOcOU0k2u/+KxdGWU4gnxpXAEI7R2nEpfzxdSZW7LxDdkyj0
         WXPz6s8Fy2pJp7r+kYrIJXR/7tsFqqPl95xS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735270537; x=1735875337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv2Kquny1rwoCYildgERHjuaVV6RvgaxGbRxpY4LP4I=;
        b=kpW00cqwF0dzEQP3pWQ4lIRw9i+ZobQ7/L0bX9CsdCB8/9DEsvDrW9+Q5Tt9FHIg9g
         qD94LkkpYaxGRrpo3OWsR0hz/Nld8hfTX1Q2XK/7uJFUGtd58H541RUf7vh42FkIp6nW
         eL0z+NG/WlG0L0+0+wFXfXNLhDTnlTB4Lh3PfrRlU5PIB4dO1OMkLBMTas2Dtmhomkpf
         YDK4o2NZXR5T3mpVtaQJ+6cRY6TlVgke3PWc8ItLmFMvta9iyK3ajvv8Zi6NnpRK5zxo
         3JD3dwG0prGWVxdKoEUgb0SnUboWBWC2/4KVp49jGp+DRRtpKcZTuVPCAxUjMpVSzXA/
         y7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc0oTWryW4q3Gv6YGwpum+MiVg7zbJAIcgi+x/lL0ZAmQdalzZMqzFKaK7UMVBIMOieAxD6oy3zTR4uW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTra5kCqclZWxdhWknhxLBgu/PTfZH2U8tafNVGFaZrinuDSF
	Yvke7KdVn0u9ywmCtCc/ynNunP+RabnIq0IyB3cgbBUENmqvuxTHzvlKGoCqsItj6/ny2I8Y8aR
	a0x8=
X-Gm-Gg: ASbGncv+i7JU1okYeuMKN3YKIc11SulZ0zYu85M/e3nYb1Orb/zll4x7wEjlMf6SCnP
	+n/Ufv9ehQlALC4JBYrWumHnlbJ6OtuLkmqECznTk6ufflQ9QWxzpyKQNgJ522IeC39Z1CSz7jJ
	teCK/ih5leJXkDAIzPjAW2RzKdg13msnZJoJmuIRLFK2HROS7TxV58z26vNXhe6VDl6gUYZR9p/
	Wkk6lHQiS02IZ0+9EyXxkqDKiPwHr7wwhZKgLFnQ+Wr9u4hnb/QCko7F+lUMhuEzQeQuSBCzP/V
	EtFJ1g/o881O01j2fwDU0jp8XDAjxtQ=
X-Google-Smtp-Source: AGHT+IF1spJG/EWUS7gZgRA48roQG2jiiMzUBHN9GbRkqCZ8ZCIlMOkadbqDzYtlnATep3Qxby1dRQ==
X-Received: by 2002:a17:907:7e9b:b0:aab:cd46:561a with SMTP id a640c23a62f3a-aac348c7180mr2169725466b.59.1735270537216;
        Thu, 26 Dec 2024 19:35:37 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b85sm1043871766b.118.2024.12.26.19.35.35
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 19:35:36 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so9681051a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 19:35:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJDeBjQWX3zkD9/7BwgN+30lYhcxQUHgIV8rQCQBaqYV74kTKLaNj1SbIzf7Fhag6kbD4MVBN0flqryRU=@vger.kernel.org
X-Received: by 2002:a17:906:6a27:b0:aa6:9fad:3c1d with SMTP id
 a640c23a62f3a-aac3464881amr1926490766b.39.1735270534947; Thu, 26 Dec 2024
 19:35:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226164957.5cab9f2d@gandalf.local.home>
In-Reply-To: <20241226164957.5cab9f2d@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 19:35:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiL8B2=fPaRwDPGgQhVs=3G=8Gy=QyR59L85L0GF67Gbg@mail.gmail.com>
Message-ID: <CAHk-=wiL8B2=fPaRwDPGgQhVs=3G=8Gy=QyR59L85L0GF67Gbg@mail.gmail.com>
Subject: Re: [POC][RFC][PATCH] build: Make weak functions visible in kallsyms
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Zheng Yejian <zhengyejian1@huawei.com>, 
	Martin Kelly <martin.kelly@crowdstrike.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 13:49, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> But then, when the linker removes these functions because they were
> overridden, the code does not disappear, leaving the pointers in the
> __mcount_loc locations.

Btw, does this actually happen when the compiler does the mcount thing for us?

It *feels* like this might be a bug in the FTRACE_MCOUNT_USE_OBJTOOL
logic interacting with --gc-setions.

Is the problem that --gc-sections removed the function section that
contained the weak function that was then never used, but the objtool
thing with create_mcount_loc_sections() would generate that
mcount_loc_list and nothing realized that it's no longer there?

Or does it happen even with the compiler-generated case (ie with the
-mrecord-mcount and FTRACE_MCOUNT_USE_CC)?

We can disable LD_DEAD_CODE_DATA_ELIMINATION, if that's what triggers it.

It's marked as experimental, and it does smell like either
--gc-sections is buggy, or we're doing something wrong to trigger it
(and I could easily see objtool rewriting object files being that
trigger...)

                  Linus

