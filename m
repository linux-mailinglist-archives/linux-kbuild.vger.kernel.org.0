Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1DB187751
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 02:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733038AbgCQBGV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 21:06:21 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56890 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733031AbgCQBGV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 21:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=w9d7jFQj/R01fofPa/QfPL0PGzem5FmcyR2bTFxYaIQ=; b=OKiUqdExIgKopcctRfEyub3JVA
        94zVSjo2WawzzSy8ebs0P85CE/uJ4D8xgQEc2J4qVIkygZXwnWV/oGq6A0f4VyqXvFitSkcwk/u/g
        e8wFoYoSlng96i7lCd0fgpriuPdW/9lbzi1rZhgAQkcP+PmpTA54a2Jg8hx+uYyU2GJYnU7X/z2Zo
        wNnyVRCTPpoRc9nfsa0EY+jaDeXG/8XaENOgs7xGlsMgbYeSI3mUKObICHLklCQFyCUzdR/TfGY6A
        q7jR++pp+O7+QaQ4eyx6CE92u0DsYtscYwT31YDc0DmIDwNRSZYJHd0WXiqFz+IjFPfY5UK8H3EB2
        faFPsKxQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jE0gX-0008Oa-2Z; Tue, 17 Mar 2020 01:06:21 +0000
Subject: Re: linux-kbuild missing from lore?
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
Date:   Mon, 16 Mar 2020 18:06:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> Hi Nick,
> 
> On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> Hi Masahiro,
>> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
>> https://lore.kernel.org/lists.html.  Is that intentional or
>> accidental?
>> --
>> Thanks,
>> ~Nick Desaulniers
> 
> 
> Thanks for letting me know this.
> I guess it is accidental.
> 
> In fact, I do not know what to do
> to take good care of the kbuild ML.

Maybe ask Sam Ravnborg or Michal Marek if they have kbuild ML archives.

or see if they are available from some other ML archive site, like
https://www.spinics.net/lists/linux-kbuild/


My kbuild archive has about 20,000 emails in it, beginning around the
middle of 2011.
I could make that available, but I don't claim that it is complete.

And I'm sure that it has some duplicate emails in it [if an email is
kbuild-related, I put the email into this "folder", no matter what
mailing list it came from].

-- 
~Randy

