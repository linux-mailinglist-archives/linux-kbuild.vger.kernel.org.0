Return-Path: <linux-kbuild+bounces-12745-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6YlFEUZN2Wk4oQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12745-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:19:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F31823DBD9D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A1A8302E3C5
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 19:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF7B34752E;
	Fri, 10 Apr 2026 19:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="giNxx1/i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6C3446A7
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848763; cv=none; b=WIwzEfp6oDA8YaPUWVhKkQbiHUOI4Mn9GJ5oS+oEpvmSKMrByeABSK2XdWGProE23Wkj5KQJR9i+ltNPAJp+HZBUvxILF2VHWfvhtlZyjyFLx2x/hrdUhVKUQzj6AZJZXWb2RBhPK3sh2ymSgq205hLjCZUXg3f/rntDeSC4SOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848763; c=relaxed/simple;
	bh=k5ZumHR02eepfJezSIqhe8isG+ypbh6AHNXxsyT/g5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPIv2JUtbGFFHJUN2lIGuBFxqjxw5BebSwhFfzYXjcgoKAyF14be1Z8hSOEsb17rLZL1jpByZXkjW9bsdmyb1hlPR+yTvwKlM+9FPQDaO8zWYazFcPsnDhd/EfU0cheoUS1jFZHmhjiTWk67G+76EeaDFxArNDJxs3YB57mua/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=giNxx1/i; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-68244d317e5so1429348eaf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775848760; x=1776453560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=liiHzz5YU4jNl+5v9Ct+tlRl/EZvkJ/YkQlCHPtfo8w=;
        b=giNxx1/iZv1xhPbHhMCOZk6edPvBeog0b5lbWQlIEiPzd6nqABW4lc+QSoEtSffJG7
         Ld40mBkZoEHUfMGY/JNAmcIaaOd4FC2mOb3jo1rvPXOllAG6f+zxQpGHNvSf37rSqPFM
         +3KfyCHQm2RaJPYETFtS+Z+Wzrea7SbgRtyUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848760; x=1776453560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liiHzz5YU4jNl+5v9Ct+tlRl/EZvkJ/YkQlCHPtfo8w=;
        b=dG3MI+S9kf45Mnd41XWwu4s0sxxNUZ+skkcJ1N82FYDVSdNZQAskFy8CnCw3D5Nqmg
         3cBU5DrHFJ05ev1rRFOTD3ID5lpKoDg75j226eUwwY9YeqyJ4uXquuqElbCcWUMeB3N5
         wUpZaqaevaehJKrA4hpE7HTeoWcHBCUBriWm1zpR7pWoIek4p62AIL+R/Qy52LFbtEKq
         f1ZSEafThuGtEGH3/cm0DkEmSVgCx2LklZCdhhG7qEn5dO9SrAfLpI7jkbG7pJQ31Qrz
         sSoD3BzmTlKefZIOIhXa1HWbj4/RXGtwl7gxPEzSPMChpv8dk+SAyYAS6/VWqHGQ+uPj
         km8g==
X-Forwarded-Encrypted: i=1; AJvYcCW6U98/nB32NrTAXKe/rG55vFv1KG3ezFH20hiRSpRBdPE/zXqLfkzBlZWLFXOzpQ65OpvKm3rArk5KekM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhC7li+GQ6EiDH+ixvmP57a9B0Z2OF7QZvZrCFvZ1K0RayD9x
	dBrO3yL/GcpjNe23MuneCa4KOmZ7o72B3ulHCE9aLOYhYB7GeeP9xVi7RvUrC3OQmdU=
X-Gm-Gg: AeBDieuJu1M57bLjSbAl6KidM93Wn1GYxM/DFKdx1+fQ+cH/1CRC5uIU8DJJUbq5zNU
	yiado9Ahc/EG2MzRW0SjDBV6BvPJgnmVegeDkojkl5pBsu4BymfxZh78oa2CnqL5lG5LHUPFV//
	pXSkRKfTSZS4UtLPqH8P688sDIFuVq9IG6RHxHZjftTRv1UDDdiH/tcK6TZbqOupYrjddKbdfad
	7wD0rCGt/I7PzNa1v/C/jNkYAgGXq8csI/ticFfIbpnC7cOErUxXF68IBskR6hleTAoAYwbD3TW
	MDlaRqQlR0niT692jeH5WatZXS7cRsavA876BoW5dEsvRlCiVh959BGKijDzc8sTIzyULBAhhni
	MKgsGdEykO6Kl5yV0WFfxSmefeV5oa+wIDv1ZDBBdRa0bNcMk/q0tyBer7rOEj2wPHdUWr1vdlL
	JaKvENKRQTn6cZXXEZ1QTlfjxsKJrQmcq/a4U=
X-Received: by 2002:a05:6820:62a:b0:67e:310a:3638 with SMTP id 006d021491bc7-68be57782f1mr2272301eaf.6.1775848760525;
        Fri, 10 Apr 2026 12:19:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-68bc88c80a7sm1819630eaf.8.2026.04.10.12.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 12:19:19 -0700 (PDT)
Message-ID: <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
Date: Fri, 10 Apr 2026 13:19:18 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] kbuild: remove kselftest output in mrproper
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12745-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: F31823DBD9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 12:29, Ricardo B. Marlière wrote:
> Selftests built with O= store generated files by default under
> $(objtree)/kselftest. Those files are not removed by mrproper today, so
> stale generated artifacts can survive across builds and be reused
> unexpectedly.
> 
> Add kselftest to MRPROPER_FILES, so that the default kselftest output
> directory as part of mrproper target.

Does this change remove kselftest build objects in-tree builds?
It didn't for me - also there is kselftest directory under
tools/selftests that has several scripts.

Can you test this for in-tree builds - I would like this work
for both.

I dropped this from my next for now. This can go through kbuild
tree.

> 
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
> ---
>   Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index c9b7bee102e8..91e6ec790a0f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1662,6 +1662,7 @@ MRPROPER_FILES += include/config include/generated          \
>   		  debian snap tar-install PKGBUILD pacman \
>   		  .config .config.old .version \
>   		  Module.symvers \
> +		  kselftest \
>   		  certs/signing_key.pem \
>   		  certs/x509.genkey \
>   		  vmlinux-gdb.py \
> 

thanks,
-- Shuah

