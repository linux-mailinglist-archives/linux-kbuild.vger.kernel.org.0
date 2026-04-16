Return-Path: <linux-kbuild+bounces-12811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPuTLn5R4Wl5rwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12811-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 23:15:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5812414D73
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 23:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A514C3015779
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 21:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59C4369208;
	Thu, 16 Apr 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S/b2f6n+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15A34D4D2
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374134; cv=none; b=tLI6wUfrINVygIoIRImnby71NbSFnctXewX9Bzvvre9rZErLiDroyef/wsvqrJd+6JOMonTL39p0PW6VcXyspX+XOVCW5XivfnhDliJH2RLRiqwuHG1PzdIm0UW9qNZID2hel6bbEQE1MiWjC31QcB+upAwDYLCYskaXIEe0ftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374134; c=relaxed/simple;
	bh=I1bLt47VSjWaeL4igpmdpjI+SkBgxLH9XmCMOiEEmaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzfZFoT2r9PSnNJ2hEM/wUcyFTZR8s0fSCZGPihYMBVdcKWou/mHN+Y2x1/QrIPBZcrohG9DgEyAElqCC1q+wxzDm0T5Kg5PeemMb4Q45ThXgrFxL3pnbfY95+ALH4QwN1fwg135p9dfTe8WaK2IV0PPbSKBvN9FePoHNPIbcVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S/b2f6n+; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-467e8aaa865so22164b6e.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776374132; x=1776978932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHMQmXQQ5iVP4ZwbqUQmktHmPMGw34HfaBhpS2wli1c=;
        b=S/b2f6n+sQyL0NMCCzf4/LH+xamwDbL0YP/5Oyob73C1FpVTmAuCfQ8aqILmhbkPMt
         2j7DJpX1VaUkFCUkaEhnUbOAvrPGfEGav50CF4XVcft3k0QM3jln1kYa9/rhwwSHOAX0
         b6QRbWchb5s5Usu5rLPwh2j8E2bjFjC4zkdyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374132; x=1776978932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHMQmXQQ5iVP4ZwbqUQmktHmPMGw34HfaBhpS2wli1c=;
        b=sYomEC35RDpSbOxvDvVILJApLVTzkqPGadtAltF2XA3gRHJv4lcyzkk96ngYKiPIaF
         pZvyi5s5i234m4cWl8VGDrQONNeX0sh8p9VSk7WtJwdo+CalNRXv1a+Fa9Qy3lWKOYTc
         4yFPu4r3e79Jf052w17orq/PZt6+eGU8x5/jeDywMxiBgmXy0Fu0ZH0E1iBF7B6gF6Sa
         YxfhfdiLYITGE5FyO2NXr1sHMWgMcb9AVf9SiOzta5N3walQGJPQ9U34JlSUZ8xWlpFo
         RY7QoDickKS+ioOLegQBlbtu4VaaTByBQI8dhsGTzBKs7ttU4lMM7DGl40aOFX35mUVs
         V49w==
X-Forwarded-Encrypted: i=1; AFNElJ+7nS9cFkzBAUXrYO0zZoEIMvbHQ17KVXoPAqYhHo9XZzUu7oVJJxsiwSOG8oO5zdbdgznJeyRAyO5zCJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzN5cnoLColFc3aI1M3Zgnu8FVF22scNcR7FeqdeAvP9xrPFmn
	FAT39Vrq2q6TBVtEy0/S/LWvljV4BiYG6rcKrQ0SrJ8xczKdW1Is3x8Ms5oyp/CcCzA=
X-Gm-Gg: AeBDiesSLtLKQJNElIBQKMW7vWw6LnwKN+uRzPAuvIMuNqYqMgqEJ+NXAjljCOwo6oG
	80EA18TOkMatryjWMt4Uq+CeO+03O1RFTrN8Tuj6VvvUevKkYNkF8fHn//CpAuQ7bbcWxyNKQU1
	YRL7nsjxAnVE8fd2uQTYMC4Ugp0SW3WwAeGZ7O9kTxHSwAAfseHEL1w7uXV6wMaX3pa52gi1hU7
	ngtjca6VLdSfy+SI3eXBdy7Yqqy+4DcTDS5cDbEBzgcMzWBHiA7Xw2Q1JImJS7C1fUzvqcuA1vL
	jIWS8YQbPNdmGlP5Inwkej6mMBl92wVhRHtuSnenX/OdKbXlnKB8FBIiGpj60sr7AGGUDk6WD3C
	ZE05YDv9MIrRCFmoyQ+hP2ISiXMh88KOgLzEdoZp9ELuJGC2g5r0laEKi/hZ3MKIIMe0vSizJBF
	lIX+u9aDXL22jK8dEsxxV3Un0UUF5kyowLu9JEjixDAg==
X-Received: by 2002:a05:6808:180b:b0:467:bfa:bd9b with SMTP id 5614622812f47-4799a233197mr375962b6e.21.1776374132495;
        Thu, 16 Apr 2026 14:15:32 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47997dbaa4bsm771993b6e.5.2026.04.16.14.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:15:31 -0700 (PDT)
Message-ID: <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
Date: Thu, 16 Apr 2026 15:15:30 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_FROM(0.00)[bounces-12811-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B5812414D73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 09:21, Shuah Khan wrote:
> On 4/16/26 09:15, Mark Brown wrote:
>> On Thu, Apr 16, 2026 at 09:08:17AM -0600, Shuah Khan wrote:
>>> On 4/16/26 07:16, Mark Brown wrote:
>>
>>>> Sending shortly, FWIW I'm also seeing a buch of issues with:
>>
>>>> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
>>>> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file
>>
>>> I will take a look and isolate the two commits that changes
>>> run_kselftest.sh - sorry for the trouble with CI this time
>>> around.
>>
>> Pretty sure it's 2964f6b816c2 (selftests: Use ktap helpers for
>> runner.sh) - I've just put together a fix for that one, will throw it at
>> my testing and send it later today all being well.  It uses readlink -e
>> which isn't implemented by busybox.
> 
> Yes 2964f6b816c2 is my first suspect with ktap_helpers.sh no such file.
> Thank you for fixing this. That way we can patch it and not revert it.
> 

Just a quick note to say I applied all 3 patches and will send pr tomorrow.

thanks,
-- Shuah

