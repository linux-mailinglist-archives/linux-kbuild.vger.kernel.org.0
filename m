Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00852414DED
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Sep 2021 18:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236597AbhIVQTO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Wed, 22 Sep 2021 12:19:14 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:38220 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236523AbhIVQTN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Sep 2021 12:19:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 9A7306171B1D;
        Wed, 22 Sep 2021 18:17:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id g_Xj6GkVOxov; Wed, 22 Sep 2021 18:17:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 0FFDE6171AF5;
        Wed, 22 Sep 2021 18:17:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Czl4Cj8z4wMN; Wed, 22 Sep 2021 18:17:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id DA4B860F6B83;
        Wed, 22 Sep 2021 18:17:40 +0200 (CEST)
Date:   Wed, 22 Sep 2021 18:17:40 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     masahiroy <masahiroy@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Message-ID: <1942256037.97524.1632327460626.JavaMail.zimbra@nod.at>
In-Reply-To: <boris.20210922165140@codesynthesis.com>
References: <20210920213957.1064-1-richard@nod.at> <20210920213957.1064-2-richard@nod.at> <boris.20210922090732@codesynthesis.com> <1402570794.96583.1632295660867.JavaMail.zimbra@nod.at> <boris.20210922165140@codesynthesis.com>
Subject: Re: [PATCH 2/2] kconfig: Deny command substitution in string values
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: kconfig: Deny command substitution in string values
Thread-Index: UN+UPErbzOHavDcXoin7FTqpapyswg==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Boris,

----- Ursprüngliche Mail -----
> Von: "Boris Kolpackov" <boris@codesynthesis.com>
> An: "richard" <richard@nod.at>
> CC: "masahiroy" <masahiroy@kernel.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-kbuild"
> <linux-kbuild@vger.kernel.org>
> Gesendet: Mittwoch, 22. September 2021 17:18:43
> Betreff: Re: [PATCH 2/2] kconfig: Deny command substitution in string values

> Richard Weinberger <richard@nod.at> writes:
> 
>> > So effectively it's now impossible to include ` or $ in kconfig
>> > string values. Seems like a major, backwards-incompatible
>> > restriction.
>> 
>> Do you have a working example?
> 
> You mean of a project that uses kconfig and that is capable of
> handling string values with these characters? If so, then yes,
> see for example, libbuild2-kconfig[1] which is a build system
> module that implements kconfig-based configuration support for
> build2. In particular, it exposes values from .config  as
> buildfile variables but it doesn't do this by sourcing .config.
> Instead it loads .config using the kconfig API and then sets
> the corresponding buildfile variables programmatically.

I had a config setting of Linux in mind. :-)

> 
>> Since the config is sourced in the scripts/setlocalversion it will
>> not work correctly anyway.
> 
> The actual file being sources is include/config/auto.conf, not
> .config, right?
> 

Yes. auto.conf is .config post processed.
This is exactly where my mitigation takes place.
 
>> > I think if this is really desired, then it should be re-done with
>> > escaping (similar to ") rather than outright banning inconvenient
>> > characters.
>> 
>> Escaping is not so easy since the very same content is included
>> in shell scripts (sertlocalversion), in Makefiles and in C files.
> 
> Again, I don't think it's .config that gets included in C files but
> rather include/generated/autoconf.h, right?
> 

Yes. But the key/values are taken as-is.

Just add some odd characters to your .config, build the kernel and observe
the breakage at different levels.
Or something like CONFIG_DEFAULT_HOSTNAME="`touch owned`". ;-)

>> At least I didn't find find a good way to escape these characters
>> such that all three programming environments will accept it.
> 
> If my understanding is correct, then you are concerned with the
> autoconf functionality: the auto.conf makefile and autoconf.h
> header, and not the .config file itself. Perhaps it will be less
> disruptive to do the escaping (or banning) at that level?

My concern is that currently a .config file can contain hostile content
that will get executed at build time.
.config files are often blindly shared across untrusted developers.
So I thought that mitigating this whole is worth it.

> Specifically:
> 
> 1. If you do escaping at that level, then you can do it differently
>   for auto.conf and autoconf.h. Though auto.conf still seems to be
>   read by both make and shell.

I need to think about that. Thanks for the pointer.

Thanks,
//richard
