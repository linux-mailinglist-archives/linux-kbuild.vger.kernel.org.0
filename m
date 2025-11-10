Return-Path: <linux-kbuild+bounces-9545-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C93A6C499A7
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 23:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C3D1881B03
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 22:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800EF305976;
	Mon, 10 Nov 2025 22:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cn8IQpKt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82E2F0C7C;
	Mon, 10 Nov 2025 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762813963; cv=none; b=ofU6bX2jCXnpSgU+y6xkUQ5ev3F4eyjYCcPU09PULpiQz4KOT5UTMoNQzcVUH5Q1IuXZuYO9sf6T9dEwMqxqDMYA7GCqcqMMgCdvFB323+k9Rh+yFnsX9UG30v+sU2lupNExeujppnkKZHFBLBdmFtwzy94hEy3TCgakZNYwzIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762813963; c=relaxed/simple;
	bh=7Yi2FC0Nz/jUUUk2yoqp2/72e3nxtzvJVmGmoKZ5+aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EI8GG48v5/x0AxfUMNnf/gIqpg2lm1vcY0eBXcJYzB/Ix3TfBBOmxItBCCYtqmH3Ts8ckiwQmlECgKi+wt2I5wwJJhJoOzfuUgCDL+9i6IbKC+BAk1FXazB1GlieZ/5c+b5kxN/nRyLaSFDk2AVG5oWSCnGjKVEX6l8/S2xntUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cn8IQpKt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sewhWqFd62I4abwE7fEOWsIQy3YSzUkbQKDocaX8Oqc=; b=cn8IQpKtYYgWm4ODn5q3va4ea0
	zNk8Oc0VIUcjIuBng/JkwYuW0Q3jqjTth2KtgDrBkqDMyr9pPlW6ZHk/FCzD/HLU5ghXN6wigc7jx
	4W7KaGxdV/wSXdtyVIbDWheW6vGSJjngKZHEphNpccJYi3DUg2S9p1Gi9ZIUtaB1l+jxmMUT9Kz/g
	1zQkbN5Cg0X1ppW5j2832ZUYcAfwrqmLsXHPGFL6ROOEp6Rr3y48fcf7vn/HjEKPp0FBqi5PKicST
	lVV/+NvtAI1HtgLbY4RkWZ0lfBPv5BVtyosk6M0BUekFmbZSsuK1ojfkoLh5xjwEtr8m2WYVdzKeM
	PLDKfJfA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIaRE-00000006D4l-0zNW;
	Mon, 10 Nov 2025 22:32:40 +0000
Message-ID: <e355cd63-77cd-42ac-b852-c789ee8c8869@infradead.org>
Date: Mon, 10 Nov 2025 14:32:39 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Support conditional deps using "depends on X if Y"
To: Nathan Chancellor <nathan@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Graham Roff <grahamr@qti.qualcomm.com>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>
References: <20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com>
 <20251109232922.GA2977577@ax162>
 <82317993284703834a7b1d8d5ca05b7c646f2795@intel.com>
 <20251110211549.GB302594@ax162>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251110211549.GB302594@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/25 1:15 PM, Nathan Chancellor wrote:
> On Mon, Nov 10, 2025 at 10:48:59AM +0200, Jani Nikula wrote:
>> "depends on A || !A" (or A=n) is the most common pattern in Kconfig,
>> which literally means "depends on A if A".
> 
> That is totally fair, I did not try to actually search for the idiom. I
> will say I do not find that either expression in Kconfig easily
> translates in my head to "this dependency must be built in if the symbol
> is built in, modular if the symbol is modular, or disabled" but I guess
> that is just lack of familiarity with these idioms. I just want it to be
> obvious to folks writing Kconfig when something like this is appropriate
> to use but I guess with that being the most common usage in the tree, it
> is fine as is.

I haven't tested it but it looks reasonable to me.

> I think my point about tests still stands, at least something very
> basic.

Ack.

-- 
~Randy


