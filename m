Return-Path: <linux-kbuild+bounces-12774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHcYGqcU3WkOZQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12774-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 18:07:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B08F3EE53E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 18:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A95B307C85C
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 15:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCC9340282;
	Mon, 13 Apr 2026 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H2HNf3MX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D244537FF61
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095938; cv=none; b=rdDr6GNNdhfTvP00bLWVYB3N3koQJ64PQu15a009OU18tNHo2yLqsXHdOcMuQ+6bDYpzFSCgtjhMy1IFZPHBBa6KTGDR6kxf2gXlr7awwknk9zAffmtB7uinD/X7/8fGiwEmn+V6hnBCQEneRCk0vn2/KzPdYpEh58DOi++WB5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095938; c=relaxed/simple;
	bh=Tdp+mcITKsiIvySwDVpO5FTy5mQWlwJlxWX9gnP5yyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JARaNzGNcfj1meYa/elBJHGhiJuy+DyNk3yZQsZsdLeqxOT3QkwO1aCyvfBkwFLAmw+y2zk6Owoj6sREf7+rmqHXbSAK+1gC4IRAh0/bQE17nxhpjbdOpOUH0lvOF38xWIv14fSqXY/Z6KLGSFvi67rtuYrYoqGKlh5nWycgGTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H2HNf3MX; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40423dbe98bso1765393fac.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776095935; x=1776700735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0mLEqSJkZyHQgnOUF59T99Z8znx2jxsYBHcn5qzOMI=;
        b=H2HNf3MXI34QGLk/inzZg/NJmrLbBzjh8eMfYTpo7NCaBYbmfnFyM8XeuqFau1/E3E
         fBmYZdwbH6xVtPffM9LFT54aA3HW5/Fq/2GWUSOA3sH7u92BbweAySEXmEqsD1/7RKAr
         oZLpLA0YBkexEP69b1BxuDz0u7pSS16Hg4xIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776095935; x=1776700735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0mLEqSJkZyHQgnOUF59T99Z8znx2jxsYBHcn5qzOMI=;
        b=LFUYr0eJRSGY33lgWpmv/FK0Knbt4TSVYfXW3d0sQ9usdFpQhFueukXqnZjh3RfW9b
         alhBSkYbPfGo9R5ouTNG9WPPvWtKbZVv2D2lVbijAN/alQbeTIJJdM/MYzxfnAOKdrQI
         DoFbOqvmjnvAFi04sWbHC2DfBXAc3G5LVZQQ0CAbfztjCVHbWMJfoDB2csa68dcwcjgz
         wo0rK9bnMSr+rFE3PL3KeQkH8sTzj6gts+ZxioVytxQ+QDGEovBWJg5Nz9hNOz+6Po7P
         GWw9fetzaIgJVfL+qkd/JNN+8fKpZvMmZtRD9d4UiRRKUGywt+5rKMy3VfAYWl2jJ8FS
         yIeA==
X-Forwarded-Encrypted: i=1; AFNElJ/9W7dg9s5gd/L59C5sYFM/7Pyo90o1fs6V2UPPmAlVMAQAp7W8BIDHKGU+HhcUP1+FZ5vJf9/Cg/7kl+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpiA72Bu4XvvuEj8HNr2gz6zTDqNLywZ/dndlRTAyV3hmNGnve
	D9/GVoofVjnhvIq/iy8SLdch3ydKNQ/Uh4ARePpKT3EXgZT9s6M6JkxRRAyJQsPMxa8=
X-Gm-Gg: AeBDietC2OoQSlKf35nL8fdpj11o+rKMq8idWSdu+mKU5C612cnMhAP0eMwqdmhGkKe
	S6kTr41IxsF8FTwSMFFURn2R8iRtULj6/coExoEuXbVzHlk58ychWoBbrqL6ZUkb3+/BH5+5+w6
	5YsJElI8wqK/9b8KbCBsKO+1MNgKC3f6apka8jYP9MV4FEqVF5I7Uj3VhOzJKnP5rq2Z8mNComV
	ARhvtIIEx3ESyedUMGxjLbH7KQnd2VfaUGkOfIpz9T/MbKwOPleaRXzhv0mAi+YfTShDPjZX1FD
	bN3o+S/DdseuFmcYtY/dYiTOjIgRs5jmLonPYNRN+QXRKIpZsRpdkIIqm1Fret03yJfblakuWyM
	7yKa9aKsWuiXLSHna57OZNZYOHCwdR8w/5T7CdPPIvCgQdbNAv/Bz1HdVZuYUqhe1JZ3onJBsXY
	qWzWnFseqP3k5O2/iyfnb7f2Is5KDo04+v7JgOL0NejA==
X-Received: by 2002:a05:6870:1604:b0:422:f3f3:5082 with SMTP id 586e51a60fabf-423e102d530mr6937269fac.21.1776095934648;
        Mon, 13 Apr 2026 08:58:54 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42410ac4858sm4857171fac.7.2026.04.13.08.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 08:58:53 -0700 (PDT)
Message-ID: <7287249f-3afb-487e-adec-8cf08ae7b1ad@linuxfoundation.org>
Date: Mon, 13 Apr 2026 09:58:52 -0600
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
 <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
 <227fd478-581e-462b-9579-afc5028abced@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <227fd478-581e-462b-9579-afc5028abced@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12774-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B08F3EE53E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/11/26 06:49, Ricardo B. Marlière wrote:
> On 4/10/26 4:19 PM, Shuah Khan wrote:
>> On 3/20/26 12:29, Ricardo B. Marlière wrote:
>>> Selftests built with O= store generated files by default under
>>> $(objtree)/kselftest. Those files are not removed by mrproper today, so
>>> stale generated artifacts can survive across builds and be reused
>>> unexpectedly.
>>>
>>> Add kselftest to MRPROPER_FILES, so that the default kselftest output
>>> directory as part of mrproper target.
>>
>> Does this change remove kselftest build objects in-tree builds?
>> It didn't for me - also there is kselftest directory under
>> tools/selftests that has several scripts.
>>
>> Can you test this for in-tree builds - I would like this work
>> for both.
>>
>> I dropped this from my next for now. This can go through kbuild
>> tree.
> 
> OK! But please also drop https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=33880424308df3c2e39fa88ea74f051205ebb7b4
> 

I can do that - you didn't mention the reasons why you want me to drop
this one. Do other patches in this series depend on this one?

thanks,
-- Shuah

