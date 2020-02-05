Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E128C153A52
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2020 22:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgBEVgK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Feb 2020 16:36:10 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:39381 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgBEVgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 16:36:10 -0500
Received: by mail-qv1-f65.google.com with SMTP id y8so1858757qvk.6
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2020 13:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P4SUvxXEKaxhwl4QO0wMSpVsP3xQz+B522JyEK1/MKI=;
        b=jTR2YIUMIeXEgWRJ4CRvkDflcfAWXOtxEamyatnZe8/yHFon5IWrud/GdlyeWSj7Uq
         s1CXVzLiDRbtPU/bDTt6cBK3nygDa1nRkCHCbey5tX2M9lnIAiA0MQI+iAF/QOaHzLWA
         Mx3GLVDVtANYuXWMca6rnh9034n8vvcm09z48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4SUvxXEKaxhwl4QO0wMSpVsP3xQz+B522JyEK1/MKI=;
        b=Msi1GvwVSn8yMssv7hyepQDx+ibUgLLZ+kW6wgxlBeM8P9K2Fc7//UYKf1vDa5O1sF
         pC4KmHjcQGFhj0hnEEXAqFUf41oRB+/d5sdP55erIdQ+i/o72RSgaIjdzfPLbsZYNiRR
         fNpnLFdnYrfH1LJPYyoWI0TgpFu4xeYMAjr063BXnfUvcsar9IwZTNROvggyM5z12aJg
         CKedJUHEo/SeG0hf0Icp222mNDU7sMu9kcwljgrb0nGOtR+YlCaVdwyVZ6eo8YCEb07Q
         WclL3Op2CjkKKPvFr/mLtq3bgic8G0/J/L62TuWrodM4yWIVmvVkqZLNuBVsjNtKEK9I
         q2jA==
X-Gm-Message-State: APjAAAUQJXjghQBRY9H+ZtAJ4YFDUa3o3D1r0Ft03dyBCyURNMC4QKM4
        FWnnaltBY0LA1WeIzUnFOEH0yQ/MfCt9O3lPScrNyA==
X-Google-Smtp-Source: APXvYqxY3ghyBPfrBLTi+UZPdOFUIUXeJu5yON0D2aeO6jFGT//bfAumbtjOm2sqTzV9oGgWyoE/4SSd1Kot5ciixEc=
X-Received: by 2002:a0c:f685:: with SMTP id p5mr34308684qvn.44.1580938568781;
 Wed, 05 Feb 2020 13:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
 <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
 <20200205171353.GI142103@google.com> <20200205213354.GB1465126@kroah.com>
In-Reply-To: <20200205213354.GB1465126@kroah.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Wed, 5 Feb 2020 13:35:56 -0800
Message-ID: <CAEXW_YSU_Zm24R2TYFQd42CfXyotowv42BbvbvKfSFbZGUqOHQ@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 5, 2020 at 1:33 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
[snip]
> > > like the BTF approach is significantly better and said users are
> > > hopefully moving forward to it quickly, and if they can't move
> > > forward, then they're likely also not going to move forward to newer
> > > kernels either?
> >
> > I think BCC runs on a lot of upstream machines. I think the migration
> > strategy is a matter of opinion, one way is to take it out and cause some
> > pain in the hope that users/tools will migrate soon (while probably carrying
> > the reverted patches out of tree). Another is to migrate the tools first and
> > then take it out (which has its own disadvantages such as introducing even
> > more users of it while it is still upstream).
>
> Do we "know" what tools today require this, and what needs to be done to
> "fix" them?  If we don't know that, then there's no way to drop this,
> pretty much ever :(

Is there a real reason to drop it or a problem dropping this solves though?

thanks,

  - Joel
