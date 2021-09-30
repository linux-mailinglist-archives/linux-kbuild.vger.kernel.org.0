Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CB241D082
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Sep 2021 02:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347287AbhI3AO0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Sep 2021 20:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347294AbhI3AOZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Sep 2021 20:14:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DDBC061769
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 17:12:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id s21so6997813wra.7
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 17:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=so++ktLIXuia7S6U7BNUIBcKY9801GrgXLBNXOJCctA=;
        b=H10inSR11/VqU/haFPGpWYX4eIl9XnsEwCEZH+0AQ8FWEQkjTj0EN+Ya1EZTQu+shE
         kLIbu8rSIIg9sHC7IW3s76bjB/WmFjFJjdj0iG5s2SYq24KYemuCcgelDuoHT3GfKS5v
         GHSR1Dp2nFiYEjqUc142eJslL5BRz2qpBArRi0DXE+UlUPDs76Licbk4P74ic6KB3nuO
         nbcqF+xbsNBjS+T7iHicGmK/f3REcqIW+rmyhP9eOiM6KxgtdZWCtDzuFE1OlxUQLNxZ
         DffsQdUDTQvoP4PoIaIP9ZQclasRxjaTX+Ph27orlZrw9Of2+FqJkvWU93dImtsnJ5AL
         8P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=so++ktLIXuia7S6U7BNUIBcKY9801GrgXLBNXOJCctA=;
        b=LXV4AfByKiIxExQ4Xe3BXelPztrUD6GnfdWvJeUGRNZks+Q7AiatypBpo2nUGuOZLm
         K3KpzN4kl6jqGKtH/WQqDc1tmqHwz3TysDVXhDLiGdCKx4Ch5HsE8AZn6zKLXgVto4G4
         c7NgSWxZov40QNEm2mVm45ZMBpkii5g+FBylJ+xPCqvtcsZxCPUx4s3d+rml7BXD1xCS
         vXiqGyI/kQPTTVo+OGIWNqczF0+MqkajuuOYa1tStqn2BWKvi9nf6Guuf3l44Tc0ZJIF
         ewxw0Wde8FglNQ7EeMjs0/FPcLQjwNG4EmCQb4QqOyjZiR1yagQEVyEeAxoFo9/UUtgB
         W71A==
X-Gm-Message-State: AOAM532xw/Ggr7YPRiksvuZ90DEy3D+T6C7DuJscgzOL34p3sDdyFLqa
        xPeEdvzwxq9gHut5cPlubtAjLQs3FDpyvGghzKdhew==
X-Google-Smtp-Source: ABdhPJzLw+kdyCSCCFIkNR/DETrYiq3Usylp9hzBKF2UTTUKIJsZKQpT9jR+TAL9iB1u9TMtKwstF0pfX1MRpQGrFfM=
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr2980547wrl.200.1632960762539;
 Wed, 29 Sep 2021 17:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210929212713.1213476-1-brendanhiggins@google.com> <20210929212713.1213476-2-brendanhiggins@google.com>
In-Reply-To: <20210929212713.1213476-2-brendanhiggins@google.com>
From:   David Gow <davidgow@google.com>
Date:   Thu, 30 Sep 2021 08:12:31 +0800
Message-ID: <CABVgOSm-UO7dqgBQs81rof1H92Vcfs0j4XsWBa_Wt+LTiimWNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gcc-plugins/structleak: add makefile var for
 disabling structleak
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Shuah Khan <shuah@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>, rafael@kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Ulf Hansson <ulf.hansson@linaro.org>, andreas.noever@gmail.com,
        michael.jamet@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        YehezkelShB@gmail.com, Masahiro Yamada <masahiroy@kernel.org>,
        michal.lkml@markovi.net,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-iio@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 30, 2021 at 5:27 AM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> KUnit and structleak don't play nice, so add a makefile variable for
> enabling structleak when it complains.
>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes since last revision:
>  - None
> ---

This seems as sensible a way of working around this as we're going to
get in the short-term.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David
