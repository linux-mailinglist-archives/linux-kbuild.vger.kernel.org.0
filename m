Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F0878823
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 11:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfG2JQe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 05:16:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41030 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfG2JQd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:16:33 -0400
Received: by mail-lf1-f66.google.com with SMTP id 62so36656278lfa.8;
        Mon, 29 Jul 2019 02:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2rZhGghO4KM9MOAeSfd1/BlN66oPCK3+XnILmYn/xRc=;
        b=L6BGpasvFUCNdcgE0kJQVj29pr2GFdSoMiXqdSRBSXSPG+cywH6+0H1/TyyvAd9bHa
         aigw1i4SERhDutZGLgp69EvPBGK40ZWNZkExA+ZDZsSGM4bM8rjWJu3Zy4UuzgSzqIzn
         JwX5vnVxW+cXZzhKLEITkGCcfNrWUJ/Inzpa5RMrrt2I6IUiwpGP2DuIsxH6nyLJhwdB
         cNmIbeajEbZpN8ap8+aIbvRykjNJ1KiPJBLnL1Jxhe9YkB3hdGCvM0D5QdlT2EWDE0M8
         wH1+XGHc8bqbiTG2JNHCwU8F1114oyShBp+qRIU63L9DsWnuLcOjGr27k7mmCM3sxvU9
         ehzg==
X-Gm-Message-State: APjAAAUtlt2glPXKgWHYcF7LHtY1R28UTBxKcqMkL+s5llcXGJ2MZlfk
        0pomgEr7Nq9K9vPwDxcEcXe7O28rTl8=
X-Google-Smtp-Source: APXvYqxt2np0x2Xr18YBSGPyukJxrKm/WNIBQjaI5A9B4gQxe1aKw45gKu5czOoCZR+tMbTge2+aMQ==
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr40495472lfp.61.1564391791180;
        Mon, 29 Jul 2019 02:16:31 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id x18sm10675261lfe.42.2019.07.29.02.16.30
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 02:16:30 -0700 (PDT)
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190714152817.24693-1-efremov@linux.com>
 <20190728100906.18847-1-efremov@linux.com>
 <20190729151351.24f9eeb9@canb.auug.org.au>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
Date:   Mon, 29 Jul 2019 12:16:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729151351.24f9eeb9@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> Just a reminder that some of us (just me?) do well over 100+ builds per
> day ...  if this can be optimised some what that would be good.

These measurements for the worst case (allmodconfig). Is it possible to 
measure the slowdown in your case? How it will perform on your typical 
workflow?

Looks like it is possible to optimize it, but I need some hints from 
Masahiro on how to do it properly. Because I don't know how to match 
__ksymtab_<symbol> with the <symbol> without an additional loop. 
Introduce another hash table?

The first loop from this patch could traverse only the exported symbols 
instead of all symbols. But in this case, I don't know how to break 
early from the loop because there can be many symbols with the same name 
but with the different scope (static/non-static).

For example, ring_buffer_size:
kernel/trace/ring_buffer.c
4334:unsigned long ring_buffer_size(struct ring_buffer *buffer, int cpu)
4347:EXPORT_SYMBOL_GPL(ring_buffer_size);
And
drivers/usb/misc/ldusb.c
125:static int ring_buffer_size = 128;

Or for, nfs4_disable_idmapping:
fs/nfs/super.c
2920:bool nfs4_disable_idmapping = true;
2930:EXPORT_SYMBOL_GPL(nfs4_disable_idmapping);
fs/nfsd/nfs4idmap.c
48:static bool nfs4_disable_idmapping = true;

Regards,
Denis

