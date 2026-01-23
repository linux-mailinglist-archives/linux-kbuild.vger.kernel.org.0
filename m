Return-Path: <linux-kbuild+bounces-10843-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDrYMIHbc2mbzAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10843-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 21:35:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0A7A999
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 21:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86329300463C
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 20:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7013EBF2D;
	Fri, 23 Jan 2026 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="e/Gixtnk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94842E8B9F
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 20:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769200508; cv=none; b=EQCSGpwaaFB2oka7s4NuD8n9NXLqCnDQqLQMMsqaClV+tH15lCaHEL/wqqpZivO1P0VU5ZwQobadf/T3lENcLPR88QecGpRd2qYUV4JG3Ph1H4wWm7XHsmXe0w3OUQkBOEqBgDpCf6spXBq+9Dh0nckGbGCSC1rbNamN2DBJrGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769200508; c=relaxed/simple;
	bh=v0iIC7VYn3C1+/Ut59jUmcaCxWZ81L6lCPUidRhhwDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOIQP5nZ5LIahm5m0aG/nRnrAwoBt2ZC8BwLQhznRQHNBQ4ftQwWkolms8K1Zeo4RfOd6GiG2oOvBMKqeq1PnHOLmYVxMWUZQC+GsYHPDwUiezfyeudTfkU1se1/9ndnubB85ZSnLeEURVZzZcLJgBigzMi4IdN1pZtffQUMUFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=e/Gixtnk; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6463B44345;
	Fri, 23 Jan 2026 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769200498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvIkaLl6Y6y8Bnna6/wRdKLlONy39Fwhx7zW31G4OWQ=;
	b=e/GixtnkGn8vi1BE3GS/ODePDSUsCBl+xeJfdt/6gF1WE/op75WepKi8bT7ycbZ9zSFFLk
	EaD4FqGgzux8LyYYGai2pOi2EjR9bi/R1gok2GwOnxQfByO96468JcLCxfkp0GC3L1tdo7
	5zqbtLrdWcVNFoC6E/vx6xYfbxc1Wo6ynpt1NfNapj0TUGY4DV8NcfI+Cdd71vDTAt6tWb
	lmMbgfIxvJRIQfJyM2NDS8ck3cMJcWaDV1E2XDCKcONytsf9IYxcgyAHOdAmW8hPsWw9EW
	2sy2s19tCF36b3lM3DdDO0MYnRyhs3d0WyEjJGFfJpvZFNY9Yy40gB3Whn6rPw==
Message-ID: <27e70467-2926-4b97-95a7-d9ca181103d2@gtucker.io>
Date: Fri, 23 Jan 2026 21:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] scripts/container: Turn runtimes class variable into
 a tuple
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
 <20260122-scripts-container-ruff-fixes-v1-1-fd1b928c3f10@kernel.org>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-1-fd1b928c3f10@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduhedttdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedutdelveekjeeuudeiffffkefgvddvjeeuhfehhefgffekkeejheekkeefuefgieenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepieegieefueeggeefgeehpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepfedprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10843-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EBC0A7A999
X-Rspamd-Action: no action

On 23/01/2026 12:27 am, Nathan Chancellor wrote:
> -    runtimes = [PodmanRuntime, DockerRuntime]
> +    runtimes = (PodmanRuntime, DockerRuntime)

My 2¢ - A subtle difference between a non-mutable list and a tuple,
is that a list is a series of values with arbitrary length whereas a
tuple is a single variable with a fixed number of values meant to be
used together.  Say, coordinates make sense as a tuple but not as a
list.  Search results from a database make sense to be stored in a
list but not as a tuple.  In this case, there could be any number of
runtimes so it's semantically a list.  At least that's why I used a
list, now there may be good reasons for using a tuple too.

Cheers,
Guillaume


