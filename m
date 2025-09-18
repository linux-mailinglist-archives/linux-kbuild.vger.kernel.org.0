Return-Path: <linux-kbuild+bounces-8904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22981B864F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 19:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB9016795A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 17:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4592773E9;
	Thu, 18 Sep 2025 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6Kqz0C2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7792459CF;
	Thu, 18 Sep 2025 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758217569; cv=none; b=d20HE+H2OoF3+mZC/WJyIG+iCIWlj5qwTgt8GyWAL3zEASxUkG1tLVGHBAjEC4OWFCoSSDApC7SIyF68jwhcVGdnuRG+e/ExQcU/PMHFIIZeMg1rKZT49COJaxdRmjVYnIsAeLpA9Kx92MOox7uMN6TtSI0/iWlb6ZAKdYckFA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758217569; c=relaxed/simple;
	bh=ZNTo/Y9EyxZmz/6UCc4XPFi8e1W38Mv8YYcq4WlZegE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN5BlQwWq+yJ6icdhqmDLNLiu9vxKwpYFc1gxHeliavwFjnh/FCAIzd+FkGq7jC8sYdTTY4gTE6fBaQkwB6jH2s3uObXKUouK6BNoDW7bmFAtGua+HZAtLFufnDdKN13HyIMGNGcf9rKdJEbchbBGpHutizw7TiPKFvvkd55mCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6Kqz0C2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C0AC4CEE7;
	Thu, 18 Sep 2025 17:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758217568;
	bh=ZNTo/Y9EyxZmz/6UCc4XPFi8e1W38Mv8YYcq4WlZegE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6Kqz0C2bMyTxFSdnUrmZXomQZUKN6PrE+wxZtJczj7QbrNhByTVlq1eR7IvDe3Jy
	 Rb0EVjsKlu7+xQR8iunNSXY3VfqUgyGCab6xsnZgBZl67tyBH/axKezDiuJ1cjPL/B
	 9kfaRoWNLZ5V3wySAKqhDPOxfQhGSa1lzggNioVkRAcTy+hqrrr0X7H9JoiHVLVFUo
	 mnNYoLhoteQ9EMMAi0FpYEfUzAKGMHcgiX/jB/qz83MmJDJnFzCuWf1/aH0MsAzimV
	 sIMfY4OB0F6qYHUWlI8mz6IPqJvhYJpjwfv9gUvj1AZPTM7hciQh+uiQLZarv96/8X
	 3zcI3CRc9uH8g==
Date: Thu, 18 Sep 2025 10:45:55 -0700
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
Message-ID: <20250918174555.GA3366400@ax162>
References: <20250918140451.1289454-1-elver@google.com>
 <20250918141511.GA30263@lst.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918141511.GA30263@lst.de>

On Thu, Sep 18, 2025 at 04:15:11PM +0200, Christoph Hellwig wrote:
> On Thu, Sep 18, 2025 at 03:59:11PM +0200, Marco Elver wrote:
> > A Clang version that supports `-Wthread-safety-pointer` and the new
> > alias-analysis of capability pointers is required (from this version
> > onwards):
> > 
> > 	https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e610c351a3227f36c92a4 [3]
> 
> There's no chance to make say x86 pre-built binaries for that available?

I can use my existing kernel.org LLVM [1] build infrastructure to
generate prebuilt x86 binaries. Just give me a bit to build and upload
them. You may not be the only developer or maintainer who may want to
play with this.

[1]: https://kernel.org/pub/tools/llvm/

Cheers,
Nathan

