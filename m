Return-Path: <linux-kbuild+bounces-8168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72584B11F76
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 15:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406EAAC0F3A
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 13:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2CC1ADC97;
	Fri, 25 Jul 2025 13:41:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0501BF58;
	Fri, 25 Jul 2025 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753450883; cv=none; b=ub2hZRRkLDmos6h+8k0P76hSV2H3mXmtH1YFRNln54xM22+cGq0DClPN9/mGzzgkAM2EeffSzFC7QUZ+ZBpAzDe5H9eYZVsev18Uui/EPMeVIKo+ymYMxWa8ent08l+7JF70Lajs50u+NFxYzM3iGFGd3YzLvD4feD/ajDrXhFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753450883; c=relaxed/simple;
	bh=kfH6fjRAy1g7mtemSw3tL6L5tX3YC+GPOTlyThw9MDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTFgmu0H524niTVRHlMqj919qiK1g3tKJxNHtOwnYFE+/TUsbdixXR0P1XtijxgqHQJWuzmZvRUDi6RWeFnPCUhZAlUy6zVBQCMuHY8tIO+L3p6A35xWojaDKqc4Rsuvwk5PS6NVpycrCZIySRF11WSQUA/2l61yPoWgra497cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 9C0BDC0782;
	Fri, 25 Jul 2025 13:41:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 6A72B2E;
	Fri, 25 Jul 2025 13:41:16 +0000 (UTC)
Date: Fri, 25 Jul 2025 09:41:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd
 Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 2/3] tracing: Add a tracepoint verification check at
 build time
Message-ID: <20250725094121.1521e14d@gandalf.local.home>
In-Reply-To: <a1f2f201-61f9-4564-b0c8-45c4d912bd00@efficios.com>
References: <20250725025149.726267838@kernel.org>
	<20250725025213.342188378@kernel.org>
	<a1f2f201-61f9-4564-b0c8-45c4d912bd00@efficios.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6A72B2E
X-Stat-Signature: ure1t647ois4fo38k6rhy4c9uqmurmty
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19uRVuGWgLultwAjkuw7HeTwr3zo7f/01w=
X-HE-Tag: 1753450876-168812
X-HE-Meta: U2FsdGVkX18cFM1KCns0Zb/ASBckcdVX8VeKxGTJURpIdH9biMAT2L48LOIYy3OHLgMzYAOj26l337EeYDIo/Fb0BOaGFvutCbaYbyhLGzPrp10ktyWyk8lSHxUI7TRN6se+ynPIAG+bnp83UIIlqIgE4Cri8jxn4lJmBU0z+p/oodJqYlbUNfHhzAjSrjh/XkfW+9dIY5fYVoHlUZx/clKQkOdJuoI9JSwk1BeZdP5P0W97zprRznFrGQqYXqDQ3TNbbrRXvrSdtnPxsec417ZSlBQyhYQR5LJrdMb9+X+b0e2KhB2ni0jR27L9I247e1JteGZD/NWMEHPIiDmsK/7UHzdgcwfCg26lWe6+HX7Ca0EOWm5uPaNGZ4pPAkMb

On Fri, 25 Jul 2025 09:15:34 -0400
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:


> > Add a verifier that injects a string of the name of the tracepoint it
> > calls that is added to the discarded section "__tracepoint_check".
> > For every builtin tracepoint, it's   
> 
> its

Weird Al would be ashamed of me!

Although, you shouldn't delete the word that comes next in your reply, as
I can't tell if you were correct or not from the context you kept.

> 
> [...]
> 
> > +	/*
> > +	 * The __tracepoint_check section is filled with strings of the
> > +	 * names of tracepoints (in tracepoint_strings). Create an array
> > +	 * that points to each string and then sort the array.
> > +	 */
> > +	for_each_shdr_str(len, ehdr, check_data_sec) {
> > +		if (!len)
> > +			continue;  
> 
> The len==0 case would be when this skips section alignment padding when
> the linker decides to align the beginning of each .o sections, which
> ends up appearing as zeroed padding within the resulting vmlinux.o
> section after the individual sections have been stitched together, am I
> correct ?

I'm guessing. But when I walked through it in the debugger, there was more
zero length strings than strings with content. But it had all the strings I
was looking for.

-- Steve

