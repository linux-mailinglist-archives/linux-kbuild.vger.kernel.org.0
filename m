Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F50736288B
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 21:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbhDPTW5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 15:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235362AbhDPTW4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 15:22:56 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D33C061574;
        Fri, 16 Apr 2021 12:22:31 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id g38so31290335ybi.12;
        Fri, 16 Apr 2021 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o0dexlCTmbXseq9OucTMrh/yd65+XxEyKGgX3F4Kcro=;
        b=hxqJDy9ySm5TrpLrNT+1gU+WEqKsjwDiT5nr16MuXAJEcHcI8eswRz5/RXvqcgsjm6
         Aqjex+khTuf+iBKcnpTzN4wCGFXNjISyvYDw1vpqkKXEBBF03buD3cDb7LZzEXJMBI0w
         8yFpX6JyfMF8zWNyAOnt/2Btp9SfcEjeojc0DEZOX6REHKlvOva9+OJQ42Debqa5VFJg
         bf/FOby2fK+ydNk+b7lRUrqxxA0gzbbRi3BLyWEDTKbvJs8cUm5pPhxD7o0JHEUEtPcW
         jvQSW+nj2hh9A2ru8X77gYFdoQMLKbTm/oh0YjF2//brHV/Myp0ezzp0ysnlwJ4XAAfT
         JU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o0dexlCTmbXseq9OucTMrh/yd65+XxEyKGgX3F4Kcro=;
        b=JUJ+iDC7IRxVkB5le/mtYUJw5H+oWhHPCyqjEIHbvpkyp3xf40YFgFe5Ansj9uQNAD
         B2Rl3hJdR29pBI+Mlt4rBsuhhokGcaculij+PKbO7TxRPrlPlF77uE5gZXvIUWM3NNrz
         hlJIXfa3GRCmvCzKNsE+vDknOVrRnc4r3LyxeLClKkqH7aH7vOa3y5Y4g7Zo6blOrIVU
         JjqMf7ZJEJZ7xtQz4qkETGQ9pkLwSLtlGWh+KNjAtAg8d3yDYz8e2wfpKw6mOuEp8V5i
         ygsZjpJdm6T2UydR0tsggGA4EWKZqEnVWTg7VqEkATwzVU7fYy09K4Q89Q52Zc9kBFKK
         tzKw==
X-Gm-Message-State: AOAM5308mpDjXfjOXQAFtcSsGYPUfqLelo/EeXMlNT8nGfmW9pG5IX4f
        25TFR33GXsWVKAMZBB60gP3ofQ6QDIO+Umvx7hM=
X-Google-Smtp-Source: ABdhPJwF5UnB4TcmPnwFLyJTNJo4qQ4027fOHmmT21t5LNwcYknq5DN6lNtqZZkQPsw2JNJ1wbDO+iiHCPZU1W+W+m4=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr1065112ybg.26.1618600951046;
 Fri, 16 Apr 2021 12:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
 <CAK7LNAR-zdHLpp7eQ_PUG6PQMKUKh2m0b80NGSxnxuXhjyT=3g@mail.gmail.com>
 <20210411101829.GR6564@kitsune.suse.cz> <CAK7LNASycuqb2wyizXgVs4aN33LOrxCBikLbSXs+anWJ0-SW_Q@mail.gmail.com>
 <20210411200335.GS6564@kitsune.suse.cz>
In-Reply-To: <20210411200335.GS6564@kitsune.suse.cz>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 21:22:20 +0200
Message-ID: <CANiq72n41amNTnMhOpF7SJY_Xg7YVbZngOx3VzJGW8_fxv9Mtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: dummy-tools: Add elfedit.
To:     =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 11:27 PM Michal Such=C3=A1nek <msuchanek@suse.de> w=
rote:
>
> Yes, I do have the rust support.

I applied your patch in rust-next and it is in the latest linux-next,
let me know if that helped.

Masahiro, if you want to apply it on your side, just let me know!

Cheers,
Miguel
