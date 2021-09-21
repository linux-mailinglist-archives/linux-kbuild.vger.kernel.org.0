Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43838413E2E
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Sep 2021 01:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhIVAAN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Sep 2021 20:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhIVAAM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Sep 2021 20:00:12 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7537C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Sep 2021 16:58:43 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id l13so1068726qtv.3
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Sep 2021 16:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yU7CBNNgEweZ+nqz6U6hKBlswHgC/fIemANqvxqpZ2U=;
        b=R9LogSUZN76uI//toRZWTFC85KzcPTU8Pz8QQPdNwcu077IgU3iYhJLtcrQb/eMifK
         ZkB4D1Ha8Pfennb/BvR5VvGTXXSvkEzFyKoeyy2cU+/GiN2g/MCqBFJCkg++7tAVJtmg
         r0gqWDoHGoggpo4brjbvHapAKS4ORKTICuxrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yU7CBNNgEweZ+nqz6U6hKBlswHgC/fIemANqvxqpZ2U=;
        b=Y1OqMmhQH6YsR7yGhmTvqhsOECRZf3xU8/DpMJJuLfu90ylQGnjNlWie9QTTdFuyM/
         8ACkKWoFSVIU8mNEBA70uMYfZkAavJCos8yeZFhCTymsZeeQijD68ylmtvq0EkKH5Lga
         1K1UuESdQH7LifVniF+xS75y/R6/ibrQEktP6qipBKPaiu2iqStB929i7j0CwZPU65Gx
         j276h/kgL9d/e3/9ea16dpxui6RZX2xDPpWqhtCwmZkPwBjby0NXH4Z/4WpTfOEn8dja
         XT1CQNZTAnnXkPUwb1WNjln/DdPApF57RLRAIBjcuvPwbtvLjhJtnPDrkXXk/9sNFs5+
         THqg==
X-Gm-Message-State: AOAM5317E4uQUuQFbuGcMsmnneQdWjl6YOlqhynCYhWTFOfJQEKUZI/C
        jeKp6wlbpFIj1MblIpj4Qj8S8Xtr4cuDSTXXreqxoPs+caK8fA==
X-Google-Smtp-Source: ABdhPJzwQD2oEWBIAjmCoNsRdiWMAzZjMXTudmGS3Y7v1RrcmbPPAw+nXjsJ2XgkBjKDTrAjhi8AlxCGKi1yLg8GRp8=
X-Received: by 2002:ac8:534b:: with SMTP id d11mr352064qto.167.1632268722732;
 Tue, 21 Sep 2021 16:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5tzxtCLaasW_Es4oqx+H2iH=Qmid8YG-gtZrCcK7n_B2g@mail.gmail.com>
 <CAK7LNASbE5=rMGCf6=Jr597okmZChy4t5sNt0O8Z9PACb=DsKg@mail.gmail.com>
 <CAGt4E5u3YAM16HgoRAbW3Zs3LVJWKosCzp0rDqvQfmzZeXz2nA@mail.gmail.com> <CAK7LNATTwCuR=4a0MWzW4j1O1DMwayePKCL9KDe+UBUz1Aqmag@mail.gmail.com>
In-Reply-To: <CAK7LNATTwCuR=4a0MWzW4j1O1DMwayePKCL9KDe+UBUz1Aqmag@mail.gmail.com>
From:   Markus Mayer <mmayer@broadcom.com>
Date:   Tue, 21 Sep 2021 16:58:31 -0700
Message-ID: <CAGt4E5uknp3vZwk10S+BHHQ016FQFbL3z9rs-h6aM31sYrNXZQ@mail.gmail.com>
Subject: Re: Module build problems with gmake 3.x
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kbuild Mailing List <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 12 Sept 2021 at 09:04, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Sep 11, 2021 at 7:45 AM Markus Mayer <mmayer@broadcom.com> wrote:
> >
> > Here is what I have.
> >
> > $ cat Makefile
> >
> > export KERNEL_DIR = /local/users/mmayer/linux-5.4
>
>
> From this line, I understand how to reproduce the case.
>
> The key is 'linux-5.4'

Sorry about that. I am glad to not be dealing with 4.9 that much
anymore, so 5.4 is still "new-ish" to me. And 5.10 is the bleeding
edge in my world. Goes to show that everything is relative.

> In your initial email, you mentioned that this happened on
>
>   * newish kernel  (>=5.1)
>
> So, I used the latest kernel for testing,
> but this does not happen after
> bcf637f54f6d2515d4c9c81808faf01848916152
> because the M= parameter is parsed before the sub-make.
>
> By running your test code on linux 5.4, yes,
> I can observe the same symptom.

Thanks for trying out a 5.4 kernel.

> The root case seams, GNU Make changes
> the origin of variables to 'environment'.
> I do not know if it is an intended behavior.
> (maybe, better to ask the GNU Make maintainer)

[...]

> So, this is what your can tell:
>
> - The behavior of the -e option seems to have a weird
>     side-effect.
>     Later, I will ask this to the GNU Make maintainer
>     to see whether it is a bug or not.
>
> - I do not want to support the -e option.  I do not think
>   it is a commonly-used option because you are the
>   first person who asked this since Linux 5.4.
>   (notice Linux 5.4 is almost two years old)
>
>  - If you use the latest kernel
>     (after bcf637f54f6d251), you will be able to build
>     external modules with the -e option.
>     But, I recommend you to not use -e.
>
>  - If you still insist on the -e option on Linux 5.4,
>     you can cherry-pick bcf637f54f6d251
>     (but it is out of scope of the support of the community)
>
> Maybe, better to consider removing the -e option.

I will forward the recommendation to see what can be done. Cherry
picking the patch you are recommending should tide us over in the
meantime. I will give it a shot.

Thanks for your help.

Regards,
-Markus
