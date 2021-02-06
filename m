Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190E9311AA8
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 05:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhBFEFA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 23:05:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:49980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231486AbhBFECo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 23:02:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62A9564DA3;
        Sat,  6 Feb 2021 04:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612584120;
        bh=XiHFcUyJrSAelpR+HWhkR6qx5t1YmZcP7sS3igpdcfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i0VcmTsv4+gMe73KUDRy1j3Uj1wf2Z+4kwhKieOmhmpGhJpYoqwNNha+qALjqepEP
         lhAG5aSi78JhpFiQibVPqRT0rOUkLsLB2ZYUP7gb8bzJyW48Rr/6UCQs6c5ovIJZCH
         IJ9HaXVPLeFz5t3jjsHLUZqthrYbSOknJoW8CCzBTUQ0pae6cKOZQvdUtnRhbYEyO0
         Wpk2pYtm8wvtV0YHHBZaoVxfi0irLO/4pLZ2z5DilQcQRH0nQchF/vBXwfoQ4DErnq
         +tmNu4gDqwB0jccfLH4lREp8WGLG6lxPRwNEge5KTwY9uq9nNGicY9B+qn1nDYPtaY
         /XHhsXt6A6WWg==
Date:   Fri, 5 Feb 2021 23:01:59 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
        stable@kernel.org
Subject: Re: [PATCH 3/3] kbuild: introduce KERNEL_VERSION2 and
 LINUX_VERSION_CODE2
Message-ID: <20210206040159.GW4035784@sasha-vm>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-3-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210206035033.2036180-3-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 10:50:33PM -0500, Sasha Levin wrote:
>SUBLEVEL only has 8 bits of space, which means that we'll overflow it
>once it reaches 256.
>
>Few of the stable branches will imminently overflow SUBLEVEL while
>there's no risk of overflowing VERSION.
>
>Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
>should create a better balance between the different version numbers we
>use.
>
>We can't however use the original KERNEL_VERSION and LINUX_VERSION_CODE
>as userspace has created ABI dependency on their structure, and we risk
>breaking this userspace by modifying the layout of the version integers.
>
>Cc: stable@kernel.org
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I wanted to re-use an older commit but forgot to drop the two tags
above. The tags from Masahiro and Greg shouldn't be here, sorry about
that.

-- 
Thanks,
Sasha
