Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C754C7544B
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 18:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388276AbfGYQlc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 12:41:32 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44703 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388799AbfGYQlc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 12:41:32 -0400
Received: by mail-io1-f68.google.com with SMTP id s7so98493091iob.11
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2019 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0jYRQRolIOxef42RRXDE4CTbs3UanGuMByQk3s/piz4=;
        b=VDI0sPuHjqypYIl5HpM6h1kYUk4Y2RJh/dbG/X72EJCzxpHFYTRdSq2JDQ1ZmzMCES
         k0DR4YyzNuL0LyG6w4UoWJpwI0UF9J3JBXondYEONoQVCATpfrL3LE3/bjUApHFzN2aJ
         S8j+5OojYRrZvNr+sOQLnsh+rlj//v+jcRWNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0jYRQRolIOxef42RRXDE4CTbs3UanGuMByQk3s/piz4=;
        b=eY9VIOxeM9BDCwyFxQ2ZCScfRXWPb0xgQVnNVs4XilaVtfzKpEb1DrQWoJ4J0rBqn7
         1pJCdcaIbZ8X/Sv9MLkWYwLyiFdmjQIrCzauVfL6E0snEqqDD5ZPJBtqcRYca5TTR16a
         WCuxSid9xM6EDjE/ipKy3MHFe52bCpAMH55/VCyPcwWHn8hMKrao3q6x2mO+m90XbnF/
         e/Smo5t4R8Ycz75eetk3nQPaEHtwFV++S/CeWBHobMwybhQ0Tnc1o6kSRwf5M/nnJg+V
         e3EdZb0mj4GaFQ8d9QrFovzxXpahf1HYl7mZFSjUtmJZoeLG2R4pUp9G8k/iQ4qY9G6L
         5bog==
X-Gm-Message-State: APjAAAXvs26gnDPejApnfEmbiGIs13X5jIpC4wTfzZSxe4I0VCeMBtJs
        P/PuAPfEl1nqEGozt38LfJj6vCffjwo=
X-Google-Smtp-Source: APXvYqy7siDnuNcXdm5hFGBrVVG86ytp2p13IWS1luEPoSxGS4iXl7E73tWF9Uzg4smfGLz8HwS1fw==
X-Received: by 2002:a5d:9749:: with SMTP id c9mr17898839ioo.258.1564072891480;
        Thu, 25 Jul 2019 09:41:31 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id n22sm82734962iob.37.2019.07.25.09.41.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 09:41:30 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id q22so98580107iog.4
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2019 09:41:30 -0700 (PDT)
X-Received: by 2002:a5d:885a:: with SMTP id t26mr29560419ios.218.1564072889706;
 Thu, 25 Jul 2019 09:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190725154730.80169-1-swboyd@chromium.org>
In-Reply-To: <20190725154730.80169-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Jul 2019 09:41:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZQEqNyJ_3Corx0iro-OB5E==d8qZCxgrMvvKon4yAxw@mail.gmail.com>
Message-ID: <CAD=FV=UZQEqNyJ_3Corx0iro-OB5E==d8qZCxgrMvvKon4yAxw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Check for unknown options with cc-option usage
 in Kconfig and clang
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Peter Smith <peter.smith@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Thu, Jul 25, 2019 at 8:47 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> If the particular version of clang a user has doesn't enable
> -Werror=unknown-warning-option by default, even though it is the
> default[1], then make sure to pass the option to the Kconfig cc-option
> command so that testing options from Kconfig files works properly.
> Otherwise, depending on the default values setup in the clang toolchain
> we will silently assume options such as -Wmaybe-uninitialized are
> supported by clang, when they really aren't.
>
> A compilation issue only started happening for me once commit
> 589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
> CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
> compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
> leads kbuild to try and test for the existence of the
> -Wmaybe-uninitialized flag with the cc-option command in
> scripts/Kconfig.include, and it doesn't see an error returned from the
> option test so it sets the config value to Y. Then the Makefile tries to
> pass the unknown option on the command line and
> -Werror=unknown-warning-option catches the invalid option and breaks the
> build. Before commit 589834b3a009 ("kbuild: Add
> -Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
> but any cc-option test of a warning option in Kconfig files silently
> evaluates to true, even if the warning option flag isn't supported on
> clang.
>
> Note: This doesn't change cc-option usages in Makefiles because those
> use a different rule that includes KBUILD_CFLAGS by default (see the
> __cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
> variable already has the -Werror=unknown-warning-option flag set. Thanks
> to Doug for pointing out the different rule.
>
> [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> Cc: Peter Smith <peter.smith@linaro.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Fixes: 589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
CLANG_FLAGS")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
