Return-Path: <linux-kbuild+bounces-1974-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 038568D751F
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 13:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 973981F21546
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 11:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9356336B17;
	Sun,  2 Jun 2024 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfzTJbq2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBFB134A8;
	Sun,  2 Jun 2024 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717328896; cv=none; b=tJLbAhiISJRbH9VMnvdwwxHSv0jw0aOQ++DYegfmQ0V9Sy6ATAmuQ/n+wAKLvOcL24amyuUlOEKDgW4cve51ScAhhi2zyKa6+sj6q52wI3FEMQag9VnhscsMl6Zat3o7Ak6PjpHwqGErqYJW65MmyZ2EVVUPNXmrcRHdqvlNq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717328896; c=relaxed/simple;
	bh=+hNV2W0JijwpQjXKflQT777I6zGWMuYrdUwsg7UjIxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ibg4aK7VmgC5JUJm0KuCguuw8tLOSluRVNgGa8ZNp1QWe1tteMF+6/MkQtdfofdBFcec8ZROCL41u1Ni9n8KlamjkS4MgA+haAz85D4ypQ7gAxXKA8fg9/d7ZPEOMjrIBJSz9HtGMd/i3xjGjU9IlUit/+NsT6c6fZLibNk7t8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfzTJbq2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6265d48ec3so361661666b.0;
        Sun, 02 Jun 2024 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717328893; x=1717933693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Oajb/kRUzc1WUZBn+VXOrie8WQ1s/4lpFkPQ6Q8aco=;
        b=OfzTJbq2vUVjGCMb5zJSqWngoaBim/Scc5vcQqVcaRimOU11mz7VFnQ8lWPc00S7Qr
         zhWHzUU2Rdhc1MXZ5Hpzi1BpdRZnERh/ZWqz6c426ryiY8tcq3BFE3KkUkaVe7cKIVAU
         FW9b+FhztzUmRchX4z9JtI7lqNSa1dx8kbHv1HXt95ZDF8u5jjcg7Kd7LyiWad3Lk+k+
         LVcjeWltEZpwqUqUW0rkIo1Dt0GVcauJTFb5fz8+5brdQZzXBTeM6ylj1SnIUZgiPthi
         vpjAAv0ixs35XCWpLEfY0by9BK9LtVDbend4A0jytWMGEfu3G4iCF39Bbx8Jw+WS1uYL
         wJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717328893; x=1717933693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Oajb/kRUzc1WUZBn+VXOrie8WQ1s/4lpFkPQ6Q8aco=;
        b=bRsAgx/ioxHpvN9HPQfh+halLPN3rrGzWzPB8zelJLrNIBrugcYjJktvCBFMhNWCZe
         SovQYtpWZQw+tTynBcI42Tc21yAKPopZpKjeWEnVBn/piPb9JNN41xZ8zvYC+Uu3+tD3
         nb307gA4Bd6H//XA7QU+CRmPd8feJR8jmh7CJRQ3mF7B65k/qohzNERznjsWciNAxVuf
         oCGKzwGrDw01QomGkeT0OpocFf849e+86koNncatXHAW1274h3g+JnjDHNSAyal/xNu7
         8JnexQONj74vLdmcTA4S0WP6pGTnU5Ii0hrRPSR4ofQYrNqwIIyOvrkoVOagehkpbduf
         9SqA==
X-Forwarded-Encrypted: i=1; AJvYcCUgY29najmOvBzmACsoobCB0vrW/G52I3jQhWlCU20ZVTXvfFjAfUU4sAnNEI7JYfcbe+MT1E6Np25K/b4RweYYnuavEWsdXeI2oazY7aGlyI7/T+HSsVFBwFflupD16JM7rX4N6MQXgJUe
X-Gm-Message-State: AOJu0YyJeo8kZtHE16MLI4iiFZAsgr7Y23bWcFQ5KvQI88mNhMpIMsMW
	wT5PNCofYy4ZfYg3Lj0F/CfGfRbAGzf2eUCBXBW63apoXHGHU8iALfOve2t3
X-Google-Smtp-Source: AGHT+IFvCtW+5CE30JLBkgRh/P611LTQD3C/kr+7FZcNtFCa1ZUcuSx9CNE+l1IcZBA7WdfadpNefQ==
X-Received: by 2002:a17:906:a410:b0:a68:8950:9510 with SMTP id a640c23a62f3a-a68895099f7mr386775766b.25.1717328892984;
        Sun, 02 Jun 2024 04:48:12 -0700 (PDT)
Received: from [192.168.178.20] (dh207-41-151.xnet.hr. [88.207.41.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68ccf77cd3sm143124166b.13.2024.06.02.04.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 04:48:12 -0700 (PDT)
Message-ID: <47e101e6-fbd2-4373-854a-db9431bf0d74@gmail.com>
Date: Sun, 2 Jun 2024 13:48:11 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM linux-next] Error in "make olddefconfig" and "make
 menuconfig"
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>
References: <b948b14b-1543-4314-9e9e-58a54cf2b734@gmail.com>
 <CAK7LNASTaxPDH4_wozMc9G6NE+HwFXgLiUAM5Ki9mc-Gwf4vmA@mail.gmail.com>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <CAK7LNASTaxPDH4_wozMc9G6NE+HwFXgLiUAM5Ki9mc-Gwf4vmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/15/24 06:17, Masahiro Yamada wrote:
> On Wed, May 15, 2024 at 3:37 AM Mirsad Todorovac <mtodorovac69@gmail.com> wrote:
>>
>> Hi, Mr. Bagas,
>>
>> While bisecting a problem in linux-next tree, I came across the problem:
> 
> 
> I checked out v6.7-rc5-2761-gefc11f34e25f
> but 'make olddefconfig' worked fine with me.
> 
> 
> If this issue occurs only during 'git bisect',
> I need full steps to reproduce it because I do not
> know what you did before v6.7-rc5-2761-gefc11f34e25f.
> 
> 
>   $ git checkout <some commit>
>   $ [ do something ]
>   $ git v6.7-rc5-2761-gefc11f34e25f
>   $ make olddefconfig
> 
> 
> If I am able to reproduce the issue that way,
> maybe I can have more insight.

Just to report that fresh cloning eliminated the error.

Best regards,
Mirsad Todorovac

>> marvin@defiant:~/linux/kernel/linux-next$ git describe
>> v6.7-rc5-2761-gefc11f34e25f
>> marvin@defiant:~/linux/kernel/linux-next$ make olddefconfig
>> make[2]: *** No targets.  Stop.
>> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_basic] Error 2
>> make: *** [Makefile:234: __sub-make] Error 2
>> marvin@defiant:~/linux/kernel/linux-next$ make menuconfig
>> make[2]: *** No targets.  Stop.
>> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_basic] Error 2
>> make: *** [Makefile:234: __sub-make] Error 2
>> marvin@defiant:~/linux/kernel/linux-next$
>>
>> Now, this occurred for the first time, and I don't know how to bail out.
>>
>> I recall in past couple of years you have some insightful advice.
>>
>> Thank you very much.
>>
>> Best regards,
>> Mirsad Todorovac
>>
> 
> 

