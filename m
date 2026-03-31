Return-Path: <linux-kbuild+bounces-12457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCdGAjdOzGlSSQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12457-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 00:44:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01A372778
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 00:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 777D1306ABE1
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74E4466B77;
	Tue, 31 Mar 2026 22:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EJ8Uw6Wn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DBB45BD5E
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774997030; cv=none; b=i9xA1AwfiLej/pF/9Q1jQ6KCJMM9osmckEZSLv/+TkBdDqfbZzNGlbermZz0i1kwXwULFprZfh97ovf5UowhkOrZ4VqHDs5eaqQ3hkkW4sS0usXjafiV3LWfG/eQSY3Msdfr8Bse34cTqRb3LcD0IxYgaaOqsbpz2kgM+7d9fX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774997030; c=relaxed/simple;
	bh=S+ES5LZ7FQDM+VkrFKzMsHCH8Fyi24/km08w7v9MYHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xq1PyiY5CyuV4dlDzPapx+nFW9UU9XoPGIWQwA/2rR6aGPgudyQ6hhoRkCkoUCq7963AtzDtHscIGj1YjMvkZJNeFGJ/xyeUxYHCCjakU/oekVhC++DH6gP/CTtlZ7t8D205rT/2zMFxmgUmIKGH/kQSWvX4gaAvnb6DIVkZk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EJ8Uw6Wn; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-415c8a4d2e6so2618359fac.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 15:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774997027; x=1775601827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0zFm/wafzYDhWoYf0yG73YRDkA8Xiy0LAp1YWtwYV0=;
        b=EJ8Uw6Wn8rfyYfwSqcJTDAUZa6jlUq5bJZCL3LipSFRbp4v1tozf9pjRs/4/+UllM8
         Q5Scg2YdtqIL2SyoH9zguFcrzNj7JA7vbChGFKzfWM1418QAorYTR0Fu5i2tInGwHqvo
         igDzcTbLrUGfLOsp3QcUIcNuVuEM6xTLhD3tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774997027; x=1775601827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0zFm/wafzYDhWoYf0yG73YRDkA8Xiy0LAp1YWtwYV0=;
        b=AXngvtt1GZC1mv2fS53/SE/6QILuYRB/vMY+stgcThY/1fPZ+62494GzqzP43iiWO9
         diKZV8DWeodsTagfhaxR9Mh76lrUIGizF14G18GE9zcF4pS2mY+gVsO2JZ7ikLEHWjxb
         nCi/w6zb3MsMaez/WQc2yj23VrUqcxWkt8ukKrOPavA+QfwHv0OKvON5frGgOQaYKnZl
         ATSrQr8+qg4ps4S8wrwGATNASsEhMouwjiX0OZWU5iB1rIcoAh1Cjaw6MGQktgUXAAoG
         rTZHkucZrpVXcI+UMvD2hatz06fwe/LRJmI9yJwQyUkjpeCIoJtq4RDwfQ1o3wxMAnPX
         l7YA==
X-Forwarded-Encrypted: i=1; AJvYcCV3/Lo7xiC24CMRHBY6yhnOq5v/wmUPF8jd6LM0pPM8Wvp5lFN+31Q2Jv57pmlNtZE4gaa7k7JG8xX3u5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRP8VxhoVsCVls2/1EvR4h5yNjtmiU4L190E5CfCF+kxrihVu
	lyNy/xYPpesrqWq+PO/eyP8tSKP2SQvqbgb4YRUReXjdtobb9fD8gLaL9TKlg1Gy15g=
X-Gm-Gg: ATEYQzwoFdwrh3dBZy14vC9Qezc8tetHyBXZFHU+veG8ubLSsefeFDH748b+zdaVuZv
	Nd6rtndbS0iSceuEGQ3vNjmbipo7wequxs+PA4/lVvR7CcRWC4W4Cfc3WCknIvZ+srlivICHTWD
	yO+U5CnmVP4zOFCTEjNbfODHX6J3dk5M+MJz2lbRjj108LLjLaufwr7ch3YOCc7CPmZ8P1hW35s
	GKfUVt3jGb5I/Uhd9/76GCgUxWm8PdCrHeUzmQO0cYpxUv5WrF75nKetbD9LExAxRGoKFJE3jER
	hiD/KxfpXkYHluO6HmISd+MyHvr9Sgbqkh5jhgcLN//6hSAXoAGCMDM7PZHmM7lsC2iNIdCEPhZ
	NhI2dzhk1cpxTuXK2XhIthEAQ4As4t1SqlOi8CHj1JRTg12NldTpfiKobp0Hr2PhsIHRxD8Qd4T
	nsvlEUCgiE0FwYmmMNyWyioJNOoE3eDvaAd+WbPmjFKP7Tjg==
X-Received: by 2002:a05:6871:823:b0:417:2daf:6aa1 with SMTP id 586e51a60fabf-422cff4ad74mr935250fac.37.1774997026944;
        Tue, 31 Mar 2026 15:43:46 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04d95bcasm8422610fac.17.2026.03.31.15.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:43:46 -0700 (PDT)
Message-ID: <b01d1156-2213-4051-9f98-60e74d18e2a6@linuxfoundation.org>
Date: Tue, 31 Mar 2026 16:43:45 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] selftests: run_kselftest.sh cleanup and fixes
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
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
	TAGGED_FROM(0.00)[bounces-12457-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: 7E01A372778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 12:29, Ricardo B. Marlière wrote:
> Hi Shuah,
> 
> Please consider merging the following patches. They are mostly small fixes
> to run_kselftest.sh, plus one feature: adding the option of passing a
> directory to the "-p --per-test-log" argument.
> 
> There is a small corner case spotted in tools/testing/selftests/Makefile
> regarding failing sub-targets, and also the removal of the default install
> directory for out of tree builds in the top-level Makefile.
> 
> Thank you!
> 
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
> ---
> Ricardo B. Marlière (6):
>        selftests/run_kselftest.sh: Remove unused $ROOT
>        selftests/run_kselftest.sh: Add missing quotes
>        selftests/run_kselftest.sh: Resolve BASE_DIR with pwd -P
>        selftests/run_kselftest.sh: Allow choosing per-test log directory
>        selftests: Preserve subtarget failures in all/install
>        kbuild: remove kselftest output in mrproper
> 
>   Makefile                                    |  1 +
>   tools/testing/selftests/Makefile            |  8 ++---
>   tools/testing/selftests/kselftest/runner.sh |  3 +-
>   tools/testing/selftests/run_kselftest.sh    | 46 +++++++++++++++++++++--------
>   4 files changed, 40 insertions(+), 18 deletions(-)

Thank you Ricardo. I applied the series to linux_kselftest next

I had to fix a minor merge conflict when I applied patch v2.
Please check to see if everything looks sane.

thanks,
-- Shuah

