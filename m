Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901C4EBD53
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2019 06:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfKAFpG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Nov 2019 01:45:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38438 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfKAFpG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 01:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=n9DPm3VVfItkSEn1eKXRQ5eHJ60lVxQA7EUPm71QGMw=; b=AWoSOgg+buMrwiSFbI+6o0Thj
        3eFxjfRjuhZP9gAgntodz6uHhAekmUOhnx51l84nw26n+K/2m03925we6JqRqMg2fO5yNThLv7fCR
        54wa1spwoxlsA1FAq/AxSMqOW9n7vX0r6S4MxNNDsC1uJE6Pu5GBBCOGJFygeHPFtW+POf/rCJua7
        sEfQG8O1L7V4EfpQXo2d3u8ZHM32kklfJZdVno/Vz+BpK1LNtaKmGCdEfzuh4fTftNHZ0eaZSEGGI
        r4RSD/Io2P+oPqWuQWErW9wtNRpWHR4kbjfc927Nhm1QQfnR2YraHyYiwPGsRiMMfl8isVCHs+fIE
        XjpwLslgA==;
Received: from [2601:1c0:6280:3f0::4ba1]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iQPk9-0003Mp-ED; Fri, 01 Nov 2019 05:45:05 +0000
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
 <20191031033722.GA7687@Gentoo>
 <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
 <20191031045242.GA3130@Gentoo>
 <809aa850-7a22-a7c5-af21-0e88d1c63dd7@infradead.org>
 <20191031071839.GB3130@Gentoo>
 <875a75ec-bbf1-9d80-a3e1-9c759c9c05e1@infradead.org>
 <20191101042337.GA3141@Gentoo> <20191101051108.GB3141@Gentoo>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b45d0312-d482-2d09-d6af-7a8b6b7051c5@infradead.org>
Date:   Thu, 31 Oct 2019 22:45:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191101051108.GB3141@Gentoo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/31/19 10:11 PM, Bhaskar Chowdhury wrote:
> On 09:53 Fri 01 Nov 2019, Bhaskar Chowdhury wrote:
>> On 08:06 Thu 31 Oct 2019, Randy Dunlap wrote:
>>> On 10/31/19 12:18 AM, Bhaskar Chowdhury wrote:
>>>> On 22:27 Wed 30 Oct 2019, Randy Dunlap wrote:
>>>>> On 10/30/19 9:52 PM, Bhaskar Chowdhury wrote:
>>>>>>>>> That 'rm' doesn't remove any files.  Compare what remove_old_kernel() does.
>>>>>>>> No,it is not using that function rather take the parameter from the
>>>>>>>> commandline and get into boot dir match with it and remove it.
>>>>>>>
>>>>>>> But it doesn't do that.  I tested it.  It should be more like what
>>>>>>> rmeove_old_kernel() does:
>>>>>>>
>>>>>>>         rm -If vmlinuz-$kernel_ver System.map-$kernel_ver config-$kernel_ver
>>>>>>>
>>>>>>> and if not, please explain why not.
>>>>>> Okay, again some uniformity missing in the code, I would like to your
>>>>>> suggested method,i.e call remove_old_kernel to do the job instead of depending on individual kernel.
>>>>>
>>>>> The simplest thing to do is set kernel_version=$kernel_ver
>>>>> and then call remove_old_kernel().
>>>>> And set modules_version=$modules_dir_name and call remove_old_modules_dir().
>>>>>
>>>>> But it would be cleaner to pass a parameter (kernel_version) to the
>>>>> remove_old_kernel() function and to pass a parameter (modules_dir) to the
>>>>> remove_old_modules_dir() function.
>>>>
>>>>>
>>>>
>>>> Thank you...I have just modified the code and call both the function
>>>> under remove option. BTW I didn't set the extra variable $kernel_ver name it $kernel_version and instead of $modules_dir_name name it $mo
>>>> dules_version.
>>>>
>>>> Capturing command line parameter in $kernel_version and $modules_version
>>>>
>>>> Is that fine? Here is a code snippet:
>>>
>>> Yes, that should be OK.
>>>
>>>> -r | --remove)
>>>>   if [[ $# -ne 3 ]]; then
>>>>    printf "You need to provide kernel version and modules directory
>>>>    name \n"
>>>>    exit 1
>>>>    else
>>>>    remove_old_kernel
>>>>    remove_old_modules_dir
>>>>    fi
>>>>
>>>>
>>>> I have just test it and it works.
>>>>
>>>>
>>>> And about solitary r option without hypen is ignoring and doing nothing.
>>>>
>>>> Means, if I pass ./scripts/prune-kernel r 5.3.3
>>>> it simply ignore and does nothing.Only with the hypen it can work.
>>>
>>> Is that how it should be?
>>> or what would you expect that to do?
>> Yes it should be. Any malformed parameter should be discarded,except
>> what explicitly given in code form,as help reminder.
>> OR
>> Do you want me to reminds user that they are missing thing to operate
>> correctly??
>>>
>>> -- 
>>> ~Randy
>> Bhaskar
>>>
> Randy,
> 
> I think we should show the help message , whenever user put a malformed
> parameter, say they put something like this :
> 
> ./scripts/prune-kernel f 5.3.3
> 
> It should show the help message to indicate what exactly need to pass
> with the script to get the desired result.
> 
> What do you think??

I agree.  Entering garbage junk should spit out help.

-- 
~Randy

