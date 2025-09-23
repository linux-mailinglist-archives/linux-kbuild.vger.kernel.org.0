Return-Path: <linux-kbuild+bounces-8933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA83B976AC
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 21:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B66123B5D86
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 19:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B247221C9F4;
	Tue, 23 Sep 2025 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvIaGTqH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA731A238C;
	Tue, 23 Sep 2025 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758656968; cv=none; b=uuKYpqOPB+gMwo7j50EgroWVs2YAhiEwbHSFUREg3e32oT2t0BrkpjUMv6E/fBz3qjP9e6eNOsQVtz0wEphoPz/tTQRUa4Zp+ke/na1xBj6dZnFEXmhhr+82+F1IM6Y4xJL+MgbuASJDjXoszLRG7147UTC9psKI8boph2bAFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758656968; c=relaxed/simple;
	bh=7gv2WzZ+nMC2bdsHIbBsKOEQPNt5h99Cw1wDY0M9npo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEmNC3iy9+3bX40MeouekeAX3QwOEgeb9KdjiK0A5906Uq+MV+r94y9K6Y0LXEA8q9DH3eiEax9HAxXye3Qt1E3xv9XkCAr3EhvD+yea707Y6NVigqw0aD5FQpV8TTQ36qKLxsOZrNa0KfBiyWkWQUttCIjNYSJ0YA5MHHaRuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvIaGTqH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0DAC4CEF5;
	Tue, 23 Sep 2025 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758656966;
	bh=7gv2WzZ+nMC2bdsHIbBsKOEQPNt5h99Cw1wDY0M9npo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvIaGTqHdNU7Q1p9iQCyi7SI8rzgs+Fd2F62Wvt4e7U9M5ZbQ8qxnT0LiSPe4PKVR
	 gehyR0Rm0ghRXneZ4tzjafcgpCRITUKyHFvb6JN4O9cuxWgjIBHK2hM2MF5Y/HqnMX
	 n3nuIsdb1r2D9GFRjzSab+/uI7K6xmpOdsNRSsCVySBQ9n2ybIX4gsztX3PGvijcvT
	 Sp/fUhAnCreO1LjGnNn/IXq6su5QDyv6TUFvnwV57AFOt5ZY8qGMFKUOL3RBXFtVX+
	 bbjgLfFkLzJt+rxjoewVtxndm0w4xC2WwbySLCvFHwFbb5zcONvgE0SDuPCi7+lbEf
	 evcKd6295D9ag==
Date: Tue, 23 Sep 2025 12:49:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, llvm@lists.linux.dev,
	rcu@vger.kernel.org
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
Message-ID: <20250923194915.GA2127565@ax162>
References: <20250918140451.1289454-1-elver@google.com>
 <20250918141511.GA30263@lst.de>
 <20250918174555.GA3366400@ax162>
 <20250919140803.GA23745@lst.de>
 <20250919140954.GA24160@lst.de>
 <aNEX46WJh2IWhVUc@elver.google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNEX46WJh2IWhVUc@elver.google.com>

On Mon, Sep 22, 2025 at 11:33:23AM +0200, Marco Elver wrote:
> [1] https://github.com/llvm/llvm-project/pull/159921

Now that this is merged, I have pushed an updated snapshot for x86_64:

https://mirrors.edge.kernel.org/pub/tools/llvm/files/prerelease/llvm-22.0.0-ca2e8fc928ad103f46ca9f827e147c43db3a5c47-20250923-185804-x86_64.tar.xz

Cheers,
Nathan

