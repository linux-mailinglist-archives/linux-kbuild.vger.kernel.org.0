Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC93AB9083
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2019 15:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfITNSj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 09:18:39 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]:33766 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfITNSi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 09:18:38 -0400
Received: by mail-qt1-f170.google.com with SMTP id r5so8634889qtd.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/zBWVQUMduMEV6S4oIBu6WgtqiwSPYzhbiHGFHy9vHA=;
        b=NM6tki/LBfV6dT4LIGUY5UfW6c7Qj/qVC68mC8w2mSeEe+B6rOkXnVORyZCKePKFXg
         eJWFDhizzAfTT++dBCvbzDPb+XTuIQKUijX2DQpb6tFng3hsPDSL5aHyr3WrefAg1BLM
         W/gxGpDVcCB8Px2kVwKn2t+jfY7fi5UZmNNz/hUeSgF0At4N+0itF4ygt/9ZB9wRyOWa
         coqARgtzDluJh1VULcieqzJRblXGLABG98sZROfnzTfRE5b0PBoI8Cpo3FlXfJp7Z4+2
         MaOYLVRCniheNmugEkbt9aYG3vba9UjhgbUkreWfZilRGrNaOJMMFx1O0YSnKlnhpr7r
         QESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/zBWVQUMduMEV6S4oIBu6WgtqiwSPYzhbiHGFHy9vHA=;
        b=Vs9swYMgQWEJ7k5cxc+nOoATsgcuntcMqfPidiI1Jt72tOsiugdmQ9+PuqL2rKNS/q
         Anpprc4WV+FEmMU01S4mwX28XDcUKONUpjJDXjhyQ4R9SSCRUoGKTv+OLXS40FvT4LjS
         qVkyZ4QCR9J5Xv0FCKqFr4ohj7lGKY4ODZCy4Yu0uCbqzy4mLHULt1WpZXjVknJhkPd0
         WQ9MDeN0xDJ68jYWVxUUL1TjDTZ7wluMDN9tIldU4GBaogSelmKZ3+ZVLSwPm6/0g0m3
         gUqkYoTtqIXef8bG0Fq6USizuFDv+SoFJwjZ9f5S8qij+y97O7nz80GOTzbgpn0Oygk6
         n1VQ==
X-Gm-Message-State: APjAAAU11n2+FFHXDDyteyAQrSdWieNDEGhq0uzIxkfG12xmKAOhHQAB
        oDjrbGp6WA3/SvHbUpYFgx8bnw==
X-Google-Smtp-Source: APXvYqxIsFgyOBopMmS9+z7fnu+twmn7h4ZA2rMQZMYyKQD/qBcVJREwxOktdQbhEnDGO3ZY+bUuwg==
X-Received: by 2002:ac8:7159:: with SMTP id h25mr3096004qtp.90.1568985517812;
        Fri, 20 Sep 2019 06:18:37 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id k54sm1035355qtf.28.2019.09.20.06.18.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 06:18:36 -0700 (PDT)
Message-ID: <1568985515.5576.195.camel@lca.pw>
Subject: Re: "arm64: use asm-generic/dma-mapping.h" introduced a kbuild
 warning
From:   Qian Cai <cai@lca.pw>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Fri, 20 Sep 2019 09:18:35 -0400
In-Reply-To: <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
References: <1568898377.5576.186.camel@lca.pw>
         <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 2019-09-20 at 19:24 +0900, Masahiro Yamada wrote:
> Hi Qian,
> 
> On Thu, Sep 19, 2019 at 10:06 PM Qian Cai <cai@lca.pw> wrote:
> > 
> > The commit 5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h") introduced a
> > kbuild warning,
> > 
> > scripts/Makefile.asm-generic:25: redundant generic-y found in
> > arch/arm64/include/asm/Kbuild: dma-mapping.h
> > 
> > 
> 
> Which tree did you test?

It was yesterday's linux-next (next-20190918) with this config [1], but it seems
gone in today's linux-next.

[1] https://raw.githubusercontent.com/cailca/linux-mm/master/arm64.config

> 
> I tried the latest Linus tree (, which contains 5489c8e0cf03),
> but I did not see this warning.
> 
> 
> 
