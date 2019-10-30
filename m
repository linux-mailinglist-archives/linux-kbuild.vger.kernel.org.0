Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CFFEA49D
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 21:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfJ3UON (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Oct 2019 16:14:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbfJ3UON (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Oct 2019 16:14:13 -0400
Received: from linux-8ccs (unknown [92.117.144.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEB8C20659;
        Wed, 30 Oct 2019 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572466452;
        bh=COfCXFzHprFhxFxRMwe4Jl7Ti+0t2sr8gRDERuMYhlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2YZ4uHiaIA0oGsIm4GiapO/wVRNQ6a3nTLDtZEEetrIRpvlmWStFFnRhckfQIehq2
         vSNi5CKFMCE+Bkh07mQhBryebVuskV/8O4iQecQz5LC4HeJpYsWylpBHhkc2iLUwq+
         Yv8YtBHvZCRcGotP2AmGqJV4mYTVTbMhSyoAAgPM=
Date:   Wed, 30 Oct 2019 21:14:04 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] More nsdeps improvements
Message-ID: <20191030201402.GD13413@linux-8ccs>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-1-yamada.masahiro@socionext.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [29/10/19 21:38 +0900]:
>This series improves nsdeps more by addressing the root problem.
>
>Based on linux-next.
>
>This series does NOT apply to the Linus tree because
>I updates modpost from my Kbuild tree.
>
>I can pick up this series to kbuild tree if there is no objection.
>If it goes to the module tree, we need to discuss how to deal with
>the conflicts.

Please feel free to take these through the kbuild tree. Thanks!

>The modpost is actively touched these days
>from both kbuild and module trees.
>
>
>
>Masahiro Yamada (4):
>  modpost: do not invoke extra modpost for nsdeps
>  modpost: dump missing namespaces into a single modules.nsdeps file
>  scripts/nsdeps: support nsdeps for external module builds
>  mospost: remove unneeded local variable in contains_namespace()
>
> .gitignore                                   |  2 +-
> Documentation/core-api/symbol-namespaces.rst |  3 ++
> Documentation/dontdiff                       |  1 +
> Makefile                                     | 10 ++--
> scripts/Makefile.modpost                     |  8 ++-
> scripts/mod/modpost.c                        | 55 ++++++++------------
> scripts/mod/modpost.h                        |  4 +-
> scripts/nsdeps                               | 29 ++++++-----
> 8 files changed, 53 insertions(+), 59 deletions(-)
>
>-- 
>2.17.1
>
