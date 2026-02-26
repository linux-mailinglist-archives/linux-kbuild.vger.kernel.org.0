Return-Path: <linux-kbuild+bounces-11444-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKK8Mb2jn2lfdAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11444-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 02:37:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14319FDAD
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 02:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F04B53009F11
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 01:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2B636F409;
	Thu, 26 Feb 2026 01:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TdXwrR79"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E836F43D;
	Thu, 26 Feb 2026 01:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772069804; cv=none; b=kzVaGjNnejXju70gM/SLxJ0tKcMGwu65suTW9gA4zaS0TZLuH9TzgyLRmAvh0LWCcjo7CuMCv6XUbjPH6/UbTVbuDdHWWhiQMFFWvodd28ACNt6uLNhKrKxDj2N7RTaD2A3SB0P3Ra6MtgeYLtgqVh1On7WZviPSU57yprTE2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772069804; c=relaxed/simple;
	bh=LRXBLkgeh8zF6uQEXLxQSZMtJpw6YopQGZe3FkQpfpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnhgPAZbhLkIYQ3kLZXXYkfasFZFJTNKag+neacgqLy6vZsfuETKqv9qGUsCcuz6ueSw5ZmKMnqZHOH5m+vv/KL1/qr79Ee1WYBY6lxjTyV+VFo7Y8Gk8Yw7MJ0h9ygXtOVYYPV6tV8SWwnedUMJxq1Toobuafn7MqPolx9ulJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TdXwrR79; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8suZ31zzY3Ppbic1BE0qzK+xmwyQjDiF2cYN0MnZlJs=; b=TdXwrR79zLQkmk1pzB+cbm08dp
	fS+RtoCq+ga0XCDXQMpXTZLhX2hWC6YKov/jJidG8dEeiu92PYmjYPrheFn2oURoME2r1BVli5ys4
	mTLrZsuybc61xyUhW7qowl7kUxXCQ1yJlzMhsQBzduQjoelMGEBISxzWcdSP2d8zYymoY1PK+S/x4
	/qbK5QHBJmfT0ItnVyFBNqsT6HrcwGlseBIw+ad1pdAvWjpPldQUgF78sCLwBIzN5iPO5gn5JfD0S
	54tTtmLaiZdSN+mkvbbu6yiIoluKtfoXsAl6EcmNPdzjpK5lFNlyu1Gx2djizK4bb+2rTAkFh9i1I
	JF1MQCtQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQIx-00000005CJn-1I7J;
	Thu, 26 Feb 2026 01:36:39 +0000
Message-ID: <a1a8c33e-6e2c-4766-b7d9-b393204ea373@infradead.org>
Date: Wed, 25 Feb 2026 17:36:38 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: Denis Nuja <dnuja@enakta.com>
Cc: linux-cifs@vger.kernel.org, linux-kbuild@vger.kernel.org,
 stfrench@microsoft.com, Ned Pyle <ned.pyle@tuxera.com>
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
 <2cb12a60-32f1-4656-8a9f-305bd0be069e@infradead.org>
 <c7fda6fb-5095-4fd5-ad1a-22319bdf0d4b@infradead.org>
 <CAGk60SEw7xgSLc5+5EhgOnZkC6PTx-N98R94t5jQZ4wZKRVfkg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGk60SEw7xgSLc5+5EhgOnZkC6PTx-N98R94t5jQZ4wZKRVfkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11444-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED14319FDAD
X-Rspamd-Action: no action



On 2/25/26 3:05 PM, Denis Nuja wrote:
> This was tested on kernel tree of SLES 15 SP7 running
> 6.4.0-150700.53.31-default.
> 
> Randy could you please confirm what is in your config for :
> 
> CONFIG_CIFS
> CONFIG_INFINIBAND
> CONFIG_INFINIBAND_ADDR_TRANS

CONFIG_CIFS=m
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_ADDR_TRANS=y

> 
> in default builds of SUSE (and probably ubuntu i will check) it is :
> 
> CONFIG_INFINIBAND_ADDR_TRANS=y
> CONFIG_INFINIBAND=m
> CONFIG_CIFS=m

Same as mine.

-- 
~Randy


