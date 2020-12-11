Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D942D7980
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 16:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgLKPfF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Dec 2020 10:35:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:49734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730079AbgLKPep (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 10:34:45 -0500
Date:   Fri, 11 Dec 2020 16:33:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607700844;
        bh=V6euIGjpFbG3ZT48QbLoiaF+ZrDMFbL3Wr7KCGHwzVI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=lVAO/leFuK8L41XdTiw9Cza07i5iu+XdTVRTMrFw1UT1EBM+C1o0AbAxSXoW3PDls
         6zFnmNaHeZbS22TeyetT0eRxHOIU2Gm8701Vg7WlqaVJVojxgruci9Hzr+0W9MdnXx
         JzCV/b4Ed7eNjeyWYPseDzL904/rs3WBD2n7FyE7ELLsq5nFYRLrXb8CCLLXNdFgJr
         nv9NRZmNBtK1ETsNmZMzUAVx8ykfcoRVcT3230TS+lXPA6/bpH2eXs+OUWyGmwLts8
         02GMfXnZsL/2S//GcSXJ7N5RMP2X8KzWM9q5+fhm4G1lIftYVCL8dVD4Gd4mMBMJ9d
         LFp6NGRttGgNA==
From:   Jessica Yu <jeyu@kernel.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 1/2] scripts/setlocalversion: allow running in a subdir
Message-ID: <20201211153359.GA19348@linux-8ccs>
References: <20201207153116.GA15772@linux-8ccs>
 <20201208200508.4107399-1-willmcvicker@google.com>
 <20201208200508.4107399-2-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201208200508.4107399-2-willmcvicker@google.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Will,

+++ Will McVicker [08/12/20 20:05 +0000]:
>Getting the scmversion using scripts/setlocalversion currently only
>works when run at the root of a git or mecurial project. This was
>introduced in commit 8558f59edf93 ("setlocalversion: Ignote SCMs above
>the linux source tree") so that if one is building within a subdir of
>a git tree that isn't the kernel git project, then the vermagic wouldn't
>include that git sha1. However, the proper solution to that is to just
>set this config in your defconfig:
>
>  # CONFIG_LOCALVERSION_AUTO is not set
>
>which is already the default in many defconfigs:
>
>  $ grep -r "CONFIG_LOCALVERSION_AUTO is not set" arch/* | wc -l
>  89
>
>So let's bring back this functionality so that we can use
>scripts/setlocalversion to capture the SCM version of external modules
>that reside within subdirectories of an SCM project.

Hm, this seems to essentially be a revert of commit 8558f59edf93.
AFAICT from light testing it also reintroduces the issue it was
originally trying to fix, no?

From the reporter:

    Dan McGee <dpmcgee@gmail.com> writes:
    > Note that when in git, you get the appended "+" sign. If
    > LOCALVERSION_AUTO is set, you will get something like
    > "eee-gb01b08c-dirty" (whereas the copy of the tree in /tmp still
    > returns "eee"). It doesn't matter whether the working tree is dirty or
    > clean.
    >
    > Is there a way to disable this? I'm building from a clean tarball that
    > just happens to be unpacked inside a git repository. One would think
    > setting LOCALVERSION_AUTO to false would do it, but no such luck...

Correct me if I'm wrong, but what I'm understanding is that the
original reporter was having trouble with setlocalversion appending
unwanted strings ("+" or "gXXXXXXX-dirty" etc) when building from a
clean tarball that happens to live inside a git repo. Even if
LOCALVERSION_AUTO is disabled it still appends the "+" string if the
SCM above the linux source tree is not at an annotated tag. Since
setlocalversion is getting confused by the presence of a different scm
that commit fixed this by confining the checks to the root of the
(possibly git managed) kernel source tree. Masahiro can probably
better comment since he maintains scripts/*.

In any case, this patch isn't of interest to in-tree modules, since we
can generate the scmversion perfectly fine without it, so I doubt it's
going to get any support here. Would you be fine with dropping the
first patch or would that pose issues?

>Signed-off-by: Will McVicker <willmcvicker@google.com>
>---
> scripts/setlocalversion | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/scripts/setlocalversion b/scripts/setlocalversion
>index bb709eda96cd..cd42009e675b 100755
>--- a/scripts/setlocalversion
>+++ b/scripts/setlocalversion
>@@ -44,8 +44,7 @@ scm_version()
> 	fi
>
> 	# Check for git and a git repo.
>-	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
>-	   head=$(git rev-parse --verify HEAD 2>/dev/null); then
>+	if head=$(git rev-parse --verify HEAD 2>/dev/null); then
>
> 		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
> 		# it, because this version is defined in the top level Makefile.
>@@ -102,7 +101,7 @@ scm_version()
> 	fi
>
> 	# Check for mercurial and a mercurial repo.
>-	if test -d .hg && hgid=$(hg id 2>/dev/null); then
>+	if hgid=$(hg id 2>/dev/null); then
> 		# Do we have an tagged version?  If so, latesttagdistance == 1
> 		if [ "$(hg log -r . --template '{latesttagdistance}')" = "1" ]; then
> 			id=$(hg log -r . --template '{latesttag}')
>-- 
>2.29.2.576.ga3fc446d84-goog
>
