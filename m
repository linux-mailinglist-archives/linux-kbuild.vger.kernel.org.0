Return-Path: <linux-kbuild+bounces-13304-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAl9LI+eD2r9NwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13304-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 02:08:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BB5AD3E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 02:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B2CB300B19F
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 00:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C4A26ADC;
	Fri, 22 May 2026 00:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3pGo5yw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C818AFE
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 00:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779408523; cv=none; b=jXCE3+032kX5uL7Nw7gr32FpK1fqahErxHdxMUW1sOaDc10QeayQ+FMCbMef+kdsk1Rse8aNUMf/AlxYFmizxL1K8njDAfvY5U93W6RLo0bOPe4hbLGkq+uxB89bfqHn8nHveCWZo945vZOB7hPZ2Tt6itv0npf7pnGMUhWUeYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779408523; c=relaxed/simple;
	bh=zIaBcJNMiP38S0QdBU0NJyQvwVJlvq0oMvajhORInLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i35m9kfe4gPR9pMtfZUXce/lB3GBqW9M/VTkh5fnVfgd1MUguZ2neBAV5D3/7Z5C8SwVv/y4MemdWzTBsvP50PoZ6c5Ms1SBERaXdTkrak/OkWOCeAngSzOsKDh1+src1EWgoIiSFJQIdoq7QqucMNdmgy5jairbjZiXFYDJ+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3pGo5yw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso59447855e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779408520; x=1780013320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zIaBcJNMiP38S0QdBU0NJyQvwVJlvq0oMvajhORInLQ=;
        b=g3pGo5ywtH2M8QXNvDcLBQocaytuMCXIEx6Z74W2KiOZaHQ+uHY3wmG3IWfpakkfdq
         EyUKbu7TAYGGuaoajzptlP/EVNLReKHeKiha41gCKN8SslqNOGWyx51Q1ZObJKgqhiik
         mh8tf4wEWHhcKMj2vU9NGbqQ+8Xsc6uP7NoER2kQLpyKlcySjC66TtxP0RIaW86L3Jtx
         xs2TpGSgOVAibXJENtoog26FuwUQ80yRC0nSe7enfWFiN9fBxEObuOnovx9yBo1jfGNS
         11AyuZqbBDtjwRE5xljjZQlR0lwn6JCRSOUu/xeDSNmtee38uMltPYbqIXyexN/71U3o
         N2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779408520; x=1780013320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIaBcJNMiP38S0QdBU0NJyQvwVJlvq0oMvajhORInLQ=;
        b=gArikWU/z0PmGaxenQ+yJXTfJfNs4bo6ZDi2clurE7b6M415vcT6Xv3KQUHWvmdA6h
         EYxENxb+Tn13Jq7T/f4R1GxD7LB5p2spj6mlPlyoAmp45btAUWT4pMVYOTxycTiAO+gc
         KKC6tCb8zStz8T1wNlQXaaaTfIeyH/HRApxAVSxhif2K4fpaYlIgTxn530geS0DiVKTz
         OTvk7WHtLegf/O73eQBsqpMrG35eUzK5FmYEVZz8OmCDfii/MjsHBM+Y1nIlhz/reZUO
         UkKfcxwDuScaG6VhAt6Bt/c9JwRxmj4p1t2/kjVxeIkUmkfEw1EdUtpzFzB9qd1vxUnv
         Rtzg==
X-Forwarded-Encrypted: i=1; AFNElJ9eKV4+kqZnFa+vl6YH8wd9HoKumLxx0RY5iEtmI9lsUr/nKHN6FTO3JNYVWFNZUbcbNVk75lhYVUV9auc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywey3+oiQhY0oPBHSLB4pPZBF3EbQ/6PWqcm7aiyz32widlhaAX
	P+vH36co6EdkgHrVOHX3BEaCIiuv80Z7CMnnVO7YKZk0KqBsrVc7t3hj
X-Gm-Gg: Acq92OFyoTwc0ZzR6x2Qg6La+l43J/W24U6Dxm50qmbBh/z32v9P4pDGsGrmK45/UFv
	WQlbDU7278TFgD0nrnT97U3t+KjfaX7fzsiLTB1r/7hxQbP/LWDdklJ8FWlIWiSnGI9B9Mtd3mz
	impBb7e20Y+Nr8O+wW70VheMcjheJcBpIMS3+zEySluVnOjfJBnByoIRLl1EwvZ858kaP3HN+OI
	7z/u1k1N7Ix2yaeNMpa5+sqWWfSVJIFcPbUHSnyA+0RRFHtIYKeelreovCLjg8EyYm8Zj8lHEdB
	Lir4vlJ0c6JfAmSAYQS0n1gVduhHgH/cTN59Pw+HYR36wVuQ04B9R+bqaSUqxuV9OJo/4eDHbPk
	MDcVomH1E1U6OHiJk8akgBtm6cDNY2TO9o3SIdfx3FcfZA8b641KZG2+tmXRS905R6sgmKBsVlJ
	yvZ3zz23LY1g8Pc298xI/HqiCpuKqt7u27sS3EpbrV+5Kq5mUYc3cM3FM=
X-Received: by 2002:a05:600c:4ecc:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-490426d4bf0mr11635015e9.18.1779408520100;
        Thu, 21 May 2026 17:08:40 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527dbf3sm4348535e9.6.2026.05.21.17.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 17:08:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d42fa51e-8dce-4ef4-be23-0e6b0642414b@gmail.com>
Date: Fri, 22 May 2026 01:08:38 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: add kconfig-sym-check static checker
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org,
 andriy.shevchenko@linux.intel.com, rdunlap@infradead.org
References: <20260521204435.534773-1-andrew.jones@linux.dev>
 <f3eb96da-cbe2-4d07-a586-9eade3bf39cc@gmail.com>
 <numrmmjpnheiawifcjhc5zustrlk6bfv5wtr6ibdzbf7mq5o53@x6wf4zv7jhsg>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <numrmmjpnheiawifcjhc5zustrlk6bfv5wtr6ibdzbf7mq5o53@x6wf4zv7jhsg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-13304-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 592BB5AD3E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 23:31, Andrew Jones wrote:
> This script is looking for symbols, and symbols
> should never be quoted.

Good point, out of scope.

It looks good to me otherwise, so:

Tested-by: Julian Braha <julianbraha@gmail.com>

