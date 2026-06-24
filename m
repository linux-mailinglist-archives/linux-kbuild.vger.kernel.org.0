Return-Path: <linux-kbuild+bounces-13877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C2+WNmTOO2rgdQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13877-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 14:32:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 495CA6BE259
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 14:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="SaGJ/Htf";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13877-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13877-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 592B13008D1A
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 12:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE63F2C11FE;
	Wed, 24 Jun 2026 12:28:25 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703841F94F
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 12:28:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304105; cv=none; b=rtMGjVJIg5layjBPG2gJ4xOpPtKxSbwZS4yYQv2O72S9O7vCGTOzlX4YggWo6WGDw7e0rVvUkXyq1ng3aLKOJva/48AbmdDwj8e66bjNxCLLrv1CfWeJ1tJVXtHwrYym2Fc39wc+GOKYdQJA5bJkehvWorOB36yZBhQK5tw0S+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304105; c=relaxed/simple;
	bh=HV7ZFu4yf88sKUiyI8sguCKmOgViMnyqSM2w5t7/Sk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QscglgsM8CO4AuyKpARvJR4zkEcDSTVlxRDU84ILFauLCvxc06qHXdRSmCErWi5fzN7DYUU1BSTrjLaYmg3Zs0wb7dkQHZEDoWK/c2hCRl3PGpRQBuj14cx+jtiInFA85mk3Eb66Yl1CkD/iUKqgWT6rnBmYpT7CRg8Sqd7venE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaGJ/Htf; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-492329c5514so4040925e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304103; x=1782908903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f/CrBAF2B9o8/C3553q9Ds+gCZQC8CnhWw5adANt3ZU=;
        b=SaGJ/Htf7raeixGiJ0MdwpdDupL2VqK6Flt7R2z3PBCuQOUZFBhLBsQ2sDqU60gqn0
         YWJlAiCUoAtqH9K9+/VSi8GHxmLM+Lh6f11uuBbhFTIFKMltAE5T0TcVAo4k3E3eJk+T
         Cc5OBjXN7kXYa6xsGbYiS4KGf8EGLFSlSaMxeD1JFcUZWUV+X2Wa9O84yY9bw+BNSzDX
         0dIMG8SJdqycGrgN5XdzsuW/D2LykYsJ5WWMqHXxlR4DyMvbsBRnqN9wv0V2x2hTzHXm
         GVHq05MNsz7RKvz8pmEmskU2DCz8sSJhQodcWlDR2uRPAuawsRzzfyja5snfBkyq3bf3
         MFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304103; x=1782908903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/CrBAF2B9o8/C3553q9Ds+gCZQC8CnhWw5adANt3ZU=;
        b=V+6rsLQBpJE343LOF7IRfjC0Jma/sEbutmx88klVT8vGROq7xx0uBv0332kNTtCAyq
         N5ZIc3UmmuSQmXNKMmgoPcqrbgt+Ilf4VTQJNVC2wAekuG/5FcMLNy1dD2yAB4VmuYFF
         JVDTjOEQWaIQSpBiWC7F46fFB+NENmB6Vwj4GTj//UZn0PuCztzIM3l3EpIODuCpyLXd
         H2GeJ2FFYV64z5nE0b/hjLwmFFaW4ws/pRPByHkn8zNo/hCyCG29sy86lWmqYpSWfVf6
         sjxn5YBTluzp5MzQjw8+YhKaU0bPt6fMuGulEqQzuQAwxzVGN4aPx/tfgdjsXKeV31X+
         hKfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fvIb/CsATfZK2uWMMPBtQKmkvP42me72NSNjVQLxD3CbIbilQiMbRImX2RWWlXyqTEF5WHAtOR7dQVMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHsSEAXYLDcSkrSmjlcuXdfxa6TY9rgcigh2hVsyLS/U4OAB4x
	GGewZCJ/lAF3OXSsSVvUHcJ2chnybwWnH0rd5z3AZEWm92/tBlqTHIFj
X-Gm-Gg: AfdE7cn38612irKMVUoos14AnmA/9fP30BnyBIEE1PR0lXjWQSA5AqD/6LdGOm/evXO
	EqFQ/zQhk+33D2BbqbcIf4rXUmK/1aQOt8dsR8WYbDuz6H93mqCfWuEpdk4kyNAcOAKLgBzrMu3
	EfScuzSQqofJmofMGWzCcAU2OFHRY1qWj5m3OP6fQbK5mXffthNRe+E5WTlZsJFg3SdkI3Xl+bP
	GbAZcwhMyJzXpUvFnu+8/0lSLSxlbW4evOLtMm9sA+tYFum2uAGVoYvo6HJjf73aEVAsTEWj0d2
	7Q81a9tWYVBBtTcMlBmkm1pqyldouRtMGaJp4q6fF6H3vKGbPBFlML7gfNTx/U943Y/dZRnY5R0
	q0vI2QlByEycACzqZkD13GgcLDQABwZhDN1AicKbNsTij++R+f7NZPNwOsVwMRkgTiCnHqkrmWJ
	ZE9oJu6RWmh+3HAHygfnj8AQw5UDPmmDV0T8OWQDfcb3vTwgzv4w48a4mCNbx9IXAeQ05GsIR3b
	QpIu7lm
X-Received: by 2002:a05:600c:8284:b0:492:4889:3d18 with SMTP id 5b1f17b1804b1-492632aaceamr3700105e9.9.1782304102594;
        Wed, 24 Jun 2026 05:28:22 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492609154cdsm46443965e9.1.2026.06.24.05.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:28:22 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7e416a8a-d7f0-4dc6-b279-f7848b89df31@gmail.com>
Date: Wed, 24 Jun 2026 13:28:21 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Jones <andrew.jones@linux.dev>
Cc: andriy.shevchenko@linux.intel.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org,
 rdunlap@infradead.org, tfiga@chromium.org
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
 <ajtM3i49HcYAF3wX@google.com> <ajtPk6gz8bd4bsxy@google.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <ajtPk6gz8bd4bsxy@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13877-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:senozhatsky@chromium.org,m:andrew.jones@linux.dev,m:andriy.shevchenko@linux.intel.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 495CA6BE259

On 6/24/26 04:34, Sergey Senozhatsky wrote:
> OK, maybe they are not similar, as Julian pointed out.  Makes
> we wonder is there any benefit in moving this functionality
> into kconfig (which is the tool that deals with Kconfig files).

Agreed, it would be ideal if the check could be part of the kconfig
interpeter.

However...

Linux does a funky thing with its architecture handling in kconfig:
it looks up the architecture from a makefile variable and uses that to
resolve a kconfig file import in 'arch/Kconfig'.

This means e.g. when evaluating the kconfig on an x86 machine, all of
the config options in the RISC-V kconfig are never reached, thus never
parsed, and never added to the symbol table. As far as the interpeter is
aware, any reference to, say, RISCV_SBI is a dead reference on x86.

Yet, options throughout the kernel can reference arch-specific options.
Try searching in menuconfig for the RISCV-only option HVC_RISCV_SBI on
x86, and you'll successfully find it, because it's defined in 'drivers/'
(not downstream of arch/Kconfig). Then try searching for its dependency,
RISCV_SBI. Apparently it doesn't exist? In my opinion, this should also
be considered a bug in the frontend...

All this is to say, until architectures are restructured in kconfig,
alarming on unknown options would output 99% noise.

- Julian Braha

