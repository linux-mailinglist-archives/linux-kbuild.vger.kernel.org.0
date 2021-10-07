Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DD9424D65
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Oct 2021 08:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbhJGGrG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Thu, 7 Oct 2021 02:47:06 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:50616 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbhJGGrF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Oct 2021 02:47:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id C0F5D61B8F39;
        Thu,  7 Oct 2021 08:45:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ZYRdjzTpmI02; Thu,  7 Oct 2021 08:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 570EC61B8F5A;
        Thu,  7 Oct 2021 08:45:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id xcxdlVL0gwMC; Thu,  7 Oct 2021 08:45:10 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 322D161B8F39;
        Thu,  7 Oct 2021 08:45:10 +0200 (CEST)
Date:   Thu, 7 Oct 2021 08:45:10 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     masahiroy <masahiroy@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Message-ID: <1874953349.45008.1633589110105.JavaMail.zimbra@nod.at>
In-Reply-To: <CAK7LNASS0NeAhwevT1AXoknRJK0RQdysK0F9Rp=F9PXxGB+j5g@mail.gmail.com>
References: <20210920213957.1064-1-richard@nod.at> <CAK7LNAQd1d89J8GjLExgeirQ3cR+tnP6GMgekeBcrGJ-=ArrCQ@mail.gmail.com> <CAK7LNASS0NeAhwevT1AXoknRJK0RQdysK0F9Rp=F9PXxGB+j5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Refactor sym_escape_string_value
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: kconfig: Refactor sym_escape_string_value
Thread-Index: wcfBa7poLfy6ketyHrnJCUsWxUrQfw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

----- Ursprüngliche Mail -----
> Von: "masahiroy" <masahiroy@kernel.org>
> An: "richard" <richard@nod.at>
> CC: "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-kbuild" <linux-kbuild@vger.kernel.org>
> Gesendet: Dienstag, 5. Oktober 2021 17:42:54
> Betreff: Re: [PATCH 1/2] kconfig: Refactor sym_escape_string_value

> On Mon, Sep 27, 2021 at 9:36 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Tue, Sep 21, 2021 at 6:42 AM Richard Weinberger <richard@nod.at> wrote:
>> >
>> > sym_escape_string_value() can take a struct symbol directly
>> > and use sym_get_string_value() itself to obtain the string value.
>> > We will need struct symbol later for error reporting.
>> >
>> > Signed-off-by: Richard Weinberger <richard@nod.at>
>> > ---
>>
>> I think this is a nice clean-up regardless of 2/2.
>> Applied to linux-kbuild. Thanks.
>>
> 
> I changed my mind after all.
> I dropped this patch to clean up the code in a different way.

Thanks for letting me know!
I noticed already via linux-next.

Thanks,
//richard
