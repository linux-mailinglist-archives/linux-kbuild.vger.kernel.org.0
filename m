Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72114142A1
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Sep 2021 09:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbhIVH3N convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Wed, 22 Sep 2021 03:29:13 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:59864 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhIVH3M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Sep 2021 03:29:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id B913F608F449;
        Wed, 22 Sep 2021 09:27:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id turHSlNKDIff; Wed, 22 Sep 2021 09:27:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 3C8E26171B1D;
        Wed, 22 Sep 2021 09:27:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 9YHVx8c-c2qj; Wed, 22 Sep 2021 09:27:41 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 14585608F449;
        Wed, 22 Sep 2021 09:27:41 +0200 (CEST)
Date:   Wed, 22 Sep 2021 09:27:40 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     masahiroy@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Message-ID: <1402570794.96583.1632295660867.JavaMail.zimbra@nod.at>
In-Reply-To: <boris.20210922090732@codesynthesis.com>
References: <20210920213957.1064-1-richard@nod.at> <20210920213957.1064-2-richard@nod.at> <boris.20210922090732@codesynthesis.com>
Subject: Re: [PATCH 2/2] kconfig: Deny command substitution in string values
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: kconfig: Deny command substitution in string values
Thread-Index: eQeXXGSt2VJG458SXb4zuJcuohhEjw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Boris,

----- Ursprüngliche Mail -----
> Von: "Boris Kolpackov" <boris@codesynthesis.com>
> An: "richard" <richard@nod.at>
> CC: masahiroy@kernel.org, "linux-kernel" <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org
> Gesendet: Mittwoch, 22. September 2021 09:17:44
> Betreff: Re: [PATCH 2/2] kconfig: Deny command substitution in string values

> Richard Weinberger <richard@nod.at> writes:
> 
>> The post processed .config file will get included in shell
>> and makefiles.
> 
> That depends on who you ask: a number of projects other than the
> Linux kernel use kconfig for configuration and some of them do
> neither of those. I also don't believe the Linux kernel sources
> .config in shell (but I may be wrong).

See below.

> 
>> So make sure that a string does not contain
>> symbols that allow command substitution.
>> If such a malformed string is found, return empty string
>> and report it.
> 
> So effectively it's now impossible to include ` or $ in kconfig
> string values. Seems like a major, backwards-incompatible
> restriction.

Do you have a working example?
Since the config is sourced in the scripts/setlocalversion it will
not work correctly anyway.

> I think if this is really desired, then it should be re-done with
> escaping (similar to ") rather than outright banning inconvenient
> characters.

Escaping is not so easy since the very same content is included
in shell scripts (sertlocalversion), in Makefiles and in C files.
At least I didn't find find a good way to escape these characters
such that all three programming environments will accept it.

Thanks,
//richard
