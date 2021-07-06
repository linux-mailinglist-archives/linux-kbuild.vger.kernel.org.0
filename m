Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C323BDF4C
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 00:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhGFWRG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jul 2021 18:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhGFWRG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jul 2021 18:17:06 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0919CC061574;
        Tue,  6 Jul 2021 15:14:26 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id h6so552939iok.6;
        Tue, 06 Jul 2021 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zZMeMLgvnFQxAN+r/nqeEif6VMjZ3hc66qsD3h/Fku8=;
        b=jzN2EbBCq0JE8rlKq9vRSKpiPtfTi4wMf5ip4XlDiS6quuADQsEqOqAG+nIafZ6ika
         ewGp+f+w7EbdXZ/4lDpzf7vdxUq5LTPGXOekUS/BLEBscyBXxcxB4RDNfLbY7VhlU7Sn
         6BuLD81sdTECS6vS3IzT22wMjaAAltHGKg+WMMTMaOjPKovZUTT+e7i4Ktl8kJwTwWR8
         MIvCAqPOEQcpfEvPWYdLpd0hnH5GFg6ewcZ9QVsQ9vBWvdjtpOsSPCwgI4wFU+yCSclr
         LSBxIPfc2vtwZ1xK1EOJnXQ21VCI0sqGPGi/7OrNcLuwHZ4leZSmP+E6pIzxiN8vsfvg
         l7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zZMeMLgvnFQxAN+r/nqeEif6VMjZ3hc66qsD3h/Fku8=;
        b=rwbK4TzzfjpxmirDFihf43S5z6ldr5ShUFH28FWLdr5+sUCCO46yKmmeWHoV139+t9
         u9Zr/q/eGHWXwcHhM6Lth53EDDIdEhny+PdoedZLjxjXuxy4pL8QbCNgZ9bwqWi8YGxM
         UYal7nfG6oMnXEgVKRiGzs17AraMUpXcLumZZHgSQ4J49EV1O1lSKNv5K9fVd65CNtfU
         iUswD+//GDeYnzFfzaQ7Z8n3rLFg3bNuJU6/uIKp86Rh/cPDndY1Jdp6Y/XmYlgQiMPF
         wz7W3jMFa3q66/QksmaOdSUSCA+LEm4sOif0EahzYv3Ir/dhyz+JxfbBJtvTpE2Mj2SG
         s89A==
X-Gm-Message-State: AOAM531F5x49bMD6pru1QxiqYT9fha6q84ts5TToE0N6bpXbm/0A9Xnb
        ukO/6PnQkG1pJnUXfv0bNNCT6diOseMk0+kEh5GCfovhegI=
X-Google-Smtp-Source: ABdhPJyGODwa3HfoBD9iPuy6GWsnQTK3XwFeInq5yi393y5Nb26tFQ4WxUBe1pcxLgU6bRwPu9PrYoZc8V9QiKhmncg=
X-Received: by 2002:a02:cc07:: with SMTP id n7mr2885107jap.41.1625609665356;
 Tue, 06 Jul 2021 15:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-17-ojeda@kernel.org>
 <CAKY_9u1WN1nK3fdS0WDVgc4umYrCMVxODn3wG0rtctJzgNE5Ag@mail.gmail.com>
In-Reply-To: <CAKY_9u1WN1nK3fdS0WDVgc4umYrCMVxODn3wG0rtctJzgNE5Ag@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 7 Jul 2021 00:14:14 +0200
Message-ID: <CANiq72k5+0RLJU6_agbFK6c61ogRt6ASGuXfRWAKYJPwqtB8BA@mail.gmail.com>
Subject: Re: [PATCH 16/17] MAINTAINERS: Rust
To:     Pedro Tammela <pctammela@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 6, 2021 at 2:26 AM Pedro Tammela <pctammela@gmail.com> wrote:
>
> Does this mean that development will be done exclusively on GitHub?
> If affirmative, is there a bot that will replicate the messages in the
> mailing list?

Development has happened mainly in GitHub so far, but we have accepted
patches from the ML and we can do their reviews there too.

We do not have a bot to replicate reviews into the mailing list nor
any fancy bidirectional sync, though.

If this is deemed unacceptable by Linus et. al., we can do development
in the ML as usual -- we do not really mind one way or the other (and,
in fact, we discussed moving things to a git.kernel.org tree too).

The main point of GitHub/GitLab/etc. for us so far is having an issue
tracker and some kind of CI.

Cheers,
Miguel
