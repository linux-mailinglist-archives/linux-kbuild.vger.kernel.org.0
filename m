Return-Path: <linux-kbuild+bounces-13607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QAc7A6JaJGp65gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13607-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 19:36:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354F664DF8E
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 19:36:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ravnborg.org header.s=rsa1 header.b=cuD1ps+r;
	dkim=pass header.d=ravnborg.org header.s=ed1 header.b=MEmkvMHO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13607-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13607-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D7E53013A46
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2026 17:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3DF31619A;
	Sat,  6 Jun 2026 17:36:21 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812D2E7367
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jun 2026 17:36:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767381; cv=none; b=pcPXgKeXrYFLHrCaGaZI2OHCUkXkGmdHF7cw5ZEOao5vsr3tYQ80VCmwQRTt9s7kL1QRWimCnMlg5t4/GZjpPCIdFDtpe+r4NIg5nk8qJ2DsMz5q5ONSSA7yjx+wdUyZvEqH1hLp8gWoAPwL7X4ronb8/SKljnPT+UdBk2SPkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767381; c=relaxed/simple;
	bh=3LoRZRoSOHCgp+5a+buMDm9erlhghHI5iUQWtrzHpQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjay++fScmGy0Azx7Y6R/CW0yow//ZndgXQhypovOQfsJ6F1QhRMBu1VDH+lBNAzCKLRY5YZKao+4HH7pUBnhzrhJtzBBXNlz4q7f+83Y64NZTDQHpjSwr7oUjHUXpHYpfv6NqzJFRScJ9oTSXWb7vmKwc9720IytKdUk7idJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=cuD1ps+r; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=MEmkvMHO; arc=none smtp.client-ip=46.30.211.179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1780767375; x=1781372175;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=UwuPKkp/1Eoa4Wex/pCeqBtMKPqSjTxPON4LN+hbyUE=;
	b=cuD1ps+rPMX8D3smFmDJsBny+gqi3kJVGIjpMkxr5ozFZ4RTV/97S+OvTaZdbu252Yx3RL48jNH+Y
	 zE7+ym3sep1F6ps9qx6xYop5K1FgsOf1g9mr1gkFIkRMMS1Xuk/4jb62OagV+NcJUnm4A9BsMw2heT
	 PwDlqROt/3+86SyKjvWuFqYZk6SpjxCVeQ2Ysn0ZUCdh6X23qrXuirYTca7mO/5iFMJaMt4Xc2dyjH
	 bbB0IyS25YITpjUCFRWhU9yaMPoXwWw9FrcMNRRuhN0xK43TImkDAESh0ToIk0btWvctQD9vvsTTHo
	 Fd08iWYy3CUboexHMH6vhelgH3L30kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1780767375; x=1781372175;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=UwuPKkp/1Eoa4Wex/pCeqBtMKPqSjTxPON4LN+hbyUE=;
	b=MEmkvMHOTjSUjnX+BXGsnjAbx4mp9gvhLAtbTg1GNeaBqGMtI1bzx1sTIDZHXNBUO697T3hqhA2si
	 /UODVROBQ==
X-HalOne-ID: 35e9c283-61ce-11f1-be0d-f7376af24660
Received: from ravnborg.org (unknown [37.97.11.187])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 35e9c283-61ce-11f1-be0d-f7376af24660;
	Sat, 06 Jun 2026 17:36:15 +0000 (UTC)
Date: Sat, 6 Jun 2026 19:36:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org,
	masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: warn on dead default
Message-ID: <20260606173613.GA126491@ravnborg.org>
References: <20260606140008.271929-1-julianbraha@gmail.com>
 <20260606142326.GA117482@ravnborg.org>
 <a5d09cc6-2878-443f-899d-dafb286322ad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d09cc6-2878-443f-899d-dafb286322ad@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ravnborg.org:s=rsa1,ravnborg.org:s=ed1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:masahiroy@kernel.org,m:grahamr@qti.qualcomm.com,m:nico@fluxnic.net,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13607-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[ravnborg.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sam@ravnborg.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ravnborg.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sam@ravnborg.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ravnborg.org:mid,ravnborg.org:from_mime,ravnborg.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 354F664DF8E

Hi Julian.

On Sat, Jun 06, 2026 at 04:01:34PM +0100, Julian Braha wrote:
> On 6/6/26 15:23, Sam Ravnborg wrote:
> > I looks redundant with the two loops were we for the latter knows it is
> > a P_DEFAULT.
> 
> Hi Sam,
> 
> It may look redundant, but we do need to check each default we encounter
> in the
> ```
> for (prop = sym->prop; prop; prop = prop->next) {
> ```
> loop against the previous defaults to know if we've encountered a
> duplicate default condition.
> 
> I guess the other approach would be to copy each default as we encounter
> them into a hashtable and check against that, instead? Let me know if
> you have another, preferred approach.

It was just a drive-by comment, keep it as simple as possible.

	Sam

