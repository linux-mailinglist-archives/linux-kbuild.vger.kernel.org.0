Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8718370F30
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 23:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhEBVGy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 17:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbhEBVGx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 17:06:53 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5E9C06174A;
        Sun,  2 May 2021 14:06:01 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a36so4490078ljq.8;
        Sun, 02 May 2021 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N7Yqh79l2fm2YthqZGJy/4v3jPHgVVehObKuu0oKfEI=;
        b=JU9W/xnDmpy9qH74iotexdN48jCFjPv+eFhuUnAbFENynmfWePJbMoBnfQSm7XWs+l
         o8h/uhfhqzWMJucn92gIG9Okv5/MyMdAFj2mj7nt+cf/PUl4ozBbnj4iRRnn2qRmPeYX
         HW5qvgcm5HgATizwthp/ysQOaJv5NnA/Iw05Csrr8LTZwMyjVjZDWxZDXHR++SNsZ5dd
         Bxv4xEfiFqpFfNOX/lOivJrw2OTWJAwvkJhZX+ybmEPFw2Ec4YLpmibqAWyfso69ukgu
         t7nX2a9FsyxFJr7ckPwClPzE479B0NUPXkLM+QhMTGmzYY5d8bSaL2riGmpDnsolJLpU
         H39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N7Yqh79l2fm2YthqZGJy/4v3jPHgVVehObKuu0oKfEI=;
        b=rM2czNvKsRfZgrw+HEiIqRz9uyNTv1fcWHtC45E2rKawKNfl7JuzhPiPTl3Hn5Kukg
         JXgOdfIl3CqGOLsjTtThd+hjIY2om5a6QxYsVkEo6LudfimjAENmTKawf4uYFk0kTYfr
         q83rlpk9m3wwoSfnLNaCO9Tw+AqhaoPkNLGM+xqo9fqnxtH0EK2na50msZ973pbh1Kr+
         LwlrvO4x7FCxzng59bWooD1RV136B1hZEJs5bSx4PYJqCEMmPm0yE2QjF+WSKo3w6eX8
         EJ4faavi6nquNd8cDcQzz06qt7lEpfvvg/EguFdJAKX4cTsU7lYVe2/1yNdS6foD2+gk
         mVaw==
X-Gm-Message-State: AOAM530BsbzNQTlp0lMCvAByv80U/YYYqZ7ThEf4dpqhcIjCIOgq6RnF
        MTkJ2Y20yeTDYr/08yQTgnY=
X-Google-Smtp-Source: ABdhPJyFdolNvSlvoH3O9+/CNW7drmqIFS0V+aTPiSan0DUukLYT6G12bs4xGHCF2oOGcHObWcQ3mA==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr6110327ljc.116.1619989559570;
        Sun, 02 May 2021 14:05:59 -0700 (PDT)
Received: from [192.168.1.218] (dsl-trebng21-58c191-211.dhcp.inet.fi. [88.193.145.211])
        by smtp.gmail.com with UTF8SMTPSA id m17sm944171lfg.171.2021.05.02.14.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 May 2021 14:05:59 -0700 (PDT)
Message-ID: <9198344a-f318-55b4-62b6-22354227ff2d@gmail.com>
Date:   Mon, 3 May 2021 00:05:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Content-Language: en-US
To:     Segher Boessenkool <segher@kernel.crashing.org>,
        Joe Perches <joe@perches.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
From:   Ali Kaasinen <ali.kaasinen@gmail.com>
In-Reply-To: <20210502203253.GH10366@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 02/05/2021 23.32, Segher Boessenkool wrote:

> On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
>> On Sun, 2021-05-02 at 13:30 -0500, Segher Boessenkool wrote:
>>> On Sat, May 01, 2021 at 07:41:53PM -0700, Joe Perches wrote:
>>>> Why not raise the minimum gcc compiler version even higher?
>> On Sun, 2021-05-02 at 13:37 -0500, Segher Boessenkool wrote:
>>> Everyone should always use an as new release as practical
>> []
>>
>>> The latest GCC 5 release is only three and a half years old.
>> You argue slightly against yourself here.
> I don't?
>
>> Yes, it's mostly a question of practicality vs latest.
>>
>> clang requires a _very_ recent version.
>> gcc _could_ require a later version.
>> Perhaps 8 might be best as that has a __diag warning control mechanism.
> I have no idea what you mean?
>
>> gcc 8.1 is now 3 years old today.
> And there will be a new GCC 8 release very soon now!
>
> The point is, you inconvenience users if you require a compiler version
> they do not already have.  Five years might be fine, but three years is
> not.
>
>
> Segher

Users & especially devs should upgrade then. 3 years of not updating 
your compiler - if you regularly build the kernel - seems nonsensical.


Ali
