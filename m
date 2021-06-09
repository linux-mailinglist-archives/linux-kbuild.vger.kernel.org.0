Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612123A1204
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jun 2021 13:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238356AbhFILHb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Jun 2021 07:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238414AbhFILH3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Jun 2021 07:07:29 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34465C061789;
        Wed,  9 Jun 2021 04:05:34 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so23532443otl.3;
        Wed, 09 Jun 2021 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=36CQRkOY7QyghBxxf7GCQwquMv/Oiou6SopAZ61gqIk=;
        b=JOKKhNNrQp8FF3pWrjWT/rfnM1fUI/2DrXw/eHx8Wdydzv359k1GCQgMbKrFwGvzAG
         T8cEE0QnJr71W34jVwdTUjDduMxhS8NAbzrL6h9clHb+U2da3tHu9mULvpowpeCosJzn
         atq/nQQA/dEuvSn+sqVGXvPaA1W6P2C5u8q7LIzCqkdNME0/hdD/Yp47uznUapGpQWjx
         BX7PGlXNqxVklSFP11vAY/Uk0pHvRCwnJgCqILyLwJn8ktmDlgTGTDMEc6PEeb0ZQQrQ
         9zpgti5F3vW7uZRPL6x9IOIP080S3v+MbA5FIRMzjeEYMsqUkK44NbgInmp9lGsfVgn/
         Xl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=36CQRkOY7QyghBxxf7GCQwquMv/Oiou6SopAZ61gqIk=;
        b=GqRebFJK8y1FQXyIgcC1hwHgPbkhHK4gv4tk5yotpUq5ObOBrPn024DZuYtUoWkC0g
         OPUrn3g0P7I29/qHhPWMwWbA5DTtGxY14xH6wyYX7yAkYaVZjqMgGJvJn9tKf1ctOP7+
         wP5itNur10GfEPWrzm/dRkXN8d6oPMkeGN6+XzLPG4XStvhrID8Eyc5pFu5PuXLNXrp6
         pkFhERH1/4SFEWghz22ZFy0HtgGhdjIw4mUYHG9n7ryUhWuVeGFG5E85AvPA78hRt5NQ
         vsLm7Zg3T7HgfkmGdsNFUEGAxe03DQe8uzHK5hfb0sg9SHAaShGwPv+96gS9z0AGsloP
         hqXA==
X-Gm-Message-State: AOAM530wdH0aXC8yJgdpXJr3QQwmjvJdAnrAHiDp4QZKjjPjrBgAuTml
        GdrL+bMEJVG7BGnaIlVOGmOpqgIszs0=
X-Google-Smtp-Source: ABdhPJyKi5DmKghplNOitTDkrAZM+inOHwPYnbD2iakRM8Q9AIcesbNAOe7mZcuQInvcEw7wYXZcAw==
X-Received: by 2002:a9d:6f93:: with SMTP id h19mr11715637otq.100.1623236733441;
        Wed, 09 Jun 2021 04:05:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z22sm1282396ooj.6.2021.06.09.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 04:05:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 04:05:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        linux-kernel@vger.kernel.org, mfaltesek@google.com
Subject: Re: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
Message-ID: <20210609110531.GA1528247@roeck-us.net>
References: <20210204152957.1288448-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204152957.1288448-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Arnd,

On Thu, Feb 04, 2021 at 04:29:47PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> ARM randconfig builds with lld sometimes show a build failure
> from kallsyms:
> 
>   Inconsistent kallsyms data
>   Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> 
> The problem is the veneers/thunks getting added by the linker extend
> the symbol table, which in turn leads to more veneers being needed,
> so it may take a few extra iterations to converge.
> 
> This bug has been fixed multiple times before, but comes back every time
> a new symbol name is used. lld uses a different set of idenitifiers from
> ld.bfd, so the additional ones need to be added as well.
> 
> I looked through the sources and found that arm64 and mips define similar
> prefixes, so I'm adding those as well, aside from the ones I observed. I'm
> not sure about powerpc64, which seems to already be handled through a
> section match, but if it comes back, the "__long_branch_" and "__plt_"
> prefixes would have to get added as well.
> 

This is such a whack-a-mole. The problem is hitting us yet again. I suspect
it may be due to a new version of lld using new symbols, but I didn't really
try to track it down. Is there an easy way to search for missed symbols ?

In this context .. is there a chance to apply [1] after all ? This is getting
really time consuming and annoying, and I really dislike having to fix the same
problem over and over again.

Thanks,
Guenter

---
[1] https://patchwork.kernel.org/project/linux-kbuild/patch/20200910153204.156871-1-linux@roeck-us.net/
