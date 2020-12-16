Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483632DC8C0
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 23:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbgLPWJP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 17:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730152AbgLPWJP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 17:09:15 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C410BC061794
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2020 14:08:34 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id x12so13271092plr.10
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2020 14:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=47njYOyHh/ol8S7fpZzgugsRzNMSSYjJhC34/rOiv4s=;
        b=S7FLajHI64C/buh7uqGUkibMmHsb3YVyukIOcPt7zJU4teERv8t2rZuO8oE52l0N/X
         HvkIcxjSbb22mzFdU0bBH+Z68871gF2/k0nPqtwqa7/izbxGQ+qbkz+x1AYm1trTrPqt
         38U1vvv+L6qSpLmC02Ym/AjhzOG3ONYtyWONiXJcBVV93RildaOwy88GFmTpJeIJielR
         GN3CV/EOmg0/Ak5y0HDGX8XlCtiSQR3kejsbSWD1DnyTBFDCUqiS7Mwpwuc6o3kPLoXl
         bglfmE2toH0Wy+Ni8VSl52ZWwDZH+A1qFMTNlpGwz0kFkd5UkHN1P9EZwq+Ix+GbMhti
         IRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=47njYOyHh/ol8S7fpZzgugsRzNMSSYjJhC34/rOiv4s=;
        b=sJqltSr5CbCxfmFlnCnkAbrVNY80oZ3Me4DfQmFdS22yF0lr0z6jEcJdew4yVs9pkB
         Smr96ZuYmnOUZDMIPUKxZydxGhjETv50FtH3CsoB3WcbfXL5GcZcNv2dR8+KmC9aGaB6
         c87W9mgi52+JiiridwQT3lROhi5nN0vsrunHEx8ZTfoXRDVhNrnTNX4cQungLQeiQ08Q
         8BrlhorXyHv3QxC9LdS7wG4ftqDQ26gU/uQEftUlVGgbji27q+ozqsc6F+CXUXF4hCIG
         T9DSoIjmy9/noAAxuPSoSzp3Hyed+a4UIA3USHxfTJKiowP1YAgju5KGOEOHIbGilZ0w
         mQWA==
X-Gm-Message-State: AOAM530rqVHHaMTgf/GV/qIfBenfKMvbDl6Oi6wZTfC56BbFKXEIdU/u
        tiMQMreJ14AEcgMQ0e570ywHIA==
X-Google-Smtp-Source: ABdhPJwbwgE28QVGilYHV9HkgCsvGyphgG8rAt/JKp64MdPSaaANDs9h3uG8K55TkGBX/WP0noolyQ==
X-Received: by 2002:a17:902:b58d:b029:db:f8de:551c with SMTP id a13-20020a170902b58db02900dbf8de551cmr4491100pls.24.1608156514071;
        Wed, 16 Dec 2020 14:08:34 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id g85sm3709366pfb.4.2020.12.16.14.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 14:08:33 -0800 (PST)
Date:   Wed, 16 Dec 2020 14:08:30 -0800
From:   Will McVicker <willmcvicker@google.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 1/2] scripts/setlocalversion: allow running in a subdir
Message-ID: <X9qFXuNR2B2fYVk3@google.com>
References: <20201207153116.GA15772@linux-8ccs>
 <20201208200508.4107399-1-willmcvicker@google.com>
 <20201208200508.4107399-2-willmcvicker@google.com>
 <20201211153359.GA19348@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211153359.GA19348@linux-8ccs>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 11, 2020 at 04:33:59PM +0100, Jessica Yu wrote:
> Hi Will,
> 
> +++ Will McVicker [08/12/20 20:05 +0000]:
> > Getting the scmversion using scripts/setlocalversion currently only
> > works when run at the root of a git or mecurial project. This was
> > introduced in commit 8558f59edf93 ("setlocalversion: Ignote SCMs above
> > the linux source tree") so that if one is building within a subdir of
> > a git tree that isn't the kernel git project, then the vermagic wouldn't
> > include that git sha1. However, the proper solution to that is to just
> > set this config in your defconfig:
> > 
> >  # CONFIG_LOCALVERSION_AUTO is not set
> > 
> > which is already the default in many defconfigs:
> > 
> >  $ grep -r "CONFIG_LOCALVERSION_AUTO is not set" arch/* | wc -l
> >  89
> > 
> > So let's bring back this functionality so that we can use
> > scripts/setlocalversion to capture the SCM version of external modules
> > that reside within subdirectories of an SCM project.
> 
> Hm, this seems to essentially be a revert of commit 8558f59edf93.
> AFAICT from light testing it also reintroduces the issue it was
> originally trying to fix, no?
> 
> From the reporter:
> 
>    Dan McGee <dpmcgee@gmail.com> writes:
>    > Note that when in git, you get the appended "+" sign. If
>    > LOCALVERSION_AUTO is set, you will get something like
>    > "eee-gb01b08c-dirty" (whereas the copy of the tree in /tmp still
>    > returns "eee"). It doesn't matter whether the working tree is dirty or
>    > clean.
>    >
>    > Is there a way to disable this? I'm building from a clean tarball that
>    > just happens to be unpacked inside a git repository. One would think
>    > setting LOCALVERSION_AUTO to false would do it, but no such luck...
> 
> Correct me if I'm wrong, but what I'm understanding is that the
> original reporter was having trouble with setlocalversion appending
> unwanted strings ("+" or "gXXXXXXX-dirty" etc) when building from a
> clean tarball that happens to live inside a git repo. Even if
> LOCALVERSION_AUTO is disabled it still appends the "+" string if the
> SCM above the linux source tree is not at an annotated tag. Since
> setlocalversion is getting confused by the presence of a different scm
> that commit fixed this by confining the checks to the root of the
> (possibly git managed) kernel source tree. Masahiro can probably
> better comment since he maintains scripts/*.
> 
> In any case, this patch isn't of interest to in-tree modules, since we
> can generate the scmversion perfectly fine without it, so I doubt it's
> going to get any support here. Would you be fine with dropping the
> first patch or would that pose issues?
> 
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> > scripts/setlocalversion | 5 ++---
> > 1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/scripts/setlocalversion b/scripts/setlocalversion
> > index bb709eda96cd..cd42009e675b 100755
> > --- a/scripts/setlocalversion
> > +++ b/scripts/setlocalversion
> > @@ -44,8 +44,7 @@ scm_version()
> > 	fi
> > 
> > 	# Check for git and a git repo.
> > -	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
> > -	   head=$(git rev-parse --verify HEAD 2>/dev/null); then
> > +	if head=$(git rev-parse --verify HEAD 2>/dev/null); then
> > 
> > 		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
> > 		# it, because this version is defined in the top level Makefile.
> > @@ -102,7 +101,7 @@ scm_version()
> > 	fi
> > 
> > 	# Check for mercurial and a mercurial repo.
> > -	if test -d .hg && hgid=$(hg id 2>/dev/null); then
> > +	if hgid=$(hg id 2>/dev/null); then
> > 		# Do we have an tagged version?  If so, latesttagdistance == 1
> > 		if [ "$(hg log -r . --template '{latesttagdistance}')" = "1" ]; then
> > 			id=$(hg log -r . --template '{latesttag}')
> > -- 
> > 2.29.2.576.ga3fc446d84-goog
> > 
> 
> -- 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

Hi Jessica,

I'm okay with dropped this first patch since it does only related to external
modules. I'll upload v4 now with just the bits that related to in-tree modules.

Thanks,
Will
