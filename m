Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5963DC679
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jul 2021 17:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbhGaPCI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 31 Jul 2021 11:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233227AbhGaPCH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Jul 2021 11:02:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BB5C0613D5
        for <linux-kbuild@vger.kernel.org>; Sat, 31 Jul 2021 08:01:59 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id nh14so7643199pjb.2
        for <linux-kbuild@vger.kernel.org>; Sat, 31 Jul 2021 08:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6NzNWl7LhGEt5gulXFub5aIXRWGd7b+RfXfHU7IL/eI=;
        b=Jx/NovSJ2alFyoaVfse4LYGuhNMlBcAWv6JTiM3YSwvodvaXCAulhewOn2HF0FC+nz
         N7t2fd02SxFeFS/jAywZfBDu3dF82py23YxGadXmxU6FsZZNwFLKknaPYZ73JtAAQWAr
         FgjDEpjlNdXTBhWlUNhxTGhy3p9i8wqoga8qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6NzNWl7LhGEt5gulXFub5aIXRWGd7b+RfXfHU7IL/eI=;
        b=ItxmGuEfFnCbc8/4pd8hs9EkW2GxBZulnuAq5Xgwn1ouLPajvn/j0+ajD6Iy7SNpzq
         w2H7ca/7JgOWBhLo6bxlSzphQtjfO5Y4Hmke5OwNZZBZeNanbTQswSp3JGMXw5rTIpLK
         tm+VQg4v2iD0hg4bMj9rzGk0r0hFfZn1GVyTUkzeWeLV+PrhOKy6XIj0JRrb6f7cMB/k
         gRn++Zi0x5e6K7FX2t9WO8pik+T9YMMqYZ3wPRCgwHuZUd6NRDypM18hrLqqTdXARsCw
         npE5YS3FjpwffwZp4AhI6npSwiSUPT3j1C25gHbwNGgMrndTnbFzENgMCy0GEnUoJ6il
         NFZA==
X-Gm-Message-State: AOAM5335OXekFcUpd8Po/pZzJXaqUXCX8deic8HfSsz7W6+JJBrbvxwM
        b/YBO7Nh/adN8QEXlubPk9Q3vw==
X-Google-Smtp-Source: ABdhPJxldKFq/Rzqofqxn4rJbNcLhr5hYJ4ZeyAVRbwaYS9Cd10PchwbLiRXEC7+1Qe+4tL2UtPocg==
X-Received: by 2002:a65:53ce:: with SMTP id z14mr2617394pgr.275.1627743719538;
        Sat, 31 Jul 2021 08:01:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id jz24sm1857832pjb.9.2021.07.31.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 08:01:58 -0700 (PDT)
Date:   Sat, 31 Jul 2021 08:01:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Keith Packard <keithpac@amazon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 54/64] ipv6: Use struct_group() to zero rt6_info
Message-ID: <202107310801.D50070F@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-55-keescook@chromium.org>
 <20210729115850.7f913c73@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729115850.7f913c73@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 29, 2021 at 11:58:50AM -0700, Jakub Kicinski wrote:
> On Tue, 27 Jul 2021 13:58:45 -0700 Kees Cook wrote:
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> > 
> > Add struct_group() to mark region of struct rt6_info that should be
> > initialized to zero.
> 
> memset_after() ?

Oh, hah. Yes. I will adjust for v2.

-- 
Kees Cook
