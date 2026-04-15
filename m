Return-Path: <linux-kbuild+bounces-12801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGDWNrG/32lOYgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12801-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 18:41:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11710406708
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 18:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A14B23011BDA
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 16:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB9B31A04D;
	Wed, 15 Apr 2026 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qlt7PXFv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602DE381AE0
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271190; cv=none; b=kkGwNi5GIA7YRVyPiDUDO6372tnllJMMUkFIi84EQRgnCk/Ers1D345ZpXqVHT+BqYW819tx5TdH2ExU4E/vLgAjjLbfTZZf/Cj/gr3+Fr4mhHX7Y+2+BS6xEOwDzVDz6tyeP07QYTdtSE/1J0nJRVNQavJohE/XthWH/lgHlhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271190; c=relaxed/simple;
	bh=f0Xhz36jloHzjGryaVb2w/X3cuD5tHkh/y9qkWJJBQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSmB/cQBkgnB4Stb/59hmozZo6oTPUpxZjDpRM2sBGAOwL7q8+tAIQYoNxIHfQMoFwUf9beJsp219SbtBXELg7VHTIwzYI89CyaV6dwEuw2/zc/cV4s4fOkfF5VcA5nw3kWv4iZgJkkahy5LcL9VusJ2AdMaVzKuOgg8qrP6xlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qlt7PXFv; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dbccb6ae20so3703138a34.3
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776271188; x=1776875988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sI6SnmW4yH3OEitrbAs93gP+SdSOTHdc6LjUpuJ7Fnw=;
        b=Qlt7PXFvw9FcmqNI0M5j4MkprnKnAPHjJApGeSzTW0tNwq/vfYPKbp8ZnLlVByAAvC
         daH85kVHmxKMfv3h9Azk4Fxx0zH+vsiV1PLXC2iEhmgRq3rc19rl3tir1eh4G/I0Nnl1
         STPjHmMadICWnenFos2h9RPv4bM4L4oG9+f/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776271188; x=1776875988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI6SnmW4yH3OEitrbAs93gP+SdSOTHdc6LjUpuJ7Fnw=;
        b=SKIB4KgFN89BxWT0q61PsYxRHz5IR9Po8qFZtNXJUBj5Vd66XDyAvzShpQlc69Pt1L
         TLtxK3WBW0wDWPkrRcSxWRFg3NNNjvq1VO11t108jcJMWz07WIlvNkCO8upg4+GoJXJ7
         2R60uLwuluTiC84pUuY3T8Yab4L5UGchaswNEEDDMrylCyYGfPTVknj8r1crahk9KLx8
         slwzW6bScFsH9PjJrkk/h6UnP7g1ir28rIbUXRy/VgcSTpIDWJxhEuzPT6A/fSzWq0Zs
         xKt9ZUYQizMOOX2KU5EAFGPgxaAmtXkNtl+pdbkit6EKaN7kIHumXynyoPnVLTLUEcvu
         R4oQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CI3/XwIMIwdCeoZ096WZRiEx3zdyeqx6QxRqH1L9kBf8L6nfqtNj3imkSaafG+5X16JF6dMgdw/X1NeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWcGcM1/Gk9mBy2DSS1NFyWQJKXevIQlPV1mplosxRgKfIKrt
	qmN3AhlmZM7EkA/zObML4LLzNhVYI4r844rYCgXqBf5m+QhHjfFu+ZT9c7oeuIrQcVCNob2ZeOp
	4IzuEcQw=
X-Gm-Gg: AeBDiesTLPHJwlMIF+LOhLjxKfZKwwqHULWL1+RCSGKGiKVS48nNj+ffHBdw1Qpa8tt
	tijkbtEullIgjC3TGstN1cZYpHvAbErl7MPzH+n9+62tH+q+nOroB2XW5p2wd87xQDzf+Otood6
	Z0EO+xy300sWGvh98Lgtjs1Q/yuR9EVjCx7XmRPQgEzNr1aVPaYzFmg4q5F7S2T/PGrivX+4fRl
	GywFxz282howcawJS3t+aXrhoqovOdF9OXWGc+OXZXihekaeCd5e16zVjTetfjD1kBLpAwARL82
	w6Vsxd04UvhxrL73O1pg1z7E8xexkXAAFJ5HRe+OzUvu4Gdm5miVAxFBKpv4ku5Li66BxoLUK5E
	IEvkzKxruKWB4yesF6OAnwVWIK2FU2ACUl/3WhcqOBaXyqCUvOg9tr/lnFGmeWCJfb39oh9JfQQ
	qkQKNmqbdaQIwduf/rTBvQcMEEZt2jZ1M=
X-Received: by 2002:a05:6830:61c1:b0:7d7:4a7d:fd40 with SMTP id 46e09a7af769-7dc27f23b8cmr12850964a34.22.1776271188347;
        Wed, 15 Apr 2026 09:39:48 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76b2dd7dsm1541449a34.17.2026.04.15.09.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 09:39:47 -0700 (PDT)
Message-ID: <b35bc514-5def-4e0c-9260-79bb2ae9da94@linuxfoundation.org>
Date: Wed, 15 Apr 2026 10:39:46 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ad-8BIkw_ijCLqcF@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-12801-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: 11710406708
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 10:25, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:
>> On 4/15/26 07:58, Mark Brown wrote:
> 
>>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>>> and explicitly choose a restricted set of kselftests which actually
>>> build with my system and configuration.  It was less obvious than it
>>> should have been with the other systems since they did not expect there
>>> to be a complete failure to generate a kselftest tarball and variously
>>> masked the error or reported it in a manner that looked like an
>>> infrastructure issue.
> 
>> I didn't see it when I did test on linux-next and my repo. I did install
>> to catch problems.
> 
>> Sorry for not catching this. We can drop this patch.
> 
> Yeah, it's easy to miss if you're set up to build everything.
> 
>> Mark, would you like to a revert for this?
> 
> Yes, I'll massage the text from my report into a changelog send
> something - it'll probably be tomorrow now.

Thank you Mark

-- Shuah

