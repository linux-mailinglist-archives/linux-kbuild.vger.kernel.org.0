Return-Path: <linux-kbuild+bounces-9623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79159C5B550
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 05:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A5B54E4D3E
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 04:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D532C11EC;
	Fri, 14 Nov 2025 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3U+OeK9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B31C2C0275;
	Fri, 14 Nov 2025 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763095105; cv=none; b=HpmPAILEXF+6Lae49yjGKu7VUWHpQcHZcUiA0MVYgV+KXgvcEsR+g8vo1uoqe/KKL6V466RRgWNPZ2byBtmL9QSkQ0lbwQ7+iAEwSEv2wlm2ZbT8hSiCwrnCv6SqbOX76nY9IOiVbkFygHaZ95+J3I76jwq0Bgk/sdiBH6nb8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763095105; c=relaxed/simple;
	bh=nHpuwrB2PqWoFYl7cIf1QtHauh5mGZ3uTev/Ldhcw+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0NOv7Lx79UjNcUKNdWJSx6o4q2lesY9vYqPhlNnA5p5ZTPds6YFwzUM6aDpnyRrf5d98ErUSRe5PhOgfMFuofEPNKWRovGnS0RlgqkMT4KYOpxUx/Rc7N/WqEPFf8MYo7pFmhPWsUqiJoSzYsrVB8i5QHYBWirg+9/sd8LIdnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3U+OeK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D54CC4AF09;
	Fri, 14 Nov 2025 04:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763095105;
	bh=nHpuwrB2PqWoFYl7cIf1QtHauh5mGZ3uTev/Ldhcw+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3U+OeK9GhqfWF0+J2jd+muy8AARO4qDhP50T8K6+Ixjl7OYP08hLGOSjvEgNxOBJ
	 S2GLkZXFLi/O9NjK1ipo/SNFyF/x2q+MTldVC8dPMtD+AzPiMHugVxJM95DcCbrvhf
	 w+P4TONQUjEMO29loLzdZvpX463OkL/mVZC1yaEqf8ktr2zjE4sZ+5mY+avsykTA+K
	 YA5I/rS3IC+TdNYYZ7Ei3wdD0P6JsEmLKcGpkSPlRUNbHgBaj0L7XpDuh3mccUNosD
	 JdIkdst85rXaaJZP3s8sX9A0Gu6//cXcUYjCevnXiDhCSLjMa0X/U4YWXnNUEkL3Gn
	 Gdnc8kbREu9lw==
Date: Thu, 13 Nov 2025 21:38:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20251114043812.GC2566209@ax162>
References: <20250918140451.1289454-1-elver@google.com>
 <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com>
 <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
 <aM0eAk12fWsr9ZnV@elver.google.com>
 <CANpmjNNoKiFEW2VfGM7rdak7O8__U3S+Esub9yM=9Tq=02d_ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNoKiFEW2VfGM7rdak7O8__U3S+Esub9yM=9Tq=02d_ag@mail.gmail.com>

On Thu, Nov 13, 2025 at 03:30:08PM +0100, Marco Elver wrote:
> On Fri, 19 Sept 2025 at 11:10, Marco Elver <elver@google.com> wrote:
> [..]
> > I went with "context guard" to refer to the objects themselves, as that
> > doesn't look too odd. It does match the concept of "guard" in
> > <linux/cleanup.h>.
> >
> > See second attempt below.
> [..]
> 
> I finally got around baking this into a renamed series, that now calls
> it "Context Analysis" - here's a preview:
> https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=ctx-analysis/dev
> 
> As for when we should give this v4 another try: I'm 50/50 on sending
> this now vs. waiting for final Clang 22 to be released (~March 2026).
> 
> Preferences?

For the record, I can continue to upload clang snapshots for testing and
validating this plus the sooner this hits a tree that goes into -next,
the sooner the ClangBuiltLinux infrastructure can start testing it. I
assume there will not need to be many compiler side fixes but if
__counted_by has shown us anything, it is that getting this stuff
deployed and into the hands of people who want to use it is the only
real way to find corner cases to address. No strong objection from me if
you want to wait for clang-22 to actually be released though for more
access.

Cheers,
Nathan

