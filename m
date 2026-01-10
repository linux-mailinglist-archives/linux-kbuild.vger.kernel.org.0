Return-Path: <linux-kbuild+bounces-10458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB30D0CDC2
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 04:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED744300D4B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 03:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF2F7081E;
	Sat, 10 Jan 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="UgEf2WY0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E76433AD
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Jan 2026 03:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768014815; cv=none; b=IGnrY28gBDnCQWBl9GQUZf3R/zdJPYexAVH9FxxD/E0YevRxSx7qw5oMygboLIE7SIn4WuKy0nT3yjR5AwHc4i2kdvib/YRF2vn3GDhBeq31X81cHOrMcPwhR+PVDJiu79tQKYVRNKrDkfQoY+bU0osOm++A4qDx6+Nq3UBelNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768014815; c=relaxed/simple;
	bh=krELXkH5ubMPF3gKx+ZzZTbekIIyfXsG5WVpDp+p31g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnz3pz6RutGyijpOUmH7XQTxGfP2AdJHM+CIDH8wti4kebr6Unkd9mld7mPGzk/x+EyIuW1oC0xPnpvbhKVhDyYXpOpFtggzD8rradpUTsKK5b/pOo8B8K/6grPZ6OSOAl9GLE+nN/Yc6NwBbaldZ+ohf9kZNXGd2RzIS0W9stI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=UgEf2WY0; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id ePCvv07FKaPqLePPsvyAiM; Sat, 10 Jan 2026 03:13:28 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id ePPrvrXif2l0kePPrvitCJ; Sat, 10 Jan 2026 03:13:28 +0000
X-Authority-Analysis: v=2.4 cv=UfRRSLSN c=1 sm=1 tr=0 ts=6961c3d8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Aea70ojWhvW6xI+oM0giEQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=7T7KSl7uo7wA:10 a=sMBj6sIwAAAA:8
 a=_Wotqz80AAAA:8 a=c-n4J4-pAAAA:8 a=Z4Rwk6OoAAAA:8 a=NZ-89VFvAAAA:8
 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=vqrTxftTu3ppZ4ASemcA:9 a=QEXdDO2ut3YA:10
 a=d2ev92nbPIAA:10 a=buJP51TR1BpY-zbLSsyS:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=pm31WBKQz9GEXVZSZ1ft:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RB/eVnJO0ueNOrkQZcgjGIOul/MDRHDGAgQ8mCIflUs=; b=UgEf2WY0WOud5PLv0OyvmrdhDG
	HSJOHlSES7uZ99hKG72Ed/H1GYAARCb6rLIf4K/+SrOd2XMAldfjsmgmUqpatFwExd3wR7W+eVZGG
	axJ2AG7lZ+Wqwb7B7fNShtAT2JQMSHT1icsMMK2ruNZbND5vw9gEdOE53851dDX+JXnbi1TqkqxMI
	x3LQnWDum5ZrKkU1KXG2rK9VLZ88gw1qHTTEL2iQ8SvKnjFTiVr3RKA6uBBWFjH+3G9hw0eC+DhMH
	98lCt0TOVddDeNomOI+sVdzbyxezzgY5JbRLmOvaghCN6PpGtvEIBZ83Xb6Hz7Qq7f+kyvarnSx3B
	DFcFKMTw==;
Received: from flh4-122-130-137-161.osk.mesh.ad.jp ([122.130.137.161]:50828 helo=[10.79.109.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vePPq-000000006Na-40Rp;
	Fri, 09 Jan 2026 21:13:27 -0600
Message-ID: <d91d137e-a9a4-4b91-a759-62054b53bd44@embeddedor.com>
Date: Sat, 10 Jan 2026 12:12:56 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
To: MIshraMohit21-LE <mishraloopmohit@gmail.com>, mohit.mishra@lunaredgeit.com
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org
References: <20260110013412.14426-2-mohit.mishra@lunaredgeit.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260110013412.14426-2-mohit.mishra@lunaredgeit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 122.130.137.161
X-Source-L: No
X-Exim-ID: 1vePPq-000000006Na-40Rp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-122-130-137-161.osk.mesh.ad.jp ([10.79.109.44]) [122.130.137.161]:50828
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNECsT5YdeyUBD06AKfa9ZyK/IRsn/s0UpBWaXsMIKjewABMLzx52K3W6kT9dbLElDka5Ul6RzjaGPbdD4BYJ2qqDCykv1RYKyt/zr76MPtsmOzktCWd
 lywMk8+A0YWp2lOOfUYV0UZMBI1bVooPxZmMd86q9EevkCsWd5CJYkWNgtbg1s30Kj095jAdbUzqn3Xry8WyLg5rVoXxUGvecIu40OtITJnQwIfWNUEePxi8

Are you intentionally spamming us?

-Gustavo

On 1/10/26 10:34, MIshraMohit21-LE wrote:
> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> 
> Now that all the fall-through warnings have been addressed in the
> kernel, enable the fall-through warning globally.
> 
> Also, update the deprecated.rst file to include implicit fall-through
> as 'deprecated' so people can be pointed to a single location for
> justification.
> 
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>   Documentation/process/deprecated.rst | 14 ++++++++++++++
>   Makefile                             |  3 +++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 49e0f64a3427..053b24a6dd38 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
>   lead to a crash, possible overwriting sensitive contents at the end of the
>   stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
>   memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
> +
> +Implicit switch case fall-through
> +---------------------------------
> +The C language allows switch cases to "fall through" when
> +a "break" statement is missing at the end of a case. This,
> +however, introduces ambiguity in the code, as it's not always
> +clear if the missing break is intentional or a bug. As there
> +have been a long list of flaws `due to missing "break" statements
> +<https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
> +"implicit fall-through". In order to identify an intentional fall-through
> +case, we have adopted the marking used by static analyzers: a comment
> +saying `/* Fall through */`. Once the C++17 `__attribute__((fallthrough))`
> +is more widely handled by C compilers, static analyzers, and IDEs, we can
> +switch to using that instead.
> diff --git a/Makefile b/Makefile
> index 9be5834073f8..bdf8eac51b07 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -843,6 +843,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>   # warn about C99 declaration after statement
>   KBUILD_CFLAGS += -Wdeclaration-after-statement
>   
> +# Warn about unmarked fall-throughs in switch statement.
> +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=3,)
> +
>   # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
>   KBUILD_CFLAGS += -Wvla
>   


