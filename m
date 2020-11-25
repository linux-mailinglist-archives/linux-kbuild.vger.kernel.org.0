Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211752C360F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Nov 2020 02:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgKYBGf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 20:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgKYBGe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 20:06:34 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A35BC0613D4
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 17:06:33 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id c12so560614pll.12
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 17:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=TNX3l7PvITod9AihyAxf0YX+RSr83EEV++pnt+PpErM=;
        b=nzjTT24G0f/hxpgBMfsv9T8XaDYFLZiugGAx5rEkDm7BJVw1ZGsYNv1wOVJL5QHG88
         DpUXuQIKf2b6OVhHQeMiwubbTvnP8VRPGMH+36Fuulo1scq1B0kLy/t5v+b1JxACZeqe
         Jovd8CYMa6FOHCL1b2nmpWnmMee46k9bNCA9sboG7HVNzgxy8XiDMb9/ADfWmfxsTRf2
         Z7Glt086nlKJz8DgJlMhvW5dsqOLPIb+3uFc4860NVRg3971g/G2tlMp/m8PJu6YLPDQ
         7hCTgQoCz3qCiW69aG4xraTEQvqxUgS6bJ6Mk0FlAbb13MyuNivYlFtg+BEhz1nDnfRG
         HYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TNX3l7PvITod9AihyAxf0YX+RSr83EEV++pnt+PpErM=;
        b=MtWgE6dxlvADhYnXQcksQgkoXERA/Usz/R6QhR1T/lvHnM8cTbza+4b6yuAsYCwrPG
         baXBvLdN76mpG38lHkBRcyYagzh108ohuLXjl5BKobQMYOj9m5MPoC4dfFh/jkL5tQMj
         8Du5BJoRO1kAnEDnWH1JprK8PqvZbWo7CX56kIMj542AQfNH0Vr7rKZJ/tCqKEOvAii7
         7b2/ZVXvESceatGCXaMI+pwdYgii5n6HqEUygXGEGJLZ6E4i6/MfbKZftQVjmHJJl8Wo
         /xJi88B3EMidLEZSXEU28WrKap2WmAZbo4mLQK1PsvX03K3qL+yQgxVPECObyruBCkHZ
         vFWg==
X-Gm-Message-State: AOAM530sD8hKiRiOg/R+WDwRS5CBG0PdD6vMk5cZJwaXW+fduefs34Za
        f192sUYe96gwyqxagtnxr0XL9Gx3idsZz3CzE94=
X-Google-Smtp-Source: ABdhPJxjcqNHbhuxz6w3vh4MoC3VMte90YJVetVzqjW+kVOJAigsZxVH5b0CA+TyroxUnBdDRMtCbfZidgQeX/coeSc=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:8b8b:b029:d9:d098:c42 with
 SMTP id ay11-20020a1709028b8bb02900d9d0980c42mr978418plb.41.1606266392515;
 Tue, 24 Nov 2020 17:06:32 -0800 (PST)
Date:   Wed, 25 Nov 2020 01:05:40 +0000
In-Reply-To: <20201125010541.309848-1-willmcvicker@google.com>
Message-Id: <20201125010541.309848-2-willmcvicker@google.com>
Mime-Version: 1.0
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2 1/2] scripts/setlocalversion: allow running in a subdir
From:   Will McVicker <willmcvicker@google.com>
To:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Getting the scmversion using scripts/setlocalversion currently only
works when run at the root of a git or mecurial project. This was
introduced in commit 8558f59edf93 ("setlocalversion: Ignote SCMs above
the linux source tree") so that if one is building within a subdir of
a git tree that isn't the kernel git project, then the vermagic wouldn't
include that git sha1. However, the proper solution to that is to just
set this config in your defconfig:

  # CONFIG_LOCALVERSION_AUTO is not set

which is already the default in many defconfigs:

  $ grep -r "CONFIG_LOCALVERSION_AUTO is not set" arch/* | wc -l
  89

So let's bring back this functionality so that we can use
scripts/setlocalversion to capture the SCM version of external modules
that reside within subdirectories of an SCM project.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 scripts/setlocalversion | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index bb709eda96cd..cd42009e675b 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -44,8 +44,7 @@ scm_version()
 	fi
 
 	# Check for git and a git repo.
-	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
-	   head=$(git rev-parse --verify HEAD 2>/dev/null); then
+	if head=$(git rev-parse --verify HEAD 2>/dev/null); then
 
 		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
 		# it, because this version is defined in the top level Makefile.
@@ -102,7 +101,7 @@ scm_version()
 	fi
 
 	# Check for mercurial and a mercurial repo.
-	if test -d .hg && hgid=$(hg id 2>/dev/null); then
+	if hgid=$(hg id 2>/dev/null); then
 		# Do we have an tagged version?  If so, latesttagdistance == 1
 		if [ "$(hg log -r . --template '{latesttagdistance}')" = "1" ]; then
 			id=$(hg log -r . --template '{latesttag}')
-- 
2.29.2.454.gaff20da3a2-goog

