Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE1811C57B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2019 06:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfLLFbQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Dec 2019 00:31:16 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:63787 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfLLFbQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Dec 2019 00:31:16 -0500
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xBC5UtvP010862;
        Thu, 12 Dec 2019 14:30:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xBC5UtvP010862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576128656;
        bh=yoxmpqDe2x6QTk+OCI2TnHYO1f9S6bQL94maOXXu9Cg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BFMJ0fqyvkgSQU6XTqtRTdjRVMGf2K4LKdULuCjmxrJWmEHbKkLTL08Jq3uyKFVWQ
         r4z0QcWjdD2c6KDnie9ikxQRa1XFzD6r+OKJRJi2GlzbLkLCA2OFTq483TGWTRxdev
         xYWai3NjWpSNEvWhjJjrKsz3PgzeKZ5V1fstOAV2RAjbvGY3qRGLQA3L+7GLUrCoO7
         oE6znrbosrNWUtV+Jt3KUpR0KxJe8isMHFxHkrF7i4Ozq9Y2dV5rOc1ZJTOxGPzWfg
         DHhHtSHkeZsCF1CNMGn79CYhEJ4hDt93Rwr+rBYcydoDo9cZ+0ReAF239Y55rpytp2
         8FAz7fY+UmymA==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id s62so55073vkb.10;
        Wed, 11 Dec 2019 21:30:55 -0800 (PST)
X-Gm-Message-State: APjAAAU4yAC9S9XsgqNCoyD1w/Dy1qZM/z4hhi6mh/CXHcSSsrCuFMqh
        Od1BN49kZ1ME+CzCdZsM6Lqbwnt5nG21/LirURU=
X-Google-Smtp-Source: APXvYqzyAz3nSzfmsWApFSr+H7lqWz4keVsUzY5ov/PBG2Gnw3VZND0u41kQMEzVp4JKD2lPAcUKpZx5ND+FxHbatqM=
X-Received: by 2002:a1f:2e4a:: with SMTP id u71mr3546169vku.96.1576128654360;
 Wed, 11 Dec 2019 21:30:54 -0800 (PST)
MIME-Version: 1.0
References: <87wob4tf9b.fsf@alyssa.is>
In-Reply-To: <87wob4tf9b.fsf@alyssa.is>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 12 Dec 2019 14:30:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2+=jCO5SUpB-C8NZHODLVXs3SJ2qyYR9J+OiU_+1iAg@mail.gmail.com>
Message-ID: <CAK7LNAQ2+=jCO5SUpB-C8NZHODLVXs3SJ2qyYR9J+OiU_+1iAg@mail.gmail.com>
Subject: Re: Bogus dependency for HW_RANDOM_VIRTIO with oldconfig
To:     Alyssa Ross <hi@alyssa.is>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-crypto@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 10, 2019 at 11:41 PM Alyssa Ross <hi@alyssa.is> wrote:
>
> I'm new here and not sure if I'm contacting the correct people/groups --
> please point me in the right direction if not.  I don't know if the
> culprit here is Kconfig, the virtio Kconfig file, the hw_random Kconfig
> file, or some combination of those.
>
> I believe I have discovered an issue with the order in which make
> oldconfig asks for virtio-related options, and would appreciate some
> advice on how to solve it:
>
> HW_RANDOM_VIRTIO=y depends on VIRTIO=y.  In my kernel, VIRTIO=y is
> selected by VIRITO_PCI=y, but when make oldconfig prompts for
> HW_RANDOM_VIRTIO, VIRTIO_PCI has not been prompted for yet, and so
> VIRTIO is still set to m.
>
> This means that it's not possible for me to set HW_RANDOM_VIRTIO=y using
> oldconfig without setting an VIRTIO-selecting option I don't need, but
> that is prompted for _before_ HW_RANDOM_VIRTIO.  One such option that I
> have identified so far is VOP.  It is prompted for before
> HW_RANDOM_VIRTIO, and so if I set VOP=y it is now possible to set
> HW_RANDOM_VIRTIO.
>
> When using menuconfig on a config file generated with oldconfig, that
> does not have HW_RANDOM_VIRTIO enabled, I am able to set HW_RANDOM=y and
> HW_RANDOM_VIRTIO=y, and after saving I can confirm that no other changes
> have been made to the configuration file.  This tells me that there's no
> need for a dependency on e.g. VOP, except when using oldconfig.

OK, you are right.

Actually, the oldconfig restarts when it finds a newly-visible option.
For example, when VIRTIO is changed from n to y,
oldconfig restarts the menu and shows a prompt for HW_RANDOM_VIRTIO.

But, this does not happen when VIRTIO is changed from m to y.

> So, I think there is an ordering issue here, and that oldconfig
> should not prompt for HW_RANDOM_VIRTIO until after any option that might
> select VIRTIO=y.
>
> I would be happy to try to submit or test a patch to fix this, but I
> don't know where to go from here.

Perhaps check_conf() could be fixed, though I have not looked into it yet.


-- 
Best Regards
Masahiro Yamada
