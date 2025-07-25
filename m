Return-Path: <linux-kbuild+bounces-8169-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62FB11F8A
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 15:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8219B7AFD9D
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 13:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAB91A0BF1;
	Fri, 25 Jul 2025 13:49:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED4F126C17;
	Fri, 25 Jul 2025 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753451383; cv=none; b=A/Sw2G3Hb8/EmttM+PKwxAkbV2i5UzFk5R1JLgar0sGoKXEDmTJPRtiHS76MKrbnyshNflDJL6N/8t/VSGoJBSbmc+exvD/muEoCNJCzthMkZieV+OaS048/9kedTSjtj2+IXCoptSyQLmit88mljQpxLFjOmKUA0u8m/77Joks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753451383; c=relaxed/simple;
	bh=qZs/QkvbrP1sqGRKRNmDs6ZTVRRgIumdd3Isd2KU+OM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzxjA3EciWuUaL7Pwb/XAVsdO1rKEJxFjSg8IQZrCDI76KqGqlKM8SvxrK2UBbldqXcWuAodL40rzOP5pQfkQzcao7JvXUJMMas9ajArcDk3YW1OjPpeuVAdybgR0Wn5AFs8x9oy99wX0lP4pKEmusdTDKIrW3YSONs0oBBQZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 124DD80741;
	Fri, 25 Jul 2025 13:49:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id B19D53F;
	Fri, 25 Jul 2025 13:49:35 +0000 (UTC)
Date: Fri, 25 Jul 2025 09:49:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 2/3] tracing: Add a tracepoint verification check at
 build time
Message-ID: <20250725094940.4d976695@gandalf.local.home>
In-Reply-To: <20250725025213.342188378@kernel.org>
References: <20250725025149.726267838@kernel.org>
	<20250725025213.342188378@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B19D53F
X-Stat-Signature: e484x68g97bgb1kac91t7xnkayw7indm
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+txAjRhzIoMjhYtd+blQDfOaaNLxm8xrg=
X-HE-Tag: 1753451375-528559
X-HE-Meta: U2FsdGVkX1+JHt8b0P4TJ/s7aJL6nhLJC2sibAEpOKppgGjLWCBYNXdv28QWkn/TMtekYwwWzDD3t8Hkx8npueqnyNyKS9wjswI5r1VJ15Sh/OCAXJyA9hFP7rvDOf9dis02SUVHx0IwhHfosBn1ZwTKoO9SjUUnCb4Nc/b9eY0yLj0bE1uWql9KbzJ1gqNhCzaRfdd1C5S6pEkOLAa904qGk3/OYNN2ZifcPvct1js1penxiJp+jNjZIsseBZATD+BULLBaEpDXAI5b3PXxiipr1bNneoMyayYlpVZyhBFs3Hi9SRMVczfqjBD/71px4am7uju1LROUQ7fnk10ZOqEhFWKl7Rtr

On Thu, 24 Jul 2025 22:51:51 -0400
Steven Rostedt <rostedt@kernel.org> wrote:

> +#define for_each_shdr_str(len, ehdr, sec)	\
> +	for (const char *str = (void *)(ehdr) + shdr_offset(sec),	\
> +	                *end = (str) + shdr_size(sec);			\
> +	     len = strlen(str), (str) < end;				\
> +	     str += (len) + 1, len = strlen(str))

The second "len = strlen(str)" can be removed as the len = strlen(str) in
the conditional will work for every iteration too.

To keep the "end" from being declared before the loop, I had to have both
str and end declared in the loop as "const char *", but that meant I
couldn't initialize "len" in the start portion of the for loop. I then
moved it to the conditional portion, but forgot to remove it from the
increment portion.

The above should look like:

	for (const char *str = (void *)(ehdr) + shdr_offset(sec),
			*end = str + shdr_size(sec);
	     len = strlen(str), str < end;
	     str += (len) + 1)

-- Steve

