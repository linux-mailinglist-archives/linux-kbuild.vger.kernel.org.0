Return-Path: <linux-kbuild+bounces-13160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKgZAv7sBWpWdgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13160-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 17:40:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAE0544297
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 17:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6220F315C683
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 15:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085843E51F7;
	Thu, 14 May 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8msXdlO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B453DD52E
	for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2026 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778772407; cv=none; b=tzzDdeb6gTYAwQkGchDAdP4goomwIiUdiThn66pnoOWCrYB9jTkFZ9I/mZ1SEh/cj/zbM0qL5LpjdPxh4caj2Uf0PV60eVcraqV1etYyLhFqt4dM8np0vCyUJnZCe46p2WIxtoKshc9h/cHndPZmX7IZCfmWr/UUhmAu3PZp1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778772407; c=relaxed/simple;
	bh=YrfsVrzh5AabJ15tVqtyAaSY7ezoo1+No7Sbd+Eycoc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=O9ApR2rnx2AGdLSr1U031KQefqyPOxkMk052wJNH8sxROx6xal6Yqx6Dv9Zw0yAbRt+oB5N8uwOq2ZbZ8pDpxgsmzN4s4mbYYZkCtN+6zerOuhdStG/HDS8LgWDUi5X11xaZ/iUhnVQm14hFPMdO0AEC7CuVXXAPbziwwGrhClc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8msXdlO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso44730835e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2026 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778772405; x=1779377205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDeI/hPIeiTi3DKmsx1BqOj+gsAw3L+zMQcd0sUrwrk=;
        b=J8msXdlOKlMpAikMeQ6aoJwomYq4LKny5P56D4rkcM8Of1lCJLfpkS47LgCESkOpsI
         88BTVKEADOpUPCD5GLHTdelt0X0Yodk3Akk5qlBN4QZK8a5rhjDVS2KskaE5nchL2N83
         mUlsQSoZkRUHXXE8N7GTACb3SA05jYe5GQuLO8osD4jWvHNTKDNa8L0IHF8Q9LEZiEJ5
         kg7qSyWzc2BxRsJb1A6K8G7617iG4QlHUUEdxi3Pj1wQbHwQF5nW7LGOc5KoImip8sU5
         ChLGEAivNrr96aBvTkFO2cov7ZY3FjUELjJU2RLxc28ohGGZdfdrYEqiiktljyVU2rt2
         Ng9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778772405; x=1779377205;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDeI/hPIeiTi3DKmsx1BqOj+gsAw3L+zMQcd0sUrwrk=;
        b=oqfWlvqpL6D33nIbmvAU4jzai3ODtMYif5FIoa/fgzA1yweFsx1TMaCXgcQKsQQBPs
         EElO0Ak7XVBijIE+NvcN4CcFBej3A+Jhu5h3/EDPQPiqYGdbmnPjGSdjqG75N2lEBrXQ
         LCqMuOUy7y+UfBQMBJWbM+SxqYtss/pXnbXqPZ7cd3cwNvjwIRL4SSNfXu1+/nBQywNo
         bGL5VV/p1BBFAqHyWhy6lEauobM9BFv+ZOp2ltaJCXaGsSLqV1j2TJi6c7YYqLQyTAF9
         UJhv5I1mm74ytMNFrFrCLUTk6blzIRdStB9NocTkpESwAKgIboZOqOnNcv9m9pAnDPp/
         LuzQ==
X-Gm-Message-State: AOJu0YyzS6VddtE7iexAYqpcRIbj3kUoy0MyLdOm0RH1Hov1OvLtPt6Q
	DD74pWFgFh49v2GuVoxHZtnZC6AWeKP/7QGFUcMRma89D4CM33HK5/2NUX4cylxyKFY11Q==
X-Gm-Gg: Acq92OEsGUwuokbDrxWhL/sNRhg03ewyNvwUYtA+h+iIBm4fJtl6YcZzD7g4yvr9KjR
	VwkGOrZZAYHKfQoM4djEL+wivtaBpR+efjKQZMOJCHmFPzMQiSVBpuvB5RSvqXozVdNkcR0LUS0
	lLLS/2C75BsKzVKTZYPOssBpITjox2HRXFTT+pGwZ2gA+CJXOHn2k03uAUgRUJKN4ZxGh0hDJmu
	tWicV0vj3eSgB7trNQX7sGDy/TKF6aYS0YMhZVgRILEWsPhpU9UG3IYf429t4P5AKhejD1FTdUR
	Uk4uMGEByXMsXi+1svWl8a0ttANnyZqxKiIU1FnhPO0LZPnqROD1AAcZpJNYAnOfAPVjUN8Y1OB
	kZTtjsgXHpu+JnbeHv4PWU4JLuCCxURcFsXiOtbzfYOeiAlh2T6j6bSsOsFRczI6VlIwGXkc+zC
	ueuplFieUZYKLYdJkgwTzH0MiN3JhapIfkYX7r4i8WWP01tvQdA3lKobI=
X-Received: by 2002:a05:600c:3144:b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-48fcea18dfbmr117797455e9.29.1778772404735;
        Thu, 14 May 2026 08:26:44 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm550915e9.8.2026.05.14.08.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 08:26:44 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <6d11bbb5-4877-4707-9f98-1b6ba2744ce8@gmail.com>
Date: Thu, 14 May 2026 16:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
To: Nathan Chancellor <nathan@kernel.org>,
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 nsc@kernel.org, andriy.shevchenko@linux.intel.com
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
Content-Language: en-US
In-Reply-To: <177876553250.305249.17848321995033732158.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7BAE0544297
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13160-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/14/26 14:32, Nathan Chancellor wrote:
> On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:
> 
> Hi Andrew,
> 
>> [...]
>>
>> This new static checker is the script used for [1] with a few
>> improvements to avoid some false positives.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748 [1]
>> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> 
> I think something like this is reasonable, as least until kconfirm
> is potentially ready for integration into the tree.
> 
>   https://lore.kernel.org/20260509203808.1142311-1-julianbraha@gmail.com/
> 
Agreed, don't let kconfirm block this. While I do have future plans to
support these same alarms in that tool, there's currently no overlap
between these two, and no ETA on that support either ;)

Side note, this script was actually part of my inspiration to go
searching for more misusage of kconfig and build kconfirm. I also
previously cleaned up some dead code, thanks to this script:
https://lore.kernel.org/all/20260309122321.1528622-1-julianbraha@gmail.com/

- Julian Braha

