Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 443D51548DC
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2020 17:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgBFQMQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Feb 2020 11:12:16 -0500
Received: from pb-smtp2.pobox.com ([64.147.108.71]:63438 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBFQMP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 11:12:15 -0500
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 7914E4267F;
        Thu,  6 Feb 2020 11:12:14 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=s77iPB9oFfq1CkqBPIOEo+Qt9nE=; b=mhDIUK
        V3+nFIBbZ4oaaKXKLwQ0WuAtfmTWW8hFHiJxq59f2BLifyQJx5YzvDJWcKNliDZ6
        M4NLDIb/8wSgCazOxVDsloRrU/86KEr0LG+7PB1ZuxVpyNRx4Aid9S4d01P53K/8
        9rEQD6i7//+ezo68eR5X/3hJstakKh7eiwI+U=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 6F96D4267E;
        Thu,  6 Feb 2020 11:12:14 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=USAs6fd+3dK9Jv6668+jev/vMsJexfPZ6kNB/99uw7A=; b=R6BmjNIZ5BDDOmlSnNrBqmLNfxnLGYGd8rMdTe8MNtC246FoDErsshWuEf7NTNOGHW2vShefSbGg4hwVnm7xbzwR+UCbkT8EtDjfRwLlhcHEImL7rT0oLbWme8V8YMTsXSLCXXyBE8YQ0Irf/Ff3cB6LJPXnEurDdWYjtISpd4I=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id E52B94267D;
        Thu,  6 Feb 2020 11:12:13 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id BB4C22DA03F4;
        Thu,  6 Feb 2020 11:12:12 -0500 (EST)
Date:   Thu, 6 Feb 2020 11:12:12 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Jessica Yu <jeyu@kernel.org>
cc:     Quentin Perret <qperret@google.com>, masahiroy@kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200206155651.GC16783@linux-8ccs>
Message-ID: <nycvar.YSQ.7.76.2002061103360.1559@knanqh.ubzr>
References: <20200129181541.105335-1-qperret@google.com> <20200206155651.GC16783@linux-8ccs>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 6FE61F14-48FB-11EA-9CA5-D1361DBA3BAF-78420484!pb-smtp2.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 6 Feb 2020, Jessica Yu wrote:

> Hm, I thought TRIM_UNUSED_KSYMS just *unexports* unused symbols, no?
> "Trimmed from the build" sounds like the symbols are not compiled in
> or dropped completely. Please correct me if I misunderstood.

If they are unexposed, then it doesn't make much sense to keep them 
around wasting space. So yes, the compiler is free to optimize away the 
unused code at that point.

Please see the first part of the following article where effective 
kernel size reduction is is achieved with this feature:

https://lwn.net/Articles/746780/


Nicolas
