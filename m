Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0FD21BDE3
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2020 21:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgGJToE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Jul 2020 15:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgGJToE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jul 2020 15:44:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D17DC08C5DC
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2020 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=5UxH6YLVExyitOD8RbNdOP7r5X608pmwXp/PCXBuwr4=; b=aSOPACYlFwPhXXuO85AC+GIxjD
        aJT3VAI0DRUnWn7vxa4Ix+t54KxneNEGzBQl8jIa8wLdWoVuv085IChzQepez03excjCvEsHIvRex
        16DEukW0Obg7lSaOD/R3fNmaj707OOCexBByrmhJqvMifWPhpTCpg3oy1TDn0174ujqunuN3jv+ub
        WXUbeApBHoKc47ONtPS8ivdK67CSlvpAZ9Sl7EH4gvY8wg+PbjMy7LrQLEc/3wb6HkUI7lNzNCSV7
        yqs3jsM09visxaPLcdRQXUYKB53MXo9BTM0+okHUocEeQwRNCFIAJSCqvbWy6QhkclJREbxrQXHCM
        kRnJNRqQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jtyw1-0003QH-GK; Fri, 10 Jul 2020 19:43:50 +0000
Subject: Re: linux-kbuild missing from lore?
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Hank Leininger <hlein@marc.info>
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <CAK7LNASg9ZMN0bKnXi0vJDEpmhX7CLVhqDZ_BvsvoTZKS7LbsA@mail.gmail.com>
 <CAKwvOdkJuT=7kBGEMu=a6kTdZtqOrqnynRGhYdP1xOs=JF_zxw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8bdb6440-820a-e3a3-f285-36674a5c8707@infradead.org>
Date:   Fri, 10 Jul 2020 12:43:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkJuT=7kBGEMu=a6kTdZtqOrqnynRGhYdP1xOs=JF_zxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/10/20 12:16 PM, Nick Desaulniers wrote:
> (minus LF helpdesk)
> 
> Here's what I put in the helpdesk ticket via their website, not sure
> if it will be posted on the mailing list, apologies if it does and
> results in a double post:
> 
> Hello, can the admin of the lore.kernel.org helpdesk please accept the
> following sanitized archive?
> 
> https://drive.google.com/file/d/1d0oS3fCYxGhB0p_IQum9Gh20B3aFxKeI/view?usp=sharing
> 
> With generous assistance from Hank Leininger from marc.info, I was
> able to get mbox's for linux-kbuild@vger.kernel.org dating back to
> 2008.
> 
> The archive was provided as a tarball of directories of gzip archives.
> To generate the above, I ran:
> 
> $ tar xvf linux-kbuild_2008-2020.tar
> $ find . -name \*.gz | xargs gunzip
> $ for F in $(find untared -type f); do ./list-archive-maker.py -s $F
> -e linux-kbuild -k linux-kbuild-known-ids.txt -l
> linux-kbuild.vger.kernel.org; done
> $ tar cf linux-kbuild.tar linux-kbuild
> $ xz -9 linux-kbuild.tar
> 
> as per https://korg.docs.kernel.org/lore.html.
> 
> This response is via the ticket #93182 filed at
> rt.linuxfoundation.org's web site.

Thanks for doing this, Nick.

-- 
~Randy

