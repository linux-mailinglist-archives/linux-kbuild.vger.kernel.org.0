Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C416F35FBC5
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349152AbhDNTnD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349164AbhDNTnB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:43:01 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02643C061574;
        Wed, 14 Apr 2021 12:42:38 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 82so23463109yby.7;
        Wed, 14 Apr 2021 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nwNvUrfqSihmBKw7V/O58rXxdk7PvVw2JH+6F3njTsY=;
        b=YV//ipOjf5gJMevTfH7bJhridvxJ8j6dAaX/WtBar5+xa/JDdKm3GnAf/k+7aidCz3
         EtOfSuGLH8Uetdga7IHFUGFXmTBbz1/qO9JMQn3JRMCXMBi5stkSu/q0P0R8rx9OLgHT
         Hkp9xOofiM4eXvGIS8mY5ChzIufloYKQOXudaNJb03Xm5r9buPypPFe8bCnzUCi56uql
         QqeAsrVZ747luCRYB2Udru4RDqSAhXdMznQvhSBy7Bn061o77sq6HKOhHnpb5crpinY+
         EsVcI13PHzDui9bf+iW9NVSAXbOwXrvTPRL4tcyxkRT26bmir7YQ1k7GbwY5QdTJaBZ8
         jj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwNvUrfqSihmBKw7V/O58rXxdk7PvVw2JH+6F3njTsY=;
        b=Qi1BvKwEN5e7DjAOLDj907ctE7ypR4Zva20cBnIQf/GuO7GkEbXePelptlQ9u4VDdE
         6umNlfjvhhbVnrpWBaV+M6Cj2DGkQu0Y61CVk46rF8JOc8owYRlkmXv49xr30ozYrhDM
         r0nUshmdCdtb4KU01T9Hosdsa1sw90k16MRB9srL8j9TEL0Y0bYdo3w3OeAa+RmSPXvp
         xVl7H14Ua6nft4inGDyonjEDbcC1R79QiUNcwxfrJ1L/QkQGEpltc1E1yK9RkzdFjjGS
         HlBYEfISTTP2N6VpbNGPQ0oCrK5A/62lMDcSoE6Pus6nNHsa1GUtIC+CPU7p9+6ybk2s
         DvCA==
X-Gm-Message-State: AOAM533lLvNT6slN5k/vHWCIAgTmxIIOWlZ3HVvAgamqfwJGe6Z8dOg9
        SAyTssl58M7ufGDJ+P+JrvGAYjLLFH2lw/p5xMg=
X-Google-Smtp-Source: ABdhPJyjfJxleWF/XeQmoJoEcxGFIQGNg6XYRodo71ehUQOm7nERG1n2SSzQnsEgofJ0HGzvxpioefFmvvXqlV4tG48=
X-Received: by 2002:a25:c444:: with SMTP id u65mr27626251ybf.93.1618429357237;
 Wed, 14 Apr 2021 12:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
In-Reply-To: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Apr 2021 21:42:26 +0200
Message-ID: <CANiq72mpjQh01QovUPCjdHDS-zVHroxymet67GOHvotW8wGdVg@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 9:34 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Honestly, I'd like to see a real example. This is fine for testing,
> but I'd like to see something a bit more real, and a bit less special
> than the Android "binder" WIP that comes a few patches later.
>
> Would there be some kind of real driver or something that people could
> use as a example of a real piece of code that actually does something
> meaningful?

Yeah, we are planning to write a couple of drivers that talk to actual
hardware. Not sure which ones we will do, but we will have them
written.

Cheers,
Miguel
