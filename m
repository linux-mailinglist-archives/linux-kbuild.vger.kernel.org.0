Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACF53DB0BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 03:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235461AbhG3BmD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Jul 2021 21:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbhG3BmB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jul 2021 21:42:01 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6D9C061765
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 18:41:56 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id a20so9209808plm.0
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 18:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z2Wamgmh73Y+Ncu8fAmHIQj7M7ZAYEMLRlTXvopvkv0=;
        b=ijAtp7BbL9OeTMvwqZJ4C6mfxUVgFhIHqoi2Bpn7KTv+xzkqR66BceM/5iMj6cpOfn
         epnzVaw1UhfDENDcgJ4dZ7tPhk6gmw29M697vajTqTUL4EanTqtO6s3pVRsJvTdO4U4i
         durS8L9aynseywI9b6j0HfM/aNYNqA/7lc1W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z2Wamgmh73Y+Ncu8fAmHIQj7M7ZAYEMLRlTXvopvkv0=;
        b=Nc+iq/NUA4t8NvjfZo6SO5UQ1Macs8gWXvUsx34zEmUCgdtPYrm8GSTHzAXyYaOHoI
         L9H7ND6IzbqL0OnJPZM7v5vJq98ITdOz8P6tgSKv4O7WF+sXBCUP7c1oHQ3FnIIbiIIR
         Y/qZuRAVG9CaDMMXHoYFrlfT9NhYHqba9+X+dLNzalVvavbYKJmFNOFdzShlfR48bmu+
         qPlV0eeeFajzA/Wf67Lgynj1fYbySiFDcAQSZslBQvlDBmV4l2P4W9/w/YdenMtqz4tJ
         DdmfGCrnQTFTEbnCG5LLD/EfWeYeY6ODW8VkUtjHCbf8plQsRxEz0FRjQDyQXm2rB2eK
         7Icg==
X-Gm-Message-State: AOAM5307EZCkt/Xy4/WNf/atqZ3J3OJliENwWLplrDTkxl4wNdzhP/xY
        xEXusgxCRb8hFUpa4BGjwlfFpA==
X-Google-Smtp-Source: ABdhPJw0813YKZxQ8DT1LgMIuVe3PAz9HErWNrX605I57TwGhBJvYb9BvbSpZ8Miqi8+VnzV2jJFmA==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id c8-20020a056a000ac8b0290320a6bb880dmr239521pfl.41.1627609316347;
        Thu, 29 Jul 2021 18:41:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s25sm97149pgv.87.2021.07.29.18.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 18:41:55 -0700 (PDT)
Date:   Thu, 29 Jul 2021 18:41:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Keith Packard <keithpac@amazon.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 62/64] netlink: Avoid false-positive memcpy() warning
Message-ID: <202107291839.6AEFA1E8@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-63-keescook@chromium.org>
 <YQDv+oG7ok0T1L+r@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQDv+oG7ok0T1L+r@kroah.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 07:49:46AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 27, 2021 at 01:58:53PM -0700, Kees Cook wrote:
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > intentionally writing across neighboring fields.
> > 
> > Add a flexible array member to mark the end of struct nlmsghdr, and
> > split the memcpy() to avoid false positive memcpy() warning:
> > 
> > memcpy: detected field-spanning write (size 32) of single field (size 16)
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/uapi/linux/netlink.h | 1 +
> >  net/netlink/af_netlink.c     | 4 +++-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
> > index 4c0cde075c27..ddeaa748df5e 100644
> > --- a/include/uapi/linux/netlink.h
> > +++ b/include/uapi/linux/netlink.h
> > @@ -47,6 +47,7 @@ struct nlmsghdr {
> >  	__u16		nlmsg_flags;	/* Additional flags */
> >  	__u32		nlmsg_seq;	/* Sequence number */
> >  	__u32		nlmsg_pid;	/* Sending process port ID */
> > +	__u8		contents[];
> 
> Is this ok to change a public, userspace visable, structure?
> 
> Nothing breaks?

It really shouldn't break anything. Adding a flex array doesn't change
the size. And with Rasmus's suggestion (naming it "nlmsg_content") it
should be safe against weird global macro collisions, etc.

-- 
Kees Cook
