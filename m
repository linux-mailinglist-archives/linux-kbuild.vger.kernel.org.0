Return-Path: <linux-kbuild+bounces-12796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO2oNPqx32lCXwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12796-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:42:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFF1406097
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D54A83025716
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F9F3DC4A0;
	Wed, 15 Apr 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YgPMBjBI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5413DBD70
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776267768; cv=none; b=bAZ9Ujpd0/m5enlAnxBMCthmYbQEuD8wgEmgCTNdt1/Qb8wUv9JBjbr1mIytV8kOyOUKqQw3gtmNdiLXPX9cbJqFkYF0+GXuZugVZ8IhSN4tjI4lyigkBfr6cvXgngPsUJIj1N5SVH2ZSBMHgOWQgY31xvcjmCHvCj9bzzyM+yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776267768; c=relaxed/simple;
	bh=dDijZuor1xvmTBogTjju/PAPbY/PQMGI1uljwU/belg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=XJYDT44br1x1qGKIpqft3DLUhIEjqSILgIumnmrPeWtScl/17H9Od6GDI8RVxs/+69CfjAtwJDTOJASsBeSeAqu7hGm4X7WOh+skeDJDCO3z+enZlR+qLlPLplkOOgB/G4ISn5zBbE++P+huzSl/37w6ybE9900YBnla8zsbCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YgPMBjBI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso84788345e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776267765; x=1776872565; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BvjwjAzTjY/jU9mV6i6higD+5qPV14w0YtVebluUHw=;
        b=YgPMBjBIzkwymkGdPggQLhS/aMLYFQ8XOej0VFMyFcxtyGqIdYxEnWEniUhpatV6gR
         panPQL9RHnLe61uh5JUojJkZnxh+NXjImsl8gOkZJZQvDMJA7yQeMIYjB9QQY9wfqK7e
         QpYotYfOjp+s5rHq1GsQSDr8htabVfnNaNaa1Pm+FYX7cSILPjyHO3fvxdE5c2I4IaiE
         juS1tdY/uUOc04h2egRgiSI9x0fzRwCULqoeCIRg77uCMxY92OoXy2TcNZSxVO0A/kFm
         kxlS9G1sx9oHw0EAUov3iD1fUchsvsaVSX2GsC6KDrYNDZ+MCgJWzP9i2YRaWV6tf8gO
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267765; x=1776872565;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BvjwjAzTjY/jU9mV6i6higD+5qPV14w0YtVebluUHw=;
        b=I3+m1UzHTFY8CCbRLiMvxstTFONAYO0WqfmT/RuIMsd1pCeUE0Y0p4VFZ8izj1bVqs
         ZfQU6e73pocU37FykToPxMrHAjQDRqcmka5xwaY/lSBES9swCqdS1Cc7l4JglSRja7zS
         WzXzQs8oaRsu4a/01PVJJfX+S9bhpEbUZ2GMIe9V1r45/Ba93dDAcdP3MBwEIVHMOVF7
         FRq/TczPLG7CXdgmCw4M13oJS+4StqTTtmDHx81p4C96i3mprTbaSEcHX9x6JPG+xdo5
         M1xKq482my5sGrk4GNWnGchEwwtDwMsrDe8AMOe1argRpRHTg93m68pJK7t/OUKABVrT
         Nljw==
X-Forwarded-Encrypted: i=1; AFNElJ/a7DK3MH3ZyD0JGeLFjy5IuTSs/9WdmNXxKphjZJLUAnAn5eHN993/4xfgqS1EAQXWKclnet12L/EkGpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUB1+NvZqnpQhsJLcMndQrE/SGp08U/gdlIaN9NCDA6ESHXbF4
	7TP+NwaN/y6+vLNmtTAR7BFZh0TvqMvcTqpM4/6p0TMda20D2Crf4p0/5QppDj75cus=
X-Gm-Gg: AeBDietJtjSu0wmWjsHuKzI7tMZFY0Gzto7zcfDCajTwypWYgZTVFtTZGuev3fgne8G
	Yv0fjFVyqwikrI/FzyyQBsHU9/8MTaxwS+SUt8ORHDlDzv7V5YntmgLkD7OeCEeG2vfxHGZbslF
	Py1wOjL07iJjtvzqPl584Hfsmj9ea2mn/ZT6TvMJbBq+2IL+ryc3k3diujE+mF9oBOiN9pFGNo7
	WohOCi2caeKwlZK5HaQ4IFh9EIrTLaV6tnChw5/FAkt9zqhjoRdK0tGuvl6DcrHyLL6s0NBUHJ8
	u1BrWBo45tKSt2PxaOp1oTzDFCSOaSKg2Fld3GKT7WwFEYnrV8qFTrYdIo4NuMGONEhlzob9Sy4
	vh5HcZOnsyIKXvlsKmUrLnuimLtrxQkk1iRsLJ8BkSPdc+F37kKYSFtSe2VUsOFFWnrY11McwRQ
	NtYAVOhmAXDQ==
X-Received: by 2002:a05:600c:19cd:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488d67e3671mr305346955e9.10.1776267765033;
        Wed, 15 Apr 2026 08:42:45 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:8620:c31f:89a6:1fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c605883sm2995905eec.10.2026.04.15.08.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:42:41 -0300
Message-Id: <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in
 all/install
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <Aishwarya.TCV@arm.com>, <ben.copeland@linaro.org>,
 <kernelci@lists.linux.dev>
To: "Shuah Khan" <skhan@linuxfoundation.org>, "Mark Brown"
 <broonie@kernel.org>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?=
 <rbm@suse.com>, <torvalds@linux-foundation.org>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
In-Reply-To: <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12796-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2AFF1406097
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 15, 2026 at 12:40 PM -03, Shuah Khan wrote:
> On 4/15/26 07:58, Mark Brown wrote:
>> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marli=C3=A8re wrote=
:
>>> Track failures explicitly in the top-level selftests all/install loops.
>>>
>>> The current code multiplies `ret` by each sub-make exit status. For
>>> example, with `TARGETS=3Dnet`, the implicit `net/lib` dependency runs a=
fter
>>> `net`, so a failed `net` build can be followed by a successful `net/lib=
`
>>> build and reset the final result to success.
>>>
>>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, s=
o
>>> the top-level make returns failure when any selected selftest target
>>> fails.
>>=20
>> This patch, which is now in mainline as 7e47389142b8, is breaking a
>> bunch of CI systems - at least KernelCI, our Arm internal CI and my
>> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
>> the top level Makefile, the prior behaviour where the exit status of the
>> top level Makefile ignores failures from individual directories is
>> desirable since by default we try to build almost all the selftests but
>> between quality issues and build time dependencies it's very common for
>> at least one of them to fail.  With this commit unless the user has
>> configured a more restricted set of selftests it would be surprising if
>> we manage to get a successful build and install.
>>=20
>> As well as being a poor default due to the very high likelyhood of build
>> failures this also has the undesirable effect of causing a build failure
>> in one selftest to cause the whole install target to fail, meaning that
>> the build failure is escallated to a complete lost of coverge for all
>> selftests in common CI usage.
>>=20
>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>> and explicitly choose a restricted set of kselftests which actually
>> build with my system and configuration.  It was less obvious than it
>> should have been with the other systems since they did not expect there
>> to be a complete failure to generate a kselftest tarball and variously
>> masked the error or reported it in a manner that looked like an
>> infrastructure issue.
>
> I didn't see it when I did test on linux-next and my repo. I did install
> to catch problems.
>
> Sorry for not catching this. We can drop this patch.
>
>>=20
>> It would be really nice to get to the point where we can reasonably do
>> this but we're simply not there at the current time.  At the moment if
>> people want to see build failures reported at the top level that really
>> needs to be opt in, we have FORCE_TARGETS for that.
>
> Good point - I will go look and see if we document this in kselftest doc
> and add it.

It's not documented. It would have solved my issue, sorry for
overlooking this!

>
> Mark, would you like to a revert for this?
>
> thanks,
> -- Shuah


