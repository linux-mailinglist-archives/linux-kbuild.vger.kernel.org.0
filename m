Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE31ADCB3
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 18:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731921AbfIIQGt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 12:06:49 -0400
Received: from pb-smtp21.pobox.com ([173.228.157.53]:57941 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729326AbfIIQGs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 12:06:48 -0400
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 5CA9991A03;
        Mon,  9 Sep 2019 12:06:48 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=Mw+zE4u1Nc8ITHHRwi48kwG1yI4=; b=f4rs2B
        Zgm4cAJb8FKRYIXBdMnO6gcvaD87w8XiqSy+D5J2UeVZbvZ30b0BHTZ4Fwn0g7EP
        k9Bxs07qYOxlAm152gKxR8gOiCRRXaKk/S2xWfrYJll7BtpMTcGR3R3ovF8v5lzL
        AXcCScrAiIfhEa1wcaBGHmnNf2e1bBrWyroMQ=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 5350F91A02;
        Mon,  9 Sep 2019 12:06:48 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=f5W8o8MLNoQ4vC0NqI61uvY1XxY7d/L27+zthWmdDUg=; b=IfQfu3JBH+UDvExLwmHK02Itw89W3YcVj0Rhx1FTP1sjmItJuUKBjveOcIsB1NzLm7QgNVkvIS8HimHNSl5pJzO7BokEOBsAOd/76OZ037p/u6onufFozj2K4cz0SJN1IokCdlv/ZvCuUZWPaKhewG8HeosZ6S/w0AhRZGsnOHg=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 4498B91A01;
        Mon,  9 Sep 2019 12:06:45 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 6AB692DA01B6;
        Mon,  9 Sep 2019 12:06:43 -0400 (EDT)
Date:   Mon, 9 Sep 2019 12:06:43 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Denis Efremov <efremov@linux.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
In-Reply-To: <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1909091158200.3091@knanqh.ubzr>
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr> <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: D209E438-D31B-11E9-80EF-8D86F504CC47-78420484!pb-smtp21.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 9 Sep 2019, Masahiro Yamada wrote:

> Hi Nicolas,
> 
> On Mon, Sep 9, 2019 at 10:48 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > On Mon, 9 Sep 2019, Masahiro Yamada wrote:
> >
> > > This line was touched by commit f235541699bc ("export.h: allow for
> > > per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> > > not explain why.
> > >
> > > CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
> >
> > I'm pretty sure it was needed back then so not to interfere with users
> > of this file. My fault for not documenting it.
> 
> Hmm, I did not see a problem in my quick build test.
> 
> Do you remember which file was causing the problem?

If you build commit 7ec925701f5f with CONFIG_TRIM_UNUSED_KSYMS=y and the 
defined(__KERNEL__) test removed then you'll get:

  HOSTCC  scripts/mod/modpost.o
In file included from scripts/mod/modpost.c:24:
scripts/mod/../../include/linux/export.h:81:10: fatal error: linux/kconfig.h: No such file or directory


Nicolas
