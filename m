Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B1E168784
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 20:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgBUTis (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 14:38:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:35392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgBUTis (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 14:38:48 -0500
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 10D46208C4;
        Fri, 21 Feb 2020 19:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582313927;
        bh=EEkZlC+I38fRKP6ziqRCvYvuuIeevZ+KKVHywn56mIo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lSKHq40hs1M19YD7sOxUNFDFS+a1h50X64VxCq+PakYXlJeADg7DcA3iat/R3ND5r
         NBztjxKxeObSrBRP4eJlhb0YrH7+D/OcTKGrGIy7dztPBMg6aZiG1IXmiSeXHFAeET
         5OkECh3IMxLo2OqHs0+kHkRN6c2239scLdmpYumc=
Received: by mail-qk1-f181.google.com with SMTP id t83so2939496qke.3;
        Fri, 21 Feb 2020 11:38:47 -0800 (PST)
X-Gm-Message-State: APjAAAUImARs3TZpXprIcHG9kaPw6o7AGPIUQAG1kg4y6YRLdBbw9jPK
        JBnJhdIZRQulqyK8g6CQi4A+NMBopdT9L3tXzA==
X-Google-Smtp-Source: APXvYqyxd8WdkXFWOCS8SNWYv4nZmrG8aLBX6mYw4szswF8/Esf6AsZA0GubHXwAODvuaiVsM3W6LKr6xJSmuO65sEY=
X-Received: by 2002:a37:6457:: with SMTP id y84mr36111932qkb.254.1582313926194;
 Fri, 21 Feb 2020 11:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-2-alexandre.torgue@st.com> <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
In-Reply-To: <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 21 Feb 2020 13:38:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJuj1=ae+_-L7_R6+ZfcbNW99BDUDSvuYSsN1=gRcvQqQ@mail.gmail.com>
Message-ID: <CAL_JsqJuj1=ae+_-L7_R6+ZfcbNW99BDUDSvuYSsN1=gRcvQqQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build information
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Gibson <david@gibson.dropbear.id.au>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Ian Lepore <ian@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 21, 2020 at 11:52 AM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 2/21/20 10:14 AM, Alexandre Torgue wrote:
> > This commit adds a new script to create a file (in dts file directory) with
> > some information (date, Linux version, user). This file could then be used
> > to populate "build-info" property in every dts file that would use this
> > build information:
> >
> > Example:
> >
> > / {
> >       ...
> >       build-info = /incbin/("dtb-build.txt");
>
> s/.txt/.dtsi/
>
> and same wherever the file name is used.
>
>
> >       ...
> > };
> >
> > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index bae62549e3d2..a5af84ef4ffc 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
> >  # DTC
> >  # ---------------------------------------------------------------------------
> >  DTC ?= $(objtree)/scripts/dtc/dtc
> > +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
> >
> >  # Disable noisy checks by default
> >  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> > @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
> >
> >  quiet_cmd_dtc = DTC     $@
> >  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
> > +     $(DTB_GEN_INFO) $(src) ; \
> >       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> >       $(DTC) -O $(2) -o $@ -b 0 \
> >               $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> > diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
> > new file mode 100755
> > index 000000000000..0cd8bd98e410
> > --- /dev/null
> > +++ b/scripts/gen_dtb_build_info.sh
> > @@ -0,0 +1,10 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +set -o nounset
> > +
> > +DTB_DIR=$1
> > +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
> > +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
>
> I would remove the filler words "From", "by", "the", and the trailing
> period ('.').
>
> <bikeshed>
> You might consider using a format more like the Linux
> kernel version line, which puts parenthesis around the
> compiled by info.

IMO, we should use exactly the Linux kernel version line. Or exactly
the u-boot version line when built in u-boot.

Rob
