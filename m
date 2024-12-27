Return-Path: <linux-kbuild+bounces-5259-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A29FD6D4
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 19:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB063A25D6
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 18:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B4D1F892D;
	Fri, 27 Dec 2024 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FvRlaoBY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719401F8909
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Dec 2024 18:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735323002; cv=none; b=ALfKaN1u+dK4O43KYPvTc8ZYDHONUStdgQAX+XzQPyOzl2tkR4jHkr7WdiHz+FtpRNakkpTRrWZ3vrZdBBLlsmmYf5PBmjVmLnEBBLLBy5pe8QxDrcn2Nqm81MF5dvMUAYxKv5yA7aK/cWkCNb0pYaTOE2jziXltE4/Tp7iIZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735323002; c=relaxed/simple;
	bh=lIgCGRIjaCWKrn+E11kdlmQyFebXDmv69x2tOk205hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7iq0/jyCVPKLfVlEOjbz4Gp3iOamQIspvCAG1n/ZrXLzInaAoDTE6l08Uuo4+UQ0zcVqDJDoEyxDogfsLUieMQMI4dWr6hEDIgxDBsId5JdbD2bysh7p6UnfOAijqfLpGU4ka2E5Fd0AZkY+JjwcrGKa8M9n0SJnCbc9PhOYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FvRlaoBY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso11800095a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Dec 2024 10:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735322998; x=1735927798; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yX3BV4MQOHPYJPObPt8JUHeYgGfsYXEGdeuM95hlgDk=;
        b=FvRlaoBYHpGIMtjx/Ax11oZir09L47Uw7fdI/RwdX1NCjFJ/m4ASkS/skmP5OkkKQP
         q3xLavUXppaNxzIrjDMkGjR8L1LX4lIkdYd3WHdswXJf/XhQyXxJ0q7qc9btvrVUTk0C
         eGABU3PDiEp6DaeD5U+BwbrPFw/3MrcjKeImE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735322998; x=1735927798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yX3BV4MQOHPYJPObPt8JUHeYgGfsYXEGdeuM95hlgDk=;
        b=SBkx+6RUHmq2kGioP6H+uSyO/NqkcU07XwN3+DXdYCpd3wuUK8VJhlLFVEvtF3znI/
         xhjWDe1yaKxX+K0WG/VLa7wkX8WtShO5MZg7H0AIf7vIVEMJvDUn3oWWUnn2X+B8eNmC
         QZtMfZLH9kecYO9l4+KodEeZR2SMrpA5gSet4VWrtFMqV2Z/YJav3QuqT75bXh5SzJLb
         8laUBMP4WSXzzaa1pJ2/m6bCPbZGoxeyJUCq5BhrcKrJS0mYPCCDa67CETO56kAqog0y
         tLvquElyzBrhLpgfufMX1oyDtsEe7i/WPM5Z5UJjBLfZQK2kqua2w2qG6DpJ8ie5uEy9
         QdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/dkAYM3fx4HmfRrS5qQy3RD56r/E5+Htprs5zNwA1FqAYNbEk3870XuvTZ4MvfeWR9bzsnRJLtzRIJe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbmnyMMbJzqLz6v/nVTABiC09LmGJQm5N2IB09WIt2u/Q5Ws6q
	KpP973OSuVPY0kSiK1kI96lfVgiMpOlKjmIeo9TU2jyM123IDgrAvbybNt3BZzll12sBqTSSo8H
	Y3NMelw==
X-Gm-Gg: ASbGncvCJjkA2nCVh4L3Sv+Q++btV+6o8wtpA8acIeUwoRUYGA0rNMNfiRH0d4dCyRw
	HQoSf0n2FXIQ0qfzPGo7GOWflltfrcSvQYWhHC8CBXzJH8JMj9yC3lNlA5JmsQItcWkRQudOkZU
	XkNSjgAOmKQErxyyxwDRA7DvgA62m/LZG8YEqGNkay/IbVj1CVkbaZ1QLgYcCcOlgjwJ4gm6wHo
	HNRSHNtTtMcTasmSrDVoQcFLj24eADEv5Dx7LTpg53yCukh3hDfSvaTaSSvEiN9xTFrUp4toHai
	GzXpMuCpdrx5YMQSNFdyAlaa6XaHLPw=
X-Google-Smtp-Source: AGHT+IFQYFxRWpefPj09kroZTM2lLwTLL6ZPznDYpUs8OfscZ9CN1gTiArA96vPAV8AlMuVH7mNflQ==
X-Received: by 2002:a17:907:1b85:b0:aae:85b4:a07 with SMTP id a640c23a62f3a-aae85b40b17mr1285507666b.8.1735322998597;
        Fri, 27 Dec 2024 10:09:58 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe49ccsm1149240366b.94.2024.12.27.10.09.57
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 10:09:57 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeef97ff02so530250966b.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Dec 2024 10:09:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWghmU341nGNwkmu2Mwb8GedCFWeeg2ep5GAlrf1s3RXcoPhlql8azuerFfb0/NNNg8Hu6bJRHhxELRwiI=@vger.kernel.org
X-Received: by 2002:a17:907:9812:b0:aa6:738c:2ddc with SMTP id
 a640c23a62f3a-aac2d4472bamr2701724166b.4.1735322996702; Fri, 27 Dec 2024
 10:09:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226164957.5cab9f2d@gandalf.local.home> <CAHk-=wiL8B2=fPaRwDPGgQhVs=3G=8Gy=QyR59L85L0GF67Gbg@mail.gmail.com>
 <20241226224521.2d159a02@batman.local.home>
In-Reply-To: <20241226224521.2d159a02@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Dec 2024 10:09:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgoORBJ6OkOA1g2MNHW4oEMRSkCbnyf7Ab+CL8pCQ0-ag@mail.gmail.com>
Message-ID: <CAHk-=wgoORBJ6OkOA1g2MNHW4oEMRSkCbnyf7Ab+CL8pCQ0-ag@mail.gmail.com>
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

On Thu, 26 Dec 2024 at 19:45, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> >
> > Btw, does this actually happen when the compiler does the mcount thing for us?
>
> Yes.

Ok, that's actually good.

I'm not really worried about the "unused symbols aren't in kallsyms"
issue, even if it confuses the mcount logic. THAT confusion is easy to
deal with by either adding symbol size information (which I think
would be a good thing in general, although perhaps not worth it).

Even without the symbol size, the mcount issue can be dealt with by
just knowing that the mcount location has to be at the very beginning
of the function and just taking the offset - that we already do have -
into account.

I was more worried that there might also be some much deeper confusion
with the linker actually garbage collecting the unused weak function
code away, and now an unused symbol that kallsyms doesn't know about
wouldn't just have an unexpected mcount pointer to it, but the mcount
pointer would actually be stale and point to some unrelated code.

So as long as *that* isn't what is happening, this all seems fairly benign.

               Linus

