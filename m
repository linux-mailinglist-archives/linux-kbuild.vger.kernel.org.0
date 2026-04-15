Return-Path: <linux-kbuild+bounces-12798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F8WEUm032lCXwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12798-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:52:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A24061B4
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34C393005A97
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519153D567C;
	Wed, 15 Apr 2026 15:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g05Va1LD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54B5313E03
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268357; cv=none; b=fMy5cKkXtk9udvOp4BAkcRvWUrmxjtrnj1sLgaMO/PbrJWfd+XSGpxhkrQR8bvnbFekg8HrqkwEkTPJJZBJmrBSQn6jxbJaV0CvZPi9bH3hjrc2RAZLkKLyjHm/yWRLGONiJl9C5tQas1tD4PTXAN+kdYtwq7e7o6VUZZGSvkEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268357; c=relaxed/simple;
	bh=U6e3kvNh9KQystEAl0TfrKTSNzunQsW++ByhZy3Guj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyWTIgVqume/9aN8wf4OwFttL7xHoEdBKHQNRZF8bCzzqE90YVPCFJZs/pB2LfCFhedhdxkO7mbcWMg6TRTm0LeQgV/qBiH2Ik1/NEcGmtiBC+JYH8H/G0DJiZBjMvcd+Zlb9J7sOa4Iab6lL97zuJoIKA7tJI1d7xUmcL/jqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g05Va1LD; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-47018d34159so5060918b6e.2
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776268355; x=1776873155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyU57pKrT+E3A9527zYY3QFwxCUHqAEnIl4mnw9XKdg=;
        b=g05Va1LDml3bA0HGHyPqErgzqJmG4BZ+xalGPfgRTDRosCHbr+O1ydnaQQsLtg9kFA
         skBYBUGv3qx3uF/1hkIlU9XquZpfVOwy31tQTNi1mBdXsnOVXF3FtK3kyNzuqRVRv/Jx
         Xd/FAJv9lqTbcEkz9ImDavsiJbgZzSfFzhLwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268355; x=1776873155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyU57pKrT+E3A9527zYY3QFwxCUHqAEnIl4mnw9XKdg=;
        b=eMAaG+tOiHwVmBAaSWnT0MtMTdYLbgRRerfoFCN6YC2flu4BMG+B51Bs9fjzjcj4Nc
         jCqBtMEQZ2rNQ0S4Bm12q7eFjKIKXwl9F48fZi/JK4okCOXOpxsye3pVSyIc+OQWswNg
         ZBDY2iqG5w3WhM2x2mmt9pfPkiDP5NeC3/YfXoQcRWAJ7zVBrctAJNysT3EycxIui1Xy
         P8GgdUFvoAobATU1LqwJxxUkxXJVc0UnqoVOlgDike1VoBJnWhDb36VcN/mnfCQtRobT
         UejrMRtI8H/KOOhSPAl8RwiIt1Y/cIFeCSj3f9NVf3nDHs3GQEuTMbz8KyLdubl294bv
         RFCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Rlhn7fclew6SRSke4YY/wCgHlkJ1JEYdEUtHN+Vj5eZdT4Q3WQO8MYjBEO3Ryprj5Haur/Y/DU3yj8PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM5VM6U4DXSMwklh/qPxnLZlsY43c8qVGBPRKV0hoH9OK9195V
	q6UfD726RDjC1mY1G2t1tWP/hPsrXsJZbxQCs1wCWiPaXDNxXH4Ihg9AcyHJmMVQpp8=
X-Gm-Gg: AeBDiescMXhmJHhuSeRSNulhS/QLtkOgkRGJ9kHHRHVMSapxpwPeoZvFRFvCakbsHdv
	EB8GMbD3UseCXsI9lWz/2/YP8EkOahHZOrmqV7Rfel/iaW4PcpPe7uNYGULUvJikNgupLPjTAE+
	R2jqVRyvV3p4GkvLahdkPdAvP/T1BSHQib6Vh0yixxZCAZNpiyTKxrPX/q1nwsoRX4QIsNdDdgH
	zxb1pC1rTQS47sovXiDyoWbDx+c9pIbLnU5rwHJ4Z+f+zoDt6/qwWePq5F6Yx+gxWfiCL6uN3h4
	d43MZHBKM6lkDjHAEAD/c/UVYxTVt8za8A5bk2TTpdj0sLISdBz1aH7HUoX/hEz1pK1E9FuSfvV
	WmiRW+/MQw5Ffsv7rfViZQ+zSZCHkSgq1hurAZ7gFpt6mFtnlV1PcQ9JnoZcJfQDHj030cCEyoL
	YJsT0zOxyDjNG+mSIHWvPk+a8xb3a94Uo=
X-Received: by 2002:a05:6808:4483:b0:46a:701:c549 with SMTP id 5614622812f47-4789c848130mr11887020b6e.3.1776268354674;
        Wed, 15 Apr 2026 08:52:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4797a544fc5sm1026816b6e.17.2026.04.15.08.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 08:52:34 -0700 (PDT)
Message-ID: <b80e905d-67bf-4c52-9b61-e52f3acc5b35@linuxfoundation.org>
Date: Wed, 15 Apr 2026 09:52:32 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Mark Brown <broonie@kernel.org>, torvalds@linux-foundation.org,
 Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-12798-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE9A24061B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 09:42, Ricardo B. Marlière wrote:
> On Wed Apr 15, 2026 at 12:40 PM -03, Shuah Khan wrote:
>> On 4/15/26 07:58, Mark Brown wrote:
>>> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marlière wrote:
>>>> Track failures explicitly in the top-level selftests all/install loops.
>>>>
>>>> The current code multiplies `ret` by each sub-make exit status. For
>>>> example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
>>>> `net`, so a failed `net` build can be followed by a successful `net/lib`
>>>> build and reset the final result to success.
>>>>
>>>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
>>>> the top-level make returns failure when any selected selftest target
>>>> fails.
>>>
>>> This patch, which is now in mainline as 7e47389142b8, is breaking a
>>> bunch of CI systems - at least KernelCI, our Arm internal CI and my
>>> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
>>> the top level Makefile, the prior behaviour where the exit status of the
>>> top level Makefile ignores failures from individual directories is
>>> desirable since by default we try to build almost all the selftests but
>>> between quality issues and build time dependencies it's very common for
>>> at least one of them to fail.  With this commit unless the user has
>>> configured a more restricted set of selftests it would be surprising if
>>> we manage to get a successful build and install.
>>>
>>> As well as being a poor default due to the very high likelyhood of build
>>> failures this also has the undesirable effect of causing a build failure
>>> in one selftest to cause the whole install target to fail, meaning that
>>> the build failure is escallated to a complete lost of coverge for all
>>> selftests in common CI usage.
>>>
>>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>>> and explicitly choose a restricted set of kselftests which actually
>>> build with my system and configuration.  It was less obvious than it
>>> should have been with the other systems since they did not expect there
>>> to be a complete failure to generate a kselftest tarball and variously
>>> masked the error or reported it in a manner that looked like an
>>> infrastructure issue.
>>
>> I didn't see it when I did test on linux-next and my repo. I did install
>> to catch problems.
>>
>> Sorry for not catching this. We can drop this patch.
>>
>>>
>>> It would be really nice to get to the point where we can reasonably do
>>> this but we're simply not there at the current time.  At the moment if
>>> people want to see build failures reported at the top level that really
>>> needs to be opt in, we have FORCE_TARGETS for that.
>>
>> Good point - I will go look and see if we document this in kselftest doc
>> and add it.
> 
> It's not documented. It would have solved my issue, sorry for
> overlooking this!

Ricardo, Would you like to send me doc patch for this?

thanks,
-- Shuah

