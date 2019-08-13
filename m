Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF8C8C200
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 22:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfHMUQV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 16:16:21 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40463 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfHMUQV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 16:16:21 -0400
Received: by mail-ot1-f67.google.com with SMTP id c34so37045881otb.7
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 13:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UyUp+OqYNvHr6I8YI09IZ2rFvtcmnaGq+Mw13M6jPN8=;
        b=u5tsb3tTi1RR6zNjTfgZWL+OogXrZrPnWysy+aD045WOTKrJEAOdQ+FoeVDVShnWk8
         IUxR3CHP9QJCeKRIEu5zkDXbg533UBtKeFFvrT8aMs0H8udcayRxrdT1wNT0Q7DjM+sS
         mL7ptgRQR3Kx12kZaazSW3SAHUtuo7vVw4TkoT1AK64nHSlBLuaf+7EcyAJ5T6S5QZmR
         0bWGzUszfX/bI6keMRxfU+uUjHdXdUU/QzjKrIiA2xQ6qfej0kl/VN72xIxD8Mf/EjLz
         uehsPbPSUzPQEmNN3NMCxmwK4vIeJV4HWNcOe7l2n4qpKPfucbJ/Yfslg6NugGmdwR+m
         R1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UyUp+OqYNvHr6I8YI09IZ2rFvtcmnaGq+Mw13M6jPN8=;
        b=JmuFtsrDBUoL8vCLoF4VeJ1g0yKWau5WjVke0UDd8o9796W08ZxsMhEy04yo9kYrbo
         K7e3NoP749lwCrsQnCTmLbLqpcyeEXsjyoraaQmTXaGBPXtvlTRCOIyc09Z8fyiuqotR
         6twuCUU5T2rWdWPAWbtcz+Jl+KN3/FTI+OV8DWLgQ9icO3sD6G3biUrue1Gq7E2p2t78
         Bfxb55TnjhpGpxODG0KNSOWGonPRGwHz7c7lLM2KHz1KSQOru/IEc9+AKvkorox6mZ8T
         PiuQtZaWL4hMB7V8GGu34RVxS6n835aWPTeIBlk9FVemmxsI5joNsnTXSUjhZTbg6yRZ
         NDBw==
X-Gm-Message-State: APjAAAV9HuAGNVnYeQoJZRDXQXmPNen93iNo5eFZXyF1NnWxMNonJb7j
        kTF5lO0vcE6XLA9+gThWlBLvb2GYsZ7i1SZ6dug8zg==
X-Google-Smtp-Source: APXvYqxxUtipoa1TnsBRCdHhtVbEni2JlDRwTgOYshKzIg8CEAX1O3Wj3b+RVL1fyBLVuGOUQHsFmCMdCl21V4krJY8=
X-Received: by 2002:a9d:6d06:: with SMTP id o6mr33264410otp.225.1565727380422;
 Tue, 13 Aug 2019 13:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190813121733.52480-1-maennich@google.com>
 <20190813121733.52480-6-maennich@google.com>
In-Reply-To: <20190813121733.52480-6-maennich@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 13 Aug 2019 13:15:44 -0700
Message-ID: <CAGETcx_LQDdnaU+3JVGw+6=DJ8tRoQ00+3rD2gOiHHkWomt8jg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
To:     Matthias Maennich <maennich@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, maco@android.com,
        Android Kernel Team <kernel-team@android.com>, arnd@arndb.de,
        geert@linux-m68k.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hpa@zytor.com,
        jeyu@kernel.org,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
        maco@google.com, michal.lkml@markovi.net, mingo@redhat.com,
        oneukum@suse.com, pombredanne@nexb.com, sam@ravnborg.org,
        sboyd@codeaurora.org, Sandeep Patil <sspatil@google.com>,
        stern@rowland.harvard.edu, tglx@linutronix.de,
        usb-storage@lists.one-eyed-alien.net, x86@kernel.org,
        yamada.masahiro@socionext.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Adrian Reber <adrian@lisas.de>,
        Richard Guy Briggs <rgb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 5:19 AM 'Matthias Maennich' via kernel-team
<kernel-team@android.com> wrote:
>
> If MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is enabled (default=n), the
> requirement for modules to import all namespaces that are used by
> the module is relaxed.
>
> Enabling this option effectively allows (invalid) modules to be loaded
> while only a warning is emitted.
>
> Disabling this option keeps the enforcement at module loading time and
> loading is denied if the module's imports are not satisfactory.
>
> Reviewed-by: Martijn Coenen <maco@android.com>
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---
>  init/Kconfig    | 14 ++++++++++++++
>  kernel/module.c | 11 +++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index bd7d650d4a99..b3373334cdf1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2119,6 +2119,20 @@ config MODULE_COMPRESS_XZ
>
>  endchoice
>
> +config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
> +       bool "Allow loading of modules with missing namespace imports"
> +       default n
> +       help
> +         Symbols exported with EXPORT_SYMBOL_NS*() are considered exported in
> +         a namespace. A module that makes use of a symbol exported with such a
> +         namespace is required to import the namespace via MODULE_IMPORT_NS().
> +         This option relaxes this requirement when loading a module.

> While
> +         technically there is no reason to enforce correct namespace imports,
> +         it creates consistency between symbols defining namespaces and users
> +         importing namespaces they make use of.

I'm confused by this sentence. It sounds like it's the opposite of
what the config is doing? Can you please reword it for clarify?

-Saravana
