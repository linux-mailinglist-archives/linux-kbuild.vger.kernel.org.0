Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F0743E199
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 15:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhJ1NJJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 09:09:09 -0400
Received: from codesynthesis.com ([188.40.148.39]:36448 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhJ1NJJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 09:09:09 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 2AC6E5FBE9;
        Thu, 28 Oct 2021 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1635426400;
        bh=v+3YIgNCTv7aNbgNvB98CxLZZapfYiWkFYFX6lFFUos=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=ec08ADUTDXXkILIgThJbXFWjYAd47BVKLOY616uNCI5Xe6y2jXZjgHrZJqB50EvLB
         eLN96xfM6c/SpWRonVo7JLaYCziP2n1YnfkKlCrLJ4r3jZsPu1kiekiXmFTrrurfKM
         4zAmIYIX4/Os5D344rZyJqaLpIYw6ORhjvAhLCjGfQX9IMPqi7VFO40JP+GZrb2eO4
         b0wcZTsYLI5aiueVnjy5HhOP2Acpsa5DPlOZG7UPA3PrV4m/rgLYUbE5HvQnX+qqDq
         pHjxMo8q6VE+CmtktLWOyI/XZZZHjGppzqHknpauYs+2/Vi5b94c4uk4z4HpMsqlWY
         fhh02IOqqEYbA==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 96D6F1A800C4; Thu, 28 Oct 2021 15:06:36 +0200 (SAST)
Date:   Thu, 28 Oct 2021 15:06:36 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org
Subject: Out of kernel kconfig patches rebased on 5.15
Message-ID: <boris.20211028145351@codesynthesis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If anyone is interested in the kconfig functionality outside of the
kernel, I've rebased my portability patches on 5.15-rc7:

https://github.com/build2-packaging/kconfig/tree/upstream-5.15-rc7

There is also the liblkc library and conf/qconf configurators based
on this (similar to the now abandoned kconfig-frontends project):

https://github.com/build2-packaging/kconfig

Masahiro, if you like any of the patches, let me know and I will
send them for upsteaming (I don't want to make extra noise trying
all of them since most are probably not welcome):

https://github.com/build2-packaging/kconfig/commits/upstream-5.15-rc7
