Return-Path: <linux-kbuild+bounces-10842-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MQNA3rZc2lXzAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10842-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 21:26:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 651167A974
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 21:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 880EE300D173
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 20:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAEF2DCBE6;
	Fri, 23 Jan 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="fMgyQqnJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89EE2DCBF7
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769199990; cv=none; b=Lxli7eocK2id14esLLYgdKfu4QayT1iN6aSt8QgKA7pC3LdIYNtsruF9Gb7OmpXm2x8Wh/U4KxAfFGaJQ2Vh4xd7zL29NNdmCafc6EL/dCmOoh5JEzmw1OZQuTmi/JSdrzNKNUnGe8yVezhH+nAVY1UCbkIYRAyT9yv/FshHpug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769199990; c=relaxed/simple;
	bh=sStMjbN3UzA0dnIsRccQKJhw1S5Dg8GkOzaqEYeeFqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMO8POqMuSU06prTAsv8Z0gjIolgnhkH85LzozDxqaQ3nYGyFs482K0qqCPsPFlWlxTfyE3K8z4J+pOk7qQACP3eq2MqCQcYN+p99JAgqV6FlEChiDaRY7CBYqQkqNIls2vYm+cyik/W+hWf3/XGZUbJ3qGBzGFaBT+0SJnObwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=fMgyQqnJ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 386954428D;
	Fri, 23 Jan 2026 20:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769199981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtAlkGfhT8yDBesa3ptsO3yTECSDXNSBNJ6EDlneIxs=;
	b=fMgyQqnJ4C0Lihd8gG9f+dupBpyE90dWG898eU58mnMEOGJb4y3YUyBbpCvJLRFNooO2W5
	/MlunH25VeG08URTcUD0+q93u79f3PYWWHw/Bw9ou8Z+yN2YdF5E0X9D19gJRgazYFCEWu
	nCogocvkOXwzYB9rkF+cxELpA8A6bwf4OjpGq1T9I4JqxdGz+5BlV3uKk7j58gV+ZEYKMU
	PHJkftP6285iiriac25I/XOFmn+1IIRXg506uZ9kYHpVJRnYZ04kmo2DMwYlN8L/nUawMt
	+EJuf+CwpmebIGy+nHdXMG14h3mDq7FMPLUNahvWCSiINbzZcHSrcwpbnWlHxA==
Message-ID: <02fe1347-0124-45be-9b8a-7a439ce48a38@gtucker.io>
Date: Fri, 23 Jan 2026 21:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] scripts/container: Minor fixups suggested by ruff
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeelleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedtjeehjeehffevvdfhffdtfeduvdekvdevveelueeigeekueekvdeufedvjeetfeenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepfeekieelheeggedvkeffpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepfedprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10842-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[gtucker.io:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[gtucker.io];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 651167A974
X-Rspamd-Action: no action

Hi Nathan,

On 23/01/2026 12:27 am, Nathan Chancellor wrote:
> Hi all,
> 
> This series fixes a few warnings that I see when running
> 
>    $ ruff check --select C4,RUF scripts/container
> 
> which were the few warnings from my personal ruff.toml that seemed most
> interesting.
> 
> I will apply these on top of the initial scripts/container change.
> 
> ---
> Nathan Chancellor (3):
>        scripts/container: Turn runtimes class variable into a tuple
>        scripts/container: Use list comprehension in get_names()
>        scripts/container: Use iterable unpacking for _get_opts()
> 
>   scripts/container | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> ---
> base-commit: 6eac13c876805f61bbb588eaff5ada0b6dc603e8
> change-id: 20260122-scripts-container-ruff-fixes-4d38fc92771a

LGTM - some of these things are arguably more a matter of individual
taste than absolute best practices but it's good to have a
well-defined code quality standard.  I typically use Pylint,
Pycodestyle and Mypy, not Ruff or Black.  So for the whole series:

Reviewed-by: Guillaume Tucker <gtucker@gtucker.io>

Cheers,
Guillaume


