Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FE33EF99F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 06:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbhHREnU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 00:43:20 -0400
Received: from gateway22.websitewelcome.com ([192.185.46.224]:13628 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237588AbhHREnU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 00:43:20 -0400
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id DF6EC13208
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:42:44 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id GDPYmu8VAMGeEGDPYmuZyB; Tue, 17 Aug 2021 23:42:44 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fqWho5z6HDj4E/uC18IyWmSmTMfo9JPqAgS3dawEvWk=; b=be9hlQMJu3Ujj1NTF548ywxCeb
        Cdh3EeFeibFikH+Pyt4qRrY2hsmcU9q5mv0J4whSv06j3VboWiOUR7Ig1dwy+SLDhj0ORSNzgoikp
        mOjCvl9AKoj+snKJQ3B7JHIP0XSuj7vXUD3RDsGwhJWYRRXdegf4d0wVeoRdCTMMQ4nY7BIAglxbh
        Px17n9e22kpZp3eUpwwy8UKxZ8e0MXHHjsZNiwyLVO2ZCP2jXhVeUOd1gUbuzyJbiZMMTh1PuNKrx
        LVvwpTxiFeCKOIQdAxaCgQh2j3Lulj845WoZ4FYCHVl5AFALi+MQxer4P0Ue4xFhmpu/xbVDdmo6o
        CPfYNuuw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:45490 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1mGDPY-002STB-9X; Tue, 17 Aug 2021 23:42:44 -0500
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Philip Li <philip.li@intel.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
References: <20210817005624.1455428-1-nathan@kernel.org>
 <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
 <202108171056.EDCE562@keescook>
 <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org>
 <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
 <71d76c41-7f9b-6d60-ba4f-0cd84596b457@embeddedor.com>
 <202108171602.159EB2C7EA@keescook>
 <72ae69b4-6069-ade5-a12b-8ee0435f803a@kernel.org>
 <20210818042720.GA1645557@pl-dbox>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <d19dd1f7-3898-227a-3d7d-25cddb0434d0@embeddedor.com>
Date:   Tue, 17 Aug 2021 23:45:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818042720.GA1645557@pl-dbox>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1mGDPY-002STB-9X
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:45490
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 8/17/21 23:27, Philip Li wrote:

>> Philip, how often is the kernel test robot's clang version rebuilt? Would it
>> be possible to bump it to latest ToT or at least
>> 9ed4a94d6451046a51ef393cd62f00710820a7e8 so that we do not get bit by this
>> warning when we go to enable this flag?
> Got it, currently we do upgrade in weekly cadence (but it may fall behind sometimes),
> and the one we use now is clang version 14.0.0 (https://github.com/llvm/llvm-project 
> 2c6448cdc2f68f8c28fd0bd9404182b81306e6e6)
> 
> We will ugrade to the head of llvm-project master today.

Thanks, Philip. We really appreciate it.
--
Gustavo
