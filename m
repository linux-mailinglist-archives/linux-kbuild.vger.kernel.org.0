Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B6A405BEF
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 19:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240530AbhIIRXt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 13:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240926AbhIIRXs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 13:23:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA53FC061575
        for <linux-kbuild@vger.kernel.org>; Thu,  9 Sep 2021 10:22:38 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k13so5157859lfv.2
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Sep 2021 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pf0sRl8GXCP8dz4WMUu5tGxz1KupPTUSRLTXOLgH9SU=;
        b=daKTLDBvTN5qMOW0vOaEkHQg4/ZsrtihPsz6YVNP0kYXHwUiYsbXYMn5llV712jFEs
         ZOfDTsSc3X+W8b0ARaG41CZ7yM1F4kQJvfjfPIynsgelm+Qi2jJbS+UKD93oh9dHk54v
         /Ce0lj2gwvzaRE2LZQM69aFFd/Y9x7Rfpgy5s3lL+R6HZ0LH71fmVYi7K5RNPEP1Cmgk
         Gb1avWRyW13ODPiwB4R586e12yqY1QSBx7BLX8EC03SQeKvOLtV4+yE3anQK+R5cVENa
         m0OxekpciEuc3h395jhA1GSXpVRhKd+XqjHVggplMObVpgKpn/cvVA45k81c9iHt62sr
         T+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pf0sRl8GXCP8dz4WMUu5tGxz1KupPTUSRLTXOLgH9SU=;
        b=s3vg7ZY0eWEmKsoQuDmQLxZUJh0gPojrJLKXvUF0DWcEgNycN1KJLbwfThR0f5u5of
         aKSO9PNFw9vkWPsvHHVGxKsupcPp4rPKvKbSYiZfu9vmDuUiU5yEh3jf0DBD3ViCvsVw
         PKzH8yyWay72+4wZgGZY/fs60YlpyqYXPU3hg04nD74B1cTtE5wnn455qAMa21EfmVvN
         OnRvcOZUrjJt6/Aog15DAVTJMR5VruDnVcGy6y5s9ARfJ52/O8n/XlcS9x9RE6FksxTQ
         9euoDEPApTPdP2Ja6gZ7QeZo4b+6PU0IpuC4nA7AA4tAxk1A3LHgvY+fpO4GOx3hHnD7
         0Yrw==
X-Gm-Message-State: AOAM532Vj+zv/1yo0ZffXcPVLDnt3r6fOUD4hFOZCz3lJXPwU5d+zpFV
        UZohquXrQrX1KtrrHM11fqNuIUVDMI6AZmVJjiwvzw==
X-Google-Smtp-Source: ABdhPJxPnUFGnHCFACHUOS5JkTg4Je24SkkSbC9505ix4KQDPJriLY181s+I1NSidhRL8eaex1JEKrBepc6IZqYy9P8=
X-Received: by 2002:a05:6512:139c:: with SMTP id p28mr649503lfa.523.1631208157162;
 Thu, 09 Sep 2021 10:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210908032847.18683-1-kortanzh@gmail.com>
In-Reply-To: <20210908032847.18683-1-kortanzh@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 9 Sep 2021 10:22:26 -0700
Message-ID: <CAKwvOdnReHxf7ysorwTZtN65Hbw4dTk-z8fAQUaKCvEQ_a97eg@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix missing 'sys' package
To:     Kortan <kortanzh@gmail.com>
Cc:     nathan@kernel.org, masahiroy@kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 7, 2021 at 8:30 PM Kortan <kortanzh@gmail.com> wrote:
>
> We need to import the 'sys' package since the script has called
> sys.exit() method.
>
> Signed-off-by: Kortan <kortanzh@gmail.com>

I'm quite sure I've run this script before; how have we not noticed
such an issue before?

> ---
> Changes v1 -> v2:
> * Fix commit title.
> * Improve commit message.
>
>  scripts/clang-tools/gen_compile_commands.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 0033eedce003..1d1bde1fd45e 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -13,6 +13,7 @@ import logging
>  import os
>  import re
>  import subprocess
> +import sys
>
>  _DEFAULT_OUTPUT = 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL = 'WARNING'
> --
> 2.33.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210908032847.18683-1-kortanzh%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
