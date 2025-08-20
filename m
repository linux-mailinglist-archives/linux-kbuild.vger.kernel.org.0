Return-Path: <linux-kbuild+bounces-8549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CBAB2E651
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 22:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C751C847B0
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 20:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1C328B4FE;
	Wed, 20 Aug 2025 20:19:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271CE2877DC;
	Wed, 20 Aug 2025 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721162; cv=none; b=i5xulo/L9Utd6vIWoL1nFqBuNQrMoHrdXZb/lr4f5B58TDVE1JdH/yGppDoEwKNPWidQq7PjDII9R3kY2sD/J0wKZ/WEtgSyN9+j+CbeFAvAjvaaQ7tIgCZmZOX2XAn54HOg+aCcEb1ew9zMLcJ9xQ8Bq6uZdeOt/AMtC5cNRVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721162; c=relaxed/simple;
	bh=FxfYt1RwXHnaAJ6Ugd+62CsLM+l/HaMfWmYFXkl+UKc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPRAnBRFQXVmhChPdeT6ZAyQUOnHLyHG8zKuvKW4gqQPsiOQVutfb1ch/i/AKS8vx5xBG5VAlbiyqsZJ9OZPtXlielu/6xjRsmJRnvIarztka+yoUI0FM8Wywh4/iqbx1Y8Xv0DrP0NBbCQdrvUhKFjr2LO2M/UruKe+QBatHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 94D0CC0132;
	Wed, 20 Aug 2025 20:19:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 61A0020027;
	Wed, 20 Aug 2025 20:19:12 +0000 (UTC)
Date: Wed, 20 Aug 2025 16:19:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v6 2/3] tracing: Add a tracepoint verification check at
 build time
Message-ID: <20250820161914.73bf78ea@gandalf.local.home>
In-Reply-To: <88b25b9d-911a-4419-b1a6-e6ae38d499ba@infradead.org>
References: <20250820174752.684086778@kernel.org>
	<20250820174828.080947631@kernel.org>
	<88b25b9d-911a-4419-b1a6-e6ae38d499ba@infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 61A0020027
X-Stat-Signature: tsmjxphye7d1carte4xh9p9j63nketyn
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/9sMJ3IiG4FSW0wxNXZ/Kn9oU82qkDAjI=
X-HE-Tag: 1755721152-565517
X-HE-Meta: U2FsdGVkX19oFt3CBo23lBChdVH8dJj02O7xSgxI6g/LjV0vK8AjbS3CQ5ZP7DYYdL8ovPonhJhCjy1y+gHipNWQDDxfjkm/k/1wYHT1/FuYSUw2hNeW9/HOi51CiLasJKKj3Nt4YNm6qMBUl2wtrYopvJYnkynxvWDm65RBNDrKoobpdkOX3TSXTm/eaGUHTbW6p31Hpm1rdpB8KYtNDwZ+77D0xVzVxUnZ/Pmeo7o78FNMF/QPWcCHc94xj+/Qh8stswOQ7NNk7LwKWsmcNGntcfvNzEhpeIXOaAmfaPga8Fq2L2oVSK2hNSlEW7UWSC7b39CzjrLS+9LM/p5vKvvMJRLqD4BdUN08SZPiyM+76SJEIuDn5t2eDXL4js6+t6Z72hOr6qf2KwhAN3TYpA==

On Wed, 20 Aug 2025 13:12:22 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 8/20/25 10:47 AM, Steven Rostedt wrote:
> > +/**
> > + * for_each_shdr_str - iterator that reads strings that are in an ELF section.
> > + * @len: "int" to hold the length of the current string
> > + * @ehdr: A pointer to the ehdr of the ELF file
> > + * @sec: The section that has the strings to iterater on  
> 
>                                                 iterate> + *

Hmm, "to iterate on" sounds better to me. :-/

> > + * This is a for loop that iterates over all the nul terminated strings
> > + * that are in a given ELF section. The variable "str" will hold
> > + * the current string for each iteration and the passed in @len will
> > + * contain theh strlen() of that string.  
> 
>               the

Oops! Thanks.

-- Steve

> 
> > + */  
> 


