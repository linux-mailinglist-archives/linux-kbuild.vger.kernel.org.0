Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8131FA01
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 20:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfEOSbj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 14:31:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34667 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbfEOSbj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 14:31:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id w7so293713plz.1
        for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2019 11:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eWVCL7OypAquy1b5ylX9pvAMoDWzSqxqQFZHT0qTIdQ=;
        b=koypC5t4enO9uQ8XhLdUSK/1pgFdw6sXAVq8AUA9TdvrsCP25bSA4Xz2YrAdC5UAo3
         0xHiGs9gkC65I4B2wRbQSceLCeWly/DLMQ5tLxyS5nIdqFCwHbxeeTksVYzVJHkFBszD
         rnjPJK0qEZBgpMWbiCafDo1MzEvrbQUbg3NMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eWVCL7OypAquy1b5ylX9pvAMoDWzSqxqQFZHT0qTIdQ=;
        b=JvjovyBFUWksLSLv/FF0DpEXBIlLDcwkBjjvA1ICyxqnEbIpcA6bVbdkgl8/0keEiv
         oA0wmNihe3/1P0ZnV+5yCVAtTrrrh/pgfmh+SrmQOEIstkMWNRGkzibe7p97hylCMtyr
         m6MjLJxufoRWpUUhTDD1CxXeL4OllUVy2Vab1wQdDC8XKWg7x0mGRg8OVUq7n+xtZU1U
         7YI07W+MJrs/U3M6e9NFGq+6wC5pKZ8Zb4N7Meu6BRjLP965L1+hyTPJ2upHzC5WMOQ5
         XehAScz44TNCb3482Z5GjOf+QD+TFdeiy4TQ0n5nkxd6gE94ZwZyw5Wn5RLh5PqC4b4P
         VcFQ==
X-Gm-Message-State: APjAAAW3b775lBZM1BEG+6YdMe/VQZEnqPiFPh8iFSluowfz4F7Qt52O
        rYRNZZVZCNWkRhOw39MQ9CB+vw==
X-Google-Smtp-Source: APXvYqxyfYKFAM4hHNcGb800CnTIP2ssp1PDdIuNqT7dnA9HC4eklExLzdnU0ostMN4RnQp4HklHDw==
X-Received: by 2002:a17:902:2a:: with SMTP id 39mr45044493pla.64.1557945098375;
        Wed, 15 May 2019 11:31:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f36sm1875919pgb.76.2019.05.15.11.31.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 11:31:37 -0700 (PDT)
Date:   Wed, 15 May 2019 11:31:36 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Message-ID: <201905151130.87CDB73C0@keescook>
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNATUvPMqt93iwzNud0mxk99Si=CEBDyjA8BLEXM_tcTBfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATUvPMqt93iwzNud0mxk99Si=CEBDyjA8BLEXM_tcTBfQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 16, 2019 at 03:07:54AM +0900, Masahiro Yamada wrote:
> On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> 
> >         $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > new file mode 100755
> > index 000000000000..944e68bd22b0
> > --- /dev/null
> > +++ b/scripts/modules-check.sh
> > @@ -0,0 +1,18 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Warn if two or more modules have the same basename
> > +check_same_name_modules()
> > +{
> > +       same_name_modules=$(cat modules.order modules.builtin | \
> > +                               xargs basename -a | sort | uniq -d)
> 
> 
> I noticed a bug here.
> 
> 
> allnoconfig + CONFIG_MODULES=y
> will create empty modules.order and modules.builtin.
> 
> Then, 'basename -a' will emit the error messages
> since it receives zero arguments.

You can skip running it by adding "-r" to xargs:

       -r, --no-run-if-empty
              If the standard input does not contain any nonblanks, do not run
              the command.  Normally, the command is run once even if there is
              no input.  This option is a GNU extension.



-- 
Kees Cook
