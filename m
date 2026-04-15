Return-Path: <linux-kbuild+bounces-12795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBkgMIiy32lCXwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12795-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:45:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C84060F1
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 17:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BAA7300F16F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7074B1E32CF;
	Wed, 15 Apr 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XglkLSTl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1E18DB26
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776267642; cv=none; b=qN6EzPjA8p1ntvN/5W07JvUv96rzDxiueHwbiUkIQg91XItMS5hoZYsaijedIYYri5+TG49e0tdGkZn9YQDN+BGPtsk9IpN3J+bZ93u0Ia1M2zggXjooTPY69+BJpMzyOQiwtNcT65Smyr+CJP076NsQRDPsiwMEvnum8ZrdOPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776267642; c=relaxed/simple;
	bh=peiaXFopgD2U2+byFyO3EYl1KnMQYZFQdtVvq5N8icM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FflmnAuFnkrAfOTu4Y3bOKt7HjS49hIoMifct3DHNPdvDkElrtDjb5fD0rVRJgccasALAcXWB0xb4FM9DiEeZXUqyz2VdIMOJUeGdect7sGWP6QR0siuK+EzYUKsiswOOS1UfEB8HrHj+uCjH1WmLiBMAgm4xqMSZIvZFvjWOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XglkLSTl; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dbff06e4a6so6616996a34.1
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776267639; x=1776872439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRbU9EO4HkCghO3rFTcKaAJtXlf84b+M9U+wgEYVq24=;
        b=XglkLSTlxeLFgvXJvM/Vu282lSe+0DAJ2I/Qt+vIjTWprfzeo82P2n2ffXS2Q2vC4u
         hH4Mu256F5Ov6Lt4m5+ylnel5nq/EW1MJw34BI2FonBFBRzBaa7q0m9LJyMFFDEckjXk
         24NEJOedkfropoyPlhOPsZVAz4pXzX6IkArzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267639; x=1776872439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRbU9EO4HkCghO3rFTcKaAJtXlf84b+M9U+wgEYVq24=;
        b=RYEXlD+SPwzlHGInQar4HloQRVcZtl7qnG/VCLA/+DflqN1LqjGrifj/DbOq6Eusb2
         gWNa7TbJCPlGxJdTrInsV6MA7R29HWrSNyqXIUiiKRSooprR0pBmaLfF7cWG3QAYbJVI
         O2Opwr/TcJJ3TIgQfCMuclZSrhdlGVE6MLzRjuP1VOvcIfEkbDDqzKt9ESfOmElE1lYf
         yrUAWGA7kzlel5aYuS0D+atXoRB8AjV5tl+pwTCiJ2Mb8z4OqfxyoM9bUFU4lO+2Wxwl
         M2PmQ2cg0+T1pOP9pj4WrdtJtO1J68g0S9yqkGU7obdp+OwPLvmiava++989OX2fGYWn
         kNxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ogZiavpooeDHQTbkb1N1M/6sHW9lehaxgHIkegR/h4dhQWo4IGlRxOPHPY5NZDXw0VDC1Wt+ARNSkqVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YywfNQz3eTabnpt/EpSi0VyyUcg7n/o9wG07SrD8oho+WTQrWCS
	4UJNF3hoNQ2uVm/zhn0ocaVKtIl2nVUtCr2q9Ywc9dBm+Itvcp5Y1ky4MOjhPTObpXo=
X-Gm-Gg: AeBDietThEYgu8OGkJ++Er62+XlBbl8sXEyxmSoDAuX3crBVlE14EjAq8CwMv53AtuM
	XKoGfpJNpLh2606qxXzbb5xPYn1jIxIJ44VQ3uQoiW3k0tvuLCNH4LFBibtfxbD+H8+kllfyyn0
	joTAy0uHJvUPPxFPQ0SXtfzFiMDh4PAtm5KOX7dUSdOuztX5eLnydpqjuSog2IDhLNkJiIBPA6D
	H/AVAei5Jaxdr2IpNsPRwebkGZgi7WrHe15Oy5e8P5xTcEjuS1t6nBUWNASXSB2YdNKqhl/l7bf
	bzaKk8Kfcnj3JpCIGvbXBvq5Kf6e/YQUHQqYXsEg6OK53KwrVtoSnFRXsXJtnXLTapVfxqXYRTQ
	+YAPMjV9QlW19OL96gcs6NZQCrAHhRsWTm7f8MTTApgvXFMcqlbtexQtd4Vf4t2U4W6dckpd6A0
	4YOHBfZdGUNtSwSBpoUf6w5Le6IiYfG+g=
X-Received: by 2002:a05:6830:6f85:b0:7db:b7ae:ef0b with SMTP id 46e09a7af769-7dc27e1a8fbmr12524416a34.24.1776267639310;
        Wed, 15 Apr 2026 08:40:39 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76a333e8sm1470984a34.8.2026.04.15.08.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 08:40:38 -0700 (PDT)
Message-ID: <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
Date: Wed, 15 Apr 2026 09:40:37 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <rbm@suse.com>, torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ad-ZdjzQZXNgkpwv@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-12795-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 542C84060F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 07:58, Mark Brown wrote:
> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marlière wrote:
>> Track failures explicitly in the top-level selftests all/install loops.
>>
>> The current code multiplies `ret` by each sub-make exit status. For
>> example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
>> `net`, so a failed `net` build can be followed by a successful `net/lib`
>> build and reset the final result to success.
>>
>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
>> the top-level make returns failure when any selected selftest target
>> fails.
> 
> This patch, which is now in mainline as 7e47389142b8, is breaking a
> bunch of CI systems - at least KernelCI, our Arm internal CI and my
> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
> the top level Makefile, the prior behaviour where the exit status of the
> top level Makefile ignores failures from individual directories is
> desirable since by default we try to build almost all the selftests but
> between quality issues and build time dependencies it's very common for
> at least one of them to fail.  With this commit unless the user has
> configured a more restricted set of selftests it would be surprising if
> we manage to get a successful build and install.
> 
> As well as being a poor default due to the very high likelyhood of build
> failures this also has the undesirable effect of causing a build failure
> in one selftest to cause the whole install target to fail, meaning that
> the build failure is escallated to a complete lost of coverge for all
> selftests in common CI usage.
> 
> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
> and explicitly choose a restricted set of kselftests which actually
> build with my system and configuration.  It was less obvious than it
> should have been with the other systems since they did not expect there
> to be a complete failure to generate a kselftest tarball and variously
> masked the error or reported it in a manner that looked like an
> infrastructure issue.

I didn't see it when I did test on linux-next and my repo. I did install
to catch problems.

Sorry for not catching this. We can drop this patch.

> 
> It would be really nice to get to the point where we can reasonably do
> this but we're simply not there at the current time.  At the moment if
> people want to see build failures reported at the top level that really
> needs to be opt in, we have FORCE_TARGETS for that.

Good point - I will go look and see if we document this in kselftest doc
and add it.

Mark, would you like to a revert for this?

thanks,
-- Shuah


