Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA739F767A
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2019 15:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfKKOfX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Nov 2019 09:35:23 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37298 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfKKOfW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Nov 2019 09:35:22 -0500
Received: by mail-pl1-f194.google.com with SMTP id g8so3689116plt.4;
        Mon, 11 Nov 2019 06:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wVpzF31OGbAVdKg6jPR/iV3MMv02WhIXAFIA8zdlv9M=;
        b=Aa95pT1k4LnfW47XFYnSD+qrMbsU6diTyfv0sq1/xAq0NiufdDCN5KMEyRzylrWnt/
         wBomtU2KNTMlQeItRmfm2c9zY+2Ma9IAUw2SMGwHKDllvU1jZEqZvjCpI8Q6LOayc4zf
         iOs8iwqDSFlIEN0A/YxNrEfKYF6aFTnf/h9//luqtwI9y9j8gNG4mpsiIw4VonNtdMCL
         HVUlNjWJNBxmE6P826XEnFic7kOZiM4MEdbDNhqHmYmmZ9P47QMAP73O5KGIFjNRXnEZ
         rTlzs7hFB/grF1z5NudzaIrQlcV6GRQjZCNIGFe9qvbZGpwzgReGwQIV73gJysfi9CPs
         eQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wVpzF31OGbAVdKg6jPR/iV3MMv02WhIXAFIA8zdlv9M=;
        b=OZ9qnE+x4WLeazZeTLinUQfM4bstadtwqQjGKvh5zLbe/5xYbk5ALux2r/k1lGLvZA
         iBlMiF41BED/TIUI3eNTF3yaBiUod9CWoxNgZFQE6ZBpRNlO6gB/JNX6ryR9WlTnrFTi
         nO6TtQOw/ex3cYIX2P0HFDzKS6JIxATAm7qctanWPHB+Hk7yfCK9b4LY1SvmThps4FRY
         dZcLY4A5qKCbruFsv//u8bh/cnaxWBBjBS2SCbLk8t2llEW7Hw7+9m4NwN9ujNhnD4fS
         60jJiBhVYqrhZyNU1xYgpo3OehGW+IPw86KSCSX5K27+OeSDVwpt1WOCGKDpFOgzY6RH
         4urg==
X-Gm-Message-State: APjAAAU0MRZgNouOrsS/yHVAdpRnBDuUQKp9rPBEK4wLhWTV6XH7PQr1
        ACr0m1Ay+Wa8rgMkMHJMLM4=
X-Google-Smtp-Source: APXvYqxX94RrUM14gzC+9zpvyiWgF/HEMGlO5jBbTg8TD45NGboL5i1MLrTd9itrFpNBDQ/xQxt7Vg==
X-Received: by 2002:a17:902:7d96:: with SMTP id a22mr24926854plm.318.1573482922072;
        Mon, 11 Nov 2019 06:35:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c64sm8095993pfb.177.2019.11.11.06.35.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 06:35:21 -0800 (PST)
Subject: Re: [PATCH] sparc: vdso: Fix build failure seen due to kbuild changes
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        David Miller <davem@davemloft.net>
Cc:     sparclinux <sparclinux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>
References: <20191111011106.18427-1-linux@roeck-us.net>
 <20191110.173203.1243596361382467520.davem@davemloft.net>
 <CAK7LNAQTCyEVKkJQfoTpd5USk5tibmcro6EeoonjXKm-OAFJ_g@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <591a9e5e-1347-8883-c080-38940fffd535@roeck-us.net>
Date:   Mon, 11 Nov 2019 06:35:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQTCyEVKkJQfoTpd5USk5tibmcro6EeoonjXKm-OAFJ_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/10/19 5:47 PM, Masahiro Yamada wrote:
> On Mon, Nov 11, 2019 at 10:32 AM David Miller <davem@davemloft.net> wrote:
>>
>> From: Guenter Roeck <linux@roeck-us.net>
>> Date: Sun, 10 Nov 2019 17:11:06 -0800
>>
>>> sparc64:allmodconfig fails to build with the following error.
>>>
>>> unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
>>> arch/sparc/vdso/vdso32/vclock_gettime.o: failed
>>> make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
>>> make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
>>> make[2]: *** Waiting for unfinished jobs....
>>>
>>> The problem bisects to commit a3de7a72c517 ("kbuild: change
>>> *FLAGS_<basetarget>.o to take the path relative to $(obj)").
>>> Duplicate the x86 specific defines from this commit to the sparc
>>> vdso Makefile to fix the problem.
>>>
>>> Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
>>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Acked-by: David S. Miller <davem@davemloft.net>
> 
> 
> Yeah, I had submitted a fix a long time before.
> 
> https://lore.kernel.org/patchwork/patch/1130469/
> 
> I do not know why it was not picked up.
> 

Why don't you just push it upstream yourself ?

> 
> It is OK whether any patch is picked up
> as long as the build error is fixed.
> 
Same here.

> 
> (I think  CFLAGS_REMOVE_vdso32/vdso-note.o
> should be added too, though)
> 
Hard to decide for someone not involved in vdso development.
It wasn't added for x86, and it compiles without, so I rather
left it alone.

Guenter
