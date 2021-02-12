Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C4A31A287
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 17:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhBLQUN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Feb 2021 11:20:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:34872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhBLQUG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 11:20:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36F6764E0A;
        Fri, 12 Feb 2021 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613146762;
        bh=4KE6QZ6eBl3MF3x94JWk2+atZ7tnhruHiOBbr4r5xH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YwIHARmIlS3BXIPg3R6tclnLcUi9BiHc/PDY1aZZz6uAgVee0H8KtJ0LNjyPiAS3m
         Vm4AdzsQFonP245SHlIcDp9+3+zIvXGalxeLoXa4Mo1sWtCR6B4OMEK+fKdDlYNjfL
         A/bI8uKMYe6RyG0fy3pgmWzg+FBfIVXYJP+mEsO8Y4/yJUkhWQm9xZL/DL1iTDLgOB
         RhB4L8y38ranUoLhwkIDuDBwjXr5P0ufXWXovElELnF91NZPZ4qvGvekd4oqid0kxj
         PyhO/DWgQZdiB0PjLQ0SoUEoeuWDcfMRpUxPAn3Oyd0n70NN4or3RlIgVthTYm5Af2
         WTjI8Rqlbqxpw==
Date:   Fri, 12 Feb 2021 11:19:21 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
Message-ID: <20210212161921.GH4035784@sasha-vm>
References: <20210207161352.2044572-1-sashal@kernel.org>
 <20210208175007.GA1501867@infradead.org>
 <20210208182001.GA4035784@sasha-vm>
 <CAK7LNAQtQTwGt4SCK88a=y4ydASXoR30cCCmcFFdsUk=WY7tfA@mail.gmail.com>
 <CAK7LNASo2i_NT8acBCJ2gYeLE_rjyncSteyqD_mrMMR5Wf261g@mail.gmail.com>
 <CAK7LNAQiSe3j5h_rjvruJJfMpRsvkTcKuU0RJ7EJvpjGVX7G_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNAQiSe3j5h_rjvruJJfMpRsvkTcKuU0RJ7EJvpjGVX7G_w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 12:41:21PM +0900, Masahiro Yamada wrote:
>Please send a correct patch,
>also drop the unneeded casts.

Sorry about that, I've hand edited the patch right before sending it out
and obviously messed it up. I'll resend.

-- 
Thanks,
Sasha
