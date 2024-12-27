Return-Path: <linux-kbuild+bounces-5253-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D169C9FCFB9
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 04:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352703A054F
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 03:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164A235973;
	Fri, 27 Dec 2024 03:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bmVpcRBC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BCC3596A
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Dec 2024 03:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735268661; cv=none; b=WYdKRSB5JOnP/OpbnL+JhniXndtlL4rFVRsO1brmI1LHYZU7yGoU2F3N25jSmflQZl9IpioiJ7sZn+PSAwiEOqXd0gi+lqTO4ZMVnOuTDAwVa4343QkEiA9l3YemMhhK6wq/i51VOCaUwPa3tEe0Ia2/vcNkNll+lbzSN8Del/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735268661; c=relaxed/simple;
	bh=ThQ9KV6K3n5aFJXUeKhastYFmKYHErpU1Qq4XCFqwn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae/Aq6uJ4emkvZ2q3gvmcCETCJRTVqyhQeIytm6DBJgbRzEM3C5MJ4r4dPK/DyaUBbFi+QwxXGLJAfdPWy+tM5RdeVtHKk8oweG9kY0AsHsV7u+a4nuhAKapO4pufnWOdHZgLiWU0+uVU+FbvbAsoL+NXpYgwf4Z58ExRU47P3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bmVpcRBC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeec07b705so412499166b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 19:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735268657; x=1735873457; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qIvsaxrrzusHG3DGldZGLiyb0altyr/HFAubLTJu3hY=;
        b=bmVpcRBCEvjv9K9iiRo6sbVC8pORVxz0pml1hjJF/Ncu12cebu4eQ4X1fSpNObkPwe
         mt3IqHTlF+y9ie7g3M9XRtwCY3fc52rcwYjj0GV0GMe2OnBvwrDZ/l+yqsbmehbDOlMQ
         /tRKMgQerY2Ok8tSYYu6yPteo8M2pRkgHMHg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735268657; x=1735873457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIvsaxrrzusHG3DGldZGLiyb0altyr/HFAubLTJu3hY=;
        b=fwoCrtM//684VRXjUjDjnQCtfzr3I2P3kz1YlmUy0HmvsLSD8RmnZ4WvJZ7jMsTobq
         XHhDo/sjhkZRyBxX0D2O58y83YGqvW67BKgutMmqHhk4m1CyuK1SzPRTLGPulh+u8IDD
         IEqrZ739mIIbdsiBdaM9k1fCA1cKFZJikaadeW0C7+jYFfVh7ae9g9+P2LiR/cp6TSoM
         73EtIWVr00lbjimWqLvnmrtLmiO2JEQi2LL4YMYsD2miv/jo1oetXE6NScsPgC4p2X9v
         LNRNmECuqcnzhMpryNVUlAYbjZrPf/PKv5KqyeEDfRlkIPCVtcJbkMmE26FPrpgyMZ/J
         Jb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXboCZN/R2T5bQBrmjBEpkQbX0qUfJu8MbYD93GNCG1nyEzdGsLbWKo+eHef/b6bM62C9HM6utgKC7T/Rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTu7dKXyu9wQgw8A1K5hIsTAYB4wFJI525ihJyqUHJb6GO2zgj
	iLgnLvtmJhLbZinjOuvnbf6r/zrJnX66ghxyRd1gG1LbR+lXPXKkCM3inH7W0BAcVIL7oky8Qio
	H3S2M7w==
X-Gm-Gg: ASbGncvZuw9k9Gxr7aGBRhzJ/20yEww/1ztBGJ0ppWBKRyTSVA3+vcKcd5HeimVrSVP
	G6nYQK/n3IZopm+OkNnBDPg/3fsr8abMqqRsGmsGW9BlPzxBQ/x/CVzCHYGCPvpiB63lwIXR5df
	5OEDovyi4O4A+xSFW2kYFntfqa3Yw+fondMFUPcFI5uFrkR+2v75hYkf0pOX0sl4X6TEB+Gs174
	INZiAcXFCj/NHjv4tA2qEhlN0tdMehbQZoX+BHr7SrXm+DfVSu1Vzkk41o/dH7loXBmQ3KZ/DKh
	kuQ4cfTFW6Q1cypU5251d4gHztXH6sM=
X-Google-Smtp-Source: AGHT+IGbaMceLOl7iTlShYMclfmQ1aG5StLJIoqtR3iAp+qBs8rn5sEsel9IIQEBrpSA+Az29qqDig==
X-Received: by 2002:a17:906:bf49:b0:aae:82ab:d531 with SMTP id a640c23a62f3a-aae82abd5c2mr1972453366b.38.1735268657467;
        Thu, 26 Dec 2024 19:04:17 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8951ebsm1042595066b.71.2024.12.26.19.04.13
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 19:04:14 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67333f7d2so1019471366b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 19:04:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4W2+X2I1MI4W4S9gL/nomxRgSyBLQuSIMbzA949OKz19U9mq2zmpwCeSOrfmWpyqKt/ZaM/iSHaFIN34=@vger.kernel.org
X-Received: by 2002:a17:907:7f24:b0:aa5:44a8:9ae7 with SMTP id
 a640c23a62f3a-aac334f1984mr1642418266b.47.1735268653379; Thu, 26 Dec 2024
 19:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226164957.5cab9f2d@gandalf.local.home> <CAHk-=wgTFSqiMvbGYqFLQaERoeXR5nK1Y=-L3SN7rB3UtzG0PQ@mail.gmail.com>
 <20241226211935.02d34076@batman.local.home> <CAK7LNARUCpzr+1ey0MKmyCdTbaVOq8o7_42t4x5BW=4dyy4wPQ@mail.gmail.com>
In-Reply-To: <CAK7LNARUCpzr+1ey0MKmyCdTbaVOq8o7_42t4x5BW=4dyy4wPQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 19:03:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi5JZ62=FFZQi2=doEOwTf4sa=cO+iAFEvnwBr0o7687w@mail.gmail.com>
Message-ID: <CAHk-=wi5JZ62=FFZQi2=doEOwTf4sa=cO+iAFEvnwBr0o7687w@mail.gmail.com>
Subject: Re: [POC][RFC][PATCH] build: Make weak functions visible in kallsyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Zheng Yejian <zhengyejian1@huawei.com>, Martin Kelly <martin.kelly@crowdstrike.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 18:52, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> So, does the kallsyms patch set from Zheng Yejian fix the issues?

[ Me goes searching ]

Oh. Instead of adding size information, it seems to add fake "hole"
entries to the kallsyms.

And I guess that works too. It does feel a bit hacky, but at least
it's integrated with the kallsyms logic.

                Linus

