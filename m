Return-Path: <linux-kbuild+bounces-5249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9BA9FCF09
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 00:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB9B3A034B
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Dec 2024 23:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E4F1B4148;
	Thu, 26 Dec 2024 23:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QMgJuhwk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23233176ADE
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 23:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735254090; cv=none; b=tqLJN+rLiXlL85bATpDMVyPVxFISoIbv+5otCpzif1aon6IkkksZ32eB1QE72hPBcu8cw2qICRfu93pZ438Ekz8BZzvhydsT13pYr2Jn4cfbjtL0GspaBNP4BldEbasLKrrZLRhinSY4GsVsJItVX2nwMcwpF3R0wg4LfWUGHt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735254090; c=relaxed/simple;
	bh=l3LfCSw34LI9hiP4+YmiSU5XDk8QeFclo5ZoywKRc/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyJzYuUswnQB4VcAOP4ser2eo8XjG3QkPyoYfnH6Iw4BRsLWYmwz9Ti385VuXfZMImezYorVkSBy5/6kGDen5PrcbYdYCR6201+Kf78IAAXycVNguDo5b5SgPDy7yt/qeSZCC3IkFTzNQGbJkzgHIfh0FE1Wzim6l5BrP2BmLhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QMgJuhwk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa67ac42819so965897466b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 15:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735254086; x=1735858886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wEATQMkfGbTb4fOsLXh4qamgDY3PFH9/p0eJJt63Xx8=;
        b=QMgJuhwkxbt5HnAxi8xxVQWawsXgVKrdc7qr1cPqlIsSu2pmX204UCB4ieXeWPABYP
         Vnk9CwMS4yzmOHd7lgNw+rzj0DxDrXI4iaCgE//azY8ByfdZaiWyJMfiV/KYz8h6zPst
         LiZsi4eyx1ixSPlUAzsqwyjMVIkDJGOUpLHKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735254086; x=1735858886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEATQMkfGbTb4fOsLXh4qamgDY3PFH9/p0eJJt63Xx8=;
        b=ZPMYCNXovHhFSE4DaB7LCUYQ4EnpAn6boIeJotk6e2ZjBbZKk1c7UZGXfxR+5AVc3y
         YHlgmOoaFiaf4V1RKoD28nqGvuzM/af2AAQWvGJSjY6CwxO/YqpA/bM/vhGFy9MN8+SC
         zs+kloVZEfpLlfdyE/GUUl4/Ys8CJeTNengjj17Tus2khQPNpQKI4i6RTts+iaz2lh1k
         kzv0rvo3L3z7eeCEX1Kv93zagOlPef4m2EwQlBlb1n6pDGhrR/OGvNuuesyMV8nJJukJ
         XvdYynVmjuZ579JJipfsUFZOWe3vVzSw54HKLOdQg+3G6//xDk9KyCW0YzTseiHenoH4
         ob4g==
X-Forwarded-Encrypted: i=1; AJvYcCU5QaS9IQSOunhNWOzejFkll7wWzMOmzmwc3vt/ouyogp+XUoI4ykk6BroUF1HnPNMjh+OhY2LSvfTwD7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCXYBcywxZT0Qtqw7iptgg/0PzJXxtpgWgkLD+z+PlvffNZn3
	MqtnGo59gXKixEiGlYzQkCJ/SFhBdTKZVMhZH+TQZhJSLvIBegWMILW5rsIx5+K2IR8jGle++H9
	n7+eEfw==
X-Gm-Gg: ASbGnctXEmP2yLetNI85MRSdDHOS/f5bwJPOr7fFuO91gl4NoOFAuwKDNBUb3lbk7Qx
	ctStVw+XLcTWE0f8fyvpYcX1TnTM32AZ3r+6CrEBl8Dh+ZgT9NkZO/L4Hm2QKhwPBCrthJBbzVG
	rqVL7OejXdUAvzI8A7v/QS7/SvKtDhDVAcLfK4S01Fu+cLZwv/KF1s+9okGxszbWlG0WsG56XKy
	zXIpQ0vom2Rt/sUoJWQ76Tv/JiwUlKvGJpwS4q0NZRP0BaJO6WaQ3WT2dCQg9h8/DF2O3yZEKsU
	kwOAWiJ0ZrZRoDQr8hurWmWevnGPisw=
X-Google-Smtp-Source: AGHT+IH3wDhFArQdIcMk8uE1eXyo0E/TkYmV5NKmxVythLwWOhDi1h+m6q1bd93jAPMZoWYudGkdMw==
X-Received: by 2002:a17:906:7314:b0:aa6:8cbc:8d15 with SMTP id a640c23a62f3a-aac2ad9e06emr2079149066b.14.1735254086188;
        Thu, 26 Dec 2024 15:01:26 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89617bsm1015555466b.76.2024.12.26.15.01.24
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 15:01:24 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1189568266b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 15:01:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtC91fQYBF/TrC7g84Jfp5p0hQvPeS+Lv31nSikeGb3ePmD/wogTVXNbpIadih5i7J9axkdn8cyb8wS54=@vger.kernel.org
X-Received: by 2002:a17:907:2da0:b0:aa6:5201:7ae3 with SMTP id
 a640c23a62f3a-aac3465011bmr2079637066b.40.1735254083855; Thu, 26 Dec 2024
 15:01:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226164957.5cab9f2d@gandalf.local.home>
In-Reply-To: <20241226164957.5cab9f2d@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 15:01:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgTFSqiMvbGYqFLQaERoeXR5nK1Y=-L3SN7rB3UtzG0PQ@mail.gmail.com>
Message-ID: <CAHk-=wgTFSqiMvbGYqFLQaERoeXR5nK1Y=-L3SN7rB3UtzG0PQ@mail.gmail.com>
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

This seems entirely unrelated to weak functions, and will be true for
any other "linker removed it" (which can happen for other reasons
too).

So your "fix" seems to be hacking around a symptom.

And honestly, the kallsyms argument seems bogus too. The problem with
kallsyms is that it looks up the size the wrong way. Making up new
function names doesn't fix the problem, it - once again - just hacks
around the symptom of doing something wrong.

Christ, kallsyms looking at nm output and going by "next symbol" was
always bogus, but I think that's how the old a.out format worked
originally.

But "nm" literally takes a "-S" argument. We just don't use it.

So I think the fix is literally to just make kallsysms have the size
data. Of course, very annoyingly out /proc/kallsyms file format also
tracks the (legacy) nm output that doesn't have size information.

But I do think that if you hit real problems, you need to fix the
*source* of the issue, not add another ugly hack around things.

             Linus

