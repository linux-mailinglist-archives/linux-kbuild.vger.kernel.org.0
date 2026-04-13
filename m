Return-Path: <linux-kbuild+bounces-12776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNzNCNAd3WlhaAkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12776-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 18:46:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3263EFBC1
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 18:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6D931A61C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 16:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14AB30F92D;
	Mon, 13 Apr 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SiGUPv6U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A830BB80
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097350; cv=none; b=YLj5M618b1QQx+gBDWzfkYRt4O64Ev9Yuc7GNCw5EuDbVQGgMfjTs8MY++/Gh0kqqJsAyG9Nq8MOul57H9wNaEG8hu9J3coXd+D6mHU2XpIK39ryHma6KwhTv6N0LbxG6nXzX7Ui30Aj6ltLTS7LHP6EA82oPkt9AptBNT9MrTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097350; c=relaxed/simple;
	bh=cWWAlxzEb2WUqi12qkJyJ8vSS8DHl2cHg8dCUkKVNXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3d06vxjq3Dj521oi1OFx3TjQYVpXYNbZ2ozIqzinZONaOrc2qOBRx9iktiGVKZjMfA98Yhe2oFHuvw7OYx4fJbECwmjlLxT+NHaf88aG5iIklKphGsBuL74U541QWWr26E0ruKdS+ocUVmWtlB968evtGPxmZjOJuRMV21SKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SiGUPv6U; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488c21c636dso27550255e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776097348; x=1776702148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7I+NYatTSR9xEcW4oWgYSH4uZ38/JA1eqYfnnbc+3g=;
        b=SiGUPv6UdVKz6v5klWG0rvYmsuN9vnRmD6xEx3dHBa95irsDYZrTH6gpBOqr/X7sYc
         zvlbfDGiu0x1NaCOcXRRzSR5DGd6W/hOdfIkSPWZXHCSbCcoj1I8EgcfkROt5MuU0v8r
         n7Wf+wZEmZJxU3o24knSforkYsQhJjTv87u7diXsERAZJcP1AHoE2TcFspmxcWHyM/4b
         5OPGDOvQd2+lf1wYlofZv/Ywoq+4//GdHlmk9Zmsv9zAng35VVvjrxEWoNjsI1vTG6+8
         vsCyYc9iP6976lcHWrP/htGkS8++79XdIi+/jV3VUYpmcMVO86C03iELV2JoeMgA0XBS
         kLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776097348; x=1776702148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7I+NYatTSR9xEcW4oWgYSH4uZ38/JA1eqYfnnbc+3g=;
        b=p/uP8trUO2RcwttoHWjst4ga1eHbOQpkPg7Fp8rzS1FN7T2zfgF1m6m1tp4MlIG/g/
         TqQKNxuO3UplzV3mNXT+zKoFRRV7op8mZGYJlRLDKGCsFfldnsfb0U/5PHpPdsXLlXOX
         6ypbTI7/sBjuyEVEoRTqLFZfLeBKozvAOt9xdq5qJomaJylw+vxj+j8k1MWk3E020i9v
         fRKt3auBBfArHyvxK7XV+P0Tz1BT+p2UMCpjOAWcFoqwP/NWrSYDy8tehW4EcPowOGD0
         n3bxAHCTO8JTGbDvdPPhdqNGxcOn5uU/q94eFl6oenW5xqyRDex+bcoyuiFPHE9AAZ/Y
         3RnA==
X-Forwarded-Encrypted: i=1; AFNElJ+0M3ATbhYsuDU1M4sL8HT2dkJcWvwdeFpYQuDahaA7b+f/e68EIuJwoxuDM4Y8NB2CR7ojX/SrPmczfO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCylRXkeb1P8tCSebzNM3dDjKSROSyoN/ydj2qxMRd83hO3hrV
	+hKpOAB6RvSLtmRrrB0OhoBxQ32TmfExYrzfhl3SNfrdyoj944Ol/cf17Yys+sBqpYs=
X-Gm-Gg: AeBDieu7wKFWdYG299J5cdNgL/8Ug3uP7YYX2I7ywh50mOeRiKQ1lQBjflaV/LpjPQ0
	NcykVKfTN1tLLVSLxBpqq2bnqd7U1lhO9pdi4Q2P9pdJ5tRef4sV5wnSsjC1pgpKEgnJFJ7wDXj
	XiQaQ+ZlbyWtMUVBfgHlwNRxSOkCsxUVwlfrb6Txdwyj9CERZJc85j3rePvWbvPxSi1QRtQv72m
	wmfe9ft0Pb8Nnt0p9aBHfRwia1DdsEMBIkL/F+nLlcUrgu5jeDA34ZNq7fBa5rgmtRGnDV5sJ7O
	GbKFZPnGqQdxRj7Zhu4i+CrYukd8F0IMmOls6E9hm2h0z433oOoxNIkKNkeXYoY9A0ck/nz6wNd
	8hU9jEKKHPV5KcrfqR3ugTbEen3LT9usVT29pZ0pqo5apLHJ+50VqGs79YLmZ68D7QTOkEpOeNj
	5uw+Lx+Xh0nbZyLeXI9/3nVKv31ihR2+/EW/gBT1jgOFcgEc1O/2Oz8y3f+n0=
X-Received: by 2002:a05:600d:d:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488d67eb7a7mr146945065e9.1.1776097347595;
        Mon, 13 Apr 2026 09:22:27 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b765:e41:ce28:aaff:fe86:149c? ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345b5b9dsm13289779c88.7.2026.04.13.09.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 09:22:26 -0700 (PDT)
Message-ID: <e412d411-6eda-4206-befc-1e59782b21ce@suse.com>
Date: Mon, 13 Apr 2026 13:22:22 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] kbuild: remove kselftest output in mrproper
To: Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
 <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
 <227fd478-581e-462b-9579-afc5028abced@suse.com>
 <7287249f-3afb-487e-adec-8cf08ae7b1ad@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
In-Reply-To: <7287249f-3afb-487e-adec-8cf08ae7b1ad@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12776-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A3263EFBC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/13/26 12:58 PM, Shuah Khan wrote:
> On 4/11/26 06:49, Ricardo B. Marlière wrote:
>> On 4/10/26 4:19 PM, Shuah Khan wrote:
>>> On 3/20/26 12:29, Ricardo B. Marlière wrote:
>>>> Selftests built with O= store generated files by default under
>>>> $(objtree)/kselftest. Those files are not removed by mrproper 
>>>> today, so
>>>> stale generated artifacts can survive across builds and be reused
>>>> unexpectedly.
>>>>
>>>> Add kselftest to MRPROPER_FILES, so that the default kselftest output
>>>> directory as part of mrproper target.
>>>
>>> Does this change remove kselftest build objects in-tree builds?
>>> It didn't for me - also there is kselftest directory under
>>> tools/selftests that has several scripts.
>>>
>>> Can you test this for in-tree builds - I would like this work
>>> for both.
>>>
>>> I dropped this from my next for now. This can go through kbuild
>>> tree.
>>
>> OK! But please also drop 
>> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=33880424308df3c2e39fa88ea74f051205ebb7b4
>>
>
> I can do that - you didn't mention the reasons why you want me to drop
> this one. Do other patches in this series depend on this one?

Others are fine. The problem with this one is this:


-    ($dryrun cd "$collection" && $dryrun run_many $tests)
+    ($dryrun cd "$collection" && $dryrun run_many "$tests")


but run_many expects word splitting.

>
> thanks,
> -- Shuah

