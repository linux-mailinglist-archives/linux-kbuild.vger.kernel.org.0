Return-Path: <linux-kbuild+bounces-13946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6XWwMPq5TGoTowEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13946-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 10:34:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D4C719263
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 10:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SS8qhkvA;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13946-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13946-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 294143057566
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2026 08:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16072328B77;
	Tue,  7 Jul 2026 08:32:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774EE322B8F
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2026 08:32:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413130; cv=none; b=hm6FhkTyDnvydNul3s9x8Aw1IxT7s2iou5F4+2DQ2f5I4s2ltX9oMLWQvAUJcISxl6hlN2bxbuk7/oCd/Zh4mVGFzgieYqOIppKAZoc3X6RUzF3DrBfehBvxqH7MqDJvDsWTLSEfhXJQDdFuHIZv6v37oycwpa9ULUIXNv7PWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413130; c=relaxed/simple;
	bh=rMXlsBzFmlQJhx/MeT6zc5o4SVLjaNIAsV6KBXJ06FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsIfK0vCTqu6JqSfLaOKrdKuSVKg8rH9WXY2jEfL4JOAywpXCwe/WI1JiicoGBVANdmU9nKi2dGpaHneLz/TjwXIyayIDjvZMZevlNnMYfTG2MBaSUOBifV7qPvJrXeV+NLquMSb3cB+zSFStYvmf0fWe09a6xhtW8KN6xW2ovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SS8qhkvA; arc=none smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1269e4721aso457301066b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jul 2026 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413128; x=1784017928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JE54RSjKYIkwOy5Cg1CBkstYTBFfezFKodw1/q6j9Kw=;
        b=SS8qhkvApRBRYFSuMVWyTz5vfAiLzquUuy0gLOcoS0/9ynxKYI5XT0IguKMZmTh6oS
         Vd40an1hc00YYW9wKpARKrI+SKxF0sT0bS+K9/V1qaMsIvMjgpz2n0AJifJyFvbe8j4R
         KvHsx4FY5QbpWUoyEO7zxbcbYo6YNPGRiQ3CJIo61g5ZRouW9Nqre4cm9IZTwOcDxueK
         StrDy4doRhG4ZnB3jROKXm4aBSoYlk6hcEpTv0WsAKGar1bE3hBVZXHdfvLDRxcEesaL
         Y7g4fYn4hcpnFdcjV7qdCEOYigvevNQ3ZE6CbV5ncQpJ1Xwlawyry6V5o37MskKrPdnk
         3Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413128; x=1784017928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JE54RSjKYIkwOy5Cg1CBkstYTBFfezFKodw1/q6j9Kw=;
        b=stZQKBKI2uhxRLcEY1YtIG/9LeOX+la/ajOhVMbO/1sImDTp1rf9ETIB1iQ+r4OPYM
         zO+YS0uU+ekzRIiVY0l5Q7TdCdtxwPj/PtnGLorH3nYHED2jxjAsIuiONV5hjOaMhaa3
         jTBWWnScL7inNUseQM7Y0HLEX7q930bqWYgRKASF/TBdtQKp3OprRf5ZCaB3zUatHkok
         lvvVGDanp+qPcxCxpbtfC4d3VS7C3Ihy9YuR2Fv/pR2JIRhM3REfBb5ZhNhfby0Dw5dM
         NvFCty1rPPYQ8kSglmVb0wR0xPRicBlo0sf5SFzfw0WQ9TvmjOJMdi2C6PryjOENkL0L
         pzEw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/qaK+7A2wleC6H+LvScNAZw+sH0omHmBewRxYa6gUj8BsJ42mTbmespJlJw2v+X9hlzLlD0d0JKKPbWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaSMuQ2sJt6aQq/DflomN+zJsoAa012OqBRiTLJZ0E8pUNu3ha
	08UmTr9Byfbcv7+QI6qeegSPZJcO5Yh5HwNVwmu7dky3aXy66d+Wt4i4
X-Gm-Gg: AfdE7cnE3FU2kA2nOume4yYHcUqrjyBH/fN49qSa6t/iXEidKqAnmKQMq609CkuZPLn
	z6zjvMPBMYSbYBQ8L1IJY+ZxJqM/SAC4CgdWl0hLUf+BP+jGPGSZJ5Av4s3SQP9wnWWgjVir5Ju
	xRfcoe2gKhGCa+POxloYnSDIMR9mqrvd6DvCZfznYfbB1RwmjvpHiEs0ZnhfgiVVLIEpOmH+h3o
	tkFkic/LrvWBaMZr7mgwGyWuxUjAyXRM2/1CDO+fF+npXt+ryRVHG+kDfTKrnWOb5lN6hvXvw8R
	49OKO2ICnuGMyfGTdAIN4iOiDPE85MxqdUdCTBAM0cNxw3y/Mem8C+6FTRnLM/qp7FyCg+Zz2Yo
	1GQc3SPcchD1aO+0vaNvPwQCnzG1P/zp9ROa6Ngo2wUgUGab/+IWybQqhx/ozBko716OQfvWYdb
	nG+z2pSt96eztoLbQm6OkO9SvqIU1VudK64iTu8BRurq8uj7yHwRO/tSjQX1jpkYSeVg/uqpsqr
	VI+Noqa8WN+NniBmzUt
X-Received: by 2002:a17:906:2ad3:b0:c12:8ade:dce0 with SMTP id a640c23a62f3a-c15a67ea2b2mr149867666b.39.1783413127545;
        Tue, 07 Jul 2026 01:32:07 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:9cd:c9aa:d5c0:549a? ([2001:8a0:e962:d100:9cd:c9aa:d5c0:549a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada091e6sm79462366b.51.2026.07.07.01.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:32:04 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e35e88e8-197a-4deb-bb28-b1e945834017@gmail.com>
Date: Tue, 7 Jul 2026 09:32:02 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn on dead default
To: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org
Cc: rdunlap@infradead.org, masahiroy@kernel.org, grahamr@qti.qualcomm.com,
 nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260606140008.271929-1-julianbraha@gmail.com>
 <20260707053143.GA1381193@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260707053143.GA1381193@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13946-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:masahiroy@kernel.org,m:grahamr@qti.qualcomm.com,m:nico@fluxnic.net,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30D4C719263

Hi Nathan,

On 7/7/26 06:31, Nathan Chancellor wrote:
> Nicolas pushed this into -next, where it fires several times for me. I
> have not looked at these closely yet, I just wanted to get the report
> out so that more eyes could be on it.

Thank you for sharing, I've taken a close look.

> ARCH=powerpc allmodconfig:
> 
>   arch/powerpc/platforms/Kconfig.cputype:269:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
>   arch/powerpc/platforms/Kconfig.cputype:270:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
>   lib/Kconfig.debug:1083:warning: default for 'PANIC_TIMEOUT' is unreachable: earlier default at arch/powerpc/Kconfig:350 is unconditional
>   arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/powerpc/Kconfig:482 is unconditional
> 
> ARCH=s390 allmodconfig:
> 
>   arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/s390/Kconfig:295 is unconditional
>   lib/Kconfig:372:warning: default for 'HAS_IOMEM' is unreachable: earlier default at arch/s390/Kconfig:760 is unconditional

It seems to me that all of these instances are probably intended by the
architectures to override the global default.

Personally, I find this redefine-and-override style confusing as it
requires the reader to think about the order of imports in kconfig. I'll
throw them in my kconfig cleanup pile, and see what the relevant
maintainers think of my version.

> When building with clang-23, which supports '-fms-anonymous-struct':
> 
>   init/Kconfig:978:warning: default for 'CC_MS_EXTENSIONS' is unreachable: earlier default at init/Kconfig:977 is unconditional
> 
> I think the init/Kconfig and arch/powerpc/platforms/Kconfig.cputype ones
> are intentional due to how cc-option works but I know those might be
> hard to silence because they are already evaluated by this stage if I
> understand correctly? Not sure about the other ones (apologies if they
> are already known or have fixes).

Yeah, let's leave these alone.

Best not to merge this. Thank you all for taking a look.

- Julian Braha


