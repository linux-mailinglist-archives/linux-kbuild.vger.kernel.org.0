Return-Path: <linux-kbuild+bounces-8899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6EDB85E61
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 18:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464AE582DE4
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C606314D07;
	Thu, 18 Sep 2025 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Mf0M1J8U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5D0314A62;
	Thu, 18 Sep 2025 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758211452; cv=none; b=Il9QWpas0opsMNgnmb6D5FyB1mHH3CPUuEarokZXOB/7dOOPhxbaNRXDmWvc0l/nSYqIHy+Zn+4FBAIY3LqUc26iafRmowjlTxeFB5AX30rRuOptFdXf/YBfSACu02GNUNjARAFOg8nXz8GZNXLM/ZG7hazxZfiqjTtUOv3I3ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758211452; c=relaxed/simple;
	bh=3LE35nZGZq8MyMAMqGFXGW2TSB7AmNx1a4aDe+qCZPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yx/BqS4a3nqufeBCoPbtCI6602xVlH3cPMcRGyxiHV0suKtumXreyfcb1b52+Yg2E77Z5Y6xXH/a5mxF7rGIucqd3NXeFffoxwKkR3p7J0HdyfWcao0/5thJ73AQ5SaVe/W4AnoqBYujYu9eH+YIFPbyxNWTBboEDhYEV8jCO9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Mf0M1J8U; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cSL6c3snqzlgn8k;
	Thu, 18 Sep 2025 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758211439; x=1760803440; bh=4wzWm6RSRc1tNocFJFpFoox7
	GYZLGguM76hcy5QnMFw=; b=Mf0M1J8U6wTLeu2gHoc5SUiGtJ7IvGYk8UZ6fQtQ
	F2HzXxFsv2wJKVo3E3itBcK5M7HBPy7vs16rMQdZNtkdtlpHUdAB6gp5zElM1tQv
	X44SkYoj7S3blZaRVlzHiogKzJP7RsYrM9zFM9RqFriOFHgBvgFNCVmVWHjXbnfj
	BCNxjhZ/nIKCSqWA5KRGlBXCj8ouY534Wu4SFzXm9YsWLm1w6mkQLx3XVjEv5N0J
	qYICjPTqTk8g9G9tSYHje0mRJLCaVRl0Qo98o58MrF9E6yTEcWnwOiMsYBacC9iZ
	WV8PxWTT8jpLUWJ3lpx2TSzx7JNYmCOfRmR8oXeNulu1CA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6L6n7UbPW0mK; Thu, 18 Sep 2025 16:03:59 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cSL5g10BTzltKG9;
	Thu, 18 Sep 2025 16:03:18 +0000 (UTC)
Message-ID: <1ca90ba0-7bdc-43d1-af12-bba73dd3234a@acm.org>
Date: Thu, 18 Sep 2025 09:03:17 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/35] compiler-capability-analysis: Add infrastructure
 for Clang's capability analysis
To: Ian Rogers <irogers@google.com>, Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>,
 Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jann Horn <jannh@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Triplett <josh@joshtriplett.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 llvm@lists.linux.dev, rcu@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
References: <20250918140451.1289454-1-elver@google.com>
 <20250918140451.1289454-3-elver@google.com>
 <CAP-5=fUfbMAKrLC_z04o9r0kGZ02tpHfv8cOecQAQaYPx44awA@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAP-5=fUfbMAKrLC_z04o9r0kGZ02tpHfv8cOecQAQaYPx44awA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 9/18/25 8:58 AM, Ian Rogers wrote:
> On Thu, Sep 18, 2025 at 7:05=E2=80=AFAM Marco Elver <elver@google.com> =
wrote:
>> +config WARN_CAPABILITY_ANALYSIS
>> +       bool "Compiler capability-analysis warnings"
>> +       depends on CC_IS_CLANG && CLANG_VERSION >=3D 220000
>> +       # Branch profiling re-defines "if", which messes with the comp=
iler's
>> +       # ability to analyze __cond_acquires(..), resulting in false p=
ositives.
>> +       depends on !TRACE_BRANCH_PROFILING
>=20
> Err, wow! What and huh, and why? Crikes. I'm amazed you found such an
> option exists. I must be very naive to have never heard of it and now
> I wonder if it is needed and load bearing?

(+Steven)

This is an old option. I think this commit introduced it:

commit 52f232cb720a7babb752849cbc2cab2d24021209
Author: Steven Rostedt <rostedt@goodmis.org>
Date:   Wed Nov 12 00:14:40 2008 -0500

     tracing: likely/unlikely branch annotation tracer

Bart.

