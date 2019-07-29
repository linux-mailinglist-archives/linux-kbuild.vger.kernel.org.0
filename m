Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B4D78C0A
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 14:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfG2MwS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 08:52:18 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34421 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfG2MwS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 08:52:18 -0400
Received: by mail-ed1-f67.google.com with SMTP id s49so24390529edb.1;
        Mon, 29 Jul 2019 05:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DXiSUFwveA5DL37XMYfZztp70YvGAlcNnFn/pPeo5N0=;
        b=uDeGuibDQNfGNJ6iygayXJkR74yjusf5CzwvqczYa2vD7xgZ3hfCTzUc5dtkwpgsP3
         7KxHStPY/9WFpNrdvPvB4aTB8Sa8vR+c5pr4xJY5Dg/6foHEjTcBLyhiXGoclCNi+v99
         5A9ZMBhFGIQemwLsH+o+RTFRFNOj3s9Kf+U/e4ubdAIEMYlDbFcx7QspVz5mwYE2CG58
         aqPk6y2anjTVNjOhkbRtAYB6bOISLw3PFRYZegZfkhrWLYUvK7oOyPbq1c2ndcv1ydED
         uewyDw0TDv6PTUhfe1aKO/J9glOwhWd18/bDlqJPpq8L+gb3ShijCcdqLyw3as1unIrU
         zAhw==
X-Gm-Message-State: APjAAAXvUQCjOj8p2cbrq7AodafH9Y5Ydvvqk4IVRNo6i67hLdE4hEjE
        GaLRV7KttAQS/DxBwqymBSCu/wfANvY=
X-Google-Smtp-Source: APXvYqz3aKDzXTLnWZ7cFc8ZXDfLQ5fmAbSEn1hzcUZRHmiN2vyvhbaVysF756g4yxuo6cuskxepzA==
X-Received: by 2002:a17:906:4e8f:: with SMTP id v15mr83106803eju.47.1564404736683;
        Mon, 29 Jul 2019 05:52:16 -0700 (PDT)
Received: from [10.10.2.174] (bran.ispras.ru. [83.149.199.196])
        by smtp.gmail.com with ESMTPSA id rv16sm11431186ejb.79.2019.07.29.05.52.15
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 05:52:16 -0700 (PDT)
Reply-To: efremov@linux.com
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190714152817.24693-1-efremov@linux.com>
 <20190728100906.18847-1-efremov@linux.com>
 <20190729151351.24f9eeb9@canb.auug.org.au>
 <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
 <20190729224007.2f7fdcb4@canb.auug.org.au>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <65ea1c44-ac7f-b63f-8ba0-85bb12349383@linux.com>
Date:   Mon, 29 Jul 2019 15:52:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729224007.2f7fdcb4@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/29/19 3:40 PM, Stephen Rothwell wrote:
> Hi Denis,
> 
> On Mon, 29 Jul 2019 12:16:29 +0300 Denis Efremov <efremov@linux.com> wrote:
>>
>>> Just a reminder that some of us (just me?) do well over 100+ builds per
>>> day ...  if this can be optimised some what that would be good.  
>>
>> These measurements for the worst case (allmodconfig). Is it possible to 
>> measure the slowdown in your case? How it will perform on your typical 
>> workflow?
> 
> I did 3 x86_64 allmodconfig builds without and with the patch (I do
> -j 80 powerpc64 le hosted cross builds) and it doesn't look like the
> patch has much impact at all.
> 
> Without the patch:
> 
> real	8m41.390s user	587m25.249s sys	22m0.411s
> real	8m40.100s user	587m32.148s sys	21m58.419s
> real	8m40.084s user	587m25.311s sys	22m2.794s
> 
> With the patch:
> 
> real	8m40.351s user	587m21.819s sys	21m57.389s
> real	8m40.868s user	587m23.730s sys	21m58.737s
> real	8m40.970s user	587m22.525s sys	22m2.467s
> 
> I do other builds as well, but that is the biggest, so actually looks
> ok.
> 

Is it worth to include your measurements instead of mine in the commit
description? Maybe the note about performance downgrade could be omitted
at all in this case?

Denis
