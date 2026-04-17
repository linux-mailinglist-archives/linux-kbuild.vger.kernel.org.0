Return-Path: <linux-kbuild+bounces-12816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eETGIpFt4mlr5wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12816-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 19:27:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E041D7C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 19:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0004300E3D7
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 17:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1443397E8B;
	Fri, 17 Apr 2026 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N5PKGutg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D838C425
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2026 17:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776446853; cv=none; b=nIPuoOg903e/dHltswHQ6A6s0LWUet2FExkCgLWYDiO+QvZZfc2ZLs79XTGtaJLcGzoES1RxVnKgcKP5HAtmlqZT2jHqpv66/AfJgTNoSSyS+BoviAH4Uy6PiUqrZG1kuDYG6h/DkUppKzl2fcpOdE+QaQ68spt6QONxwNMeC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776446853; c=relaxed/simple;
	bh=7Y+D6KqcYE9lTP7zS5oHeHLOKpJ4jNFqhuy0hQB9z9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7oz9ykdOpFg9LaZAdjWf1mezpofZzDxl6kyVAQ4qUHwoNbmwk7qhDoVyYq+GFlOA4OFsvmdMwiqGF/vIHYMFqg3/ToufOL7LzUhcAx9n1TuJ8P8ukeuNpBIM21/vPvJdWhiEy9kZkX+6GsXllnuVIeWnrKRzXz2VPRIOfLCEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N5PKGutg; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dbb6c072f1so900671a34.2
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2026 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776446845; x=1777051645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLn+P2ktPPdEjm49mYZXWZCPIYGUflvOd0GJ7r0DE78=;
        b=N5PKGutgvOZ01mZs+scY3X4VeezwrlWv+Z6jo5Je1cyfCfgnjbo+6KmlSaYhAUuflG
         VTxUSdgRlpNjGrtOGGZtIbhHM8g3Ij3wbyhTmQMrwJv/SrUFNWqRHqLN464xATESNbmA
         KD11WjJVAeWjbFp4u405DijA0TIvHtTOh+Vis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446845; x=1777051645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLn+P2ktPPdEjm49mYZXWZCPIYGUflvOd0GJ7r0DE78=;
        b=G6hqWUz3tleesXoc2FkSb++7dG0u/AeMbqUPI47AyxBYeiOW3qt37AgRCBz2l9OgUX
         MngIpUFLl+99y5a6nW60PMw2S0a3BFHL/b2wFc/PPHoFL2ZckB107S/3TdSydjGpB05T
         dBgQO6mK3DaE/ZIcx4NVF5CIcCDHvf1U3UIb+McpKRrmEuuJ4SIPoKnllepVFHlIY3yl
         NdMKfyZqfnJJXV8ktA8J0f3s74e8aRaxItEKYI3ZBV5cah79t0AdSTfY/LWZdMEzrQA4
         +k45KP6Gfc3PAkend0EwSKEQ1gVIFTXY0/QTQAma0v+93V5FnAR0rTDtZog3iVt17Dks
         zKRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/utDoWF0jwXCOUU2kb5UDIt2p6gfmzt1pPzIfDMGKmGxv/5B5k/3dWwiLc8IGVY2Ew2BbwxukUqcoQep4=@vger.kernel.org
X-Gm-Message-State: AOJu0YynXQ/kd7YuU76iC+CRG6qgBNW5dt198MNwnKITT+WEI61m/EJz
	Ahv2L5ok5IwnEydMWEUxF1/UkWJlTSCm3j+TNoAt4IbadCq69RbnN6Nu0OEvjsVSGlU=
X-Gm-Gg: AeBDievVpfs+7AJnctuLym0UcyNVk2j1C6gY0E2RWU71Qs9Kuq7nWXg/XXRIu/BSA4p
	eIZPcSV+BWhx9U4q8F/6hnu13vIKG46O8NuvQjD7DSI2aKVlUcwckZxbfOMOGR0qH43OwwXwkOf
	gsRjvCoE0N+Phee/qZoso2yqFsc2cMD0Vp7rs9JmxhUHJZOoAwdgABWnvyhjStaLGpvPNmiJT6g
	VO217LID7c1TAO3EnHVgxYMZZsJCuMKgOje0AxCPwjgLXQ7t8sQteh1BlyBYN50umPvabLXjJgY
	/8GMqhhU5kqfRKMEZ5uGm5hVawf8JleuzWSR0WjMAN2DbLkWoVjTKM/UtyYoVncVtLPi6T2bx1V
	oT/XYdxPIrxU8PB+6Mc2dA4F4jzbTD7X/Ke6mRJwt0+HzpsxbVJGUz8x1auwhlbwWtVEsVPVr4R
	TzAPFUAdssx9ycdRfroZmuxtbelBxywvU1SmUxAyWb9A==
X-Received: by 2002:a05:6830:348c:b0:7d7:cc53:c457 with SMTP id 46e09a7af769-7dc951e22b1mr2523842a34.17.1776446844974;
        Fri, 17 Apr 2026 10:27:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975b06d2sm1585184a34.23.2026.04.17.10.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 10:27:23 -0700 (PDT)
Message-ID: <edded65a-633e-4891-b4b2-cd85aea20f66@linuxfoundation.org>
Date: Fri, 17 Apr 2026 11:27:22 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
 <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
 <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
 <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
 <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
 <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
 <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-12816-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: EB3E041D7C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 07:30, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 03:15:30PM -0600, Shuah Khan wrote:
> 
>> Just a quick note to say I applied all 3 patches and will send pr tomorrow.
> 
> Confirmed that everything seems to be running fine in -next for me.  I
> am seeing the test number duplicated in the log messages from the
> wrapper:
> 
>    ok 59 59 selftests: arm64: syscall-abi
> 
> which is confusing my parser a little but is less of an emergency, I'll
> take a look.

Just about to send pr when I noticed your patch to fix the above.
I applied it to linux-kselftest next and will send a combined pr
with all 4 patches tomorrow.

Thanks for fixing these regressions.

thanks,
-- Shuah

