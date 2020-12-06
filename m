Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E9A2D02EF
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Dec 2020 11:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgLFKnV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Dec 2020 05:43:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60893 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbgLFKnU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Dec 2020 05:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607251314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DGB1JYDSRnOOOUOqlFv/3mgP78JkLdIpK80wJrAOKSU=;
        b=ER6ZX2USnQNkS8GWODjZ3CTIgv5tk6S5aZI6im9JsvW/03vVh5PT/SXZHaK3NSJktj+IYU
        LDtzU1Y8WRpREo84ucgPqmsR+VjqfhEpHtkz0nA0jxR5fIImnglC8UA501jcSLbP2xq9sg
        Q9YL1juYME1sZgT+dBUvoVAE43pssrU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-jKnd6padMD-yxjMXbYbuWA-1; Sun, 06 Dec 2020 05:41:49 -0500
X-MC-Unique: jKnd6padMD-yxjMXbYbuWA-1
Received: by mail-ed1-f72.google.com with SMTP id d12so2115215edx.23
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Dec 2020 02:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DGB1JYDSRnOOOUOqlFv/3mgP78JkLdIpK80wJrAOKSU=;
        b=V/iNCv3rbSneX1NG/DvLvp+EuyZrr4AMgFYuBZaPEHbs7moB1+l7aK1s6ZtXhXCdfd
         4KGfFUyr/KJafiIhNkKbzKClCtBDQz4jmlEPmwrlZ2vM3JxS9P8aM4DBQ6OOBamZIBN1
         S5hxFit1LLHY4iXGY0wbU1UojkNW8HV/PmY806dfNwnBr+0sNd8kYhkW5N+qM3SJjE/o
         jFHpHKcrO61P/WAOcRJYIePffZGbpDKOWSjj/eYp35D6w0wkiwQGAnVYgA+X/bev1+bO
         7C+wtO4s+/uvCQkXAjIBUYowdE2r7DaF/aP9eENFpp2pVSNdFsF1hdnSlb8/8d/zdUK0
         k9iA==
X-Gm-Message-State: AOAM532Eb909y6/dyC5EJxWnZRHiJZNVxVBCcNgw8AVz9RYj95PSoOcb
        twqw6WCaeCFHds2D0OUw6zQ5tsYh008H8c8PRUy060QKGgau8M+OW0CN37sOKIrD0NriHQNrkJX
        awAhegZhsZvaPOONN12KDjXT2
X-Received: by 2002:a17:906:1412:: with SMTP id p18mr14920066ejc.480.1607251308247;
        Sun, 06 Dec 2020 02:41:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMIc++XaaZp76MeeyQPNXmvAvqxtTa/qqjkqPQBgHHCNRABisppYTbhXm/z2wIDSQde6SWag==
X-Received: by 2002:a17:906:1412:: with SMTP id p18mr14920037ejc.480.1607251308088;
        Sun, 06 Dec 2020 02:41:48 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u16sm2416359ejy.90.2020.12.06.02.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 02:41:47 -0800 (PST)
Subject: Re: [PATCH v2 0/9] Add support for Microsoft Surface System
 Aggregator Module
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Mark Gross <mgross@linux.intel.com>,
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
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20201203212640.663931-1-luzmaximilian@gmail.com>
 <20201206070705.GA686270@unreal>
 <052ecf4d-9e08-2c08-8a06-c30ba2b28d82@redhat.com>
 <20201206085631.GE210929@unreal>
 <f76b329a-b6f5-486d-b06a-452ec4c51979@redhat.com>
 <20201206103339.GB693271@unreal>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f2511463-3bb8-a640-7863-b206db136109@redhat.com>
Date:   Sun, 6 Dec 2020 11:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201206103339.GB693271@unreal>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 12/6/20 11:33 AM, Leon Romanovsky wrote:
> On Sun, Dec 06, 2020 at 11:04:06AM +0100, Hans de Goede wrote:

<snip>

>> But there is a difference between being careful and just nacking
>> it because no new UAPI may be added at all (also see GKH's response).
> 
> I saw, the author misunderstood the Greg's comments.

Quoting from patch 8/9:

"
+==============================
+User-Space EC Interface (cdev)
+==============================
+
+The ``surface_aggregator_cdev`` module provides a misc-device for the SSAM
+controller to allow for a (more or less) direct connection from user-space to
+the SAM EC. It is intended to be used for development and debugging, and
+therefore should not be used or relied upon in any other way. Note that this
+module is not loaded automatically, but instead must be loaded manually.
"

If I'm not mistaken that seems to be pretty much what Greg asked for.

Regards,

Hans

