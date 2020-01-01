Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E02012E0C6
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jan 2020 23:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgAAW0u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jan 2020 17:26:50 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34123 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbgAAW0t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jan 2020 17:26:49 -0500
Received: by mail-qt1-f193.google.com with SMTP id 5so33647989qtz.1;
        Wed, 01 Jan 2020 14:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iQu0HUIm4XiQGFH+gozGoo1Hyw0Z/oVPbsqjgUDbkQs=;
        b=UZQGAnB0WHkCOm9SaQvxU69RMIY+H8W9HB5hRVflXlemoAdJIVULy7WXiJl8N/1lHP
         NIaDesHRyo8ATOwAy4elZAdpYwEfoH2dyCxk7JL6GQQahEqyJNCTSht1qRO1GQL0xXAQ
         HEtpgtFHjBb4Pmz3GBOwcmEfIPEq49+Dewg5m1R3/KSr0HOPDtgepo/hXhE8VZj59AOD
         Lmz2HyC+8nBHqPVyg1KMfufBYyEtI1esnyHO5GqXhsyRiXHMrBmrsYxJVGcQ7tltErVK
         LR29eFpA5o1GYNpQvFn3urfKGcYWLH20aixPIvZCH5C5sV7BMghLjtiHvQeCshzhQLlI
         Sa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=iQu0HUIm4XiQGFH+gozGoo1Hyw0Z/oVPbsqjgUDbkQs=;
        b=GwBF0MK1NMnDkyhUBLxCsPTRnw02sN+Wwlvbxdjv+TZaBP5UVXyZNlL/rG2Ww9dPjX
         qBxRUT2et+dXHthrH7PzRqPZRVKpzfvURJt5ebHyyyOeu2NdD2JbxmQwMObTaroF4Erx
         ATNhYbG+WI3j68mQQYaghIu1StY/5kY97xFfKhmrko7pKG+iQ1vBnxftErTH+e6fQgp5
         ThKBmrIEKaEp6RQlltXqXCJNxDGRLY2ABK7HJOVVftJ1/DG61CfiGAcPrrNeawojR3TY
         SDQ1UqJPLBP/Pq7OjxHqE12G+CLSvxagYlZnaoHXMeQpZQWOPVYS/VaQchJiA/RXiM1l
         v1Eg==
X-Gm-Message-State: APjAAAU1YifptuLrgEJNQciWXnY02LSmo7k4P2z20Xca5Lb8XSolSoTn
        3/M/Eyc0pnETF+uMqTyKRofJ1QhLkPA=
X-Google-Smtp-Source: APXvYqzRAwIdTPkxSN+ZKzNoKkU5CLgN87X53bEd2zz8bNCDtKte97iuXjNRUFTASEYMAhoTO04CJQ==
X-Received: by 2002:ac8:2af4:: with SMTP id c49mr59212013qta.367.1577917608415;
        Wed, 01 Jan 2020 14:26:48 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id 3sm16193583qte.59.2020.01.01.14.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 14:26:48 -0800 (PST)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Wed, 1 Jan 2020 17:26:45 -0500
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] menuconfig: restore prompt dependencies in help text
Message-ID: <20200101222644.GA438328@rani.riverdale.lan>
References: <20191231055839.GG4203@ZenIV.linux.org.uk>
 <20200101204152.402906-1-nivedita@alum.mit.edu>
 <20200101210426.GA8904@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200101210426.GA8904@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 01, 2020 at 09:04:26PM +0000, Al Viro wrote:
> On Wed, Jan 01, 2020 at 03:41:52PM -0500, Arvind Sankar wrote:
> > Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
> > prompts") moved some code from get_prompt_str to get_symbol_str so that
> > dependency information for symbols without prompts could be shown.
> > 
> > This code would be better copied rather than moved, as the change had
> > the side-effect of not showing any extra dependencies that the prompt
> > might have over the symbol.
> > 
> > Put back a copy of the dependency printing code in get_prompt_str.
> 
> Umm... Is "visible" really accurate in this case?  AFAICS, the
> entry (and help for it) _is_ visible with EXPERT=n.  OTOH, with
> EXPERT=y and MULTIUSER=n it disappears completely.
> 
> I'm not familiar with kconfig guts (and not too concerned about that
> feature of help there, TBH), but it looks like what you are printing
> there is some mix of dependencies ("visible when") and selectability...

Perhaps not the most accurate term. For NAMESPACES it has a submenu, so
it can't disappear as long as its selected, even if it's not editable
any more. A "leaf" level option like MULTIUSER, otoh, does disappear
completely (even though it's still selected).

But there are also things like CONFIG_VT, which stays visible, even
though its not a menu.. I think because there is a visible option that
depends on it and immediately follows, which menuconfig shows by
indenting. If the order of UNIX98_PTYS and VT_HW_CONSOLE_BINDING is
flipped in drivers/tty/Kconfig, then VT disappears when EXPERT=n.

Dunno, maybe Editable would be a better word than Visible?
