Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319A71548F2
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2020 17:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgBFQRb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Feb 2020 11:17:31 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35075 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgBFQRb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 11:17:31 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so706437wmb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Feb 2020 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WQsOr/IVWp27dNug1WtqOw9okINpGHdd5WHi9kRo0ZE=;
        b=UCtyQCus59AS4hIHczJXWmirhprctTwMqVGMaarNOJQIrkOlRaQHhHMCKLYjcSGW08
         sP8hduus9SvlQDbHULm2kdnn8oOX7BJbKkeQ8iLj3gw5135UaDKHhi0am533gBFlk++m
         4WQPVlhBvZLDTWFdONQT60RUHyMmXFAstAdKBI8wHLN4LvRQPFBdRdkdNhtxMIT7G62Z
         vlRdZerRfH8Gpfome0OpPN54xyNvWg1E75YBaXRFPu1KC2NbiN2qUWlzXCg0vTN+dxMD
         /I2YFYjz4os0Pk1nduM92o6bip6nOPSxWYRGTxFGXo8D1YSXZp3fk3BTJGOa0DzS8I3X
         GlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WQsOr/IVWp27dNug1WtqOw9okINpGHdd5WHi9kRo0ZE=;
        b=qC/24Pb+4doGZeGv/6YtvpxcA6Yt9zeSZ7h+OHOm/7HE6N3R6ApcXTLkRwccIU3tI7
         b0yQ7mFy7LEJy41IjdwkTcMngXRf44i3ZodqED1VncPdqJXuIPgbWXTKolKgi/fw4TKc
         XJhElEvFfJ3eY+yddIMx2+3JBSv/LtN3fP/WS20RTPSpc9hk+cxNbXQnUQUHL6ggrozQ
         oy3ENp3xrcRCK26tZB583SKvoTzBkScs//iFNbv7UKQpzve5Qxrt2Om8iJQ0MGIjQnxY
         85jqWxPzTymZatDpw6EfQ/7FirFFQU+Yg/4+T3cn5BVvcJC/WJE1whtXEhmPWMNehiOY
         RnBw==
X-Gm-Message-State: APjAAAWphQaU3m84hDQK5XpPw43pgEloIrKEsWyI8pZt4Y+xilUyDwjI
        a8Q1afmVFMarGVNuCJys9CHutA==
X-Google-Smtp-Source: APXvYqwlD3/gx+oT/kgkwAaUNqsSpCyv72HxnP3e5wvVE303EA3yOFGPTayFmPqjuWPYkb2nXwNBTg==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr5360458wml.171.1581005848974;
        Thu, 06 Feb 2020 08:17:28 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id c9sm4064448wmc.47.2020.02.06.08.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 08:17:28 -0800 (PST)
Date:   Thu, 6 Feb 2020 16:17:25 +0000
From:   Quentin Perret <qperret@google.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200206161725.GA235676@google.com>
References: <20200129181541.105335-1-qperret@google.com>
 <20200206155651.GC16783@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206155651.GC16783@linux-8ccs>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jessica,

On Thursday 06 Feb 2020 at 16:56:51 (+0100), Jessica Yu wrote:
> +++ Quentin Perret [29/01/20 18:15 +0000]:
> > +config UNUSED_KSYMS_WHITELIST
> > +	string "Whitelist of symbols to keep in ksymtab"
> > +	depends on TRIM_UNUSED_KSYMS
> > +	help
> > +	  By default, all unused exported symbols will be trimmed from the
> > +	  build when TRIM_UNUSED_KSYMS is selected.
> 
> Hm, I thought TRIM_UNUSED_KSYMS just *unexports* unused symbols, no?

Right.

> "Trimmed from the build" sounds like the symbols are not compiled in
> or dropped completely. Please correct me if I misunderstood.

Good point. I tried to re-use the wording from the help text of
TRIM_UNUSED_KSYMS ("This option allows for unused exported symbols
to be dropped from the build"), but I agree this is a bit confusing.

I'll re-write the help text in v3.

> 
> > +	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
> > +	  exported at all times, even in absence of in-tree users. The value to
> > +	  set here is the path to a text file containing the list of symbols,
> > +	  one per line.
> > +
> > endif # MODULES
> > 
> > config MODULES_TREE_LOOKUP
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index a904bf1f5e67..8e1b7f70e800 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
> > EOT
> > sed 's/ko$/mod/' modules.order |
> > xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> > +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
> > sort -u |
> > sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
> 
> In general, I agree with the motivation behind this patch, even though
> we try not to provide too much support for out-of-tree modules.
> However, in this particular case, I think it's fair to provide some
> mechanism to keep some exported symbols around that we know will have
> users, despite having no in-tree users for a particular
> configuration/build. For example, livepatch exports symbols that have
> no in-tree users (except for the sample livepatch module, but you'd
> have to enable SAMPLES), and all livepatch users will always be out of
> tree.
> 
> I also agree with Matthias' feedback, so assuming that gets
> incorporated into v3:
> 
> Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks for the review!
Quentin
