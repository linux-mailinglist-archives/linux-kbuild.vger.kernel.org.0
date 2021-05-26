Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CC9392256
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 23:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbhEZVvf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 17:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21309 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233790AbhEZVvf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 17:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622065803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s2jDM/TpmfLpzDZ7Dd8kJfaXr/uLu6JzfCGH8PAhY6A=;
        b=f1DJ2axgBoIulDfVYjmYedXEoJuVCl0QzYGDGYYrOes44/lV8ePZCR6jaS9XfSy2ZI6gNY
        h9q7f/cEJWGIraVtz5EiUIJK35rcIhWb9ER7x3HfVLd8zjSOMcRuQyzN2J078J1bzmqM80
        Rr2Cuo9D/iBnZ4u7hhxjPAS92ltHFIk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-PZVAsyq2NdCLMl4UXya-wQ-1; Wed, 26 May 2021 17:50:02 -0400
X-MC-Unique: PZVAsyq2NdCLMl4UXya-wQ-1
Received: by mail-wm1-f69.google.com with SMTP id y205-20020a1ce1d60000b029019278214067so772567wmg.3
        for <linux-kbuild@vger.kernel.org>; Wed, 26 May 2021 14:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s2jDM/TpmfLpzDZ7Dd8kJfaXr/uLu6JzfCGH8PAhY6A=;
        b=smX87QvDJw8WIf4txANojM05M+NiaqfiTBeEvRVqIM4dz4s5ue+QAkwDzI1BvFwp3v
         kOlF2NhPCqCxf2X93AxYXIYxKQY2swjzQrG24dPMaMIfWPd1xCGKZu2m34FkMH2ELlgm
         QGfUAOLYZHmR2cXoE96/dmKEhfA8sw6YfwAZtKhnic1a6g+sPSQNc3zpIncdWUZ2b6ZY
         Bm9YrnFm+M+/S/9hd2BrmxU+Ub5RcFGWp4boKgqPQv0H05bNRtgxVLaDTbcYa72kJt+L
         Cmxpg3GMuRf1rrzLnQgBm1rBKncAp36bh215FMIrgbHVKf1NH5QigGubM2IncLJijYX0
         Vdgw==
X-Gm-Message-State: AOAM530EHFEPFCiq6q64XhxY5pldjq21byli3JDozS70qXiJs1j/Au71
        xnRHN01GzwiQUpShnKpF3tJS6sr8MpW958cItJNYLjVOZ5QNohgJBt0B8SpVwy1W+GpzggYWaVW
        Pen9sJj1YUzV08CYC8QM0mV7cyPSG8+X2ucF532NLp66+UlZJBhUaELFKBqC9vL93dw0hwyxgvo
        0=
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr85977wrx.320.1622065800515;
        Wed, 26 May 2021 14:50:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX3XLrans83aVeEW49CvKbVeLkqlNa3AgNJRBQ+d+nHfyxrTBw4pmjGbjCUesYgRVfH6dHEg==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr85963wrx.320.1622065800347;
        Wed, 26 May 2021 14:50:00 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id f14sm235371wry.40.2021.05.26.14.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 14:49:59 -0700 (PDT)
Subject: Re: [PATCH] kbuild: quote OBJCOPY var to avoid a pahole call break
 the build
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <20210518142302.1046718-1-javierm@redhat.com>
 <CAEf4BzYqA1Upbm75aW-Rs-WCqQ6KRnSje-uTis2fw749_f8tRw@mail.gmail.com>
 <CAK7LNAQZNkdQTtGHmrE0dcbeirBZb1O++A4b2oaAvu6+1Jupbw@mail.gmail.com>
 <CAEf4BzaV0y51EY5JAYZ0dueC2NQihwy+4pTtidSj4KXxGm+fwA@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <a5004a7e-14bf-4fb1-beec-9dc19165f2d2@redhat.com>
Date:   Wed, 26 May 2021 23:49:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAEf4BzaV0y51EY5JAYZ0dueC2NQihwy+4pTtidSj4KXxGm+fwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/26/21 11:02 PM, Andrii Nakryiko wrote:

[snip]

>>
>> BTW, I see similar code in scripts/link-vmlinux.sh too.
>>
>>      LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${extra_paholeopt} ${1}
>>
>> Is it OK to leave it unquoted?
> 
> You are right, link-vmlinux.sh should be updated accordingly.
>

Good catch. I'll include this in v2 as well.
 
> Javier, can you please send v2 and cc bpf@vger.kernel.org? Thanks!
>

Sure, thanks!
 
Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

