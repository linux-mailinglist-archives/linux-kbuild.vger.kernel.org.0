Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77192D02EB
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Dec 2020 11:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgLFKou (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Dec 2020 05:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59392 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727009AbgLFKou (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Dec 2020 05:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607251404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ThOvcpo01+U282DIKyNPgDob2K7LlEHH/DyStgcc8dU=;
        b=HiZ1d0iB8FhQzpKoyUJ2ZQn3qzuwAY9UUYYYip9AZdqy7cghO3jZj75LpULE2CSCjW8iJW
        bNy1+XELiX13kQEHphyTYT31pSfeKmLz0gPAGkiXP2noqZp3HHxPqcixzsfs6aA4XlOWtI
        zdTSyBZ67rJUaVrkvAPzOKuMHsdgYUQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-xatHInbGPs2bkO9JP9I-pw-1; Sun, 06 Dec 2020 05:43:16 -0500
X-MC-Unique: xatHInbGPs2bkO9JP9I-pw-1
Received: by mail-ej1-f71.google.com with SMTP id n17so3143883eja.23
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Dec 2020 02:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ThOvcpo01+U282DIKyNPgDob2K7LlEHH/DyStgcc8dU=;
        b=lWrkz7C877b0tEHZGi3RtJndyns1mjNXOlQJAJzfnzaSrBnX9Zqpes+npZGSbJkPCi
         rh4D6CeJvU3KHp0N/8IUBuPlmwOyKlN8rdVsV2VGFwZ4lXSluR6RauHkF+Xb0rw4122K
         +2DccowkA8kDgfyu1u/Hs8seu0+AtS1m5psrRIK15mtHavstVIFEfKCfeto4n4HQ3G/d
         ijNygf0nX8TMln1iiZ9GqI/b1nNF/iHvEguGAQuK2yucu4zL+wJUz2cSW4LhEE12HSqp
         2kmHMfUt9i9m0Ohv9Xdjc1tebqlqriJ7E3zrUW1ECxU+bZ+K/SfWjrf5w+dmT/x2rv4I
         Nwwg==
X-Gm-Message-State: AOAM531nDIDV9kT0LZc85RPguQ/yncIvGhf7e7oeaV+72LrYkiKjSxVc
        wrD1D60L035T5wNgF0KtUklSYZHyp9/cEgdmrsXVTVFGGrGCh6lW46+R5LhdGItSREHffgZ1PbW
        xTyoEA3/AiGGg53PsZQLOFN8M
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr15012409edv.226.1607251394875;
        Sun, 06 Dec 2020 02:43:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9UaSthJgws677y0x4dKymXVvddxVxDRJ6bIcKuBqKa73F4Xt4nJWZ3gFp9RCXrAU8C1Zh+Q==
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr15012374edv.226.1607251394717;
        Sun, 06 Dec 2020 02:43:14 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id ng1sm6972407ejb.112.2020.12.06.02.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 02:43:14 -0800 (PST)
Subject: Re: [PATCH v2 0/9] Add support for Microsoft Surface System
 Aggregator Module
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Leon Romanovsky <leon@kernel.org>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20201203212640.663931-1-luzmaximilian@gmail.com>
 <20201206070705.GA686270@unreal>
 <052ecf4d-9e08-2c08-8a06-c30ba2b28d82@redhat.com>
 <1b4fe1fd-592d-4a88-b156-fbf6af2df428@www.fastmail.com>
 <20201206090614.GA693271@unreal>
 <a1db4b23-8159-924a-a99b-2fa4b0eb6fff@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8c6f7234-fc7e-66c2-948c-1232eb5ff813@redhat.com>
Date:   Sun, 6 Dec 2020 11:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a1db4b23-8159-924a-a99b-2fa4b0eb6fff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 12/6/20 11:33 AM, Maximilian Luz wrote:
> On 12/6/20 10:06 AM, Leon Romanovsky wrote:> On Sun, Dec 06, 2020 at 05:58:32PM +0900, Blaž Hrastnik wrote:
>>>>
>>>>> More on that, the whole purpose of proposed interface is to debug and
>>>>> not intended to be used by any user space code.
>>>>
>>>> The purpose is to provide raw access to the Surface Serial Hub protocol,
>>>> just like we provide raw access to USB devices and have hidraw devices.
>>>>
>>>> So this goes a litle beyond just debugging; and eventually the choice
>>>> may be made to implement some functionality with userspace drivers,
>>>> just like we do for some HID and USB devices.
>>>>
>>>> Still I agree with you that adding new userspace API is something which
>>>> needs to be considered carefully. So I will look at this closely when
>>>> reviewing this set.
>>>
>>> To add to that: this was previously a debugfs interface but was moved to misc after review on the initial RFC:
>>> https://lkml.org/lkml/2020/9/24/96
>>
>> There is a huge difference between the suggestion and final implementation.
>>
>> Greg suggested to add new debug module to the drivers/misc that will
>> open char device explicitly after user loaded that module to debug this
>> hub. However, the author added full blown char device as a first citizen
>> that has all not-break-user constrains.
> 
> This module still needs to be loaded explicitly.

Good then I really do not see a problem with this.

> And (I might be wrong
> about this) the "not-break-user constraints" hold as soon as I register
> a misc device at all, no?

Correct.

> So I don't see how this is a) any different
> than previously discussed with Greg and b) how the uapi header now
> introduces any not-break-user constraints that would not be there
> without it.
> 
> This interface is intended as a stable interface. That's something that
> I committed to as soon as I decided to implement this via a misc-device.
> 
> Sure, I can move the definitions in the uapi header to the module
> itself, but I don't see any benefit in that.

Right, if we are going to use a misc chardev for this, then the
correct thing to do is to put the API bits for that chardev under
include/uapi.

It would still be good if you can provide a pointer to some userspace
tools using this new API; and for the next version maybe add that
pointer to the commit message

Regards,

Hans

