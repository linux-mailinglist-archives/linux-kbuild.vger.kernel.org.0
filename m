Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FFC35FC14
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345147AbhDNT77 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245471AbhDNT76 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:59:58 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8555C061574;
        Wed, 14 Apr 2021 12:59:35 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id o10so23487477ybb.10;
        Wed, 14 Apr 2021 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kk+4eaGKBse7wylWIAyXzwrFNlUikGMw6Cuy5HxWNJ4=;
        b=nP5JvCXU1J2ZZl0o7Qp4jkJYQeiqEcXIedAawZSmc5SBQrAGieHpyzpJFJouqdXDJD
         Nvdhmc9lnN06RL9pSJoxX+my+ginHSZaB5FXtdBerQ3/xhfLvJBVb+xZXWNOFKz/SCyR
         dFfsDblIQUFV71fIbzvj0dVGf11ZKZm8ff0m2VETq/mQQODAGMF6wncCMF60vjdaNWfO
         BVnNUlExAKpG9ukgorqKtubYuXLr8g/Ln4lFKC1KgPkRo+KZiJwblGulcTrqHuDhYBQ/
         Od88hKCcQTGznXZ/w0t7WvtStfJw/O61GEpO/UkJGv3HIUFxPYwzVSFio6zUwdtqXqQD
         /4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kk+4eaGKBse7wylWIAyXzwrFNlUikGMw6Cuy5HxWNJ4=;
        b=SheQC8Jf1b2NnbUn5y7PEqmMmfR+fMWZYrtawmS9+z0I5nXc7I/nlCjad2ta+bVcWZ
         WoYfLXrt36eagR67Or2w6qZjN+BWLw/asdBzHE0O4Ad6CrcvEH3LQ9dfHlz+wjCfknKB
         3OvJKuufPGEh7ifBmwTteVFuiqtS8CWJE07koBe4KI9Rjy1c+T9USOCM4LlrtTCNxQPo
         f21TwcBXBils7gDtJJzTHeHRJMKapivZo4rw2nKT6KeB9kgExA+Tuz6z7gTGBwtBjS0x
         Ra2NgYoDQO8ijut+7UcwVkz1fRCHhACmysHC8kDVibi+DNru+Y1pxjivnHWrXkaVivTq
         EiLA==
X-Gm-Message-State: AOAM531NYgoDX2e6HnCcytNYMB3sJ9pFttFPSJHREKVHlKj442kMhFqQ
        QH6uBpa6RAMAnUd9vh6mJy+FIL962ZvZgNa1gPM=
X-Google-Smtp-Source: ABdhPJxMTpTOTPwXq7WTQUYopUBdDbXy2nRjKNVN+LX3MWIuhhGD4BKdSoSlL3G/YWvruxJ08+j+TYuLJi66gh0p/hc=
X-Received: by 2002:a25:81ce:: with SMTP id n14mr52455964ybm.33.1618430375276;
 Wed, 14 Apr 2021 12:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-2-ojeda@kernel.org>
 <20210414194454.GV2531743@casper.infradead.org>
In-Reply-To: <20210414194454.GV2531743@casper.infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Apr 2021 21:59:24 +0200
Message-ID: <CANiq72k1w8__rCAZs1NbVvB=gXp_AX9=H-KYbdoLCcmYFEWc_w@mail.gmail.com>
Subject: Re: [PATCH 01/13] kallsyms: Support "big" kernel symbols (2-byte lengths)
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 9:45 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> How about doing something a bit more utf-8-like?
>
>         len = data[0];
>         if (len == 0)
>                 error
>         else if (len < 128)
>                 return len;
>         else if (len < 192)
>                 return 128 + (len - 128) * 256 + data[1];
> ... that takes you all the way out to 16511 bytes.  You probably don't

That would save some space and allow us to keep the 0 as an error, yeah.

> Alternatively, if the symbols are really this long, perhaps we should not
> do string matches.  A sha-1 (... or whatever ...) hash of the function
> name is 160 bits.  Expressed as hex digits, that's 40 characters.
> Expressed in base-64, it's 27 characters.  We'd also want a "pretty"
> name to go along with the hash, but that seems preferable to printing
> out a mangled-with-types-and-who-knows-what name.

I have seen symbols up to ~300, but I don't think we will ever go up
to more than, say, 1024, unless we start to go crazy with generics,
namespaces and what not.

Hashing could be a nice solution if they really grow, yeah.

> If you have C-d-b, you don't also need S-o-b.

Hmm... `submitting-patches.rst` keeps the S-o-b in the example they
give, is it outdated?

Cheers,
Miguel
