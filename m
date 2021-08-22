Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D34D3F3E99
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Aug 2021 10:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhHVIMU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Aug 2021 04:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbhHVIMT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Aug 2021 04:12:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548E2C061764
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Aug 2021 01:11:35 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id oa17so10032567pjb.1
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Aug 2021 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zWkjWEvskowDV9RuOm1icxTsINafWKFQlH8OIXXrrz4=;
        b=RQdXywP6yts45USpiw/5k2ZmYqVHMSbk9lus7YCqnHd8h/dka/Mtc/dvJ9OXe5Otvy
         Sqan4jaX0EaO6pSp84INK0mTwB48SVVmVb4c2YqbHrlCvd6ldJuCPTsbKqBjRTW6P8oo
         9Ux/xZOvOXbIQtNK3Akl22kbAtyj0C7ROjsaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zWkjWEvskowDV9RuOm1icxTsINafWKFQlH8OIXXrrz4=;
        b=b0Xx9+KVpTACfZpZI+ne9ijhlLdROfAZERj+Zwu7VpDbjayJKRZEPorfPluCdAGxJA
         i+BbCgvfQ7wj2zA1UdeDSJeBtFdY7CNiFPk+uuB56KWd971JqaVi+Rqh+VxmKY4DXevX
         WogGD4jBEAeJIc2VocZeLJeuye3AOPQ6Azj+wJmtV1251xf8cnoN1BtGochPu1XCiz8B
         G51tLc984IQ3O9C2FCcMWzwHfZYWJvnkEN2lOwtruIb003V1/h4fB2XX1tQmGipHrcid
         B3U/4BbAPbSknsbnvDr7TRFz7jKaX5cXKe+u3MrwA73gB9NRPZvw2Ixxzm3cnWukwuai
         OBiQ==
X-Gm-Message-State: AOAM530Y75o2SIvetHTOWG/+L9zmgCyaSlrHp1fKeBgnOm5Zt1Y2AJQx
        ECDwFlzvapDYuxd57O5JjSt4Qw==
X-Google-Smtp-Source: ABdhPJwd1ju8xuF6lspQHjJq0552r+HoTrwzTs5HEFbQVZzpc/fLKP3ldMoQP6w86dYwBror2p+DQQ==
X-Received: by 2002:a17:902:c643:b0:130:eab4:bd22 with SMTP id s3-20020a170902c64300b00130eab4bd22mr9764805pls.13.1629619894669;
        Sun, 22 Aug 2021 01:11:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 186sm12621542pfg.11.2021.08.22.01.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 01:11:33 -0700 (PDT)
Date:   Sun, 22 Aug 2021 01:11:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 45/63] ath11k: Use memset_startat() for clearing queue
 descriptors
Message-ID: <202108220107.3E26FE6C9C@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-46-keescook@chromium.org>
 <87eeapbmhi.fsf@tynnyri.adurom.net>
 <202108190923.30FD4FC6E@keescook>
 <87pmu7t83j.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmu7t83j.fsf@codeaurora.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 21, 2021 at 01:17:36PM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > On Thu, Aug 19, 2021 at 04:19:37PM +0300, Kalle Valo wrote:
> >> Kees Cook <keescook@chromium.org> writes:
> >> 
> >> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >> > field bounds checking for memset(), avoid intentionally writing across
> >> > neighboring fields.
> >> >
> >> > Use memset_startat() so memset() doesn't get confused about writing
> >> > beyond the destination member that is intended to be the starting point
> >> > of zeroing through the end of the struct. Additionally split up a later
> >> > field-spanning memset() so that memset() can reason about the size.
> >> >
> >> > Cc: Kalle Valo <kvalo@codeaurora.org>
> >> > Cc: "David S. Miller" <davem@davemloft.net>
> >> > Cc: Jakub Kicinski <kuba@kernel.org>
> >> > Cc: ath11k@lists.infradead.org
> >> > Cc: linux-wireless@vger.kernel.org
> >> > Cc: netdev@vger.kernel.org
> >> > Signed-off-by: Kees Cook <keescook@chromium.org>
> >> 
> >> To avoid conflicts I prefer taking this via my ath tree.
> >
> > The memset helpers are introduced as part of this series, so that makes
> > things more difficult. Do you want me to create a branch with the
> > helpers that you can merge?
> 
> Is this patch really worth the extra complexity? Why can't I apply this
> ath11k patch after the helpers have landed Linus' tree? That would be
> very simple.

Not singularly, no. But I have a bit of a catch-22 in that I can't turn
on greater FORTIFY strictness without first fixing the false positives,
and I can't fix the false positives in "other" trees without those trees
first having the helpers that get introduced by the FORTIFY series. :)

Anyway, since we're close to the merge window anyway, the FORTIFY series
won't land in 1 release at this point regardless, so I'll just get
the helpers landed and we can do the individual pieces once the merge
window closes.

Wheee :)

-- 
Kees Cook
