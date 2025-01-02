Return-Path: <linux-kbuild+bounces-5304-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95526A00039
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 21:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ADF016309F
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 20:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEFD199FBB;
	Thu,  2 Jan 2025 20:52:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F6186A;
	Thu,  2 Jan 2025 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735851129; cv=none; b=phplYKWn39lOPAtQy3QVATvgpNHZIyfYAB0RSC410SJUJUMJwd2oySZwDz/yi2wml4IFTMHV7IXXdhyOjrFFBMje3gZfNqgnfOiArvNxfqawx2ivc65+PJ1CvpfoTx17vAUAh1yiazRN8Y9PHZMfbbzVxaGpP2t8T+OJMb3QHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735851129; c=relaxed/simple;
	bh=ir5DPRB33s7ztIY5WPHmX2rCVM5Df8ywu1LWIxcepdA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPsox/tp/edyLNg8T/KAez+kN7PWApufdojkF6P5N4el6Pj4VCcgdWopL7fgZ+HdcASknHulA2GT8gF95Ualv4SbXniuNxV0IkBoUHb2feDrnNQei4E5ni3u2KD+RPLM7TaUhOJP0SnSEyDbjf9/Bmkp88A0L/GmS2MGyUZWWt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CFCC4CED0;
	Thu,  2 Jan 2025 20:52:07 +0000 (UTC)
Date: Thu, 2 Jan 2025 15:53:23 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian <zhengyejian1@huawei.com>, Martin Kelly
 <martin.kelly@crowdstrike.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 14/14] scripts/sorttable: ftrace: Do not add weak
 functions to available_filter_functions
Message-ID: <20250102155323.043c6315@gandalf.local.home>
In-Reply-To: <20250102204804.GG7274@noisy.programming.kicks-ass.net>
References: <20250102185845.928488650@goodmis.org>
	<20250102190105.506164167@goodmis.org>
	<20250102194814.GA7274@noisy.programming.kicks-ass.net>
	<20250102145501.3e821c56@gandalf.local.home>
	<20250102150356.1372a947@gandalf.local.home>
	<20250102203200.GE7274@noisy.programming.kicks-ass.net>
	<20250102154146.1d5e8f9c@gandalf.local.home>
	<20250102204804.GG7274@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jan 2025 21:48:04 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> There's patches out there doing much of the above IIRC.

Right, which is why I started this, as it does handle a slightly different
problem with the mcount_loc sections.

I was hoping someone else could solve the kallsyms issue.

-- Steve

