Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D852C5230
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Nov 2020 11:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730213AbgKZKiu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Nov 2020 05:38:50 -0500
Received: from codesynthesis.com ([188.40.148.39]:59084 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729906AbgKZKit (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Nov 2020 05:38:49 -0500
Received: from brak.codesynthesis.com (unknown [105.225.210.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id AEC875F6C4;
        Thu, 26 Nov 2020 10:38:47 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 1C0AB1A800C5; Thu, 26 Nov 2020 12:38:41 +0200 (SAST)
Date:   Thu, 26 Nov 2020 12:38:41 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Felix Fietkau <nbd@openwrt.org>,
        Patrick Franz <patfra71@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Junio C Hamano <gitster@pobox.com>,
        linux-kernel@vger.kernel.org
Subject: Re: kconfig as a git subtree on Linux
Message-ID: <boris.20201126122203@codesynthesis.com>
References: <20201125172544.GJ4332@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125172544.GJ4332@42.do-not-panic.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Luis Chamberlain <mcgrof@kernel.org> writes:

> I'd like to propose we discuss the possibility of taking kconfig and
> making it a git subtree under the Linux kernel. This would allow
> other projects outside of the Linux kernel to be able to update their
> own copy / fork of kconfig in a jiffie *very* easily.

I am maintaining one such copy/fork[1] and for me the effort to pull
in the new version of upstream (which I currently do by just copying
scripts/kconfig/*) is nothing compared to the effort of maintaining
a set of patches[2] on top of that which are necessary to make kconfig
buildable on other platforms and usable with other build systems.

So unless there is also an agreement that such portability patches
are now welcome, this is not going to be a major improvement for me.
And right now such patches are clearly not welcome[3] (but no hard
feelings; I wouldn't touch Windows with a ten-foot pole if I could
help it).

[1] https://github.com/build2-packaging/kconfig
[2] https://github.com/build2-packaging/kconfig/commits/upstream-5.10-rc1
[3] https://www.spinics.net/lists/linux-kbuild/msg27460.html
