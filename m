Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE991B2E68
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 19:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDURhy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 13:37:54 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49485 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgDURhy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 13:37:54 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 03LHbD8u012335;
        Wed, 22 Apr 2020 02:37:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 03LHbD8u012335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587490634;
        bh=onymGhbUck19AZVdqs2MMUXq8sVb6RSuA8p4Ua6walc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=miZbySjAoZGsWn6F6etUcfv/Ib8DJrQCkBcrx4vDs/A6q9tm9SmR7wAqCo8Ea26Nu
         RdFiwVYL6OwNVSEP0DOcq1ruM7rqyp+oH9RhoqmKWfq7Uh+9bgAwkPuUqsOQbnxjoX
         O+Ac8cIDJjvPKkuGZbYSXYV/SdYPjF6pr1cPgoPGqcoYk5oOYRtkqtxOcH3xzZhShK
         d2YUPJLyc8dGY8baaN5DclAi2aIqbrSE75MIzcqSC08ZC1B7MnE+W0GLpLAQJoz+Gs
         y8KCC7F4VcMabHtzhT75V1s6rVdd2B8A69QeXO3RxCUC08AxzBXW0+T7yhTHh2mqpF
         SZ00t3BFi/gHg==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id 1so8941407vsl.9;
        Tue, 21 Apr 2020 10:37:13 -0700 (PDT)
X-Gm-Message-State: AGi0PubMadMVI2Tii8Ru0TMH38Vqp1iu4nkTitWPvWamBcapfegTebwC
        PhPTSGfQvQwiP3IA3GO4k3/4Ii29dhn1D8/thk0=
X-Google-Smtp-Source: APiQypKVTO7WNsW+ml/GS/8vAZR7f48di3kb94bDCzOQtw069Fm/nYwoVlcsTcMljs4Fs7q86fNhJZH6heQm60CJ8sg=
X-Received: by 2002:a67:6e07:: with SMTP id j7mr10430712vsc.181.1587490632767;
 Tue, 21 Apr 2020 10:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com>
In-Reply-To: <20200421134654.GD5983@pendragon.ideasonboard.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Apr 2020 02:36:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARcL5tfwFWE=EbW6pnpJKwfQY5n93WmFD0Ggw+EkSJ8mg@mail.gmail.com>
Message-ID: <CAK7LNARcL5tfwFWE=EbW6pnpJKwfQY5n93WmFD0Ggw+EkSJ8mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Laurent,

On Tue, Apr 21, 2020 at 10:47 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

>   HOSTLD  scripts/dtc/dtc
>   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
> make[2]: execvp: /bin/sh: Argument list too long
> make[2]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Documentation/devicetree/bindings/Makefile:38: Documentation/devicetree/bindings/processed-schema-examples.yaml] Error 127
> make[1]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Makefile:1300: dt_binding_check] Error 2
> make[1]: Leaving directory '/home/laurent/src/kernel/this_is_a_long_directory_name/linux/output/x86'
> make: *** [Makefile:180: sub-make] Error 2
>
> It seems to only fail with out of tree builds (O=...). I expect that
> failures will become more common the more YAML bindings we have, even
> without long directory names.

Indeed. This will be a common problem sooner or later.

Rob already suggested a solution.


Another way is to use a pipe.

See the following code in scripts/Makefile.modpost


# Read out modules.order instead of expanding $(modules) to pass in modpost.
# Otherwise, allmodconfig would fail with "Argument list too long".
quiet_cmd_modpost = MODPOST $(words $(modules)) modules
      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)


The same issue happens for modpost
because allmodconfig floods the command line.


-- 
Best Regards
Masahiro Yamada
