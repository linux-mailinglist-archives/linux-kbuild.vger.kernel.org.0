Return-Path: <linux-kbuild+bounces-12763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 03cNH2dD2mkDzggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12763-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 14:49:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C85CA3DFF88
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 14:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D94CB302EEC5
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 12:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855A6262A6;
	Sat, 11 Apr 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GgR3QN9v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038421EB1AA
	for <linux-kbuild@vger.kernel.org>; Sat, 11 Apr 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775911780; cv=none; b=kzkNil83kj4HiHk2hPQjt129UX0As3jELvaIiwIT5oOsmcNtVR/uM1x+RJxpK9ZfJqCXwYSfbq+F3x5SycBnAoSGwOwL9xBFFqKBC4ZyQxyS4KQchk0rcCgpDWcwlXqIYQJnK/wpThsnNdiiLHn5Z34YIZyE7oC76l/nqqUGljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775911780; c=relaxed/simple;
	bh=Bmgif21JILxtKROQRrvBMcxSwdIEucVmx9w+2fEqPrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+1lSrMhjcAyXQ9Z8h0MP/Rs1GaE18NYxtw524yv0hggQNWGA7D2OnmVbtGq2ELPIPzA5Ul1Vzy48JMMRFTW3n/lDhLKzINmG0NMJF7EnRXJivlm6yRMWM9g2G56ET6XU0FYrZXHBI31W58epmj1ccnktWlPI+resH4LwWq/sbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GgR3QN9v; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so20719445e9.3
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Apr 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775911777; x=1776516577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OY+pUT3bAKsfuyssDABe7DVX4rqXH9Z4jNHxto2UUNc=;
        b=GgR3QN9vPbErrAH5zrJ75nWsmZRez/SC7JYJsX1tQrhG2WhPz4FEZDyJEVsZgF+wQn
         OYxwhUYTN1mDadGztLmGpNOR7Vu2jheneI+IgwkEMUMx4FuWEm6Bn9uOXTX3jjK+5tJN
         bZie7XiKMtt9MLleLpRweBPFlt7REeHMmaY7o5EZ7u1ueuCJpgM6caw1SO8ZUj1rvC+L
         kUUfkib8CJdgeHDtJRTpnvj8VjVo3GAZrLjGeLT/+/+huM8aRVUxcInkr6AgyJpzyLen
         9wCwFsgflGytgYgxSNQ25GrgZSsPBZ/zKz+1sYgF6xxQxOQSQ8lxTh3NaZ2w1EmjcG3U
         E7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911777; x=1776516577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OY+pUT3bAKsfuyssDABe7DVX4rqXH9Z4jNHxto2UUNc=;
        b=DqPjIgkfpOAYTkmAqn9W0a+ZiWLvJgY04U6eyKae/toZH6os8y/jU3iJrlBMcaeLoq
         SIZUuSN80QuSJAWJNEhNwyPZHIhlwdK6bMEcoy05dHF6t2R/msk3+p+ZEczMYzP2leuK
         j0z6ko+3Q6XdDQ97U4iwSwoFpG4YdM8AS7MpdmG2SGShuglJW6m4lg7vnzzK1yjtYTEc
         detSIwh0TJwMTFxDR1a/V3KR6xGdDuGQ8q1zrzUA+mie4sToca6P+bpJhajEahJbuNEx
         CBFVeLwNh4B0ogXxnl58SXv1AfopMpHTd+Z85nJcPqrW2opS978S5Vq2t06/9kmPbDg7
         2uiw==
X-Forwarded-Encrypted: i=1; AJvYcCUOOjM8G1aOvzEEUylfENzCXogqQ+kfiX19LpcNEhUaYFiRPYkFrpwaQf63GCg4wmyfhA11EOR+Gl6YU8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlYExjBHeOtJehB+SKKzCVva/UrWONjJ8sMrDiBpsd9CJJbU3
	O3LotF3NNfgMzpVpv3hiTpqd97S6G89SsFNRX8i2IKA+gc7rbWwizmYwiiTShe5T+Eu59RDR0mM
	3dcdF8EI=
X-Gm-Gg: AeBDiesCp3xymG0PeqnMBy/G4S2y482Ngp6kBa1L6x3vJkNojsaOOXJI3WsSCKkPsq/
	v9mtrXT6NctHfsXyunGPcFkH1GfmvAdg+hi/iajUSBeyqyWlkCNgwhh9cUqD2OXmOFsXU5t8wPp
	uQkgicrce01TxClrwF0E7BFLVBwtvcR4HRmEWqkI8+rqneK+JXccVmlytyBFc7+a/WHw735kVV4
	rrnjmK1xfzksRzNmhUGwzgaE+4zLRT7vktawcNhuXpwdrXg19InfbJ89mzjLaeLb03co/RQheYD
	ILWZlelm4TrAjPCBe9IYIf43rqR2ljtOXp1H8DunMne6SYwXqP7IMoyofob0fj8GPaB+9zlwfgq
	bAa50ck1zhPTLWWlWke02PhoWasHm1BM2KfiIqUup0/PYC8f4FFVlQMxhPB8xz2ciu7DIqTZd7v
	yE+tOWqc/S/RbzWBvyCciHrwqKTa1hT4rrJN+k3j0eNMjz5cpQDB52KNUFbA==
X-Received: by 2002:a05:600d:1:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-488d6772785mr78952175e9.0.1775911777328;
        Sat, 11 Apr 2026 05:49:37 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b765:285:ce28:aaff:fe86:149c? ([2804:7f0:b765:285:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-954bf112822sm3314511241.7.2026.04.11.05.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 05:49:35 -0700 (PDT)
Message-ID: <227fd478-581e-462b-9579-afc5028abced@suse.com>
Date: Sat, 11 Apr 2026 09:49:31 -0300
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
Content-Language: en-US
From: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
In-Reply-To: <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,vmlinux-gdb.py:server fail,sto.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12763-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: C85CA3DFF88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 4:19 PM, Shuah Khan wrote:
> On 3/20/26 12:29, Ricardo B. Marlière wrote:
>> Selftests built with O= store generated files by default under
>> $(objtree)/kselftest. Those files are not removed by mrproper today, so
>> stale generated artifacts can survive across builds and be reused
>> unexpectedly.
>>
>> Add kselftest to MRPROPER_FILES, so that the default kselftest output
>> directory as part of mrproper target.
>
> Does this change remove kselftest build objects in-tree builds?
> It didn't for me - also there is kselftest directory under
> tools/selftests that has several scripts.
>
> Can you test this for in-tree builds - I would like this work
> for both.
>
> I dropped this from my next for now. This can go through kbuild
> tree.

OK! But please also drop 
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=33880424308df3c2e39fa88ea74f051205ebb7b4

Thanks!

>
>>
>> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
>> ---
>>   Makefile | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index c9b7bee102e8..91e6ec790a0f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1662,6 +1662,7 @@ MRPROPER_FILES += include/config 
>> include/generated          \
>>             debian snap tar-install PKGBUILD pacman \
>>             .config .config.old .version \
>>             Module.symvers \
>> +          kselftest \
>>             certs/signing_key.pem \
>>             certs/x509.genkey \
>>             vmlinux-gdb.py \
>>
>
> thanks,
> -- Shuah

