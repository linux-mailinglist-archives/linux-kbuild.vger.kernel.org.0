Return-Path: <linux-kbuild+bounces-8550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8AB2E690
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 22:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1BE91BA6681
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 20:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA905296BC9;
	Wed, 20 Aug 2025 20:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sJ3houIp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F3019007D;
	Wed, 20 Aug 2025 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721671; cv=none; b=RdS2czNr8Fc3+E21VkhTrF0UyA3Wp7Jbqytzz1FYcYPQoh8uqPrHN1flchnuBMAvv0IoXAatHOf7lyOAvXWBUkYAsYr3LuF4o27k/Rl37YdXi0vXY0t6k0xXrHj5AfdNT9SaxqiQuPgwyRom/ehvUfYM194ymlXHHWlr01rcbR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721671; c=relaxed/simple;
	bh=fbZVErr+jrSnq2ES8rilg3sKhbTRz45P1lCsOuC6IEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbCNPo0I8f8OoTbOm50uJosw2DeEcH5oRf4RR4MR/C1lZj/guIxYmP5Vt8aWUsbg+6SwvSHzaiD+HJ1nZgr7/nDYDbPqGwEAcw7vKNZ4aH5oNlmYACCq1GMbh5Zb1MjJ2ncw3XZ71S8V6orw2KZVj1iXbP9s+zlj3UonrO8YQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sJ3houIp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=FUb1tLLRzQ1GoNSXB0kGRoR7feLn3tR7Ad06LpJWUTQ=; b=sJ3houIpoYJPiWJu8FTR2WO0ze
	ZeTj/gvUh7NlGPM5LtBOeOBea6gsSKHI+A4F0dAxKHBng6Bh+vG67q59eBPiEqUCw2SEZ+2GJmlON
	Vhui37v0wDf55hGgTxM694W0jTiQEhmWC/8uwCCH03sfbyMiGaOqB84rUhSLEd07EIIr6I8EAlAYI
	yRVPXMZ8AtAmC8q4y1n/opH1FUbHf+4dcU324ALM6IyS0rKarRE+V4cstgdQ2cIH7q6JAOlVBFLxN
	PKFPT0MkHA0OGR7MG85ZWBqWAegGIYKVQLY+ci8AvvkZs69pNMUFKQovqtJOkIiDhVhnpACtlIP9t
	8EqgVH2g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopPQ-0000000Epoy-2v3P;
	Wed, 20 Aug 2025 20:27:48 +0000
Message-ID: <4d76d8e2-cc00-40d0-851a-fea29b228438@infradead.org>
Date: Wed, 20 Aug 2025 13:27:47 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] tracing: Add a tracepoint verification check at
 build time
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250820174752.684086778@kernel.org>
 <20250820174828.080947631@kernel.org>
 <88b25b9d-911a-4419-b1a6-e6ae38d499ba@infradead.org>
 <20250820161914.73bf78ea@gandalf.local.home>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820161914.73bf78ea@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/20/25 1:19 PM, Steven Rostedt wrote:
> On Wed, 20 Aug 2025 13:12:22 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 8/20/25 10:47 AM, Steven Rostedt wrote:
>>> +/**
>>> + * for_each_shdr_str - iterator that reads strings that are in an ELF section.
>>> + * @len: "int" to hold the length of the current string
>>> + * @ehdr: A pointer to the ehdr of the ELF file
>>> + * @sec: The section that has the strings to iterater on  
>>
>>                                                 iterate> + *
> 
> Hmm, "to iterate on" sounds better to me. :-/

Sure, I just meant s/iterater/iterate/

-- 
~Randy


