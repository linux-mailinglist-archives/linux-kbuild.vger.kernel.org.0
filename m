Return-Path: <linux-kbuild+bounces-8920-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98874B8ABEC
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Sep 2025 19:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8241786D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Sep 2025 17:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ECE272E54;
	Fri, 19 Sep 2025 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="L8/5f0d8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1819C227EA8;
	Fri, 19 Sep 2025 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302490; cv=none; b=c7T9XHmjTA03OrvOwM2NBW7Rx5zAuRVvIP2O/75SVXEh5cERUqBqLc4gD2IjGEnLeLiXs/q7HvE2eyKGcwCZVVHwl/JR5cE4fJwGtxDOz5lpuDkUz/j/vNKL9N1//Is+aItiq6GaT/Bq+RV5Ml6eGiEdFzkF/4+BUI6SM3vPd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302490; c=relaxed/simple;
	bh=/2jAKV9i75aKZxYUfkfVcPa5YZbB0ra8iEfrm/O5034=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RG8hSIQ4lYkrznnkzHPMpikDJe2agqr8ectv1Ws7lEHsJguBDdZqLgndBSaEYRBY3Gar+oi4nGsgFE4BXZXUdjsqZLylrfyeRItAlrNXpSeVo1OkN7/JQoPGizBcc7GS3Fe+3pxDlQVky5lGhWSu9Nyd2i5GxsICuJ0fvKoIS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=L8/5f0d8; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cSznL5LKTzlgqVk;
	Fri, 19 Sep 2025 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758302479; x=1760894480; bh=KlBMZtQYmssvvNlMdIFNyVIK
	CykDzp91ay9FSX4ijvY=; b=L8/5f0d8/kPyXoJ7DoiyeGUMePzHeJ+yVVI7oEG7
	Y/g8nB7VZYf4pFB/HQcbU/WwOQ2kjYtYvAhsnrLL0quWX4GMl7aH01WO641cHC/M
	raSDU+8jQepUsqDl4DUTQF8dqtrahKmiJGLWao6jTYvwwlimGXdXMzTsblCck8Ol
	NvqBph9rN6BI19OaJVWn4FT33f19effNIdudp6goRn7YKrbmHqM/4d8zunz/tWEG
	UIL7ER/Wq2UJWgV6cMKzIZC7kqgMp0Y3EbzWN7cmkfJ4gcT1npp8XTK/9ii53vdh
	99kxBiXmt1tlBKTOOth6OWvTsiMhLf/YOO7XCKUtlMWxxQ==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id OCIV4NH48gVh; Fri, 19 Sep 2025 17:21:19 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cSzmX4zj3zlgqW0;
	Fri, 19 Sep 2025 17:20:43 +0000 (UTC)
Message-ID: <a75f7b70-2b72-4bb0-a940-52835f290502@acm.org>
Date: Fri, 19 Sep 2025 10:20:37 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Christoph Hellwig <hch@lst.de>, Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Bill Wendling <morbo@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Eric Dumazet <edumazet@google.com>, Frederic Weisbecker
 <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>,
 Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20250918140451.1289454-1-elver@google.com>
 <20250918141511.GA30263@lst.de> <20250918174555.GA3366400@ax162>
 <20250919140803.GA23745@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250919140803.GA23745@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/25 7:08 AM, Christoph Hellwig wrote:
> 3) Wrappers that take multiple locks conditionally
> 
> We have helpers that take different locks in the same object based on the
> arguments like xfs_ilock() or those that take the same lock and a variable
> number of objects like xfs_dqlockn based on input and sorting.  The
> first are just historic and we might want to kill them, but the
> sorting of objects to acquire locks in order thing is a pattern in
> various places including the VFS, so we'll need some way to annotate it.

Hi Christoph,

As you probably remember some time ago I took a look myself at adding
locking annotations to kernel code. I ended up annotating multiple XFS
functions with NO_THREAD_SAFETY_ANALYSIS. Maybe the locking patterns in
XFS are too complex for compile-time analysis? See also the XFS changes
in 
https://lore.kernel.org/lkml/20250206175114.1974171-33-bvanassche@acm.org/.

Thanks,

Bart.

