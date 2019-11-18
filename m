Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1BBDFFD19
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 03:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfKRCas (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Nov 2019 21:30:48 -0500
Received: from mail-pf1-f172.google.com ([209.85.210.172]:38101 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfKRCas (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Nov 2019 21:30:48 -0500
Received: by mail-pf1-f172.google.com with SMTP id c13so9596624pfp.5
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Nov 2019 18:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v8BAWdRTBsXRM8xdSToodwMOCDg93ZmO7iNpdniRA1s=;
        b=YhYa/eN1/0CYmCrBfLipG4tNs7hUM2OspQjH0ajp8lzwCz5POfa0zWoBz9cXGUxZdl
         knYZhCtZe1LuBDcxRPXlQKD86u2nVIL4Pez8iFZ9e0DkoqxhruLlJUMG57SpxO5lcXnb
         Eddw1zTtJnbFlY01xHJOZrZcdYMdNp0XEoXbvg/t8BWvt1QUQN/0yhUFS49/Kk+xSMEO
         goQA3DcV6IZM/ts4iL94rVvIz7JirIOOohGEhvm8KNaOzJUtC+XQ9R2vdfiyW0HMtwAT
         ulbFuhgN+QOLLUO5USyDogwsqZzM3+mGjMLJop6YV6at95DO5rsy9gMJngj4QZBvYHk3
         97jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v8BAWdRTBsXRM8xdSToodwMOCDg93ZmO7iNpdniRA1s=;
        b=tDT/YCvqqC/+ghEW4uW+eN7GO1547C9p5urLbEJPnZQqkdmA5o1HOlQr/Kvoj7w6e4
         W6iAheQkxclk67eR9s7M95g+WXpJJ+HJxXEYe6oMu1uAU3dKp3Cv4CHJ8FmEwHBbX7U2
         2vpDVMqdXO+ckc8bqZ06N1fV4W0y9i1DI0WkURCQHVtd1uLEDi6yTrLi2O2IrPf//cSF
         Nj+RbzUUYZNjhYmghkQr8fy//WlsAxtdf9Hq5EFvoC5ZhQEysKAnFzyu8zJgmvAUQGG8
         33gy96OO0EfMD6rSHglrFsI+QnNoAmZttH1voSak3ZLpLQS+PqaIiiUrVfpbV9aE91ne
         h3aw==
X-Gm-Message-State: APjAAAU1DpdBQlnDLKhHX4VIt1nIWNipWBtMBy5iGODCqW2GeZY6XW2V
        Xwc/NORX/PqI7oZN5J1Mn0phKg==
X-Google-Smtp-Source: APXvYqx3pA+d8Gd38MjrEOEeopWnEcuRlRvpg9kJlJbbc+eA1td1lda41Q7Mfwbhi8fdHqf+0Ta2EA==
X-Received: by 2002:a63:ed43:: with SMTP id m3mr12428483pgk.261.1574044245656;
        Sun, 17 Nov 2019 18:30:45 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.79])
        by smtp.gmail.com with ESMTPSA id s66sm21543885pfb.38.2019.11.17.18.30.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Nov 2019 18:30:44 -0800 (PST)
Subject: Re: building individual files in subdirectories
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190528121148.GA18162@lst.de>
 <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
 <CAK7LNAQFy=AfJtk4GT+FL=Kzcf6Ev=keKoUz_7Le7iZOQEc90g@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a08ab4f0-d500-331b-da70-388e6244bc67@kernel.dk>
Date:   Sun, 17 Nov 2019 19:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQFy=AfJtk4GT+FL=Kzcf6Ev=keKoUz_7Le7iZOQEc90g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/17/19 5:15 PM, Masahiro Yamada wrote:
> Hi Jens,
> 
> 
> (related to  https://lkml.org/lkml/2019/11/15/1152)
> 
> 
> I received questions about single builds not working properly
> some times in the past.
> 
> For example, the following is a post from Christoph to kbuild ML,
> and my reply to it.

I'm not saying it isn't useful, what I'm saying is that slowing
things down by almost 100% seems excessive!

-- 
Jens Axboe

