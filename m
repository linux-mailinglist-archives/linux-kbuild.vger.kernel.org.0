Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2110427478
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Oct 2021 02:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243818AbhJIADT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Oct 2021 20:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243798AbhJIADS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Oct 2021 20:03:18 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4140DC061570
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Oct 2021 17:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=6HikJAcNDYEErE0XNVgPbLiDAd1N3g6851QJGohW7eE=; b=tltWXkQ7Wo8+7iO1PLADP/lEhU
        3MmDlOpHg71fZTNgob6rstXlvAksJOuuM0GM5/xZKw8F3d+mZ04j41TUjuH7nMOYFkZ0YneKfIPJ9
        /PPEGV1aLfInwfxft74DTipGQeWHCP/Jys21j3vmCKcErNWJ53MoiM9TbDiqGOau9rQrWs7CQ0g3d
        PpWAD7ZHFudfHtnjNBRYf6flmntDi/4MbEG8WD2DOBbESsdyZRMtWwEysT1ToRUsZQXtkucawKG17
        G8E7AWexzTJo0BnUvLN3jMebrsO/9tr9gVKJ4D4MNUag9gUjS/GNRl3q69mFKbDLN5nc9uJcJCA/O
        toUxGPbQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mYznd-004MXY-IY; Sat, 09 Oct 2021 00:01:13 +0000
Subject: Re: [PATCH] um: Add missing "FORCE" target when using if_changed
To:     David Gow <davidgow@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>, x86@kernel.org
References: <20211008215133.9371-1-rdunlap@infradead.org>
 <CABVgOS=QVysVtN5seB5hp7hHAw5P0yuOaA3rgkRtEyiJu-1H6Q@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <05939461-793d-2266-8752-1b593bab8eec@infradead.org>
Date:   Fri, 8 Oct 2021 17:01:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABVgOS=QVysVtN5seB5hp7hHAw5P0yuOaA3rgkRtEyiJu-1H6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/8/21 4:23 PM, David Gow wrote:
> On Sat, Oct 9, 2021 at 5:51 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> 'make ARCH=um' says:
>>
>> ../arch/x86/um/Makefile:44: FORCE prerequisite is missing
>>
>> and adding "FORCE" there makes it be quiet, so do it.  :)
>>
>> Fixes: e1f86d7b4b2a ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Michal Marek <michal.lkml@markovi.net>
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Cc: linux-kbuild@vger.kernel.org
>> Cc: Jeff Dike <jdike@addtoit.com>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>> Cc: linux-um@lists.infradead.org
>> Cc: x86@kernel.org
>> ---
> 
> FYI, this looks identical to "uml: x86: add FORCE to user_constants.h":
> http://lists.infradead.org/pipermail/linux-um/2021-September/001791.html

Oh, thanks for that.

Maintainers?...

-- 
~Randy
