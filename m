Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3219AD394F
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 08:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfJKGZD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 02:25:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52174 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfJKGZD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 02:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=FLAWMK1jll/1124JX1Di/BVjDfG1z6BDR61XdNeuZ+s=; b=Px2/FgJlPISYp/fR+EOqQUESj
        xEi/n2k64OzLBieWoVrQZvDG0Nmy8f2aPlcksHSdHW2c0fG9DoCyg449McDHaNiwLwpqojM+7SSw/
        MSSgcUF1TUvzC8z1nZ3AMqUzkVhOrtDj3203UBC+38xp7DwXuFcZaXGDKZjfse633NUPmSoBfYst4
        Oac500a83pDr8/QYqYmFIlJDFu6UkwpyRxgZrjsvq51NnHnpfP0V4sVtjQmC83kcvA3mpN6fFs3zx
        YwWn+2UXfoayE+gx8UpuRG8sjZ4tKfZSPcQFFbwuNVjhzZ61YeVte025P5EQ777ezrfkpoulHmxh0
        WEWFEcdpw==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iIoMI-0000eJ-Vs; Fri, 11 Oct 2019 06:25:03 +0000
Subject: Re: [PATCH] Modern Bash syntax, replace backquote to dollar
 parenthesis
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     linux-kbuild@vger.kernel.org
References: <yamada.masahiro@socionext.com,michal.lkml@markovi.net,linux-kbuild@vger.kernel.org>
 <20191011021759.28960-1-unixbhaskar@gmail.com>
 <369b1248-fd80-11e2-d879-d5943f9659f4@infradead.org>
 <20191011042840.GA11550@Gentoo>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5960306a-15e0-0ec0-3ad3-03ededfbacb1@infradead.org>
Date:   Thu, 10 Oct 2019 23:25:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191011042840.GA11550@Gentoo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/10/19 9:28 PM, Bhaskar Chowdhury wrote:
> On 20:04 Thu 10 Oct 2019, Randy Dunlap wrote:
>> On 10/10/19 7:17 PM, Bhaskar Chowdhury wrote:
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> ---
>>>  setlocalversion | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 183 insertions(+)
>>>  create mode 100755 setlocalversion
>>
>> Hi,
>> I'm pretty sure something is mucked up here.
>>
>>> diff --git a/setlocalversion b/setlocalversion
>>
>> but this isn't a diff between those 2 files.
>>
>> And this diff should be from the top level of the kernel source tree, so it
>> should be a diff between a/scripts/setlocalversion and b/scripts/setlocalversion.
>>
> Right. I have move the original file to top level dir then ...
>>> new file mode 100755
>>
>> There is already a file scripts/setlocalversion, so this "new file" is strange.
>>
> It is indeed..because of my stupidity ..as I said removed that file and
> made the patch...heck
> 
>> Also, the patch subject should be something like:
>> [PATCH] scripts: fix shell syntax
>>
> Doesn't the subject catch it from commit message??

I don't quite follow that, but anyway my answer is No.

>> And note that the shell in this case is /bin/sh, not necessarily bash.
>> Actually we prefer to make patches that remove bashisms in many cases.
>>
> Do you want me drop this one ? Can you be specific Randy, please, if it
> is not what is need , no point wasting time on it.

Sorry, I can't tell without seeing the actual changes in a corrected patch/diff.

>> One more:  you should Cc: the kbuild maintainer on patches that he might apply/merge.
>>
> 
> I did , I believe ..both the maintainers .

Nope. Only the linux-kbuild mailing list, no maintainers that I can see.

-- 
~Randy
