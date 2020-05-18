Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6DC1D7F1C
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2020 18:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbgERQtv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 May 2020 12:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQtv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 May 2020 12:49:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2544C061A0C
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2020 09:49:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u15so10629039ljd.3
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2020 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KygdLUcTs6knBX0F3T/JLZYcVgSrVEzt6jZyrJ+boZQ=;
        b=S9bunU4mXjCTchqmsktCwiUzwrjCVNgd8YdFx6fqrfQbJSITfJ3Gfe0UZSPKy1COMq
         XgtV3MuVzYZ10FDt3fKxp2DI4i0KU99M1qsxjthk3kmKU65B8LYjZ+6gpdV3oGSJtrEX
         CvNN34lX+RlxUFi8ZDs+UvDfbUaWrrsJnAN1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KygdLUcTs6knBX0F3T/JLZYcVgSrVEzt6jZyrJ+boZQ=;
        b=pi6kXNi+gWs7FOj1xLznH/mxwpOQvyd8Aey62oxhWX4kuK7MNvoQ8Al//oHL/r/xOi
         UyDSstbuT0B//vMgN69mLif+bTS92q2MJuEAd75R06jLJ5Xucni2R7jkAtIKwQYxEf48
         U2kCqrchSV6CugLQ9EUQsezuPlMxPC63bafzAKfHsmkkAC/Ek7Zopq0RSrSAfQWM2NN4
         EyWGA+xoALtVLXgDloa3wgssZKuVwEBmfMKlGxVElTk0ZVdo//6iFBm9LColhdkdnZh4
         er7K8+QVflcWTUmdg0LIlSoTFW9kZ//PowCPLYsxpsS25KzGM30UjRTNHeio7U1KEZNP
         tlqA==
X-Gm-Message-State: AOAM530/ajivTswzNwL4gVKFMpEd3q4Lk+jk2I+7DlFT44qjOkgmqB4K
        j0BKdwswd9zZcN/Wrxi5rujnq83XWZ8=
X-Google-Smtp-Source: ABdhPJyiOBDRqnV6Z9OiC59JqMqAZvYZH9zLULOIvlcmcwwxlHvCu62TWLbYQ1CuElwRdzQmb9asYA==
X-Received: by 2002:a05:651c:291:: with SMTP id b17mr11381986ljo.166.1589820588337;
        Mon, 18 May 2020 09:49:48 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id f2sm5947989ljg.98.2020.05.18.09.49.47
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 09:49:47 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 82so8691886lfh.2
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2020 09:49:47 -0700 (PDT)
X-Received: by 2002:a05:6512:62:: with SMTP id i2mr3329357lfo.152.1589820586909;
 Mon, 18 May 2020 09:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200518145723.65b89375@canb.auug.org.au> <968394.1589817650@warthog.procyon.org.uk>
In-Reply-To: <968394.1589817650@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 May 2020 09:49:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6J-iqrCr_7oLDCbS8qXQ69EF=nPLWmvBiDmgdNWZ6KA@mail.gmail.com>
Message-ID: <CAHk-=wj6J-iqrCr_7oLDCbS8qXQ69EF=nPLWmvBiDmgdNWZ6KA@mail.gmail.com>
Subject: Re: How should we handle a bool depending on a tristate?
To:     David Howells <dhowells@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 18, 2020 at 9:01 AM David Howells <dhowells@redhat.com> wrote:
>
>
> Blech.  Yeah.  "depends on" doesn't work either.  The problem actually lies
> within the Kconfig framework.  It doesn't know how to handle a bool depending
> on a tristate.

No problem with Kconfig. It knows exactly how to let a bool depend on
a tristate.

It's just that there are two different kinds of dependencies.

For example, the dependency can be a hard and absolute dependency
(linking doesn't work, or whatever), and then obviously built-in code
cannot be enabled if the thing it depends on is a loadable module.

But the dependency can also be a conceptual one: "This option doesn't
make sense unless that option is set". Then a bool can make sense even
if the other config is a modular one.

And Kconfig can deal with either situation just fine.

Do

    depends on XYZ = y

or

    depends on XYZ != n

to clarify the choice. One requires a hard dependency, the other
requires that the  option just be enabled.

Now, if you just do "depends on XYZ", it allows a bool to be enabled
even for just a module (ie that second case). That makes sense for a
lot of "allow this feature in the module" kind of options, where it
would be pointless to even ask about a boolean feature if the parent
module isn't even enabled.

But that "depends on XYZ=y" is not uncommon. It basically says "this
option makes sense only when built in". Either because it requires it
for linking, or just because it doesn't work or make sense without it.

                     Linus
