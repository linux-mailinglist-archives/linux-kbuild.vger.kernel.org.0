Return-Path: <linux-kbuild+bounces-10869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCpdNASrd2kZkAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10869-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 18:57:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5A8BD28
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 18:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDB5C30541E4
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 17:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F00330B07;
	Mon, 26 Jan 2026 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SVKdc93P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A12356D9
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449945; cv=none; b=DsatYJzrkvmdM4iSWjuH/e1avwjB5cLFaIiZxLT0XyxzEHUlZ4Q85G5kKn2BbIGy3frNledJWoExzVZH8HK8/2YWmwrIKST7fKP6kUj0PfAar7klO7sqYwOZmJ4CNsG9tRzblgBftaACknT+MPLF432uWmbKQcduMJeFQ0ppTuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449945; c=relaxed/simple;
	bh=gzMLyBPSy5DTCUWVnle07j/YiPoILJ5CqsTzOuPNF98=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OKZI65cIyRQKRUeImfmb91a7hIe4LUEcfN7qc8hFX5C6FsErKYw09fckx5eOPBuLeRqhFmyD2G/1XfWJoZsEYeA/7mNl06BBdnvB3usZJ4RoRi2GLusKTtC86a5P1a7LI3sKNIvyy4dwzGeSCeHaoof4ONF3OOsFi/gUjwePovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SVKdc93P; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=2vWNbzqgmZ0ZwcCjiUSlnwEK6ZSJzeJ6M78M3Z8E9D0=; b=SVKdc93P5TdWAWeiCDKHcr0+zm
	dbolUq6A0w6Y/uZeOfPPQ5WVH4aZkER/RSqiefgVjsS//AvRTo6VaDmbd0Hy2rwZpLIDuxIGfjJj7
	DfzDQ1gjdqpDLRcChyQz7uUI1IiyLXwLjlkh5OCPpNh5BTh/24jtoRlHAdxZ6wCef48SolIXZZ5Km
	Ew66B4aXxUsODWl2ycAwiEmsDcYwr1dT6FTAmTTfhhRZqWNuNpordSS9zXU/S6dumIrn0dItDGb6v
	5mCIBg/OXpxYsjJi7xhl5prMOeBeChBmD+0cRPkSQ8SCacu9R86GzFf8kIO8szMCK0FvYcvVpkcZ6
	mDRfAPcw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQlA-0000000D189-3aTo;
	Mon, 26 Jan 2026 17:52:21 +0000
Message-ID: <2ad44cb3-2c17-4808-987e-a4b98a9601fe@infradead.org>
Date: Mon, 26 Jan 2026 09:52:20 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: make olddefconfig surprises
To: Song Liu <song@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 linux-kbuild@vger.kernel.org
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
 <20260123205359.GA95167@ax162>
 <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
 <20260123234418.GA206716@ax162>
 <CAPhsuW54fjr1tP+khcMYQ3qTjN_Eff_rm0dM4h3=TpFVwAdh5w@mail.gmail.com>
 <aXUfOK38XIapv1Ak@levanger>
 <CAPhsuW4xCmGu4g2N7eBzR4tt4yFffWSAjr_dQvUzkUvQAspvTA@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAPhsuW4xCmGu4g2N7eBzR4tt4yFffWSAjr_dQvUzkUvQAspvTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10869-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2CB5A8BD28
X-Rspamd-Action: no action



On 1/26/26 9:17 AM, Song Liu wrote:
> On Sat, Jan 24, 2026 at 11:40 AM Nicolas Schier <nsc@kernel.org> wrote:
> [...]
>> Have you tried to use something like
>>
>>   make KCONFIG_ALLCONFIG=whatever/minimal.config make allnoconfig
> 
> Hmm.. This doesn't seem to work (or I didn't get it right):
> 
> $ cat y.config
> CONFIG_LIVEPATCH=y
> $ make KCONFIG_ALLCONFIG=y.config allnoconfig
> #
> # No change to .config
> #
> $ grep LIVEPATCH .config || echo no LIVEPATCH
> no LIVEPATCH

You still need to supply all of the dependencies.
We don't have an in-tree kernel config tool that will automatically
set all of the dependencies.


-- 
~Randy


