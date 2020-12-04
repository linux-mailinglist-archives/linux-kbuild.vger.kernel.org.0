Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186092CE484
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 01:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgLDAhK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 19:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgLDAhK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 19:37:10 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602F6C061A51
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 16:36:24 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id e23so2442101pgk.12
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 16:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u42CbjiqH6yH/u4ofLvYgcwvhaYpZ3AArTDQstrAzmY=;
        b=wIaFO/wSzHzjZwn1K9BZkWRiMVTHUfLIky33xyclPtHbQNj4cUInEma62So9YDnJBD
         4Ygg+MvKHE8OeBie7rddhxhxkGcjq6ncB+tPP9WqwkIt6QOtt79nu3AuehcVCjq7nBvo
         aR7E1S9kdDStyl/fX+L1svgxyGuuZ3lbmvH2/TbBl8umw1ksQ0ZX1a/+Na9r8qDYQuNQ
         6UNUjq5pZTzQx9pWPGuISyHb1iygcO0qla7HqRD4obXPmzLf5V7Jl0pCBN6CaGoppFKj
         3mBaWXJ5/lQe7h54ABxPertLI88b1wq8hzkQfMWYIiDn7KDjztNkAFfK9F79EmT7Ed7H
         JsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u42CbjiqH6yH/u4ofLvYgcwvhaYpZ3AArTDQstrAzmY=;
        b=NF522SSmBCqgHQpKxWZM9uJvxFkuqIMSTFOLI22Jr9Zr/OPAupvrhwpQVKUvFLFlNL
         V14jZG+g/y81tqDDzr9Y3yn0dAwTVB1yey0BowMtFHJ4mJzY4u6yKi2JNcnNi70bmzZ/
         PnjxHCrUy+GFwT5jVx/tS14QOGpFpi4y72THvAI4aO3fDsNcCGXGCBtzWmE8ajj6oR1g
         OW+/q1qyr+MOGdWinvzW5nX37BDR0fRPG9bdavXVmy83ignY3vccDtcjLXXOLS9JWgF4
         2wUqjIMqrIuwKAQ242ZhsihxVxkGCq7qidx+Tn0W4PciLZVQHKlJ4o7xCII2vQDoMc+c
         6s8Q==
X-Gm-Message-State: AOAM530EREzMt/A8R6s3Z40vCwFhpMzPC6pWQX0hCsn6K9Qk7VJl+Fzk
        lvYkNZAcvOFZgZd/fOEMVBpg8g==
X-Google-Smtp-Source: ABdhPJxvoWOtHpgv1xEaceUoRj3awXWl1dkFM7Q9a7dGVnWw/wkMg5i5rqtQhMD8830KNmta/N5pDA==
X-Received: by 2002:a63:d312:: with SMTP id b18mr5267980pgg.233.1607042183627;
        Thu, 03 Dec 2020 16:36:23 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id k1sm2104233pgm.21.2020.12.03.16.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 16:36:22 -0800 (PST)
Date:   Thu, 3 Dec 2020 16:36:20 -0800
From:   William Mcvicker <willmcvicker@google.com>
To:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v2 0/2] Adds support to capture module's SCM version
Message-ID: <X8mEhIeYeMjZc/+7@google.com>
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125010541.309848-1-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 25, 2020 at 01:05:39AM +0000, Will McVicker wrote:
> Hi All,
> 
> I have updated the patchset to:
> 
>  *) Include Documentation.
>  *) Use a consistent output pattern for the SCM version.
> 
> In my debugging, I found that the vermagic reported by modinfo can actually
> vary based on how the module was loaded. For example, if you have a module in
> the initramfs that is newer than the module on disk, then the initramfs module
> will be loaded (not the one on disk) during boot. Then, when you run the
> command:
> 
>   $ modinfo MODULENAME
> 
> The vermagic returned will actually be the vermagic of the module on disk and
> not the one in the initramfs which was actually loaded. With that being said,
> adding this scmversion attribute ensures that you can *always* get the correct
> SCM version of the module that loaded.
> 
> Please take a look at the updated patch and provide any comments you find.
> 
> Thanks,
> Will
> 
> Will McVicker (2):
>   scripts/setlocalversion: allow running in a subdir
>   modules: add scmversion field
> 
>  Documentation/ABI/stable/sysfs-module | 17 +++++++++++++++++
>  include/linux/module.h                |  1 +
>  kernel/module.c                       |  2 ++
>  scripts/Makefile.modpost              | 20 ++++++++++++++++++++
>  scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
>  scripts/setlocalversion               |  5 ++---
>  6 files changed, 65 insertions(+), 4 deletions(-)
> 
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
Hi Jessica, Masahiro, and Michal,

Friendly reminder :)

Thanks,
Will
