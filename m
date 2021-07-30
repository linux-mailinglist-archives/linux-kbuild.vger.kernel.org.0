Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66FDE3DB0AF
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 03:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhG3Bj3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Jul 2021 21:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234361AbhG3Bj3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jul 2021 21:39:29 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDD8C061765
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 18:39:24 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so18394775pja.5
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 18:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vPAHzrcSpfKuQzB1lrV/ttkpcnRRhB/aWzazYKPR4LA=;
        b=Nkis4e8105uAbCge9aO+StXNkXelrJqOpF7xNsIBtcoe+D0iGfGrhXWOijeKDfFQS8
         tcGIefv5L6ODB7FGlHuoK3nhQNiRzvNAcTkGvlhjpZKPls5MD5zfBf1pJ7Ll8rA8iZ5f
         LTaEoFLk38qAHkDnPefiooUaNHcHv32+03LBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vPAHzrcSpfKuQzB1lrV/ttkpcnRRhB/aWzazYKPR4LA=;
        b=AjEM/UYFCadwNt5XbfiZIfS0mltcVfQ0aip9GJ5iyJqGlUPVv+KsQyddrfWlUGQ8P6
         eGOofY548MyvwDAh8jJXUHVptmXBtLjzbVPF6+9RLsM8ND8o0yHUrUrL3AZ4+yiHOV/g
         DHwr0fC95yNYuICgHMtamOpFIZ9IFJ3SCb2vpRSMG2oH1146oCNeZR8NUjorNZcm5RcI
         0P+ukRL1vm8Q8cyX6EzcR4cRUyFz8UbPQJmPJzL/nyAK+H6KjJUn3hKFhETKeykYawMN
         l+m8MFL0MOTFC89QDY4l90ES6hZ6N03f2LTD3nR0z8GXQW11OwloGuCUJp13AtIzQdbi
         3I4Q==
X-Gm-Message-State: AOAM531waySMbws+En9NTlFrGnh5xgrYWjer1/HaRv48uOsmuGDfGwli
        ECktg1dDOzVfj2FgRZRQ17Lnew==
X-Google-Smtp-Source: ABdhPJzbwo1FmDrFDbiWZ8BWT3TYMS+pXDsYeTk5gfATiaIbAKAeZ3H6gw+DeJERV+7PZzePv9GaaQ==
X-Received: by 2002:a63:1053:: with SMTP id 19mr5768pgq.395.1627609164105;
        Thu, 29 Jul 2021 18:39:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z5sm97349pgz.77.2021.07.29.18.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 18:39:23 -0700 (PDT)
Date:   Thu, 29 Jul 2021 18:39:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Keith Packard <keithpac@amazon.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 62/64] netlink: Avoid false-positive memcpy() warning
Message-ID: <202107291838.25D1F118C@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-63-keescook@chromium.org>
 <YQDv+oG7ok0T1L+r@kroah.com>
 <d7251d92-150b-5346-6237-52afc154bb00@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7251d92-150b-5346-6237-52afc154bb00@rasmusvillemoes.dk>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 01:24:01PM +0200, Rasmus Villemoes wrote:
> On 28/07/2021 07.49, Greg Kroah-Hartman wrote:
> > On Tue, Jul 27, 2021 at 01:58:53PM -0700, Kees Cook wrote:
> >> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >> field bounds checking for memcpy(), memmove(), and memset(), avoid
> >> intentionally writing across neighboring fields.
> >>
> >> Add a flexible array member to mark the end of struct nlmsghdr, and
> >> split the memcpy() to avoid false positive memcpy() warning:
> >>
> >> memcpy: detected field-spanning write (size 32) of single field (size 16)
> >>
> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> >> ---
> >>  include/uapi/linux/netlink.h | 1 +
> >>  net/netlink/af_netlink.c     | 4 +++-
> >>  2 files changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
> >> index 4c0cde075c27..ddeaa748df5e 100644
> >> --- a/include/uapi/linux/netlink.h
> >> +++ b/include/uapi/linux/netlink.h
> >> @@ -47,6 +47,7 @@ struct nlmsghdr {
> >>  	__u16		nlmsg_flags;	/* Additional flags */
> >>  	__u32		nlmsg_seq;	/* Sequence number */
> >>  	__u32		nlmsg_pid;	/* Sending process port ID */
> >> +	__u8		contents[];
> > 
> > Is this ok to change a public, userspace visable, structure?
> 
> At least it should keep using a nlmsg_ prefix for consistency and reduce
> risk of collision with somebody having defined an object-like contents
> macro. But there's no guarantees in any case, of course.

Ah, good call. I've adjusted this and added a comment.

Thanks!

-Kees

-- 
Kees Cook
