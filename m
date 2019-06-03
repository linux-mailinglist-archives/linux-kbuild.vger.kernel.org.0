Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C051933657
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2019 19:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfFCRQ4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jun 2019 13:16:56 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52815 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfFCRQz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 13:16:55 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x53HGqQY028806;
        Tue, 4 Jun 2019 02:16:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x53HGqQY028806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559582213;
        bh=p2MCoDaSkOYHsUqev5UiEB/8d3quV+bRpPgivCGnysQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zZwpUjSV2+g865NLZvT3kmnhA3WdvY29vNCbQF/YKGy0xqOlzsP5fhB3d0WBPZtNR
         FluTczWN+cu6Wk//8jWXwF3Z0CZNHftIZxnPac0/w/SECsnaacwLXgYiqAR3JNiLNw
         k79qyEKQ1BzzH4VWlLE/ep6XD16TkHY39/u1K+QQp3tjJ5uQldsaKhsbUqLw6UunK7
         qmrFrNQYNaEM3EprqAlUIQ1tU7aWGeZ88fEf7wFptRf66sYPxyQgWbHKYPDu3b6tw+
         j/tgeqIlbHP72nRVH8E7S7ZNrXVy4dGuRyr7yf/Sfcr8EY/04AKPEtpTT79Qw8U7pN
         asnAHgdeFFFSg==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id o5so11744255vsq.4;
        Mon, 03 Jun 2019 10:16:53 -0700 (PDT)
X-Gm-Message-State: APjAAAXkgIhVjJdD5h/AO+RBjHFf2gdt6OUEJvH/jM4LcCfhlMqYuVFE
        8Rub3dem482ALWvb2q613AagFzAnM7pM2LE8yWs=
X-Google-Smtp-Source: APXvYqx+2aihAKpGUBJam+w6nqhJC5i9XtjkNSKhzYLP9vE1JNxYbwQurHMIybogfxhj6RAF+lKZQxEXjYTEsmk7NzE=
X-Received: by 2002:a67:de99:: with SMTP id r25mr13343402vsk.215.1559582212209;
 Mon, 03 Jun 2019 10:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com> <CAK7LNAQv-fm2iV6HW_FM0Fe6hNDeJ25c9CS2SbroSOneoepFMQ@mail.gmail.com>
 <87zhnh8ou6.fsf@intel.com>
In-Reply-To: <87zhnh8ou6.fsf@intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 4 Jun 2019 02:16:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT=nB0=at0X4OnHVKB=y7WwHGm4LXkrQnCw9HpjB5LooA@mail.gmail.com>
Message-ID: <CAK7LNAT=nB0=at0X4OnHVKB=y7WwHGm4LXkrQnCw9HpjB5LooA@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC 1/3] kbuild: add support for ensuring headers
 are self-contained
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        intel-gfx@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jani,

On Mon, May 20, 2019 at 6:16 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
> >
> > I will take a little time to considier
> > how far we can extend the idea about
> > "headers should be self-contained".
>
> Thanks! Please let me know if/when you need further action from me, I
> won't post new versions until then.


Could you send v2 with the following changes ?


[1] Could you rename *.header_test.c to *.hdrtest.c ?
    (I just thought .header_test.c was a bit too long.)

[2] %.hdrtest.c should not depend on the header

This will avoid unnecessary regeneration of *.hdrtest.c

quiet_cmd_header_test = HDRTEST $@
      cmd_header_test = echo "\#include \"$*.h\"" > $@

$(obj)/%.hdrtest.c:
        $(call cmd,header_test)

[3] Please add '*.hdrtest.c' to  .gitignore, Documentation/dontdiff

[4] Please add '*.hdrtest.c' to 'make clean' (around line 1640 of top Makefile)


-- 
Best Regards
Masahiro Yamada
