Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670AF2C5850
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Nov 2020 16:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391263AbgKZPdw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Nov 2020 10:33:52 -0500
Received: from mail-pg1-f178.google.com ([209.85.215.178]:40949 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730602AbgKZPdw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Nov 2020 10:33:52 -0500
Received: by mail-pg1-f178.google.com with SMTP id t37so1994802pga.7;
        Thu, 26 Nov 2020 07:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NGgXZQd1YCwmJ36vehPGn0W1kk8YP/wLoGFC1iNcNa8=;
        b=Hzcni2asR26KWhL7oCKNKQirLv8jv+mN4LtCbngzAnU2lw7eX4dAAVMoCnqMoG71Su
         cASikNGtJwuFMkj5gtHW82yl+WYnrNeFkJf1BrwjUC5uoMlxrD92iPEWe+hFZEAoz/QK
         J4I1zV+i39YA/3zci5RvzJQ6iP7oVBs13RV5z4RFiwS+24/5ruhdMnPeVy97XiZlJ4IT
         XAYLWRsG4baCzfDOiQBd+N5mRerbNcmoNROu/Z+RV6E5ppyBNfn8WYznKXlXpeXKO1C0
         CIk+kFLIIuCEN5mD+9h4fELLtPG3akYupMbXbg7Ep0nwlIV5Wd3OcCwRqlWWEaNBVo4R
         N5jw==
X-Gm-Message-State: AOAM533dizCVqQQCPFeK1Utjq+EyZj5kUtKcDMaJzvmYfAZaAcPZ5gxQ
        OV4/yEKJZz/+XyEjPt3wpc0=
X-Google-Smtp-Source: ABdhPJx2q2hND68yqHBQ7sQ/8QWdTwrm8rUztpc7aYQg0iXSiiqjOnsHyJaxFoEG2LEMp26Q8Hu1Og==
X-Received: by 2002:a17:90b:3753:: with SMTP id ne19mr4191915pjb.148.1606404831652;
        Thu, 26 Nov 2020 07:33:51 -0800 (PST)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id 184sm5147736pfc.28.2020.11.26.07.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 07:33:50 -0800 (PST)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 6E3AE40317; Thu, 26 Nov 2020 15:33:49 +0000 (UTC)
Date:   Thu, 26 Nov 2020 15:33:49 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Boris Kolpackov <boris@codesynthesis.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Felix Fietkau <nbd@openwrt.org>,
        Patrick Franz <patfra71@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Junio C Hamano <gitster@pobox.com>,
        linux-kernel@vger.kernel.org
Subject: Re: kconfig as a git subtree on Linux
Message-ID: <20201126153349.GK4332@42.do-not-panic.com>
References: <20201125172544.GJ4332@42.do-not-panic.com>
 <20201126091329.GA21541@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126091329.GA21541@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 26, 2020 at 09:13:29AM +0000, Christoph Hellwig wrote:
> On Wed, Nov 25, 2020 at 05:25:44PM +0000, Luis Chamberlain wrote:
> > I'd like to propose we discuss the possibility of taking kconfig and
> > making it a git subtree under the Linux kernel. This would allow
> > other projects outside of the Linux kernel to be able to update their
> > own copy / fork of kconfig in a jiffie *very* easily.
> 
> Hell no.  Not because I'm against sharing, but because git submodules
> are a complete fucking pain to deal with.  Adding submodules just fucks
> up being able to easily use a repository.  

I agree wholeheartedly! But I was not alking about git submodules. I
think git submodules should be taken to the back of an alley and shot.
But, git subtrees, however, now that is proving to me to be very sexy.

  Luis
