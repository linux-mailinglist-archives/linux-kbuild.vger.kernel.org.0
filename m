Return-Path: <linux-kbuild+bounces-8905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1802B86B7B
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 21:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0AAB1B234AF
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 19:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDBB2DCBF8;
	Thu, 18 Sep 2025 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkCy5zq7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38003275B04;
	Thu, 18 Sep 2025 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758224438; cv=none; b=e37KOoVC9mfAdI3u2ZGBtAOlpyWPsa1K13iugIpknZdowVzfgs8YeN/wryr9USSp3mwS4wCfy9VbQP5ferV89BeRbb92URxCTPpO+JGOb07zQKP4LrfpYtoMtzJU/IwAxf47r0Uljt13VUmG9r0wYWBYcPIFao4SdHbZPciSe+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758224438; c=relaxed/simple;
	bh=GNLoPVl1DXIVax+PtnoEsKdKDKFCQNOtCNXTfw8iceU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9+AB6WpEmm3imSeI0++3mV5Z8LkgQH+yWv7Wu0g7fE3uO9m3nvbjX+YxzU90X8iIzl6G62qFHjfAo5MSoPkClC0hpMgsUowdQxDlBKcwp9xC1bcXVhzAa6J6FVds5e3RzxiFpNLELN4Nh7K6ataxHX/53fJAEfihNrqgZXEL1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkCy5zq7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B1EC4CEE7;
	Thu, 18 Sep 2025 19:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224437;
	bh=GNLoPVl1DXIVax+PtnoEsKdKDKFCQNOtCNXTfw8iceU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkCy5zq7k3oMe16JYv7VlKExpwS7wxKXd0JYnRIUtDgj+7Qq0qsQIOWdm7toXWBkq
	 qWWWYrzR7UIQvF/lWUpmPC5P6Z+qdxmxw6iACC2LtXqrvCN6/wzeGRmUaVeOjUIaZ3
	 yWB1FmongptVZ5uIN7XzmR8KxxYJfFw7/U7sxSI0m0WbpLrULrfnpoXInLZICfv6Lg
	 7oR6vK4+RXkPaAxuIzgVcI5Ri0YEBtO16rHrjo5xw4sIIKOkKSjdV/eB2iU+F3IG08
	 diobdjjvcUaEalg7hsOHEtkzvOVwCl6Ry1mVN+hHXasJm0gzOGBVCYfyrlvSoDS1mY
	 QDh3hVnEuH0TA==
Date: Thu, 18 Sep 2025 12:40:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20250918194026.GA3379805@ax162>
References: <20250918140451.1289454-1-elver@google.com>
 <20250918141511.GA30263@lst.de>
 <20250918174555.GA3366400@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918174555.GA3366400@ax162>

On Thu, Sep 18, 2025 at 10:45:55AM -0700, Nathan Chancellor wrote:
> On Thu, Sep 18, 2025 at 04:15:11PM +0200, Christoph Hellwig wrote:
> > On Thu, Sep 18, 2025 at 03:59:11PM +0200, Marco Elver wrote:
> > > A Clang version that supports `-Wthread-safety-pointer` and the new
> > > alias-analysis of capability pointers is required (from this version
> > > onwards):
> > > 
> > > 	https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e610c351a3227f36c92a4 [3]
> > 
> > There's no chance to make say x86 pre-built binaries for that available?
> 
> I can use my existing kernel.org LLVM [1] build infrastructure to
> generate prebuilt x86 binaries. Just give me a bit to build and upload
> them. You may not be the only developer or maintainer who may want to
> play with this.

This should include Marco's change, let me know if there are any issues.

https://kernel.org/pub/tools/llvm/files/prerelease/llvm-22.0.0-e19fa930ca838715028c00c234874d1db4f93154-20250918-184558-x86_64.tar.xz

Cheers,
Nathan

