Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D688CA7924
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2019 05:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbfIDDIm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 23:08:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34110 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfIDDIl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 23:08:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so10394692pgc.1;
        Tue, 03 Sep 2019 20:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dfA6U+IJyyy9kC1t5JV8/mlZA71sQY4hs9JHXN0VII8=;
        b=W9whrDCQTi29K2svnEOO7Jm/Lv0CwQfhVCFntQRReI554NV2ECeg9cqzqpzL9/Nhbi
         Iv0RcqfQ2lWyHzLQ1CQULUOMva0gc2k7G3Ur52T0WVNSBRjlQqaMvnUWi3APN3y1TqvB
         uWRQEIBdDTX7NZBOHQXu5IKlsbInvKveKB1F20SeGFsxOGslUzaxv1m40RqwBPwz6z77
         V7v5fqyWJRiFFnaU1A8EM0KEDI3gqgvzDFGEtcpQZi0BR4agMSz/tF7f3HkUg9hu1LFS
         eojHLfH8lzmIm8gj9YNoP8x4tRrgZ8z6zSZPFGRLJu9QlEhBcrld4eUxvQtnMz3HWTS9
         Z63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dfA6U+IJyyy9kC1t5JV8/mlZA71sQY4hs9JHXN0VII8=;
        b=chrpaCnH/ewt8Pq/CK5pC7dnCFNp2NdmIjzqOd1eBqzBW8q7VCOx99errxQDuY5C6Z
         AjuogZmTsb+of3++CCc6+CDZtLNyprT4t/7gLbqUde89IySM7az5TBFqTFl+H0YzLwX5
         2bE3N7kjuvHDkl9JME4HA6dBkYT0Prm+ZhE6PClUosD0tspn9CoA9RG7AkXJRAgP4lS7
         F3nWCBg+iNgAMrcQfXgxcpgJjDpqfraPdDBU4cu4eyTiTe1g2D9hXLqmSxsQm17vC9Po
         3NH7NdlNfl2DsvuO9IdxzOwKsIoXKjgE017GC1DwBFJs/mec7p8VrgTXzQ7dOoXe8Hrk
         Fm+Q==
X-Gm-Message-State: APjAAAUEM8RVsDhJarEBjurJvg0pIE3oAt2r+cKZ5SzeaOyoaKjXYvyt
        2mBjUsjNJbJ7g3eXoQFrh02j/fEsreZXkQ==
X-Google-Smtp-Source: APXvYqyN3ZttcnW79XW08fIqU8Zbo+MeMpKouUCVa9iane7nR/SvDbr7IE7cE9B+HX3JNUfNaq/O6g==
X-Received: by 2002:a17:90a:650c:: with SMTP id i12mr2673118pjj.11.1567566520959;
        Tue, 03 Sep 2019 20:08:40 -0700 (PDT)
Received: from ?IPv6:2601:641:c100:83a0:559:28ce:4564:4221? ([2601:641:c100:83a0:559:28ce:4564:4221])
        by smtp.gmail.com with ESMTPSA id g20sm8741631pfh.184.2019.09.03.20.08.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 20:08:39 -0700 (PDT)
Subject: Re: [PATCH 2/3] kbuild, arc: add
 CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 for ARC
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>
References: <20190820170941.26193-1-yamada.masahiro@socionext.com>
 <20190820170941.26193-2-yamada.masahiro@socionext.com>
 <ed251c63-10e0-bd8a-1a9b-be9ade5cad3f@gmail.com>
 <CAK7LNARd1KFq=GRYQUr16KaiiRzh4ARX5eOpcRcUrZSVgHdhJA@mail.gmail.com>
From:   Vineet Gupta <vineetg76@gmail.com>
Message-ID: <c9ff7cad-d3bb-1367-e7c1-0d22fd542903@gmail.com>
Date:   Tue, 3 Sep 2019 20:08:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARd1KFq=GRYQUr16KaiiRzh4ARX5eOpcRcUrZSVgHdhJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/3/19 8:08 AM, Masahiro Yamada wrote:
>> So if you could please split out the Wmaybe-uninitialized change
> I could not understand your request.
>
> I added 'imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED'
> for CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3.
>
> I cannot split it out. Otherwise, you will see false-positive
> maybe-uninitialized warnings.

Sorry I must have overlooked this part. So no issues now !

Thx,
-Vineet
