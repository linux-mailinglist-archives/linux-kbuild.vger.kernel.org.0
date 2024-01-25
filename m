Return-Path: <linux-kbuild+bounces-647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DF83C502
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 15:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE13B1F26465
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 14:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFF96E2BE;
	Thu, 25 Jan 2024 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="Z0mtIbOp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E209E3A1B6
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jan 2024 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193759; cv=none; b=XKWfHqXHoSQPyf4BovWS6TZPcbuoMOlfYGa2BQbsPlTHkyot2tbnaMUBTjQLOnvblq7UXAdZXeU8qwIj9wz+QJ4jbru8C5byexZqzLzPdDheIuMCHdwpSNWNEF2Vj8fA2y+7t/WexWhhy8Em5N5SFdqqjXkjpzt14soli5CrlJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193759; c=relaxed/simple;
	bh=Lri9+r3U5+UXW0b6nYnAwhx2o25q+wQCEH/6xNOMjuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDgXF2BEpu8zCPmofbv99ZHUD+WGVV9UA/JkR1UzIvxCZzCqW/L7qCHTwCj11pcb2AExOM2nSi45Qb9BG72UI+Ue0rYVOx9sntCujNBP+pX+vryfJtxp0Xu9DGrJX1gdUQuY2ZAuzS/YjzGailDxa/4oRSyo5Rib6JECLQG9isQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=Z0mtIbOp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so74425635e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jan 2024 06:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706193754; x=1706798554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m/VxeZJGjBjcDQmtxAoZtXCX3PaowqHCK6uf1JI14tc=;
        b=Z0mtIbOpfxc6JjAJgkblDik6yBVVpyM0z5qQRbTA+wkoa8OhQzvPRU1dNqOoPROT+6
         7BzS36UUUguRti7g1zP6o83r0w5dUadPyiSw1Gx5ZCmyXjt+NkyxPfbdDRnVpJvu60hA
         5Z7eGmpWWbBMnh+3aR8Y1kAxwsk0Xrox7qh21XBfY4GGq6EmcOUvGN384BLP2kq3qZB9
         OnjV1igH3MdUMPj05lRwq/6LShUaHm6SPKwDC7RAtgrcbgpJL22zFC0yc3RHaOIQFgwe
         o9CNrCIy4LS0ejpQv8j6YgvNMNn660MwfFj8KhuU/EKvG2me/kWrVfz9ZL7++j/YOc8E
         G7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193754; x=1706798554;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/VxeZJGjBjcDQmtxAoZtXCX3PaowqHCK6uf1JI14tc=;
        b=s0BaZSzyhS86Hya4BdJfsim8h908DirAY/kFH9bN3G1mY517BMdcptZuc+PYlNTUEi
         NBeenllF109SEAY7eNF6XJd/f55mlD1kjUn6NWV3OdhMtL2IQnJ0kYTRj432xh2/ogaz
         DvZCw3eo9PQvHS9rfQpPjxdRjnCCypk/1+EGqyb3ylnF+YayD9oAk0lasMl1KWwNxCSO
         GR2JhczO4w6BRLA+FBF+RtJNC4PZuMtWxWGpw+VTJdKlGkJTfZAdYttJA29tQanEhBjR
         WjHsg6Zm1QL/mt9ADmWqWU2FXfuO8uPOFfXO30oxUGLOuKoChK3b8SejdeLrQ1kTPTOs
         W10Q==
X-Gm-Message-State: AOJu0YwUpbYjfkG71R8z4wpdxZHqBipnNZfnX/9yJO71SOD7xw/LM0yz
	lZak2tbk7YsbIyXmsbDljutzUJrSjth8rYTl6ssZGHeMU0zXYtZkhDYxgQc+h6Y=
X-Google-Smtp-Source: AGHT+IGhyJMrPQn0fqcKBTnmjxLFuu17Nr0I1Uk6sabd53h7Ly7EF0zOXZMmHZTv9b7Ulo//CtDxyA==
X-Received: by 2002:a05:600c:212:b0:40e:47fb:fcca with SMTP id 18-20020a05600c021200b0040e47fbfccamr487664wmi.147.1706193753803;
        Thu, 25 Jan 2024 06:42:33 -0800 (PST)
Received: from [192.168.0.22] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b0040e52cac976sm2845655wms.29.2024.01.25.06.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 06:42:33 -0800 (PST)
Message-ID: <928267c8-2c79-4f76-aa6e-26dc63c77e43@smile.fr>
Date: Thu, 25 Jan 2024 15:42:32 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kconfig: remove unneeded symbol_empty variable
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>
References: <20231125163559.824210-1-masahiroy@kernel.org>
 <CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com>
 <d21298d9-fed6-4e08-9780-dbcb388b9ccc@smile.fr>
 <CAK7LNASaG4DpHTb3YHMd8d8DJ5H3z0aiUcSqX+=7CZb99kRU8A@mail.gmail.com>
 <b65a68eb-6b96-41ff-bbb9-38cb2dee940e@smile.fr>
 <CAK7LNARVbjVkP=v7uQDB=Z+Ntcy9MiFa6WowTX9mA47YjS3zTg@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAK7LNARVbjVkP=v7uQDB=Z+Ntcy9MiFa6WowTX9mA47YjS3zTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Le 24/01/2024 à 21:12, Masahiro Yamada a écrit :
> On Wed, Jan 24, 2024 at 5:56 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>> Le 24/01/2024 à 09:09, Masahiro Yamada a écrit :
>>> On Wed, Jan 24, 2024 at 12:11 AM Yoann Congal <yoann.congal@smile.fr> wrote:
>>>> For what it is worth, CONFIG_BASE_SMALL is defined as an int but is only used as a bool :
>>>>    $ git grep BASE_SMALL
>>>>   arch/x86/include/asm/mpspec.h:#if CONFIG_BASE_SMALL == 0
>>>>   drivers/tty/vt/vc_screen.c:#define CON_BUF_SIZE (CONFIG_BASE_SMALL ? 256 : PAGE_SIZE)
>>>>   include/linux/threads.h:#define PID_MAX_DEFAULT (CONFIG_BASE_SMALL ? 0x1000 : 0x8000)
>>>>   include/linux/threads.h:#define PID_MAX_LIMIT (CONFIG_BASE_SMALL ? PAGE_SIZE * 8 : \
>>>>   include/linux/udp.h:#define UDP_HTABLE_SIZE_MIN         (CONFIG_BASE_SMALL ? 128 : 256)
>>>>   include/linux/xarray.h:#define XA_CHUNK_SHIFT           (CONFIG_BASE_SMALL ? 4 : 6)
>>>>   init/Kconfig:   default 12 if !BASE_SMALL
>>>>   init/Kconfig:   default 0 if BASE_SMALL
>>>>   init/Kconfig:config BASE_SMALL
>>>>   kernel/futex/core.c:#if CONFIG_BASE_SMALL
>>>>   kernel/user.c:#define UIDHASH_BITS      (CONFIG_BASE_SMALL ? 3 : 7)
>>>>
>>>> Maybe we should change CONFIG_BASE_SMALL to the bool type?
>>
>> My first test shows that switching CONFIG_BASE_SMALL to bool type does fix the LOG_CPU_MAX_BUF_SHIFT default value.
>>
>>>> I'll poke around to see if I can understand why a int="0" is true for kconfig.
>>
>> Here's what I understood:
>> To get the default value of LOG_CPU_MAX_BUF_SHIFT, kconfig calls sym_get_default_prop(LOG_CPU_MAX_BUF_SHIFT)
>> -> expr_calc_value("BASE_SMALL" as an expr)
>> -> sym_calc_value(BASE_SMALL as a symbol) and returns sym->curr.tri
>>
>> But, if I understood correctly, sym_calc_value() does not set sym->curr.tri in case of a int type config.
> 
> Right.

Thanks :)

> The following will restore the original behavior.
> 
> 
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -349,12 +349,15 @@ void sym_calc_value(struct symbol *sym)
>         switch (sym->type) {
>         case S_INT:
>                 newval.val = "0";
> +               newval.tri = no;
>                 break;
>         case S_HEX:
>                 newval.val = "0x0";
> +               newval.tri = no;
>                 break;
>         case S_STRING:
>                 newval.val = "";
> +               newval.tri = no;
>                 break;
>         case S_BOOLEAN:
>         case S_TRISTATE:
> > 
> But, I do not think that is the right thing to do.
> 
> Presumably, turning CONFIG_BASE_SMALL is correct.

I'm working on a patch to do that.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

