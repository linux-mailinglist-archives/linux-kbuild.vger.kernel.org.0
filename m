Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA7774E59A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jul 2023 05:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjGKD7y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Jul 2023 23:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjGKD7v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jul 2023 23:59:51 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B5C12F
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jul 2023 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=p3N0rKMAtLe/rTQe1FW+qwjwr6uFhtA/ztrC5/uT9e0=; b=ltep12dcDfvCXyJ40Cmk4mvJlM
        yFDZ1omigi/0ox+ei/CYBEsjjWLkRI2BgQ808lNTkzwNehIix/iF0mvBKiqaK/UPTqNg9UWUhLeJe
        RAUMCZoX1o4HYOp4cfMBJX7T+jzHBDgm5hLQ/U5MFQKfOgvzt0HLwHFyqx7VEyYDF4FKaf0oz3iwJ
        drXxEBPBPCp2yT07TbuV4QTftNGu/Xdzso9mabkQZBDi0S6SIEhne5fk6wKvQ4Ngd1X6lPnyMF6Fm
        Rmvpz/YobG1Wtm7B+sJcdJtP9M/KV6BvKpjLYPfvLEP9MhE+i3jCbJ91wCgs53engqyPnJZ6rCvR2
        Ok7wFfqQ==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qJ4XT-00DYXz-29;
        Tue, 11 Jul 2023 03:59:50 +0000
Message-ID: <1e05d248-b619-1d74-acd7-275f2c9db61d@infradead.org>
Date:   Mon, 10 Jul 2023 20:59:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: gconfig help text quesion
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <c7b1cb3d-801b-b78f-d203-edd840c9e98a@infradead.org>
 <CAK7LNAS53G=c+nsVGT66GXZsTOJqwzLyWtNbXY_FaBcXcG2Vtg@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAS53G=c+nsVGT66GXZsTOJqwzLyWtNbXY_FaBcXcG2Vtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 7/10/23 20:42, Masahiro Yamada wrote:
> On Tue, Jul 4, 2023 at 9:04 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> The gconfig help text says:
>>
>> Toggling Show Debug Info under the Options menu will show
>> the dependencies, which you can then match by examining other options.
>>
>> This is at the end of the intro_text string.
>>
>> I don't see any way to toggle the Show Debug Info flag,
>> or even any such flag.
> 
> 
> I guess this comment is left-over after
> 7b5d87215b38 ("gconfig: remove show_debug option")
> 

Ugh, I need to improve my search skills. Sorry about that.

> 
> 
> 
>> Is it hidden somewhere or should this text be removed?
> 
> I think it should be removed.

OK, I'll send a patch.

thanks.
-- 
~Randy
