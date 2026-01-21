Return-Path: <linux-kbuild+bounces-10763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJv+OHuvcGmKZAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10763-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 11:50:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 588765584E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 11:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2FBA84C88E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 10:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E6147AF5A;
	Wed, 21 Jan 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="jI/xZ/wz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509F3A7F46;
	Wed, 21 Jan 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990447; cv=none; b=j4kcb7eQj8VW2PYbqBL1OdFKrdFJuTBjzzzl11oc64+DX1urm09mROAu5pZxtomGZKLuIhNlBV7q0mtysHcnAKTf/H84BTQ08uj0l9FfTYFHCVxRXGC3dLK6IY096Pxv4Sx3X4ia7cqgL/Hq0hW0d6Zb/QvrLQIDzng1bYR3tzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990447; c=relaxed/simple;
	bh=pwh6f5VzaTK/a8Hxv/pzd+4XEZHCMvMiYB2JKPP4yXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=ueWsUXw6pc0gDwi4jAnvzidKx36foy2Ck/NMJ/os19EH0PrD04tkiQotFFqSADE/9sHyq2gA72dqaAwk5cQ40cVffUPBZYExk6/+G4g576NbjuNSXaujX8V/fRhVVuJyex7JLAfe/LZwGL+XlUQZiS8E7Oieplbdy9LTsGbPR8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=jI/xZ/wz; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10C09433D3;
	Wed, 21 Jan 2026 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1768990437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSdVek+3nur9iWZzpy6Ip/w5pyhwEVGS8pZ2EUOfZJk=;
	b=jI/xZ/wzkd3D4gjdSbPX12TmGCEtrWikuLQ0bTDQhy5VWAYUlBL6wXTrwhpApdq6IS17hq
	UfVnLkazYlCeNB6G0/yh9sVKu54HVlxP8zOzl7Tzp8MfTrpuLzl7F8OEU/SFZWZSPnQr17
	6kxfZkFC2IXJdpNxSsgrv78aBWlhftU1hvim/PAMofKdTtFTSrOjwU9PTuB1+Go8hJKQDD
	Z7cHpPKn1qHt9B0V8mADlFgrE1omJ8daq8z/+XTW+Ygj19dIZjlOJrNADIkL9NB8kO2yWq
	ILAuFthHqtElzNuNibFLaw9wPMhc2fAU2JhsUb4aCKbKNEUUSlOIhYNeoUauUQ==
Message-ID: <d4020305-fc95-446f-b73c-5f0be68529c9@gtucker.io>
Date: Wed, 21 Jan 2026 11:13:54 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Nicolas Schier <nsc@kernel.org>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
In-Reply-To: <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeftdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfevjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpefhleeiueelhedtveefheegiedvheevieetvddtgedvjeeljeegffehfeehveevleenucfkphepudejiedrudekkedrudejgedrudegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirddukeekrddujeegrddugedupdhhvghloheplgduledvrdduieekrdduleekrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupedutdevtdelgeeffefffedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehnshgtsehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-State: clean
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[gtucker.io];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10763-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gtucker.io:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gtucker.io:mid,gtucker.io:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,docker.io:url]
X-Rspamd-Queue-Id: 588765584E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

On 20/01/2026 2:54 pm, Nicolas Schier wrote:
> Out-of-source builds do not work on my system with podman.  If this is
> expected, I think it would be great to mention that somewhere in the
> documentation.

Yes, as discussed with Nathan.  So here's the list of potential
improvements gathered so far:

* automatically pick Podman first, Docker second
* explicitly mention docker.io registry in examples
* mention TuxMake available images more explicitly in the docs
* mention that out-of-tree builds aren't supported yet
* distinguish true Docker from Docker-compatible Podman
* add support for out-of-tree output build directory
* add option for mounting source tree from arbitrary path
   (needed for nested containers e.g. Docker-in-Docker)
* detect when Docker has namespace support enabled and document
* add user config file with default images and runtime etc.

Then beyond that we could consider other container runtimes such as
containerd, lxc, runc or whatever works in practice.

> Nevertheless, thanks a lot!  I expect me to use that a lot in the
> future!
> 
> For the whole patch set:
> Tested-by: Nicolas Schier<nsc@kernel.org>
> Acked-by: Nicolas Schier<nsc@kernel.org>

Thank you!  Let's hope others will find it useful too.

Cheers,
Guillaume


