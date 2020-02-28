Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 372CF1734DF
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 11:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgB1KDI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 05:03:08 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32779 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgB1KDI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 05:03:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id x7so2303878wrr.0
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2020 02:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pcGqnEttOAifT8C/i2foCNbskxyD0r8jBwXuL9tjrGg=;
        b=K92oLJK7SWQ7refLU8GU9V/QedS/E24rMjR95fVl5+Xm553FvOKpfZ99YkJsSoGWsC
         359ZJ+KlZjgeQ04O4f00voYoHJaIcVuxprwD5grNxkfUFvFmCT87X29/yzHIRmqMLqpT
         zMMVNnk91nezhZxc/jFLnHkLz/MDs+YJptcE5+FbXB9fmSCZ7Zf+vCWZxSDOzUIDdxey
         KzO9N0P15t2wVYytTHDmGMNu2XnV09AMbYv5wFRQcTXp9QWORLnWBgJs27k502VrCEcO
         NCR4d6Ep1z2yUa1y6NCjrLA2b4qKpd2ykBYJRbfTYDOA6q6g3T/2c8I1XYdrp8S80SeN
         qNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pcGqnEttOAifT8C/i2foCNbskxyD0r8jBwXuL9tjrGg=;
        b=btgUBtIEzgTxAOHMLZGj1ym1J2gHna1PRJotkYZEPG1O9q70YiaFAXT/g0MVkvY3+K
         hOYgMde09GonD5T1tCqxrXgkJKyR6Gp+umrMbLhLM3LHLXsKKZftnggcrMTfcgGj7Eux
         j5060HqgCdRc9XuH+FTU/NrDul4eg357M6+rygnWl/h0zEPiy3ssusCU7P3fNrofo4om
         8BVrdoq+MFsXTqCyEQXdE9XVFyNCX1uneFJUX4C7CwUoJgmyxEa/xqKNuXeZ7a4IKM+n
         /oO4PoCm77zARYpmFijT3YtjsGybCUaeqzOajYnYJPT1NSB8i5xbeQLHUC3kSBgR3uNR
         T6sg==
X-Gm-Message-State: APjAAAU6ntlSTKNQpK2jI2PhI0DhARJd2Or+DZvmvxUsUbKobTojMhRv
        s03vU5QIP14pIvQvPGeadokrNg==
X-Google-Smtp-Source: APXvYqxh/D2F4ik9ypryEpterz98zFGA6jKzokwqrOdYP81UNnAydt+tSSgwTEJ9SDUZs3dzNdUxzg==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr4256788wru.296.1582884186618;
        Fri, 28 Feb 2020 02:03:06 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id s8sm12196326wrt.57.2020.02.28.02.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 02:03:05 -0800 (PST)
Date:   Fri, 28 Feb 2020 10:03:02 +0000
From:   Quentin Perret <qperret@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 2/3] kbuild: split adjust_autoksyms.sh in two parts
Message-ID: <20200228100302.GA228304@google.com>
References: <20200218094139.78835-1-qperret@google.com>
 <20200218094139.78835-3-qperret@google.com>
 <CAK7LNAS0D_1k8FUJ+Bre1jrtGvHu28psU_xCa=K24iD7BkcJeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS0D_1k8FUJ+Bre1jrtGvHu28psU_xCa=K24iD7BkcJeA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Friday 28 Feb 2020 at 01:41:50 (+0900), Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Feb 18, 2020 at 6:41 PM Quentin Perret <qperret@google.com> wrote:
> >
> > In order to prepare the ground for a build-time optimization, split
> > adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
> > based on all currently available information (whitelist, and .mod
> > files), and the other to inspect the diff between two versions of
> > autoksyms.h and trigger appropriate rebuilds.
> >
> > Acked-by: Nicolas Pitre <nico@fluxnic.net>
> > Tested-by: Matthias Maennich <maennich@google.com>
> > Reviewed-by: Matthias Maennich <maennich@google.com>
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  scripts/adjust_autoksyms.sh | 36 +++-----------------------
> >  scripts/gen_autoksyms.sh    | 51 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 55 insertions(+), 32 deletions(-)
> >  create mode 100755 scripts/gen_autoksyms.sh
> >
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index ff46996525d3..2b366d945ccb 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -1,14 +1,13 @@
> >  #!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > -# Script to create/update include/generated/autoksyms.h and dependency files
> > +# Script to update include/generated/autoksyms.h and dependency files
> >  #
> >  # Copyright:   (C) 2016  Linaro Limited
> >  # Created by:  Nicolas Pitre, January 2016
> >  #
> >
> > -# Create/update the include/generated/autoksyms.h file from the list
> > -# of all module's needed symbols as recorded on the second line of *.mod files.
> > +# Update the include/generated/autoksyms.h file.
> >  #
> >  # For each symbol being added or removed, the corresponding dependency
> >  # file's timestamp is updated to force a rebuild of the affected source
> > @@ -38,35 +37,8 @@ esac
> >  # We need access to CONFIG_ symbols
> >  . include/config/auto.conf
> >
> > -ksym_wl=/dev/null
> > -if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
> > -       # Use 'eval' to expand the whitelist path and check if it is relative
> > -       eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
> > -       [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
> > -       if [ ! -f "$ksym_wl" ]; then
> 
> 
> Just a Nit.
> 
> Maybe, is testing  -r better ?
> 
> 'cat - "$ksym_wl"' is piped, so its error code is not checked.
> 
> So, checking the read permission here is robust, I think.

Right, that's a good point. And actually, I think we want both -f and
-r. -r alone would consider a path to a folder as correct.

This should do the trick:

diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index 679c9f05e4b4..16c0b2ddaa4c 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -24,7 +24,7 @@ if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
        # Use 'eval' to expand the whitelist path and check if it is relative
        eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
        [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
-       if [ ! -f "$ksym_wl" ]; then
+       if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
                echo "ERROR: '$ksym_wl' whitelist file not found" >&2
                exit 1
        fi

I'll send a v6 shortly.

Thanks!
Quentin
