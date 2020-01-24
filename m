Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149EB148450
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jan 2020 12:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390216AbgAXLly (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 06:41:54 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:36104 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390342AbgAXLQW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 06:16:22 -0500
Received: by mail-lj1-f174.google.com with SMTP id r19so2081582ljg.3
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Jan 2020 03:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WPh74pEP+nQ76ELzYt+TrcyRCi7yaoOoadSkrfPnPw0=;
        b=UiiEOmI5crrZFnXah+iBEOCV1kFA6HM7uH0AeaaVeCmEY0JQFlbkI5t8sr83qk61jO
         ENI1Xm1UUUGXlAoQn+AgsSPXkmL1Hx34lQhSF7FiDCi+8GlB7JdN5aVzcdCM/RbQbz0T
         gr+P+irrrT+iCw23HnU+FbiaxS5z0yDBgxLkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WPh74pEP+nQ76ELzYt+TrcyRCi7yaoOoadSkrfPnPw0=;
        b=csQ9eeHoU7PzgJ1r6nCmbQNX5qD2qyhdugOZRMFBQKS/LoJ9hSjsMUb4ccRSNM+9t9
         4G7JvkbWe5DKzEVSEY0O34HzDGt9QndP0XM0GORnrXGMlHRS/Q6dJVcEWxWFQi2GKhit
         jUFniIeW8fIjG6eRuYijUlMSHPke4Pc2whUUx5IYq/0KqDcecgLFclI4GEJdxUVhZwYz
         TNE3B6UkEtzCZ+X6kM+yc/PTHPgBn/rBShGg5GXuXzpa9Y4TMIYrxE34cvTAV6aUgTHX
         e96VVewBSKMbQr/QA2+wJwwfHYLsoqcOpvWDKK0N0xYJlojf2Gnpgf0NUfSNYRVPIsBA
         00Og==
X-Gm-Message-State: APjAAAUYeLaFuiN1V1Q+wIbcIQLcqNiRTsucjmxpfxXCPE/1Gr5fw1or
        YP7LeEttb6UwLcpwMWpwuSuv2Q==
X-Google-Smtp-Source: APXvYqwhcWeDSkhp2yrEeOy7QBdhQdx7TS6ALPFnsE1YmPPh0m3SZYBK+yeJxbdM4du+1HhZ1HMVbQ==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr1853505ljc.271.1579864580100;
        Fri, 24 Jan 2020 03:16:20 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id t1sm2947207lji.98.2020.01.24.03.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2020 03:16:19 -0800 (PST)
Subject: Re: vmlinux ELF header sometimes corrupt
To:     Michael Ellerman <mpe@ellerman.id.au>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
 <875zh1i0wj.fsf@mpe.ellerman.id.au>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <b5f6ab1c-337e-c5e4-6449-0cf73413e1be@rasmusvillemoes.dk>
Date:   Fri, 24 Jan 2020 12:16:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <875zh1i0wj.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 24/01/2020 11.50, Michael Ellerman wrote:
> Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:
>> I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
>> very hard to debug problem that maybe someone else has encountered. This
>> doesn't happen always, perhaps 1 in 8 times or something like that.
>>
>> The issue is that when the build gets to do "${CROSS}objcopy -O binary
>> ... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
>> that fails with
>>
>>   powerpc-oe-linux-objcopy:vmlinux: file format not recognized
>>
>>
>> Any ideas?
> 
> Not really sorry. Haven't seen or heard of that before.
> 
> Are you doing a parallel make? If so does -j 1 fix it?

Hard to say, I'll have to try that a number of times to see if it can be
reproduced with that setting.

> If it seems like sortextable is at fault then strace'ing it would be my
> next step.

I don't think sortextable is at fault, that was just my first "I know
that at least pokes around in the ELF file". I do "cp vmlinux
vmlinux.before_sort" and "cp vmlinux vmlinux.after_sort", and both of
those copies are proper ELF files - and the .after_sort is identical to
the corrupt vmlinux apart from vmlinux ending up with its ELF header wiped.

So it's something that happens during some later build step (Yocto has a
lot of steps), perhaps "make modules" or "make modules_install" or
something ends up somehow deciding "hey, vmlinux isn't quite uptodate,
let's nuke it". I'm not even sure it's a Kbuild problem, but I've seen
the same thing happen using another meta-build system called oe-lite,
which is why I'm not primarily suspecting the Yocto logic.

Rasmus
