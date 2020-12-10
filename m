Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62B52D5A65
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Dec 2020 13:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgLJMXA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Dec 2020 07:23:00 -0500
Received: from nautica.notk.org ([91.121.71.147]:45286 "EHLO nautica.notk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726904AbgLJMXA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Dec 2020 07:23:00 -0500
Received: by nautica.notk.org (Postfix, from userid 1001)
        id EC1A9C009; Thu, 10 Dec 2020 13:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1607602937; bh=k0CJucuVEz8HkH9kDdldXKj+LZNAj5vMfQmKkCtAcss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IR/Rvsqg4HBjqHubGfpZhml4heRwRBqXy8woFQzNeSoB2l2EILEI0SGWLhos2ulVa
         +3wvpxgnW/VINWXN21+RhWCAu10NsefiNeJsApO4EZQeYyvQQ+gPeZM9CF+vjbUl2U
         x9FDVfwUP48hbyJXOE5U+GIVUCAlKT3JYQ0Rt4BNENlGAE+egRaOKxs7h/fwr3o+DE
         LJnOs1Y0F+Y3J/ud1oatfveIcQFBs7YmCIS9Z/jvy2KptzGBckP0amCgkRzA81iDID
         8G8VteAyM8uG/RBNj6RNnEIc+/7wg1t9+cTOyv2kIHNT22SkUEkiqld5Bp7QVkCl2O
         mSUiGPx4UYhqg==
Date:   Thu, 10 Dec 2020 13:22:02 +0100
From:   'Dominique Martinet' <asmadeus@codewreck.org>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     David Laight <David.Laight@ACULAB.COM>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
Message-ID: <20201210122202.GA8323@nautica>
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
 <69c82aee-59ec-f8d8-9546-b38f85bf08c0@arm.com>
 <20201209174252.GA27721@nautica>
 <5ca5c3bb23614af0a35f01f1e3a84ead@AcuMS.aculab.com>
 <a68a09ce-f172-bfb4-6422-b1776d798f5f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a68a09ce-f172-bfb4-6422-b1776d798f5f@arm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Vincenzo Frascino wrote on Thu, Dec 10, 2020:
> On 12/9/20 10:03 PM, David Laight wrote:
>> Why bother with awk?

I wanted to keep the patch minimal, I'm not opposed to rewriting but
that always potentially has more impact (although as you say, this
script is simple enough)

> > I think you can do it all in a shell function.
> > Something like:
> > 	read line
> > 	line=${line##*)}
> > 	line=${line##*version }
> > 	IFS='.-'
> > 	set $line
> > 	echo $(($1*100000000 + $2*1000000 + $3*10000))
> > 
> > That will work on any recent shell.

Works for me.


> I would suggest to revert the patch for now since we are close to the merge
> window and then maybe in -rc1 start discussing a better solution.

As far as I can see the patch is only in -next, as said earlier I'm in
favor of just dropping the patch until a decision is taken for the next
merge window (or the one after that); there's no hurry for me and
nothing to revert.

-- 
Dominique
