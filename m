Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF5C1B63FD
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 20:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgDWSrX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 14:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgDWSrX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 14:47:23 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C4DC09B042
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Apr 2020 11:47:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id 7so3906792pjo.0
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Apr 2020 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B+wAZ+L0hlrTQ6+bTifPXFWaL5DgCyVYBW9QyGb8kMY=;
        b=bR8hDR+mzaoHgNGpJnRn8ZAiHrQhaMuIfSSzHSRsOLKXDNe6eSKFZKgF/RExSQxrcJ
         ef5vSFdlC/FV9+MMy8uFld+YVf1Sg6Q7ZSZLiyq9DHUtyPChN7BtLaIJC1CAmfygQ3vd
         j8ubSnVyDQO5RohKa1DORoZltv0uzh9zK6B8PKdYLOJu0QaDaR82zQ2DIjkybEaKESWA
         FSljcBim1JbTXgPXTH2wNuXj1R78lrDDRc11FiS4GNCLzuNny7yZAq3SXYUQSHVtJ1IO
         zzkDVGBb5PeNel3SfOVpCZ29nKGXlcA4CWgmwX9awHlJYgCDB6JtUrvoAVX44/b2uW8W
         QA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B+wAZ+L0hlrTQ6+bTifPXFWaL5DgCyVYBW9QyGb8kMY=;
        b=DBv85fMx3N0QiqYnrkQxG6soB3+0zzlg0s1k6oxWeUnzJ0jwpcsxKjHskVW1p1HL4f
         s8WkamxwE5ufRi0Q3rm3BR5Rl7+C3LrUqZu7Yy+FVajocaKKPIW+cmShdz9EYoBXECS1
         HzqTyIeKgfQCTqM31c/6nGLPLH67vPH1EXAjHl47ZyIwPeC4+VSgTMh4DwDmp4shEcRh
         kMmkascQ+POTR2ykfvYt1KggGB4VyGsagpxXn2XYdeLUU54LMBNIsDdnvAHmiBJtL7kq
         fsjrjz1NO/5Ww05epH0Yl5vr8nFdcrDGXgYAIiLmbhtSpd6QmRpgW7z2bv7K5h3CoIyB
         +SuQ==
X-Gm-Message-State: AGi0Pua/zZkNwR1tTg1JtXEYuKZSkcxovjWlpYnJEpnAwQtWLmSybFqC
        4k27GT4OSJD0PHF+yfmaT588uQ==
X-Google-Smtp-Source: APiQypLGWwTV56tnjOkx9OOlWfrW0Dfh2W2HlNEVLY73VZd8xyW71IIxwv8uE0Bb69TXlpo7+zB7NQ==
X-Received: by 2002:a17:90a:bf8c:: with SMTP id d12mr2153843pjs.11.1587667642270;
        Thu, 23 Apr 2020 11:47:22 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
        by smtp.gmail.com with ESMTPSA id g25sm3209697pfh.55.2020.04.23.11.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 11:47:21 -0700 (PDT)
Date:   Thu, 23 Apr 2020 11:47:16 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Matt Helsley <mhelsley@vmware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] recordmcount: support >64k sections
Message-ID: <20200423184716.GA257363@google.com>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200422200532.480face2@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422200532.480face2@oasis.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 22, 2020 at 08:05:32PM -0400, Steven Rostedt wrote:
> On Wed, 22 Apr 2020 16:24:17 -0700
> Sami Tolvanen <samitolvanen@google.com> wrote:
> 
> > When compiling a kernel with Clang and LTO, we need to run
> > recordmcount on vmlinux.o with a large number of sections, which
> > currently fails as the program doesn't understand extended
> > section indexes. This change adds support for processing binaries
> > with >64k sections.
> 
> Thanks! As you have also Cc'd Matt Helsley, perhaps you have noticed we
> are trying to get this code merged with objtool.
> 
> How would that affect this?

Yes, I saw the patches. If you are copying over code, a similar fix
might be needed, but otherwise I don't see any issues. I also sent a
patch for objtool a couple of days ago to support >64k sections:

  https://lore.kernel.org/lkml/20200421220843.188260-2-samitolvanen@google.com/

Sami
