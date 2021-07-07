Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6073BE853
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 14:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhGGMxh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 08:53:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231553AbhGGMxh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 08:53:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE7B661CB9;
        Wed,  7 Jul 2021 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625662257;
        bh=T/6V7NtYw3XVHDWvfHf4Ig60ns9m+Gj7S40AvwV9oUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dYwgToOUKqm8DuqD6KeEvfvNqe2bnxaVxDlbLMweNFLsJOosRTB9b7nRBJFFlg5mK
         adbH8TiIwoHjU6ZNpqEbBuOMhmg9/Z2L9XELPjdJ4f2tDv944k6AjiPLJ+ZqsEceVZ
         MAE7RCSV73ldkbFqDNVCOdW981CEA4jfSZhQVti8=
Date:   Wed, 7 Jul 2021 14:50:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOWjLmg/Z7kr2+tx@kroah.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 07, 2021 at 02:33:57PM +0200, Miguel Ojeda wrote:
> Now, if you are OK with non-hardware modules, you can take a look at
> Rust Binder (last patch in the series) which is a non-trivial module
> and it is already working.

Cool, does it actually pass the binder self-tests that the Android
systems have for the codebase?  Last I looked at this thing, it was not
feature-complete compared to the in-kernel binder code, has that been
resolved and the needed filesystem changes added?

thanks,

greg k-h
