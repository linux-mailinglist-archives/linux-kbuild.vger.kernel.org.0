Return-Path: <linux-kbuild+bounces-8344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F6B211FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 18:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B996E14D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 16:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A696296BAC;
	Mon, 11 Aug 2025 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OUagfL/7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9E1531F9
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Aug 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754929215; cv=none; b=LMsOmaAFWe/QE68cB7RGfNG+tf4xfd4WOIlkXdnMbDLM9hO0L576QWUPvknfun9tvb4fokCIov0NKaG7VKFCkJlY2jJojMu2gE9Ki7QCU6wCVy4DD5LQAkEPAcfVjeTy2Q8Okgpm15EK9YKhScMcgena060VzDNtZXacF6Lu+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754929215; c=relaxed/simple;
	bh=zabansxPhYnoj7w2vg2VzK37/rJZROr7lswm4ad8Sk0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Piv7hNukAG2qW7ezIrW/ltdp5C9pRusYzBkb7nYXWXKqxB7vj3Ct2JbbObWNmj4MfT3cFh0KBRRNNm+UUvwAF/XRsRw7WxHIFu8mGPwcrTNZEfnm2jD4CU6lz8Zl0GpTNsL7N+1ATzOyIhpEWiVMXwRPscJzTdYF0fN3R6Xon4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OUagfL/7; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754929211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vj6dOdTXrXnPZ0bJXLh/iJrSEfu0GL8+vxSQDSGqTlU=;
	b=OUagfL/7GSWr20gP9So9fRsfiAGy0BtEbzQzbAQ9Pe3Zc6QqmOujN+C+dJzwySYxwgLhI7
	gWU4r72PUmoy7umKokrDaMdfBbMRdDckyhKusy/XwyJvZulURPfAliKiYqHMCtnDVC9a9l
	Dj37eHaX730NiglGbe8MPYwNeUAH1n0=
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] kconfig: nconf: NUL-terminate 'line' correctly in
 fill_window()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <4B3C8558-81F3-4965-A09C-CE07D6A5FF4A@linux.dev>
Date: Mon, 11 Aug 2025 18:19:56 +0200
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 "nir.tzachar@gmail.com" <nir.tzachar@gmail.com>,
 Michal Marek <mmarek@suse.cz>,
 stable@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C491DBC5-8891-4ED5-9869-A91A60978AFB@linux.dev>
References: <20250810142239.120294-2-thorsten.blum@linux.dev>
 <98b4d33c-24eb-4034-82ce-e88e85f8e6f2@gmail.com>
 <4B3C8558-81F3-4965-A09C-CE07D6A5FF4A@linux.dev>
To: Franco Martelli <martellif67@gmail.com>
X-Migadu-Flow: FLOW_OUT

On 11. Aug 2025, at 17:08, Thorsten Blum wrote:
> On 11. Aug 2025, at 14:51, Franco Martelli wrote:
>> Is there a rationale behind the choice to avoid to use snprintf()
>> in these circumstance?
>> Preferring snprintf() you will not have to take care to
>> compute the position of the NULL terminating character of the
>> string, it's done automatically by this function.
> 
> I looked into it a bit more and I think we need neither strncpy() nor
> snprintf() (and no temporary buffer) because this should be sufficient:
> 
> 	mvwprintw(win, i, 0, "%.*s", len, line);
> 
> Unless I'm missing something, I'm happy to send a v2.

I submitted this as a new patch instead of a v2:

https://lore.kernel.org/lkml/20250811161650.37428-2-thorsten.blum@linux.dev/

Thanks,
Thorsten


