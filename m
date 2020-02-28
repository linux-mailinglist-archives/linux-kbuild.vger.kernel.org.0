Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98717358F
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 11:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgB1KqM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 05:46:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45930 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgB1KqM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 05:46:12 -0500
Received: by mail-wr1-f67.google.com with SMTP id v2so2342738wrp.12
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2020 02:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WroTn4ZOSoWOI3ov0YWSSJUWyAnuK2wVB2xk4MqHAcc=;
        b=LhmwIPdrdZKpLzy/06ivR114pWiTD8AkY4r+Z8gIpWanabMMYs66F+chnVJMHYAj2p
         EQdsRe7kxLBGiAG1Op/O0O/A1PcZoPdG4+Q/B4VPKPeZFD02wX1hp4csQC0coTSa8o2A
         D5zO5vvFeWHlvpJlsDQowCEuMhPx/T7pSSOFLH5goxsoFvm/DqN70t02JJ9FC+szfOjo
         oM1C9CC5bwOmmGwhyQUibA6FSh2SUK+QMCqmdGmFDcidAJMUZXXiHCwuJa8+qW0IwRDj
         HbBhVHc8HLNKucYRpT3uexbCfzvpBjxySZlVYqMS4+YxeBDKcSOaY0pAPM5FXzDfuhPg
         NyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WroTn4ZOSoWOI3ov0YWSSJUWyAnuK2wVB2xk4MqHAcc=;
        b=EmN6IOVWM7YyLrw2vjHrzgto1UbT27lA9d4xix65GwfQRcbxZjfPtLUFe9x7cmJA9w
         H+wHxvnG5vuiKetQWJ3hVyHItHl2UxmEGwb7R4xrKDuHHCahFiZ8WtOXHZliC5rQn8Up
         AENa+uFrA4B/VFZC5PZTSN2Zie/vnK4SmlkhDPhyKj0e7KSmxDRghfvAV+voTDVvPKsl
         2EeBcwLHiVYu8lvJ6i/v/W6EGtifdyLR/VFlYj9G0r6YNAwnv05pnPJ5pa/Ct+Ta47CX
         kswIS2LljIDgmOSu/5pSJ1HNfwtUmCWAPJFn8zZvlYZz9LJIla86OyFDYn8zBwbt2UC3
         G2hw==
X-Gm-Message-State: APjAAAVYaPkgqicrHqOq5BreZIflS6RKZA1oPnmnmRXf+Ytvxk3X8zv+
        se8MD4Sitq/Hw5ksi5X9dFrmgQ==
X-Google-Smtp-Source: APXvYqwJOE0fqXlVeja/r5Fj91sS1NrDnRD2e4QVZWt0hqhAnh6s1ILszXX+lUHYng+CHur/FGDR2A==
X-Received: by 2002:adf:fe83:: with SMTP id l3mr4471825wrr.41.1582886770366;
        Fri, 28 Feb 2020 02:46:10 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id i4sm1610787wmd.23.2020.02.28.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 02:46:09 -0800 (PST)
Date:   Fri, 28 Feb 2020 10:46:06 +0000
From:   Quentin Perret <qperret@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200228104606.GA139632@google.com>
References: <20200218094139.78835-1-qperret@google.com>
 <20200218094139.78835-4-qperret@google.com>
 <CAK7LNASCrTj4_RgtxvZm0ei_HExYaPPMJodngKXBOL+=GODv5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASCrTj4_RgtxvZm0ei_HExYaPPMJodngKXBOL+=GODv5w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Friday 28 Feb 2020 at 19:42:41 (+0900), Masahiro Yamada wrote:
> On Tue, Feb 18, 2020 at 6:41 PM Quentin Perret <qperret@google.com> wrote:
> >
> > When doing a cold build, autoksyms.h starts empty, and is updated late
> > in the build process to have visibility over the symbols used by in-tree
> > drivers. But since the symbol whitelist is known upfront, it can be used
> > to pre-populate autoksyms.h and maximize the amount of code that can be
> > compiled to its final state in a single pass, hence reducing build time.
> >
> > Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
> > creating an empty file.
> >
> > Acked-by: Nicolas Pitre <nico@fluxnic.net>
> > Tested-by: Matthias Maennich <maennich@google.com>
> > Reviewed-by: Matthias Maennich <maennich@google.com>
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  Makefile                 | 7 +++++--
> >  scripts/gen_autoksyms.sh | 3 ++-
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 84b71845c43f..17b7e7f441bd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1062,9 +1062,12 @@ endif
> >
> >  autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
> >
> > +quiet_cmd_autoksyms_h = GEN     $@
> > +      cmd_autoksyms_h = mkdir -p $(dir $@); $(CONFIG_SHELL) \
> > +                       $(srctree)/scripts/gen_autoksyms.sh $@
> 
> 
> When you send v6,
> could you wrap the line as follows (CONFIG_SHELL in the next line)  ?
> 
>          cmd_autoksyms_h = mkdir -p $(dir $@); \
>                           $(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
> 
> 
> This still fits in 80-cols.

Will do.

Thanks,
Quentin
