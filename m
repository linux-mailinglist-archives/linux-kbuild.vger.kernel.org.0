Return-Path: <linux-kbuild+bounces-13749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EXmEMETCLmoM2gQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13749-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2026 17:01:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289A6815CA
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2026 17:01:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KKaWcFA0;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13749-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13749-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CD72300C5A4
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2026 15:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E3C26F2AF;
	Sun, 14 Jun 2026 15:00:54 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C3846A
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Jun 2026 15:00:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781449254; cv=none; b=B2G/s+8I+7ZL7oZh2qFmnG08YaLUjbfdlbAwDAe+8Doh4z9DssT1kCA6O5uTh6phulS5hxlSyQ8NnUluPB0dwidVw3Qcym4jaOIYmiVAmzvFzoiFnx8LBradFcpkFxAhjLxZay+eMrRrnxl0m+aNS6RbwpHTsY8wp65jP5Q2cy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781449254; c=relaxed/simple;
	bh=bnn83/VQiP0XKx1cDRZdXo5MQrAVpAi8pEi8lZj2+0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Siz9A2t+6mWsE8Q1aGnV9E9WFBdolUAmiCrWpoWeVWNWdB+RKonxpTRUycjm2dCCumZBYLiO9qSbz1NDxaN4MKd4OsxIUGMQiEM520fOzn/csj6oMXSujWW7iUEBRumG31NEy06NTpqG6LA3onuxeSvgUAj91DQ6BVVftW0S5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKaWcFA0; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so27570235e9.2
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Jun 2026 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781449252; x=1782054052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bnn83/VQiP0XKx1cDRZdXo5MQrAVpAi8pEi8lZj2+0k=;
        b=KKaWcFA09XUjQ9WfBM7ZBHM88looRNGGP7zqgzPm3nqFlwY2wqxjZmmoSg4rs1063j
         wr5fKqhdR0XIgAIhXsxSA7hWPuVoa++jv0GoFrZB17MgCkqNNREA3EGaBBfP3JOh5HvR
         uPPBqFVEyd5VPkCOm0kOnqYbJr6cqHx7TDYPiPnz2J0USisk3qrDcQCWRNT6eTEpnbjW
         r1GIs1W8X4woIK1UwGdKZvfoIO+FmeTsGIkFigdY8GY4V8y8FwCi0YFdA12CSYhxvCP9
         sgVrSIe1fAtp+O197sdh5oAWmrGbvyl7kXKc3MGyS3OORXZOrLn3BU4Jz4HXBZX30fxj
         Mdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781449252; x=1782054052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnn83/VQiP0XKx1cDRZdXo5MQrAVpAi8pEi8lZj2+0k=;
        b=gh5ouFmdTm0nlVQyZXqi+KznGeHdGbJS3M82iEnZaSVsKASWwKzwdutMUlaH+c52Sw
         wNeymXS1WhQuwgNVLuAkSoTO/O5NjfCCaI5OKSEAKdFETP8w/Das4OhbGEhO0/LLLMMv
         XtQjbbTWz127VK39fmgLviN7Dho/jjNnNoot6lhmlgozs50HQewkziNZQ0FEQQku8yBf
         H6DbVULT5+RFoTczVqiZszC+h2vQPUGO2Nfig6EsPNoOkwd7Z6ZW/u5OmPUsU2DshbZy
         6CNUd151xnE3zBJ3UlblLhSi6h4+DF36IJWiKrMfGC8MtL1UOgNUlojuB5z6wYvRN+o1
         G8UA==
X-Forwarded-Encrypted: i=1; AFNElJ/v7N60BFEsU0vTz0BY2yGnpmeF6j6tSE7qqmxRqoooFxZinXOTOw4MHWHWsyM5wJP8InNPuzq4FuBm+2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjO2/26UGI/PZ4wijGVQ+riEogh/FBeTPzdXflcod2YRMnAZ+n
	gIhH9yCQRb5LIGGYDVQc1kyzVHcqlRKPydbC1xvJSiZ962WptfZk8l3bOI3nRHhBawTX34OM
X-Gm-Gg: Acq92OHMAgHPos6fS9A/YckBDt/zWTzuS25uw8EYMncd420ukPr2TRbTJtz7qGltf0G
	1zAXV/zBS51lTxNV2ZyYudKWz4jYgFgPZ/HmNZoZ7EcW5zn5Vpa7vRb2PBDTD+876QVSmXJy8JB
	u9IDSh7C/+c/z2uyo18MhQFBwMqmsiHdFuwry+636weR9YhvvaVqjZ4zD0LP1wLCu32vq8reMeL
	Jau5y37GJZbbo2VM3EGCxl+vXVeZxKMrhyDW8DCcgW5R0wPOvdaFr1geEa0yNyEAgiTg+dy6I+y
	rmGMe28L+dzROpcq1XxLKXdet9GAs+eFlsPrRCdMj7nawcZ8dylWgQ9bux83kaGAyFJFgCDKEMf
	ZgPS3dlQemXB1ppcXoF1bC+VN1v7J7UuQSu7GfXU2/SVBc3mRlZPbeZv/M9ArO42AZQ5SsHOF63
	u+Lb+xJNyNX4bDagcex8einzp4J02DjLVFcY00kIwSTo3TmLCPtQkAolIrCDiAZMxyZ7Z/vjWVE
	FbgxBl9Z/92zHyN5NI=
X-Received: by 2002:a05:600c:4754:b0:492:2100:aba2 with SMTP id 5b1f17b1804b1-4922100ac1emr78147525e9.4.1781449251459;
        Sun, 14 Jun 2026 08:00:51 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d2449sm153669105e9.14.2026.06.14.08.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 08:00:50 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b677c9e4-edd7-42ab-ac0d-d721e7aaf2e3@gmail.com>
Date: Sun, 14 Jun 2026 16:00:50 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kbuild: remove ISDN references in Makefile examples
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Chen Pei <cp0613@linux.alibaba.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Andrew Jones <andrew.jones@linux.dev>
References: <20260613232830.147116-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260613232830.147116-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13749-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:skhan@linuxfoundation.org,m:cp0613@linux.alibaba.com,m:rdunlap@infradead.org,m:corbet@lwn.net,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:andrew.jones@linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,linux.alibaba.com,infradead.org,lwn.net,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2289A6815CA

On 6/14/26 00:28, Ethan Nelson-Moore wrote:
> Documentation/kbuild/makefiles.rst uses some extracts from now-removed
> ISDN code as examples. While they are harmless, they appeared in my
> checks for CONFIG_* symbols referenced but not defined in the kernel.
Hi Ethan, are you using the kconfig-sym-check[1] that was recently
merged? This dead symbol check should not have the false positives on
documentation.

Though maybe your check also catches dead symbols in C, Rust, Makefiles?

[1]
https://lore.kernel.org/all/20260527142703.107110-1-andrew.jones@linux.dev/

- Julian Braha

