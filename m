Return-Path: <linux-kbuild+bounces-12809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LXkDy3/4Gk7oQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12809-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 17:24:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1552410A72
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 17:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E44C30693C8
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398503E1CFA;
	Thu, 16 Apr 2026 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UXD+qgWg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2513E0C73
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352874; cv=none; b=Cr0Z7tua083srdkERlPBjCbjNGv7Nfl1ZAR2hQViB5Iqyi9W4q4SgFxFGiu1zel7ysPMwxD0F3ogv8/c1WGZEcxQCNWXiN9DEVmUFWhKFu+BZVDoTQlbSxjPBni8xWknm/3VgMxYdO/O92jR1XZfLUwRzRMZlg0I/dhNpdsu2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352874; c=relaxed/simple;
	bh=lY8KnyEnww1BaerqB9rUeouJcntcbdG7KfY4D4jc3hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaQnWVB2mPN5EM3CeKMwD6awL+zDFLwg9de9Kxy7ZRwzrbWri6OQscyVpjvp9m8MV0ge0eKQ8ZEeIbxkGZnOzKg7OlDu2zAud+7OA4J2Z762OzX+ZTxtb38MFBLQKZPVKmY2tWanZ/SL83ymWf2C4D/BalLC/tJ6L22OtrhTdmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UXD+qgWg; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-685013eb590so531442eaf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776352872; x=1776957672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ED7Dtk/V7JNqL6bwm+6sfQAnzfjIa9OPc/3hBimeik=;
        b=UXD+qgWgk/64Yt2GJgOpAU+SRkyuvWJaYd7Dy4XFvOUF+8y6zYAusyTKobEbIbGnva
         3xGjwKXH5t4ooZsTk7WgeIoG7XrWBQInKdhGmjavoIW2OYFcDTdsFW5UtaF0uxyHvYj+
         w/DTeAv6C+f6GYxKsZt5eefMY0G+6JtzOxA8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352872; x=1776957672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ED7Dtk/V7JNqL6bwm+6sfQAnzfjIa9OPc/3hBimeik=;
        b=nx/F6JJLDAPYKfYNq18AL//1/DXt0JLeOPn8mY8ylgZ+IYVTJ08z863rye/0ZdN1sc
         VoK3cHWYkXU/uqM+qZFTyyOXj9JwwgDI+dMKbBTlu1k70QGbfejbnG0whDbyqFVzsCD/
         NuGMqq1rxuT9GGxOF1BeKMCDSsf6aPN/zDA9uMkOMO0Vsl9MqgB+ujGSSxSExEpRdZVP
         cyuDJR9QICeY5/l9qbPQkUbGus4E0K+wWBMEse1F1n3uFc1r08dW3x45jUV7m8Pp7AJH
         SkjCgk8TFGDBDm55fkszGzuqdisCivePIFcWn9mSYg/zzHxI5144Cz6gQqn0kw45lHac
         ZwJA==
X-Forwarded-Encrypted: i=1; AFNElJ95snmnxgUStnUfOl/bs1plGly96SsnC3HFp6xj0rmRKPYxGFR1aZd2CnYnM9qKFoBfHuzv7SCBfpdw8v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzVD5BZuOQtTxZ979DhZWiEkbxzGekISURMxpHYGgRiGoslW1m
	2NX0+NYfIr7iiDtq3T8k755/ibBCWDkwbj+hfuYvIoEbV8MuYf72l6RffjcsBtUWLXI=
X-Gm-Gg: AeBDiesVxQWOtTt/+T4xtEa+/JioerNtOqkjl9FQ14PZgpBaze8AcuYs5dYzGIEPmND
	YgHGzD6uQDly9sviySfSq3715t34UQCPOXqPkrdEy03R33rdNatmw0i6Q3skWuo0OsKW5e+goaM
	Uh/9yKE/k2nxstpUFEzyFTE+lyo3IHqkSRjpYrvdL9vD55cU4K7ns9IqlsywQEV3FbKuZnV4LBK
	ZRxoEr1+mMV1ZCD92mhbDBOkdeIth5/Ch2NHuLN4GQav0h9/ZY/IXOjvqNXBLOuS2/68iuR89Gi
	3VNILDgk4vLg6CO/NYxJJMkG3INQ76qluVmt4EBiZUgrdkh+TWGdgK9V76ttSrpmJHMoRrkrWxx
	NDfUhSrgD58fwTxqE38NnPWuCgqj99V4QcD+Vcz3S2uolJDB5L/+mjEHQkewrwdWrk84Aoia1Dt
	z3P3lTwxq62vBAfsA2vf2KCZ+vyD7YMZ0=
X-Received: by 2002:a4a:e39a:0:b0:67b:b738:59b4 with SMTP id 006d021491bc7-694249766b9mr1880122eaf.32.1776352871649;
        Thu, 16 Apr 2026 08:21:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42689699dc8sm4149132fac.14.2026.04.16.08.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:21:11 -0700 (PDT)
Message-ID: <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Date: Thu, 16 Apr 2026 09:21:10 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
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
	TAGGED_FROM(0.00)[bounces-12809-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,runner.sh:url,run_kselftest.sh:url,ktap_helpers.sh:url,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: F1552410A72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 09:15, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 09:08:17AM -0600, Shuah Khan wrote:
>> On 4/16/26 07:16, Mark Brown wrote:
> 
>>> Sending shortly, FWIW I'm also seeing a buch of issues with:
> 
>>> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
>>> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file
> 
>> I will take a look and isolate the two commits that changes
>> run_kselftest.sh - sorry for the trouble with CI this time
>> around.
> 
> Pretty sure it's 2964f6b816c2 (selftests: Use ktap helpers for
> runner.sh) - I've just put together a fix for that one, will throw it at
> my testing and send it later today all being well.  It uses readlink -e
> which isn't implemented by busybox.

Yes 2964f6b816c2 is my first suspect with ktap_helpers.sh no such file.
Thank you for fixing this. That way we can patch it and not revert it.

thanks,
-- SHuah

