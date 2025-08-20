Return-Path: <linux-kbuild+bounces-8548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D96ECB2E63F
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 22:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4C485E48E3
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 20:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A690C28134D;
	Wed, 20 Aug 2025 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XOa5qIBJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A6D27B35D;
	Wed, 20 Aug 2025 20:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720748; cv=none; b=tV8gtya3TCG1MnSUkQOpUIjlJhlGu6wjuKE87+RhSXgGwjWa9hBX5DiyiK4xuQcCqG5VD7C2XY3niZ1kJnhqwTk9dAD6ldYV5A7qgB4sjhNVffGALM5s+yDGzF9k+3JihPODMValNPkXDuM1sc47G4W/Kqw4K/+AQmSQLxJCVlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720748; c=relaxed/simple;
	bh=zqcGJSspxf5zinFHLK4gHoVtE4aWtBICsxsjObTEl5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRjGlw5Pd9dxvB+/Kc9Z7vQHlYnQldNb82Cfq6VQ00Yxdic5Gv5gtROzf6jE5kzl8z3CHMmghSXW25mxsiBpOhl0IEIt+m/aUfCadpBwxUcpR8nBFMOk8Aecim5SUJpSJ8t7VvDAQYFF9BKVP6wFOJLuAR3BJAfK2egLkiC84/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XOa5qIBJ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=W63MMTMvmB6dl+5eT7CKL9PFuVf8rs2QgB8pzsAzX9c=; b=XOa5qIBJdl6XTEe/8bgT4qMTos
	EKVXS392npmS7iFDjpxCNXng7NCyyB8fvbGTOQmU3PbVL65tdZ0rvNmpgeaW30dxdUUsqsFdJOb5b
	NfT7fd+6dMOApjUSdxjzI5GXyIV/56KojG7wkJUMYpmIE56p1FG3R+FoNhAQ6r2lBZ/7bhF3wJFDn
	oZKmke2+o79yG5/VEPIILBVnYlcdlmtGShCId9Ce3HQA/IFINsqFu0meMDMEOyAx0RmBUaK4uh2ia
	NvU0NNTn1Ki2gd3/yvNgtCtFZ76fWNEaG1FLm9RnXYm/kwsfqg0zu7gR0SUdyOgmHQHNYmIt3hOYA
	gDyT5Ang==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopAV-0000000EoWf-0mFq;
	Wed, 20 Aug 2025 20:12:23 +0000
Message-ID: <88b25b9d-911a-4419-b1a6-e6ae38d499ba@infradead.org>
Date: Wed, 20 Aug 2025 13:12:22 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] tracing: Add a tracepoint verification check at
 build time
To: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250820174752.684086778@kernel.org>
 <20250820174828.080947631@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820174828.080947631@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/20/25 10:47 AM, Steven Rostedt wrote:
> +/**
> + * for_each_shdr_str - iterator that reads strings that are in an ELF section.
> + * @len: "int" to hold the length of the current string
> + * @ehdr: A pointer to the ehdr of the ELF file
> + * @sec: The section that has the strings to iterater on

                                                iterate> + *
> + * This is a for loop that iterates over all the nul terminated strings
> + * that are in a given ELF section. The variable "str" will hold
> + * the current string for each iteration and the passed in @len will
> + * contain theh strlen() of that string.

              the

> + */

-- 
~Randy


