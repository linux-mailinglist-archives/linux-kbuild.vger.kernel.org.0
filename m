Return-Path: <linux-kbuild+bounces-13285-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN2xNdYCDWoUsAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13285-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 02:39:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC8586519
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 02:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A112304D90F
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 00:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9060C1A682C;
	Wed, 20 May 2026 00:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NY7ctBWR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7713A3F7;
	Wed, 20 May 2026 00:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779237585; cv=none; b=ZMpPM7o6A2/nC0RV+8RhKuqNngILqwouapQ9VpK8nPocWi7eYQaUrh7nzt0LRceMypZYOr4EbxiGZCktSDxZ3uU5LqgR/l5NC534LvWFfV4Irfsh+QrmPUlrHXLJBY7HaKwhICkAbt/EIJqZ3L1/RQDf+SfJx9y5/bJWiLZcV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779237585; c=relaxed/simple;
	bh=AgE6tk9WMETbnkbH25CkjTbMBtpxOfXYW0CR0pvPHgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5Dc3S9nKxDxQagySRvskSJAjBtVg9qZfx7xNUKQtyVPpZDpQ56DB4tOZ7517GnjxDvYPYJUoHnygZGMBbZSDOarFxwSpx1Tsf37Ter2cv54EqPxaTJ6QTGIl6kmPS/9OqGfkXNTpKfDRlldagXvOpDrbAhu3efV/y/wn0ZnzRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NY7ctBWR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0G2eXTCZw4FHW6cECifnqgBvninOCxXJTtfFF63s7tA=; b=NY7ctBWRN0PKgAB5MpSw4ph0S/
	WXVifmjAsk0A5f6Drj1L/Zw5hr3XTJ86u+yYCSP5Ue229sJNwnjq/lXY18Z6vfU4MhfmYzmHJcJdO
	uI+qsbu0OlU0et2O7jXNSCHGREym90CE0Xz+Xfhs1s/4ODVQbxvLYoOKWzk+gs288qOJkGPNJpAaq
	01CFI207RhyKjAl0utWO/sCP1m710wfFjkpDoHYO2R9kLRncUtLDNZXvX8RV3bVe24NhSeAJY7F+p
	I8W1hPtI4g8uBdPe1A2AVof8ukXTB7NRIwM5pJrfusoCBEMIrUpDQguo4lzRoqT86TIzphVjMumAn
	L1JFezHA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUyK-00000003AMa-3M59;
	Wed, 20 May 2026 00:39:40 +0000
Message-ID: <423ffdf6-fec6-4165-8c27-8c729558384c@infradead.org>
Date: Tue, 19 May 2026 17:39:40 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: add kconfig-sym-check static checker
To: Julian Braha <julianbraha@gmail.com>,
 Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: nathan@kernel.org, nsc@kernel.org, andriy.shevchenko@linux.intel.com
References: <20260519215804.84025-1-andrew.jones@linux.dev>
 <e0ee7e31-0f0d-4dfa-acc4-c1822aa031da@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e0ee7e31-0f0d-4dfa-acc4-c1822aa031da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13285-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: 27AC8586519
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 4:59 PM, Julian Braha wrote:
> On 5/19/26 22:58, Andrew Jones wrote:
>> The checker also warns about uppercase N/Y/M used as tristate literal
>> values following the same logic as checkpatch.
> 
> Hm, I tested this out by manually adding a:
> ```
> config KCONFIG_SYM_TEST
>   default Y
> ```
> 
> to the end of the root Kconfig file, but the script didn't actually
> catch it. The hint about casing only appeared with the 'N'.
> 
> Could this be a bug, or is the Y symbol actually defined somewhere...?

It's defined in a test file:
./scripts/kconfig/tests/choice_randomize/Kconfig:19:config Y

Could the script be seeing/using that?


-- 
~Randy


