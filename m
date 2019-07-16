Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C91756AF07
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 20:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388321AbfGPSqw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 14:46:52 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:39219 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfGPSqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 14:46:52 -0400
Received: by mail-lj1-f182.google.com with SMTP id v18so20983951ljh.6
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 11:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kTeeu+hLZEXpN0rThQFCD/UlvDUpZb8x8Ce3yWy8rA4=;
        b=GpFstsa7GDVMT7gyYKGgVCrWu9c5T0HDYr3BEdPSAugTtGNGH2YJjd1T79QBTinR5R
         2Z1jGz+ok9EirB48ppGzGSR0QsLYpM3t4ldEtSu0bDBNnGnRdktkY4Mkeug6i5ktf/EZ
         fMwrd/iOg3IWRY+g0+vzD5O+rbWrfuFmIA0l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kTeeu+hLZEXpN0rThQFCD/UlvDUpZb8x8Ce3yWy8rA4=;
        b=rYvD+Kft/pZv2Po84yvX/dmWpYf9iruwSwjUocrSWZgw7nGTW9sU1fx4wke5ZPSrOs
         KuoF5GXSIT7vNNRVKQ+Hcusgk2ptye2vzgwUI8yHvewCqEdQWirlCWTVgkuCU87rAIzq
         jRInFAoc3tzmS3qp/HTbAAHe4lQfMGw1t1gxMzfj1TvEoxX5ez3DNyP0qi5iOGZ9C8Fl
         b3UrXS6Tw0OLoDxldGOel8BaHz68Ln5xZw5CCTMIt8ZA20LXNYoWtRulwEuICx/Lfy10
         uS1OK9ot4ux399bJnKvoh2YDZG+MdcUT7AOh6DwtVQsfvnS41w6cbM7j6ZebtXvoysfa
         eS4g==
X-Gm-Message-State: APjAAAU0zcGAlju3QuoRgU+lyoSN+fEhMjKk9LQNF72KPBKFz0QOk/ON
        zgqrI1RK9jOg7ZjHelxoYLizYr2KAqw=
X-Google-Smtp-Source: APXvYqxxHY82gHANPrf3vPx8LsMIm+cwaP1ZRJSAN6B8e3jTsOr6iMs+uRiP+U0lKVx/fSnORuk/eg==
X-Received: by 2002:a2e:7c15:: with SMTP id x21mr18594654ljc.55.1563302809976;
        Tue, 16 Jul 2019 11:46:49 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id t137sm2953653lff.78.2019.07.16.11.46.48
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 11:46:49 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id d24so21002445ljg.8
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 11:46:48 -0700 (PDT)
X-Received: by 2002:a2e:9192:: with SMTP id f18mr18206103ljg.52.1563302808576;
 Tue, 16 Jul 2019 11:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716144034.GA36330@gmail.com> <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
 <20190716181324.GA41555@gmail.com>
In-Reply-To: <20190716181324.GA41555@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 16 Jul 2019 11:46:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw5JGdP=1ezB4ZCQV1kCMR4K=NhSoA6AAOD1wuV=sH=A@mail.gmail.com>
Message-ID: <CAHk-=wjw5JGdP=1ezB4ZCQV1kCMR4K=NhSoA6AAOD1wuV=sH=A@mail.gmail.com>
Subject: Re: kbuild: Fail if gold linker is detected
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 11:13 AM Ingo Molnar <mingo@kernel.org> wrote:
>
> Then please make this a bit more apparent, such as:
>
>  "The gold linker has known issues of failing the build in random
>   but also in more predictible ways."

Maybe even mention a couple of particular known failure cases.

Just in case somebody decides to start up active gold development
again, and actually look at cases it fails at...

               Linus
