Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A712FD474
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 16:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732288AbhATPqp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 10:46:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:58396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732352AbhATPoQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 10:44:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69E5723340;
        Wed, 20 Jan 2021 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611157415;
        bh=kd/paozK38VJWW0FXnITt47RxhG+gJMdUP82dsvezso=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ltuxau2hzQIpfg7IADTCE3SyKcIqxDXb5BG2xo4NwkfX7H6a8x8Nk2Ba5vZ7t5MBO
         Ss031tqAxAg7aX0eYHnsPWprMIiuTlqIDoR2NzeFd4ndd6XkNfMRgiF/X1tyx5vXMV
         GjXoZISzYgQiMxJRLO79H7jHbDiDLk1DINHxKfTqiS8LI1nbxejJvgawf75idh7xH8
         VWbS79T4m+KxBs9AAJDm/a9JIUWoJ0oQ5xv46gLQVgTeG206pfNyLnKfdM3lbhDn33
         wQAGkIbYqUlY2FS/x2rB822Bi0/HXCSH4mw3nElGeNvz3UzHiCE4pTYwi3tisJlcvc
         83yG6rc4c+jzA==
Received: by mail-ej1-f46.google.com with SMTP id l9so28454490ejx.3;
        Wed, 20 Jan 2021 07:43:35 -0800 (PST)
X-Gm-Message-State: AOAM530ZPEqUlGAUc//k9q4s/J/cjGquns/URpPhOuHc98WFE6GtWU6E
        ecRbnLcc9PZRX4QKdQwo9dqBMU/F38G36oPS7g==
X-Google-Smtp-Source: ABdhPJzmOkLbtAe8nvDkJov21h52898/evdmJ2U4bx2dw7Fbe+76/XnQco8dKKmAAxAtUy0DOx8UmxeSR/8oW2L6r1A=
X-Received: by 2002:a17:906:958f:: with SMTP id r15mr6314359ejx.360.1611157413992;
 Wed, 20 Jan 2021 07:43:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611124778.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1611124778.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 20 Jan 2021 09:43:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLoxHGphf4TbQtGPggq=kEUnpoR2QqCQD77ttjnVNt0wg@mail.gmail.com>
Message-ID: <CAL_JsqLoxHGphf4TbQtGPggq=kEUnpoR2QqCQD77ttjnVNt0wg@mail.gmail.com>
Subject: Re: [PATCH V5 0/5] dt: build overlays
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 1:07 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi Frank/Rob,
>
> I have picked all the related patches together into a single patchset,
> so they can be properly reviewed/tested.
>
> This patchset makes necessary changes to the kernel to add support for
> building overlays (%.dtbo) and the required fdtoverlay tool. This also
> builds static_test.dtb using some of the existing overlay tests present
> in drivers/of/unittest-data/ for better test coverage.
>
> Note that in order for anyone to test this stuff, you need to manually
> run the ./update-dtc-source.sh script once to fetch the necessary
> changes from the external DTC project (i.e. fdtoverlay.c and this[1]
> patch).

Do we need a fdtoverlay fix for applying root node changes?

Rob
