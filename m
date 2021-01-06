Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC5E2EC35A
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Jan 2021 19:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbhAFSpB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Jan 2021 13:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbhAFSpB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jan 2021 13:45:01 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FC5C06134D
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jan 2021 10:44:21 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 23so8767061lfg.10
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jan 2021 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B3o1kNyxEv4i+lDJkh/+xYzW3JvlkqElwj1t9uUUP2E=;
        b=hhjCHZjLEXie72KKMUYCum6xgiUwm8nDjmI4mbMihbvVAetHfkKnNiU+qDFdIp6lUm
         RuF/Jahx9XgsyU0KhZQvXbMNAIn1A0hox4jor50RRpuDpmoKK9myfaZb5FG30DuyVkHr
         tNemfxqeu6fKKofETWxImnhtoX0sk3CgoXNywfmxBGZMpBdT6Nc7GpdlbPrcPmbJAEl5
         gm7DqeRqicQbOVvZibsOo7KsKCyQcKf4OjO822Pqhr3LpKUarEr2K8XoxKhPjzZ4uIyb
         XOW3GreMXR23itlBg8QXMR4fyHUYNDF/P4tHlB6Y3Qz3s/aBn7EfVQKEF2jQQffCxCWV
         WM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3o1kNyxEv4i+lDJkh/+xYzW3JvlkqElwj1t9uUUP2E=;
        b=Be7jnFCfWg4zeW2URN/tq/shm2DtwHKbs8l/1tbmcpVS+S4mLVXdJfHGj/MZLYsOMQ
         roJnVOoXUn3t9SmFwQWJXSswdvAcXgdC05f2aovqwWZMaRjmk2gcVzrSdxvlXIbHcz4R
         lZ8sBqzHgBWKODaAqPzQoOtmewa7ZJUULbe4MkN7/t4HIyEhkpLsVmHaPgpQkMfkR5T3
         29/p6HrrBaj1T8lLksOBB/H9wsImclQEZ4mIhvokL6kZmbxsjEtTaqfXlv65kP5jUrR+
         amO/FyftwkvDLIJ+//1MTKdtldkMddJuS0ufen5VB4HOpBAyCp1lVXhfNeOQ3YTUW/Q4
         34uA==
X-Gm-Message-State: AOAM532wSKIeA61XhZr2vMT3pay6nZiOe7dPs+czKcDTc98ccYD1W5VZ
        x/rWHZE3GUgucD1uW38eDWpVLbqUV76QJUsvapUi7g==
X-Google-Smtp-Source: ABdhPJy2R7mxtoZE2UVib7UPCexFN5VblNmPNqy3EmcAXyjmH5/GGbx0j031iXDgAltBtB8H0moJfj6+gHTH5Fzo5IQ=
X-Received: by 2002:a05:651c:316:: with SMTP id a22mr2390349ljp.473.1609958659406;
 Wed, 06 Jan 2021 10:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20201216220850.659584-1-willmcvicker@google.com> <20201218120138.GA5265@linux-8ccs>
In-Reply-To: <20201218120138.GA5265@linux-8ccs>
From:   Will McVicker <willmcvicker@google.com>
Date:   Wed, 6 Jan 2021 10:44:03 -0800
Message-ID: <CABYd82bf+RACxboKCxoV=N63ynKwPspGhb6G5yYPiCFKnOk9Hw@mail.gmail.com>
Subject: Re: [PATCH v4] modules: introduce the MODULE_SCMVERSION config
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks for the vacation notice Jessica! I'm just letting you know I'm
back as well and am happy to respond to any concerns regarding v4 when
you get all caught up.

I hope you had a relaxing holiday :)

Thanks,
Will

On Fri, Dec 18, 2020 at 4:01 AM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Will McVicker [16/12/20 22:08 +0000]:
> >Config MODULE_SCMVERSION introduces a new module attribute --
> >`scmversion` -- which can be used to identify a given module's SCM
> >version.  This is very useful for developers that update their kernel
> >independently from their kernel modules or vice-versa since the SCM
> >version provided by UTS_RELEASE (`uname -r`) will now differ from the
> >module's vermagic attribute.
> >
> >For example, we have a CI setup that tests new kernel changes on the
> >hikey960 and db845c devices without updating their kernel modules. When
> >these tests fail, we need to be able to identify the exact device
> >configuration the test was using. By including MODULE_SCMVERSION, we can
> >identify the exact kernel and modules' SCM versions for debugging the
> >failures.
> >
> >Additionally, by exposing the SCM version via the sysfs node
> >/sys/module/MODULENAME/scmversion, one can also verify the SCM versions
> >of the modules loaded from the initramfs. Currently, modinfo can only
> >retrieve module attributes from the module's ko on disk and not from the
> >actual module that is loaded in RAM.
> >
> >You can retrieve the SCM version in two ways,
> >
> >1) By using modinfo:
> >    > modinfo -F scmversion MODULENAME
> >2) By module sysfs node:
> >    > cat /sys/module/MODULENAME/scmversion
> >
> >Signed-off-by: Will McVicker <willmcvicker@google.com>
>
> Hi Will, thanks for v4. I'm on vacation for the next two weeks and
> with the current merge window almost over, I hope it'd be OK with you
> if we revisit this early January. Just wanted to give you a heads up.
>
> Thanks and happy holidays!
>
> Jessica
>
