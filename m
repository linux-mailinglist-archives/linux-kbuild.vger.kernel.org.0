Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7370E1AF48
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 06:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbfEMEID (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 May 2019 00:08:03 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42523 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfEMEID (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 May 2019 00:08:03 -0400
Received: by mail-qt1-f196.google.com with SMTP id j53so13173960qta.9;
        Sun, 12 May 2019 21:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sHEFKQfcGH4B+408DKFIloLlBCtwyujDF4yn5X+9N8Y=;
        b=GRlwmvpttrX13Wq3NL4bJM2/T0tdFYpPf0TcDufLMccLLHQN3ysRCbtILt2rT06kOP
         fqtL1PLihIvSZL7hwJocdCK/XDYa0MW98wRp/LS1osJrxRhr5Mj4k3FL0UG7jj/30n/5
         JnyvqTT4SHw3TjO8wlBpPgs4yLB8l+6p8S1jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sHEFKQfcGH4B+408DKFIloLlBCtwyujDF4yn5X+9N8Y=;
        b=NNmKZ3HeJ4j/P50vC6fPT78P/83YQ24WMDh1aWJJu6EcCO+SpOb2+eIJfBUk2mp9vq
         09d7x6sJkZW5mBDoxpN2rrvVzjD1qUjlF/5EMdqTTdualRfHcNCMOpcF/YSyzfhwAsru
         J5lmSfGvLWn6GJJn+0vvyWEG2fVvZzjjqdV1JfHAdaQb5O7EnZ1V8F2V5oz9jIzuSSzR
         x+o1U1kcZs5AVDh7BFdWK+4xxwm/8qe0Nj4mQSRDA4o0oKcwCykFrjOdC77UTqV4jbij
         U8Vd/1Iq0YlTN9f2hmy1ZB/x0/tujFkKpvXL7AQS3FwkLOoajVOrgfgaTdITTzlo0GSc
         5wug==
X-Gm-Message-State: APjAAAV3SpH+3D2yLkQxaAycZsvjtLOfEnDXJX4DLIcfo1zRDQMORTuj
        YOKQbCIhBTiyC6TZFfQjLQrxq8a6+sa2Y85Gb5EbrQ==
X-Google-Smtp-Source: APXvYqx5O7znBG/jSsiHQTMO3pSSVLvI1wIfQneskr2zV0XVxRUy69X1rL0fkPRSRFhamJGQugi6mm7IaMs2VD5z9uM=
X-Received: by 2002:ac8:45da:: with SMTP id e26mr12608636qto.235.1557720482179;
 Sun, 12 May 2019 21:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190509073555.15545-1-yamada.masahiro@socionext.com>
 <CAK7LNARotATDnShT-80Ect9XvSM98wYEbQRKHdUTuQBtvxG8aw@mail.gmail.com>
 <CACPK8XdVZHtCtHzv9vmt8C877SBbZNqRPxT9iUe0+8-o7X9W7g@mail.gmail.com> <CAK7LNAS71K4my-eyYryViy_uQ0LR5hbzyMjAwZUta99pU=0X9g@mail.gmail.com>
In-Reply-To: <CAK7LNAS71K4my-eyYryViy_uQ0LR5hbzyMjAwZUta99pU=0X9g@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 13 May 2019 04:07:50 +0000
Message-ID: <CACPK8XediQp2mdbDNuJAJ8_tNoo91aFCaVsC1e_MQ46eonvihQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 13 May 2019 at 02:50, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> > $ CROSS_COMPILE=foo  make
> > make: foogcc: Command not found
> > scripts/kconfig/conf  --syncconfig Kconfig
> > scripts/Kconfig.include:34: compiler 'foogcc' not found
> > make[2]: *** [scripts/kconfig/Makefile:69: syncconfig] Error 1
> > make[1]: *** [Makefile:557: syncconfig] Error 2
> > make: Failed to remake makefile 'include/config/auto.conf'.
> > You are building kernel with non-retpoline compiler.
> > Please update your compiler.
>
>
> I think you are seeing a different bug.
>
> Please test after applying this as well:
> https://patchwork.kernel.org/patch/10939845/

That did the trick. Thank you.

Cheers,

Joel
